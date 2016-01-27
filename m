Return-Path: <mbc@koumoul.net>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id E963B77196
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Jan 2016 21:07:12 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id l66so2554500wml.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Jan 2016 13:07:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=koumoul.net; s=dkim;
	h=sender:from:to:cc:subject:date:message-id;
	bh=AM0alaHOFBiEBJUhaoMW+RZMn0/ljEtasQNpoRaRYyQ=;
	b=EVkR7LuaxX3oPbOfOIERLklcJ7bC0/9s2Gd6/zGQExvzedY4AOAhCrkZDj1pQ/+Rht
	cR1YhaUvgkQ70l4ZsxDDDAjan7dk/PkZ2U6xR0QrYru1wCp0Uva5Sko+9IRihHA3Bx4N
	WexfX9DiYr+L/A5tgkBUqXTO6MR/ukkaziVDw=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=iot-bzh.20150623.gappssmtp.com; s=20150623;
	h=sender:from:to:cc:subject:date:message-id;
	bh=AM0alaHOFBiEBJUhaoMW+RZMn0/ljEtasQNpoRaRYyQ=;
	b=XV09nFEjr1WckhyaLlwGpf92y7eqiLPGBVNBZh4PoVot1fyFRSqyFfE2ASuySR29/J
	KXaMrjaj0c61QSD3i5I4s+KycN/vf/RxH3nS9vRh+cKDGC3Z8LsMujE3vC+Fk4xj2VHc
	yfQ8vKdrHEzV03Whi7JKMr0CZ+1va8O1RBcrVP1FCSkMtkuQp85D44j/Cmc2NW82wPp8
	TeqhUa8TP3lWrZvse6GcxQdjKRjk9uXkSC1hs7/grftEVPatGzLELQuAeKAMugPEuJ8N
	9TiKYbyDoUBIpN2MpRovjN9JJgi6sZ4kVcATT8mn5WpAqrWEk9LOyMOb2rFOnbqVCM2w
	ihwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=AM0alaHOFBiEBJUhaoMW+RZMn0/ljEtasQNpoRaRYyQ=;
	b=ir9oGV4Xvm6NMz506N06H3r84M4DwelDhrj7g0bsarpVOYHWjgnQM0+GUYAiojL0Dq
	r1h0IOhG9Yvl8J2MEeAH1v2lgSucEMI8k5yiiqJvwXcBuG7+FxHYu8qVsNQQqeZ0306v
	dCPrYJfnRw5MNnruRgcit8rhcTpPtLsScCm8kPwKGvWzW1XzIwJBpPcLXubg4JLfoqMk
	Jre7PiLXr7nrK2JYTEhfz7mw7Xu52PRGYGd5lT8Sn1KpOo7Ep8Xaoq9i/uqrdy6SnHQ4
	v7ymhpbAdiKA8T/0+y+1/rJxAGZJn3OcXOiBYHIrdoqoLjRS+GU8ftbTd12BaBExd0ip
	Hewg==
X-Gm-Message-State: AG10YOQL9ZW79NTPwWNDCCRxp4buyHlYLEgsn9D8KqbEWD9nbOAkgq+973NfmHM9VM/JlA==
X-Received: by 10.28.217.74 with SMTP id q71mr31843262wmg.68.1453928832901;
	Wed, 27 Jan 2016 13:07:12 -0800 (PST)
Received: from localhost.localdomain
	(ARennes-655-1-93-157.w92-139.abo.wanadoo.fr. [92.139.132.157])
	by smtp.gmail.com with ESMTPSA id
	c203sm9363067wmd.5.2016.01.27.13.07.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 27 Jan 2016 13:07:12 -0800 (PST)
Sender: "Manuel Bachmann [ IoT.bzh ]" <mbc@koumoul.net>
From: Manuel Bachmann <manuel.bachmann@iot.bzh>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 27 Jan 2016 22:11:54 +0100
Message-Id: <1453929114-10937-1-git-send-email-manuel.bachmann@iot.bzh>
X-Mailer: git-send-email 1.8.3.1
Cc: Manuel Bachmann <mbc@iot.bzh>
Subject: [meta-multimedia][PATCH 1/2] gupnp: Update to 0.20.14
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
X-List-Received-Date: Wed, 27 Jan 2016 21:07:15 -0000

From: Manuel Bachmann <mbc@iot.bzh>

Update to latest version (required for latest Rygel).

Signed-off-by: Manuel Bachmann <manuel.bachmann@iot.bzh>
---
 meta-multimedia/recipes-connectivity/gupnp/gupnp_0.20.12.bb |    8 --------
 meta-multimedia/recipes-connectivity/gupnp/gupnp_0.20.14.bb |    8 ++++++++
 2 files changed, 8 insertions(+), 8 deletions(-)
 delete mode 100644 meta-multimedia/recipes-connectivity/gupnp/gupnp_0.20.12.bb
 create mode 100644 meta-multimedia/recipes-connectivity/gupnp/gupnp_0.20.14.bb

diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp_0.20.12.bb b/meta-multimedia/recipes-connectivity/gupnp/gupnp_0.20.12.bb
deleted file mode 100644
index c8c6164..0000000
--- a/meta-multimedia/recipes-connectivity/gupnp/gupnp_0.20.12.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require gupnp.inc
-
-SRC_URI = "${GNOME_MIRROR}/${BPN}/0.20/${BPN}-${PV}.tar.xz"
-SRC_URI[md5sum] = "c01aa6d3a78792b3a24591f036dd91f4"
-SRC_URI[sha256sum] = "205d47b950a1b7190df1115f454cb38a44d71aacfec75d4287299e400e139b69"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
-                    file://libgupnp/gupnp.h;beginline=1;endline=20;md5=d78a69d9b6e63ee2dc72e7b674d97520"
diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp_0.20.14.bb b/meta-multimedia/recipes-connectivity/gupnp/gupnp_0.20.14.bb
new file mode 100644
index 0000000..ed07175
--- /dev/null
+++ b/meta-multimedia/recipes-connectivity/gupnp/gupnp_0.20.14.bb
@@ -0,0 +1,8 @@
+require gupnp.inc
+
+SRC_URI = "${GNOME_MIRROR}/${BPN}/0.20/${BPN}-${PV}.tar.xz"
+SRC_URI[md5sum] = "63346ef90ac5cd925c3a941f51d8bca6"
+SRC_URI[sha256sum] = "77ffb940ba77c4a6426d09d41004c75d92652dcbde86c84ac1c847dbd9ad59bd"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
+                    file://libgupnp/gupnp.h;beginline=1;endline=20;md5=d78a69d9b6e63ee2dc72e7b674d97520"
-- 
1.7.10.4


