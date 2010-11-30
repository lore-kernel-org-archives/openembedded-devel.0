Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1PNInN-0002Sq-Bl
	for openembedded-devel@lists.openembedded.org;
	Tue, 30 Nov 2010 06:30:30 +0100
Received: by pzk12 with SMTP id 12so770371pzk.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Nov 2010 21:29:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=doA0B1Hp0GuM7F8nxm0ixO2VvwLwdBAhjJ3yXPR+fBA=;
	b=bOrMOKmsZIQEmYi3HtYRuYPPqFqNE6ntuMHH3u9MBaBS1dxKuX8iy+EqcAkqGIcR5l
	86vzEcLAhxQHKN5WDp8PEZeJLgDw6jwDZTBP5crPDPYe50rq3rNFPj5HOUqfsMZDKRs1
	ZiketGTqg2Npy2kECoeFRmRxdVATixtZQR6IA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=k2tf0yUqGTV4doyOyThwjZzf3SrBCaEN8pwrOQIT8ashfNxw/daiI6UhGJo5hlSbRF
	XS5+MZYS6QBGYplHkFzCBpETFHZMvMfTQm2oUhRD4IjFoDMOqAhQsESSppMCaPxZyAVP
	i69x/50OYznd8E/6QrhipVrdNBVvKlYUXDP5U=
Received: by 10.142.162.19 with SMTP id k19mr6511375wfe.313.1291094947344;
	Mon, 29 Nov 2010 21:29:07 -0800 (PST)
Received: from [10.0.0.5] (eth7090.sa.adsl.internode.on.net [150.101.58.177])
	by mx.google.com with ESMTPS id p8sm8457604wff.16.2010.11.29.21.29.04
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 29 Nov 2010 21:29:06 -0800 (PST)
Message-ID: <4CF48B9D.9050907@gmail.com>
Date: Tue, 30 Nov 2010 15:59:01 +1030
From: Graham Gower <graham.gower@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.15) Gecko/20101113 Thunderbird/3.0.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.210.47
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] autoconf_2.65.bb: Fix configure for DISTRO=micro.
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
X-List-Received-Date: Tue, 30 Nov 2010 05:30:30 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Update autoconf-dont-execute-perl.patch for autoconf-2.65.
See aa0d1e870c41d3375866c8180c720cd0fc27ffcd.

checking for perl... (cached) /bin/perl
/mnt/oe/tmp/work/mipsel-oe-linux-uclibc/autoconf-2.65-r10.0/autoconf-2.65/configure: line 2507: /bin/perl: No such file or directory
configure: error: Perl 5.005_03 or better is required

Signed-off-by: Graham Gower <graham.gower@gmail.com>
---
 .../autoconf-2.65/autoconf-dont-execute-perl.patch |   26 ++++++++++++++++++++
 recipes/autoconf/autoconf_2.65.bb                  |    6 +++-
 2 files changed, 30 insertions(+), 2 deletions(-)
 create mode 100644 recipes/autoconf/autoconf-2.65/autoconf-dont-execute-perl.patch

diff --git a/recipes/autoconf/autoconf-2.65/autoconf-dont-execute-perl.patch b/recipes/autoconf/autoconf-2.65/autoconf-dont-execute-perl.patch
new file mode 100644
index 0000000..b0ac89c
--- /dev/null
+++ b/recipes/autoconf/autoconf-2.65/autoconf-dont-execute-perl.patch
@@ -0,0 +1,26 @@
+diff -ur autoconf-2.65.orig/configure autoconf-2.65/configure
+--- autoconf-2.65.orig/configure	2009-11-22 00:29:10.000000000 +1030
++++ autoconf-2.65/configure	2010-11-30 15:53:46.000000000 +1030
+@@ -2504,9 +2504,6 @@
+ if test "$PERL" = no; then
+   as_fn_error "perl is not found" "$LINENO" 5
+ fi
+-$PERL -e 'require 5.005_03;' || {
+-   as_fn_error "Perl 5.005_03 or better is required" "$LINENO" 5
+-}
+ 
+ # Find out whether the system supports flock
+ # Note this test does not try to find out whether it works with this
+diff -ur autoconf-2.65.orig/configure.ac autoconf-2.65/configure.ac
+--- autoconf-2.65.orig/configure.ac	2009-10-29 12:23:41.000000000 +1030
++++ autoconf-2.65/configure.ac	2010-11-30 15:53:04.000000000 +1030
+@@ -133,9 +133,6 @@
+ if test "$PERL" = no; then
+   AC_MSG_ERROR([perl is not found])
+ fi
+-$PERL -e 'require 5.005_03;' || {
+-   AC_MSG_ERROR([Perl 5.005_03 or better is required])
+-}
+ 
+ # Find out whether the system supports flock
+ # Note this test does not try to find out whether it works with this
diff --git a/recipes/autoconf/autoconf_2.65.bb b/recipes/autoconf/autoconf_2.65.bb
index d0bc9d4..a70b698 100644
--- a/recipes/autoconf/autoconf_2.65.bb
+++ b/recipes/autoconf/autoconf_2.65.bb
@@ -1,12 +1,14 @@
 require autoconf.inc
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 SRC_URI += "file://autoreconf-exclude.patch \
 	    file://autoreconf-foreign.patch \
 	    file://autoheader-nonfatal-warnings.patch \
 	    file://autoreconf-gnuconfigize.patch \
-	    file://config-site.patch"
+	    file://config-site.patch \
+	    file://autoconf-dont-execute-perl.patch \
+	"
 
 SRC_URI_append_virtclass-native = " file://fix_path_xtra.patch"
 
-- 
1.7.1



