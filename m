Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f176.google.com (mail-we0-f176.google.com
	[74.125.82.176])
	by mail.openembedded.org (Postfix) with ESMTP id B803370A10
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  9 Aug 2014 16:08:32 +0000 (UTC)
Received: by mail-we0-f176.google.com with SMTP id q58so6792890wes.21
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Aug 2014 09:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=VhpegV/KcYkISFnz1hRYnog5xv+j8QQT/qT8w+VtQhg=;
	b=iFqCxlmRd/rV2RLzVyZtqGTOWa+qfRbSubES3g/1Kn4+kNvJba4IzkdMXDzXAM8ID/
	jm2yXU8iPed9CeZTVI1BLaPSmvzdWwED0PeNeIUNrXiCav6U7GNQF3byRRtpidilrpFz
	7DPcg6o1sipqFvlMzvu3esUCvversz9IxMZD66pSPSAWMPXqK2++4jtAdGoWG+21VjWh
	h2+9XWkPFF7BBn0ooHXuBjAB1Hx48HjjkefTWDKFDMAMoGF6s+8p41uD1oDoGIMG57jt
	rFBXJD68VuRuVbmSXvltLP81UdW8QoJuEDV9xFVJQ3K9tl8YOcCKgXBQ5+v4+Gpp61Kq
	Pcnw==
X-Received: by 10.194.188.46 with SMTP id fx14mr3410328wjc.112.1407600513363; 
	Sat, 09 Aug 2014 09:08:33 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ch5sm25534567wjb.18.2014.08.09.09.08.32 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 09 Aug 2014 09:08:32 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  9 Aug 2014 18:08:26 +0200
Message-Id: <1407600537-10857-5-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.4
In-Reply-To: <1407600537-10857-1-git-send-email-Martin.Jansa@gmail.com>
References: <1407600537-10857-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 05/36] gnome-disk-utility: add dependency on libgnome-keyring
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
X-List-Received-Date: Sat, 09 Aug 2014 16:08:33 -0000

* fixes following floating dependencies:
  gnome-disk-utility/gnome-disk-utility-libs/latest lost dependency on
    libcap libgcrypt libgnome-keyring libgpg-error

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb b/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb
index 7e6c340..2c526c8 100644
--- a/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb
@@ -3,7 +3,7 @@ SUMMARY = "GNOME disk utility"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e9115d11797a5e6b746b4e9b90194564"
 
-DEPENDS = "glib-2.0 gtk+ libnotify libunique udisks avahi-ui virtual/libx11 libatasmart gnome-doc-utils intltool-native"
+DEPENDS = "glib-2.0 gtk+ libnotify libunique udisks avahi-ui virtual/libx11 libatasmart gnome-doc-utils intltool-native libgnome-keyring"
 
 PR = "r4"
 
-- 
2.0.4


