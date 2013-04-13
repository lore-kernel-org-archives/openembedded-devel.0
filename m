Received: from mail-gg0-f178.google.com ([209.85.161.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1UR4JW-0007dJ-NF
	for openembedded-devel@lists.openembedded.org;
	Sat, 13 Apr 2013 19:32:41 +0200
Received: by mail-gg0-f178.google.com with SMTP id e5so569983ggh.23
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Apr 2013 10:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=vjLM98eww/dw4mYEaNqdL3h4Vlq0vtzFItTu/D19RPU=;
	b=0/m2XDaKtdjxPju2AP/nxXdj+6nZvOpEJzuZHgId3V01p0V+AOIsINrBYlP0o1RTF3
	ftf2460FbTqFq4xSgXEVgI+4f5wSbc/VT/Xh9N4Dr2jEoahFLWOibGSH3Je4/6IB437I
	CTbq8zbzwaEN0IWNt3W2lLZVjDEW0ADFICQlT6DJCcwIfk3Ltk+VNEAcWwJ/Fu1nU9rN
	GMVuIF8RFUCILTN4IkVK+wRlS1fXZlaYgHWJ+2fk5iLwZDiTk1DCYm+17XKEd7uq6MV6
	1mFPimpH61i5H6Ho2k1Bt9DR3TU/4q0TTAD/V6KU1ZmysWRdkxz1RQ45Z8hxzN4vMvqj
	jEJg==
X-Received: by 10.236.161.130 with SMTP id w2mr8395320yhk.173.1365873308238;
	Sat, 13 Apr 2013 10:15:08 -0700 (PDT)
Received: from nano.lab.ossystems.com.br ([187.23.144.59])
	by mx.google.com with ESMTPS id x33sm18491838yhn.18.2013.04.13.10.15.06
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 13 Apr 2013 10:15:07 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Sat, 13 Apr 2013 14:15:00 -0300
Message-Id: <1365873301-29552-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.8.1
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Mario Domenech Goulart <mario@ossystems.com.br>
Subject: [meta-oe PATCH 1/2] libgsf: update to version 1.14.26
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
X-List-Received-Date: Sat, 13 Apr 2013 17:32:57 -0000

From: Mario Domenech Goulart <mario@ossystems.com.br>

Previous version was 1.14.21, but Gnumeric requires at least 1.14.24.
Since we are changing it, we pick the latest available version.

Signed-off-by: Mario Domenech Goulart <mario@ossystems.com.br>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../recipes-gnome/libgsf/{libgsf_1.14.21.bb => libgsf_1.14.26.bb} | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta-gnome/recipes-gnome/libgsf/{libgsf_1.14.21.bb => libgsf_1.14.26.bb} (71%)

diff --git a/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.21.bb b/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.26.bb
similarity index 71%
rename from meta-gnome/recipes-gnome/libgsf/libgsf_1.14.21.bb
rename to meta-gnome/recipes-gnome/libgsf/libgsf_1.14.26.bb
index a4f1ec2..a6127d6 100644
--- a/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.21.bb
+++ b/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.26.bb
@@ -3,16 +3,16 @@ LICENSE = "GPLv2 & LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=dc7371b50816c96e145fa0f8ade8e24d \
                     file://COPYING.LIB;md5=61464cfe342798eeced82efe9ae55f63"
 
-PR = "r4"
-
 SECTION = "libs"
 
 DEPENDS= "libxml2 bzip2 glib-2.0 zlib"
 
 inherit autotools pkgconfig gnome gconf
 
-SRC_URI[archive.md5sum] = "2b702648b853402554c97d75405c60d3"
-SRC_URI[archive.sha256sum] = "eef0a9d6eca4e6af6c16b208947e3c958c428b94d22792bdd0b80c08a4b301db"
+SRC_URI[archive.md5sum] = "3c5a4fbd16a727c36974078e6d0e9575"
+SRC_URI[archive.sha256sum] = "8919e725aadd785380350c8dec7427d82cf33164bc9a9a549df9440a0c3da6d5"
+
+GNOME_COMPRESS_TYPE = "xz"
 
 EXTRA_OECONF = "\
 		--without-python \
-- 
1.8.1



