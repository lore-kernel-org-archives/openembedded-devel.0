Received: from mail-ea0-f182.google.com ([209.85.215.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1UDZWT-00019v-Gs
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Mar 2013 13:02:10 +0100
Received: by mail-ea0-f182.google.com with SMTP id a12so1466859eaa.27
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Mar 2013 03:45:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=ivFor3FLkxWhkl1aoPD44Iep1ei1oNCAqM+ATWv6AsI=;
	b=FicjcTMNfzPT4lk+A7T8U01X7h/m8vxENxmr9gsXAJdlgyxany7McPutDnDUh1Ss7k
	wqwe950C/KbVQOp8ZGuhA7sDa++sFeDMkxd22PXavjUd6gLO5souYQnWsToztNvG/CpC
	PmdKiHe9k0Dk9FT0G7kUgZiNMoUhZf+8FhnWrOF1/+5R7PfdKlawx4iUWvQwK3DuP9H/
	Jc1cEEZ6zyyZ/zoug7lYur4gy/Ar+VVXGcJCWBissADY/lf0CZYysokAmcIhbbzfYgH4
	/ULN1qMkQED7GCK28zLoXgTxr5jVXyEKxTjAnheBeU1WQNBQ43VbZDfrwiXnL9f84+Vn
	t1jg==
X-Received: by 10.14.173.196 with SMTP id v44mr92134282eel.29.1362656737638;
	Thu, 07 Mar 2013 03:45:37 -0800 (PST)
Received: from localhost.localdomain (ip-95-223-251-141.unitymediagroup.de.
	[95.223.251.141])
	by mx.google.com with ESMTPS id q42sm1778870eem.14.2013.03.07.03.45.36
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Thu, 07 Mar 2013 03:45:36 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  7 Mar 2013 12:43:30 +0100
Message-Id: <1362656613-10357-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1362656613-10357-1-git-send-email-schnitzeltony@googlemail.com>
References: <1362656613-10357-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe/meta-xfce/meta-gnome 1/4] midori: update to 0.4.8
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
X-List-Received-Date: Thu, 07 Mar 2013 12:02:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

the following issues caused similarity index decreasing:

| waf: error: no such option: --disable-hildon

| Checking for Python			:  /usr/bin/python2

| Checking for zeitgeist-1.0 >= 0.3.14        : Package zeitgeist-1.0 was not found in the pkg-config search path.
| Perhaps you should add the directory containing `zeitgeist-1.0.pc'

Run tests showed artifacts with google maps. Theses showed up with previous
version of midori and current version of firefox too. So they seem
independent of this update.

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../midori/{midori_0.4.7.bb => midori_0.4.8.bb}    |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)
 rename meta-gnome/recipes-connectivity/midori/{midori_0.4.7.bb => midori_0.4.8.bb} (84%)

diff --git a/meta-gnome/recipes-connectivity/midori/midori_0.4.7.bb b/meta-gnome/recipes-connectivity/midori/midori_0.4.8.bb
similarity index 84%
rename from meta-gnome/recipes-connectivity/midori/midori_0.4.7.bb
rename to meta-gnome/recipes-connectivity/midori/midori_0.4.8.bb
index 8521e47..266df4f 100644
--- a/meta-gnome/recipes-connectivity/midori/midori_0.4.7.bb
+++ b/meta-gnome/recipes-connectivity/midori/midori_0.4.8.bb
@@ -6,10 +6,10 @@ DEPENDS = "webkit-gtk libsoup-2.4 openssl python-native python-docutils-native l
 
 SRC_URI = "http://archive.xfce.org/src/apps/midori/0.4/midori-${PV}.tar.bz2;name=midori \
           "
-SRC_URI[midori.md5sum] = "06db7b88a41e9b2265728960d5e98f35"
-SRC_URI[midori.sha256sum] = "65bf9976733597c405492ce91aa664fd10547cb7df16e0a70f260c7a3e97ea5d"
+SRC_URI[midori.md5sum] = "ce1b01fa5aa33d2ee50196df0c71e96f"
+SRC_URI[midori.sha256sum] = "40bf23f84a3537f54d7eb45df1da40ebef54c321b1b34d0d0c8e45bb0cce5e9f"
 
-inherit gtk-icon-cache pkgconfig vala
+inherit gtk-icon-cache pkgconfig vala pythonnative
 
 do_configure() {
     sed -i -e 's:, shell=False::g' -e s:/usr/X11R6/include::g -e s:/usr/X11R6/lib::g wscript
@@ -26,8 +26,8 @@ do_configure() {
             --includedir=${includedir} \
             --infodir=${infodir} \
             --mandir=${mandir} \
-            --disable-hildon \
             --disable-gtk3 \
+            --disable-zeitgeist \
 }
 
 PARALLEL_MAKE = ""
-- 
1.7.6.5



