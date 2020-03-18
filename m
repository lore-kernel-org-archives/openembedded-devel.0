Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
	[209.85.128.47])
	by mail.openembedded.org (Postfix) with ESMTP id EF5BE60ADF
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Mar 2020 20:44:30 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id c187so3754162wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Mar 2020 13:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=Sypz8mrlfdgB3GytFLGu/1s3tU7K+PCEWpZ3+PhHJYs=;
	b=oO6ay3vvtCA+rTCOirU/eUvKTO+p7ELEv8QCQJKXVTWAf5SKzXV5rE1adi5lAoJnFI
	X2FXUG3NcbaH5u+krJOdW7cS1yqMrkk5nYpGdrLuQT8r0vByG6kWeV9HmohIXO5r0xBL
	8z+RBxasHN9TfvABTg2UIwZvviqWNvHU3tN70vO3q0my01htGQrw+dyxmtYMzxHFWHh0
	IXOWwGvR2f4GM0VaWsbbb5yfESnxy1ZM6XA9qWHVtuVXf6j+g4zWnhZj4AUUivq8DD6G
	KC373vG/ZGXQXlRwO3xGFoPDewjtxJnJVn4+msFrQcsCcZr0MyPpQGJsHfwT79aVzNcs
	zJow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Sypz8mrlfdgB3GytFLGu/1s3tU7K+PCEWpZ3+PhHJYs=;
	b=qa7GWcGMMIgDeuyZl5fEWwSdkRd/aBisAFc7XTndNQRrDjE0sVSh4RUFQ21Ey4N1vS
	rN46CPevInd5AqxYrLjadHllj1EFbGtLiuQywhs8nAAU0JPLxFtPPVi/akdqn543YRc5
	TF1kxMqJqSe/OdViiahZQADFhSj28WL6LjEnsM8EyTRSwsF45LZHFOF4WVa6scp3nNP9
	fsl+5mct4wXrudccwyzJkiF1o2gbnYldiE3CRumLugrkeAuWVpt7SLWl+rAekW/xOlts
	oe1ClR9S7QgzhD41OQ+KApU7kmRF/sJJsEn6G1BBl+S8q4IJGwgQt3jV/1CMEU4KmhzB
	/fSQ==
X-Gm-Message-State: ANhLgQ0ZnAoZh1nLpFFx1cC6nG/BtLntTUC/PwJB3H2HgjVAdAX3yJdW
	maqa0xEhI4GTkaW4zIelmThN91kD7B8=
X-Google-Smtp-Source: ADFU+vtytDYdgqF6IAEe1ZHJ/z9PQAsrJSyfu05LSKmNF/ZZ2TMZKdLIvcwHpcYQq3mH/JDYIxHoXQ==
X-Received: by 2002:a7b:c159:: with SMTP id z25mr7219110wmi.102.1584564271312; 
	Wed, 18 Mar 2020 13:44:31 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F0E8C3838FF9D0BB177A6DE.dip0.t-ipconnect.de.
	[2003:f0:7f0e:8c38:38ff:9d0b:b177:a6de])
	by smtp.gmail.com with ESMTPSA id
	j188sm3982590wmj.36.2020.03.18.13.44.29
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 18 Mar 2020 13:44:29 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 18 Mar 2020 21:44:10 +0100
Message-Id: <20200318204411.12996-4-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200318204411.12996-1-schnitzeltony@gmail.com>
References: <20200318204411.12996-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 4/5] networkmanager-openvpn: Make PACKAGECONFIG gnome work
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 18 Mar 2020 20:44:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../networkmanager/networkmanager-openvpn_1.8.12.bb | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.8.12.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.8.12.bb
index 5e246a85b..d455a0f06 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.8.12.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.8.12.bb
@@ -15,7 +15,18 @@ SRC_URI[sha256sum] = "0efda8878aaf0e6eb5071a053aea5d7f9d42aac097b3ff89e7cbc9233f
 
 S = "${WORKDIR}/NetworkManager-openvpn-${PV}"
 
-PACKAGECONFIG[gnome] = "--with-gnome,--without-gnome"
+# meta-gnome in layers is required using gnome:
+PACKAGECONFIG[gnome] = "--with-gnome,--without-gnome,gtk+3 libnma libsecret"
+
+do_configure_append() {
+    # network-manager-openvpn.metainfo.xml is created in source folder but
+    # compile expects it in build folder. As long as nobody comes up with a
+    # better solution just support build:
+    if [ -e ${S}/appdata/network-manager-openvpn.metainfo.xml ]; then
+        mkdir -p ${B}/appdata
+        cp -f ${S}/appdata/network-manager-openvpn.metainfo.xml ${B}/appdata/
+    fi
+}
 
 do_install_append () {
     rm -rf ${D}${libdir}/NetworkManager/*.la
-- 
2.21.1


