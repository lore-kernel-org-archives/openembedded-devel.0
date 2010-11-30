Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1PNIFR-0007cI-RP
	for openembedded-devel@lists.openembedded.org;
	Tue, 30 Nov 2010 05:55:30 +0100
Received: by pvd12 with SMTP id 12so854805pvd.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Nov 2010 20:54:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=xMntzR/8Qpb+1pH4q9oo3w0XSRA34YR4r6Pxn9UwmOM=;
	b=eVliYjh95Yl4lRusXNk0LCGpQb+Rj4hyIskzd0uQenWbswZxFTihdzqjt3btYHbsGj
	GfQP0IIV9j3oeW8ip+8PsK/8n8eCxibOH59C6wE0tIOal4PGEh4ffbUaMNJJL0wfu7xP
	wabm6Uk4fQMy30cci92+RHmAkHylLDL6Jnof0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=K8yfcPMye9Dj/5e7u7j8UIK5CEku/48xSfh75LhOZky0fjlOKLNYdRg5njFb8KxfDs
	ybLlq26WEguDN1L+E2Zidrcvub8HNO1nR+O4yjoiPHFwtNnXUbob9VXYrhuDge4+N4yQ
	LrtF0l5qGLnhQWwl5c2eBb40a0dzGwpdJJ9Is=
Received: by 10.142.224.11 with SMTP id w11mr6513150wfg.126.1291092835016;
	Mon, 29 Nov 2010 20:53:55 -0800 (PST)
Received: from [10.0.0.5] (eth7090.sa.adsl.internode.on.net [150.101.58.177])
	by mx.google.com with ESMTPS id
	w42sm8424385wfh.15.2010.11.29.20.53.52
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 29 Nov 2010 20:53:54 -0800 (PST)
Message-ID: <4CF48356.2050501@gmail.com>
Date: Tue, 30 Nov 2010 15:23:42 +1030
From: Graham Gower <graham.gower@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.15) Gecko/20101113 Thunderbird/3.0.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.175
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] perl_5.8.8.bb, perl_5.10.1.bb: Fix build when DISTRO_FEATURES lacks largefile.
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
X-List-Received-Date: Tue, 30 Nov 2010 04:55:30 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

CCCMD =  mipsel-oe-linux-uclibc-gcc -march=mips32 -DPERL_CORE -c -isystem/mnt/oe/tmp/sysroots/mipsel-oe-linux-uclibc/include -fexpensive-optimizations -fomit-frame-pointer -frename-registers -Os -D_REENTRANT -D_GNU_SOURCE -DTHREADS_HAVE_PIDS -fno-strict-aliasing -pipe -I/local/include -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -O2  -Wall
In file included from /mnt/oe/tmp/sysroots/mipsel-oe-linux-uclibc/include/sys/types.h:27:0,
                 from perl.h:420,
                 from miniperlmain.c:36:
/mnt/oe/tmp/sysroots/mipsel-oe-linux-uclibc/include/features.h:216:5: error: #error It appears you have defined _FILE_OFFSET_BITS=64. Unfortunately, uClibc was built without large file support enabled.

Signed-off-by: Graham Gower <graham.gower@gmail.com>
---
 recipes/perl/perl_5.10.1.bb |   13 +++++++++++++
 recipes/perl/perl_5.8.8.bb  |   13 +++++++++++++
 2 files changed, 26 insertions(+), 0 deletions(-)

diff --git a/recipes/perl/perl_5.10.1.bb b/recipes/perl/perl_5.10.1.bb
index 9038b96..91434e2 100644
--- a/recipes/perl/perl_5.10.1.bb
+++ b/recipes/perl/perl_5.10.1.bb
@@ -97,6 +97,17 @@ export LDDLFLAGS = "${LDFLAGS} -shared"
 # We're almost Debian, aren't we?
 CFLAGS += "-DDEBIAN"
 
+do_nolargefile() {
+	sed -i -e "s,\(uselargefiles=\)'define',\1'undef',g" \
+		-e "s,\(d_readdir64_r=\)'define',\1'undef',g" \
+		-e "s,\(readdir64_r_proto=\)'\w+',\1'0',g" \
+		-e "/ccflags_uselargefiles/d" \
+		-e "s/-Duselargefiles//" \
+		-e "s/-D_FILE_OFFSET_BITS=64//" \
+		-e "s/-D_LARGEFILE_SOURCE//" \
+		${S}/Cross/config.sh-${TARGET_ARCH}-${TARGET_OS}
+}
+
 do_configure() {
         # Make hostperl in build directory be the native perl
         ln -sf ${HOSTPERL} hostperl
@@ -128,6 +139,8 @@ do_configure() {
                     config.sh-${TARGET_ARCH}-${TARGET_OS}
         fi
 
+	${@base_contains('DISTRO_FEATURES', 'largefile', '', 'do_nolargefile', d)}
+
         # Update some paths in the configuration
         sed -i -e 's,@DESTDIR@,${D},g' \
                -e 's,@ARCH@,${TARGET_ARCH}-${TARGET_OS},g' \
diff --git a/recipes/perl/perl_5.8.8.bb b/recipes/perl/perl_5.8.8.bb
index a0fb21a..69078e8 100644
--- a/recipes/perl/perl_5.8.8.bb
+++ b/recipes/perl/perl_5.8.8.bb
@@ -52,6 +52,17 @@ export PERLHOSTLIB = "${STAGING_LIBDIR_NATIVE}/perl/${PV}/"
 # LDFLAGS for shared libraries
 export LDDLFLAGS = "${LDFLAGS} -shared"
 
+do_nolargefile() {
+	sed -i -e "s,\(uselargefiles=\)'define',\1'undef',g" \
+		-e "s,\(d_readdir64_r=\)'define',\1'undef',g" \
+		-e "s,\(readdir64_r_proto=\)'\w+',\1'0',g" \
+		-e "/ccflags_uselargefiles/d" \
+		-e "s/-Duselargefiles//" \
+		-e "s/-D_FILE_OFFSET_BITS=64//" \
+		-e "s/-D_LARGEFILE_SOURCE//" \
+		${S}/Cross/config.sh-${TARGET_ARCH}-${TARGET_OS}
+}
+
 do_configure() {
         # Make hostperl in build directory be the native perl
         ln -sf ${HOSTPERL} hostperl
@@ -83,6 +94,8 @@ do_configure() {
                     config.sh-${TARGET_ARCH}-${TARGET_OS}
         fi
 
+	${@base_contains('DISTRO_FEATURES', 'largefile', '', 'do_nolargefile', d)}
+
         # Update some paths in the configuration
         sed -i -e 's,@DESTDIR@,${D},g' \
                -e 's,@ARCH@,${TARGET_ARCH}-${TARGET_OS},g' \
-- 
1.7.1



