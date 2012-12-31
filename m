Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TpjE8-0005wm-9B
	for openembedded-devel@lists.openembedded.org;
	Mon, 31 Dec 2012 18:32:53 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so5197156eaa.20
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Dec 2012 09:17:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=QlyuMAitibu9auNfl5FShVjYlZ1fDMW2r6lprOvuTvM=;
	b=VMTodCq4OiF9mLEePbbCAi/BQkX7nKJtUoapPmRL8jEUg8PWdyK23LVKx1fAGO3Gfg
	5CbyNcFdvJyLblMWAsr0uv/z4Wn41LYbH/Mybd2l9Z9unSLcKTifEsAy5EXaLPEf34rV
	Q+43LYIsDzGSBdeSUkfdmL17E49tAmSNpa/QZEpPJbDl3a++BDWKY2bJYqDg46VP4arW
	E4wjb+ZeUuo5T9wTVmBjt4sZ/S695F5azCcMsxWjUmPtwWygbkFYNFTplqlhvVwnVR/M
	mfRXYNo9YIOdOMV9kfMFSqBFBu/gkBsk36OXe24h47QYeOZyZHXteT6Hbnxo+ZNZ1UJy
	yN6A==
X-Received: by 10.14.176.66 with SMTP id a42mr111813037eem.34.1356974260712;
	Mon, 31 Dec 2012 09:17:40 -0800 (PST)
Received: from localhost.localdomain (p5B0A1BD4.dip.t-dialin.net.
	[91.10.27.212])
	by mx.google.com with ESMTPS id 46sm86204729eeg.4.2012.12.31.09.17.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 31 Dec 2012 09:17:39 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 31 Dec 2012 18:17:16 +0100
Message-Id: <1356974245-3497-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1356974245-3497-1-git-send-email-schnitzeltony@googlemail.com>
References: <1356974245-3497-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-xfce/meta-gnome 01/10] exo: update to 0.10.1
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
X-List-Received-Date: Mon, 31 Dec 2012 17:33:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-xfce/recipes-xfce/exo/exo/configure.patch     |    4 ++--
 .../exo/{exo_0.8.0.bb => exo_0.10.2.bb}            |    4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta-xfce/recipes-xfce/exo/{exo_0.8.0.bb => exo_0.10.2.bb} (87%)

diff --git a/meta-xfce/recipes-xfce/exo/exo/configure.patch b/meta-xfce/recipes-xfce/exo/exo/configure.patch
index 2ccfcfc..ef27e42 100644
--- a/meta-xfce/recipes-xfce/exo/exo/configure.patch
+++ b/meta-xfce/recipes-xfce/exo/exo/configure.patch
@@ -1,5 +1,5 @@
---- exo-0.3.4/configure.in~	2007-12-02 10:37:06.000000000 -0200
-+++ exo-0.3.4/configure.in	2008-06-05 17:21:42.000000000 -0300
+--- a/configure.ac	2007-12-02 10:37:06.000000000 -0200
++++ b/configure.ac	2008-06-05 17:21:42.000000000 -0300
 @@ -127,22 +127,24 @@
  dnl ***************************************
  dnl *** Check for strftime() extensions ***
diff --git a/meta-xfce/recipes-xfce/exo/exo_0.8.0.bb b/meta-xfce/recipes-xfce/exo/exo_0.10.2.bb
similarity index 87%
rename from meta-xfce/recipes-xfce/exo/exo_0.8.0.bb
rename to meta-xfce/recipes-xfce/exo/exo_0.10.2.bb
index af9103f..4fdfd48 100644
--- a/meta-xfce/recipes-xfce/exo/exo_0.8.0.bb
+++ b/meta-xfce/recipes-xfce/exo/exo_0.10.2.bb
@@ -13,8 +13,8 @@ SRC_URI += " \
     file://gnome-mount \
 "
 
-SRC_URI[md5sum] = "189bd19210e1d7d8601be1cdf27bf259"
-SRC_URI[sha256sum] = "6e21aa30692affcb45fc8283d034da4a02221d26e3e1facb968d04fed4ba05b0"
+SRC_URI[md5sum] = "c70f2a217811bfba2e62f938d4b8f748"
+SRC_URI[sha256sum] = "b385828bf8a38204da3254b57fdfa25a72694495aa189fabd5040f707eec76ce"
 
 # see http://wiki.xfce.org/gnomemount-replacement
 do_install_append () {
-- 
1.7.4.4



