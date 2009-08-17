Received: from [85.10.209.111] (helo=mail.road.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <u.luckas@road.de>) id 1Md3UY-0005O4-9I
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 Aug 2009 16:47:25 +0200
Received: from slimfast.dyndns.org (unknown [192.168.254.1])
	by mail.road.de (Postfix) with ESMTP id 077228F0004;
	Mon, 17 Aug 2009 16:30:25 +0200 (CEST)
Received: from ulitu.localnet (ulitu.handy-pc.constin.de [192.168.116.44])
	by slimfast.dyndns.org (Postfix) with ESMTP id 7D281AD4052;
	Mon, 17 Aug 2009 16:30:24 +0200 (CEST)
From: Uli Luckas <u.luckas@road.de>
Organization: Road GmbH
To: openembedded-devel@lists.openembedded.org
Date: Mon, 17 Aug 2009 16:30:22 +0200
User-Agent: KMail/1.12.0 (Linux/2.6.30-1-686-bigmem; KDE/4.3.0; i686; ; )
References: <200908141710.43549.u.luckas@road.de>
	<1250264656.12282.1273.camel@mill.internal.reciva.com>
In-Reply-To: <1250264656.12282.1273.camel@mill.internal.reciva.com>
MIME-Version: 1.0
Message-Id: <200908171630.23496.u.luckas@road.de>
Subject: [PATCH] Re: coreutils-native race
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 17 Aug 2009 14:47:36 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Friday, 14. August 2009, Phil Blundell wrote:
> On Fri, 2009-08-14 at 17:10 +0200, Uli Luckas wrote:
> > What happens (once in a while) is that some build process uses commands
> > from coreutils-native while coreutils-native is being staged.
> > Let's say the command is 'rm' - so coreutils-native stages 'rm' while
> > another build process trys to delete some file. This leads to "rm: text
> > file busy" because rm is still open for writing.
> >
> > Has anyone seen this? And is there a known fix or workaround?
>
> I guess the fix would be to make coreutils-native install its binaries
> atomically (i.e. install them to ${STAGING_BINDIR}/rm.new and then mv
> them into place) rather than installing them directly into their final
> location.  Alternatively you could probably patch it to just not install
> things like rm at all: if your host system doesn't have a functioning
> "rm" then you're probably hosed anyway.
>
Hi Phil,
I went for your first sugestion. Attached is a patch that does atomic 
installation. The patch is against a snapshot of the stable branch but 
should not be to hard to forward port to other branches for people who
have trees of these other branches available.

regards,
Uli

commit 59171bc7bc35eabab3bd35730f77d194aa802a53
Author: Uli Luckas <u.luckas@road.de>
Date:   Mon Aug 17 15:53:06 2009 +0200

    - Fix "text file busy" build bug.
    
    Signed-off-by: Uli Luckas <u.luckas@road.de>

diff --git a/packages/coreutils/coreutils-native.inc b/packages/coreutils/coreutils-native.inc
new file mode 100644
index 0000000..f6a6dc2
--- /dev/null
+++ b/packages/coreutils/coreutils-native.inc
@@ -0,0 +1,24 @@
+# binaries from coreutils-native are usually provided by the host os and already
+# used by parallel build threads before coreutils-native is staged.
+#
+# The regular autotools_stage_dir installs non atomically and can cause parallel
+# build threads to find busy binaries.
+#
+autotools_stage_dir() {
+	from="$1"
+	to="$2"
+	# This will remove empty directories so we can ignore them
+	rmdir "$from" 2> /dev/null || true
+	if [ -d "$from" ]; then
+		mkdir -p "$to"
+		(cd "$from"; find . -print ) | while read object; do
+			if [ -d "$from/$object" ]; then
+				mkdir -p "$to/$object"
+			else
+				tmpname="`mktemp "$to/$object".XXXXXXXX`"
+				cp -fpP "$from/$object" "$tmpname"
+				mv "$tmpname" "$to/$object"
+			fi
+		done
+	fi
+}
diff --git a/packages/coreutils/coreutils-native_5.3.0.bb b/packages/coreutils/coreutils-native_5.3.0.bb
index ee90981..3a278b6 100644
--- a/packages/coreutils/coreutils-native_5.3.0.bb
+++ b/packages/coreutils/coreutils-native_5.3.0.bb
@@ -5,3 +5,4 @@ S = "${WORKDIR}/coreutils-${PV}"
 
 require coreutils_${PV}.bb
 inherit native
+require coreutils-native.inc
diff --git a/packages/coreutils/coreutils-native_6.0.bb b/packages/coreutils/coreutils-native_6.0.bb
index ee90981..3a278b6 100644
--- a/packages/coreutils/coreutils-native_6.0.bb
+++ b/packages/coreutils/coreutils-native_6.0.bb
@@ -5,3 +5,4 @@ S = "${WORKDIR}/coreutils-${PV}"
 
 require coreutils_${PV}.bb
 inherit native
+require coreutils-native.inc


-- 

------- ROAD ...the handyPC Company - - -  ) ) )

Uli Luckas
Head of Software Development

ROAD GmbH
Bennigsenstr. 14 | 12159 Berlin | Germany
fon: +49 (30) 230069 - 62 | fax: +49 (30) 230069 - 69
url: www.road.de

Amtsgericht Charlottenburg: HRB 96688 B
Managing director: Hans-Peter Constien


