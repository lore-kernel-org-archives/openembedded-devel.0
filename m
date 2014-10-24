Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id 86959601F6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Oct 2014 10:22:42 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Xhc12-0003qo-A7 for openembedded-devel@lists.openembedded.org;
	Fri, 24 Oct 2014 12:22:40 +0200
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Oct 2014 12:22:40 +0200
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Oct 2014 12:22:40 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 24 Oct 2014 12:22:29 +0200
Message-ID: <m2d996$3rc$1@ger.gmane.org>
References: <1414145104-32486-1-git-send-email-Hongjun.Yang@windriver.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
In-Reply-To: <1414145104-32486-1-git-send-email-Hongjun.Yang@windriver.com>
Subject: Re: [meta-oe][PATCH] sharutils: Add new package
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 24 Oct 2014 10:22:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hongjun Yang schreef op 24-10-14 12:05:
> From: "Hongjun.Yang" <hongjun.yang@windriver.com>
> 
> Signed-off-by: Hongjun.Yang <hongjun.yang@windriver.com> --- 
> .../sharutils-4.14/fix-for-cross-compiling.patch   | 29
> ++++++++++++++++++++++ .../recipes-support/sharutils/sharutils_4.14.bb
> | 18 ++++++++++++++ 2 files changed, 47 insertions(+) create mode 100644
> meta-oe/recipes-support/sharutils/sharutils-4.14/fix-for-cross-compiling.patch
>
> 
create mode 100644 meta-oe/recipes-support/sharutils/sharutils_4.14.bb
> 
> diff --git
> a/meta-oe/recipes-support/sharutils/sharutils-4.14/fix-for-cross-compiling.patch
> b/meta-oe/recipes-support/sharutils/sharutils-4.14/fix-for-cross-compiling.patch
>
> 
new file mode 100644
> index 0000000..86a7da6 --- /dev/null +++
> b/meta-oe/recipes-support/sharutils/sharutils-4.14/fix-for-cross-compiling.patch
>
> 
@@ -0,0 +1,29 @@
> +From 990234af84a5399017d1c4fe03c5c756a8e51e23 Mon Sep 17 00:00:00 2001 
> +From: Hongjun Yang <Hongjun.Yang@windriver.com> +Date: Tue, 20 Aug 2013
> 09:41:43 +0800 +Subject: [PATCH] fix cross compiling issue + 
> +Upstream-Status: Pending + +Signed-off-by: Hongjun.Yang
> <hongjun.yang@windriver.com> + +--- + configure | 2 +- + 1 file changed,
> 1 insertion(+), 1 deletion(-) + +diff --git a/configure b/configure 
> +index 6ee98e0..8067f54 100755 +--- a/configure ++++ b/configure +@@
> -26965,7 +26965,7 @@ fi + if test "$cross_compiling" = yes; then : +   {
> { $as_echo "$as_me:${as_lineno-$LINENO}: error: in \`$ac_pwd':" >&5 +
> $as_echo "$as_me: error: in \`$ac_pwd':" >&2;} +-as_fn_error $? "cannot
> run test program while cross compiling ++$as_echo "cannot run test
> program while cross compiling + See \`config.log' for more details"
> "$LINENO" 5; } + else +   cat confdefs.h - <<_ACEOF >conftest.$ac_ext +--
>  +1.8.1.4 + diff --git
> a/meta-oe/recipes-support/sharutils/sharutils_4.14.bb
> b/meta-oe/recipes-support/sharutils/sharutils_4.14.bb new file mode
> 100644 index 0000000..49981e7 --- /dev/null +++
> b/meta-oe/recipes-support/sharutils/sharutils_4.14.bb @@ -0,0 +1,18 @@ 
> +SUMMARY = "This is the set of GNU shar utilities." +HOMEPAGE =
> "http://www.gnu.org/software/sharutils/" +SECTION = "console/utils" 
> +LICENSE="GPLv3+" +LIC_FILES_CHKSUM =
> "file://COPYING;md5=d32239bcb673463ab874e80d47fae504" + +inherit gettext
> autotools-brokensep + +SRC_URI =
> "ftp://ftp.gnu.org/gnu/sharutils/sharutils-4.14.tar.gz \ +
> file://fix-for-cross-compiling.patch \ +	  " + +SRC_URI[md5sum] =
> "5686c11131b4c4c0841f8f3ef34d136a" +SRC_URI[sha256sum] =
> "90f5107c167cfd1b299bb211828d2586471087863dbed698f53109cd5f717208" + 
> +do_configure () { +	oe_runconf +}

Can you add a note in the recipe and commit log why autoreconf fails?

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFUSihlMkyGM64RGpERAlChAJ0ZLHbPb0F1oXz/YczTkBwRFG2GVACgtD8j
XBsqMhqeGZmPJvcSFjMlKW0=
=LRRA
-----END PGP SIGNATURE-----


