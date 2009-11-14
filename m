Received: from [64.235.106.9] (helo=astoria.ccjclearline.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpjday@crashcourse.ca>) id 1N9oAM-0002yu-P3
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Nov 2009 00:05:57 +0100
Received: from cpe00222d3a26f0-cm00222d3a26ec.cpe.net.cable.rogers.com
	([174.113.186.52] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1N9LuT-0007UP-7K for openembedded-devel@lists.openembedded.org;
	Sat, 14 Nov 2009 11:56:09 -0500
Date: Sat, 14 Nov 2009 11:55:08 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: OpenEmbedded Development mailing list
	<openembedded-devel@lists.openembedded.org>
Message-ID: <alpine.LFD.2.00.0911141154040.29809@localhost>
User-Agent: Alpine 2.00 (LFD 1167 2008-08-23)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SA-Exim-Connect-IP: 64.235.106.9
X-SA-Exim-Mail-From: rpjday@crashcourse.ca
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] i2c-tools: Remove superseded i2c-tools 3.0.1.
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
X-List-Received-Date: Sun, 15 Nov 2009 23:05:58 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

  whoops, ignore earlier patch, i forgot to remove the entry from
checksums.ini.

diff --git a/conf/checksums.ini b/conf/checksums.ini
index 8252329..8a66ed1 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -12010,10 +12010,6 @@ sha256=1019b3fbeb3e7e2d0c8faf81191e722bfabc714ee03ec08703faf91dab443b64
 md5=01f5cc3adbe9d161cf8e1855cec4fa15
 sha256=9a9b7092f2e48786e8f83e5bef99fd31988f87140ad9ca840583f91b3623d628

-[http://dl.lm-sensors.org/i2c-tools/releases/i2c-tools-3.0.1.tar.bz2]
-md5=0f5c7ce5fd3c65113909db0ef3a3a8c8
-sha256=8cf39f7c447b0b8f7a24eaed243ad4d8c654c2e94a146a796dba9ed08e857209
-
 [http://dl.lm-sensors.org/i2c-tools/releases/i2c-tools-3.0.2.tar.bz2]
 md5=b546345ac19db56719dea6b8199f11e0
 sha256=0b4d6455a30a3264a60b4d3be55855d996d52ea4f162a2f04ffff378e24f98a2
diff --git a/recipes/i2c-tools/i2c-tools_3.0.1.bb b/recipes/i2c-tools/i2c-tools_3.0.1.bb
deleted file mode 100644
index c8ea32a..0000000
--- a/recipes/i2c-tools/i2c-tools_3.0.1.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-DESCRIPTION = "Set of i2c tools for linux"
-SECTION = "base"
-LICENSE = "GPL"
-
-SRC_URI = "http://dl.lm-sensors.org/i2c-tools/releases/i2c-tools-${PV}.tar.bz2"
-
-inherit autotools
-
-do_compile_prepend() {
-        sed -i 's_/usr/local_/usr_' Makefile
-        sed -i 's_CC\t:= gcc_CC\t:= ${CC}_' Makefile
-}


========================================================================
Robert P. J. Day                               Waterloo, Ontario, CANADA

            Linux Consulting, Training and Kernel Pedantry.

Web page:                                          http://crashcourse.ca
Twitter:                                       http://twitter.com/rpjday
========================================================================


