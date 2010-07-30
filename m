Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <aalonso00@gmail.com>) id 1Oeri2-0001PL-9r
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Jul 2010 17:41:19 +0200
Received: by wwb34 with SMTP id 34so23403wwb.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jul 2010 08:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=oReLIrAfVWf+ujwXugJnPnXvMlp3GQA3OiFwlJ0l0ys=;
	b=Xwl3SlxcqVYQvwMlIbqrav9bHV8CBZjX8XsSjTw2Gx1seR5QeS8rUwYIqKONjpzspg
	qzThWD7prBLlYSVwR7gXeKdu9t5ZGb1MuREMfCiZ9idZlLmF/J5hIDbx0DUQ/j9cPzA/
	A71ghdBBz3BBTkKdiHPWJRz3Oblb//g+d+zwI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=leJlkLVpJ9VH6lk8yBQRgUsqryhHMaVMt/qCjrYWMGFEXDI0jHEJqtHqQsYREeCerg
	SViTC/D+hwbFQDkV2FgJDo/tQ3c2YC0olIeGt8rrTowW/K4ODUJOoRkaWOaAqpp01Okl
	aMqLF1DFlIX10wat91dmD3FIpP/MnP7Fzc73w=
Received: by 10.227.128.144 with SMTP id k16mr1855648wbs.196.1280504457422;
	Fri, 30 Jul 2010 08:40:57 -0700 (PDT)
Received: from aalonso-pc.lan ([201.153.218.190])
	by mx.google.com with ESMTPS id h3sm2015014wbb.15.2010.07.30.08.40.55
	(version=SSLv3 cipher=RC4-MD5); Fri, 30 Jul 2010 08:40:56 -0700 (PDT)
From: Adrian Alonso <aalonso00@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Jul 2010 10:42:33 -0500
Message-Id: <1280504555-3633-8-git-send-email-aalonso00@gmail.com>
X-Mailer: git-send-email 1.7.2
In-Reply-To: <openembedded-devel@lists.openembedded.org>
References: <openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Mail-From: aalonso00@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 08/10] xserver-common: xilinx virtex support
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
X-List-Received-Date: Fri, 30 Jul 2010 15:41:19 -0000

* Add xilinx virtex platforms support
* Set xserver args
* Bump PR

Signed-off-by: Adrian Alonso <aalonso00@gmail.com>
---
 recipes/xserver-common/files/Xserver-virtex.patch |   14 ++++++++++++++
 recipes/xserver-common/xserver-common_1.33.bb     |    5 +++--
 2 files changed, 17 insertions(+), 2 deletions(-)
 create mode 100644 recipes/xserver-common/files/Xserver-virtex.patch

diff --git a/recipes/xserver-common/files/Xserver-virtex.patch b/recipes/xserver-common/files/Xserver-virtex.patch
new file mode 100644
index 0000000..c7d6cc2
--- /dev/null
+++ b/recipes/xserver-common/files/Xserver-virtex.patch
@@ -0,0 +1,14 @@
+Index: xserver-common-1.13/X11/xserver-common
+===================================================================
+--- xserver-common-1.13.orig/X11/xserver-common
++++ xserver-common-1.13/X11/xserver-common
+@@ -181,6 +181,9 @@ else
+             # this is to rotate X display properly, tested with display TX09D71VM1CCA
+             ronetix*pm9261*  | ronetix*pm9263*)
+                  ARGS="$ARGS -screen 240/54x320/81@90x16" ;;
++        "Xilinx Virtex"*)
++            DPI="96"
++            ARGS="$ARGS" ;;
+         # This is a fallback for PCs
+         "")
+             if [ -f $BINDIR/Xvesa ]; then
diff --git a/recipes/xserver-common/xserver-common_1.33.bb b/recipes/xserver-common/xserver-common_1.33.bb
index cb644a4..71fa231 100644
--- a/recipes/xserver-common/xserver-common_1.33.bb
+++ b/recipes/xserver-common/xserver-common_1.33.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Common X11 scripts and support files"
 LICENSE = "GPL"
 SECTION = "x11"
 RDEPENDS_${PN} = "xmodmap xrandr xdpyinfo"
-PR = "r4"
+PR = "r5"
 
 PACKAGE_ARCH = "all"
 DEFAULT_PREFERENCE = "-1"
@@ -19,7 +19,8 @@ SRC_URI[sha256sum] = "4576ccca80730f1860a273df38b9f917cf906eca9865e108d76fc5460e
 SRC_URI_append = " file://loop.patch;striplevel=3 \
                    file://rgba.diff \
                    file://setDPI.sh \
-                   file://89xdgautostart.sh"
+                   file://89xdgautostart.sh \
+                   file://Xserver-virtex.patch"
 
 SRC_URI_append_angstrom = " file://xtscal-fix.patch "
 RDEPENDS_${PN}_append_angstrom = " tslib-calibrate "
-- 
1.7.2



