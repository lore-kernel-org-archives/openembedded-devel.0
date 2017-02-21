Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id 7C9DF719A9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Feb 2017 08:45:48 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id q39so14367883wrb.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Feb 2017 00:45:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=P5mt4LTLTYg1vqrpjnC6tBqUPYOkbD++ozNfn7R+uPo=;
	b=LZ+hRWKYLPOgy7jyZgh56qmcyVsW4FL9X+FYIoGaEHtW9SIDOmrtMsdw/M/3+iYgAl
	7KM8JZ7DhCARliUYI/IOdrYnPFxP6sbxYcGCg0/w/G7yWKxEuLYNRdoQnE5NQ9R1mJj0
	z4EOiA6O7prQnirakBYlitBfQl24X5wVHoX4jNMghmNqv0gSajAQNTjtK4QB3HfNFK64
	8ZSfNzn/dTG4/v0mQwpbeKi9Oeziwrx1AHyFDx+gar7znkgzeKq04wn/JqEEbuyvN/JJ
	5zAl3hsGk9OV/MG9Ts7HmtOw5H5SkWGd4eszI/VnnlprMpHyt+wxAjU+45MDqLGJpMt5
	H80A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=P5mt4LTLTYg1vqrpjnC6tBqUPYOkbD++ozNfn7R+uPo=;
	b=Q/cEv8SMfMaTKYdySnOGfKEtETqYm/FwcpHih+Me/IXs1RqHPygzvl4+STuxC+RuK6
	iKoE6le5G6CRMzEzE+lkU1mOcPhxOH5jmVVRCKGHcIU25NiFwDEDhOXOfQS9Eiar4Oeo
	iBRcrx0PAaP7iLDkOunzw56oh1Uf+d4eY9l2+G7DwerXKwl9s+fNPoMwqKxy5hoNrDfT
	SoMkZn9994ei5Y6E0dvhhvWcP/nLjt9gj0C/AYLabzTvbmXBJdaPSsoQ1ed0aKjC8ena
	5tR9HVaGwTprBGbZght06SK3NpRqYHuig9Z5K845+CL9FdgzdD5zJU7KZwyz0fKtUVN7
	9dBg==
X-Gm-Message-State: AMke39mFl64vWJ9bWXwaH/hpFML9nmlkYise6U6PLroM+RwjeznGg0D+2EHzYtfumKb8/A==
X-Received: by 10.223.160.180 with SMTP id m49mr9641414wrm.167.1487666749988; 
	Tue, 21 Feb 2017 00:45:49 -0800 (PST)
Received: from localhost.localdomain
	(ip-109-91-251-48.hsi12.unitymediagroup.de. [109.91.251.48])
	by smtp.googlemail.com with ESMTPSA id
	h23sm18953962wrc.48.2017.02.21.00.45.49
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 21 Feb 2017 00:45:49 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 21 Feb 2017 09:45:14 +0100
Message-Id: <20170221084514.27766-2-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170221084514.27766-1-schnitzeltony@googlemail.com>
References: <20170221084514.27766-1-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH V2 2/2] mpd: update 0.19.21 -> 0.20.4
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
X-List-Received-Date: Tue, 21 Feb 2017 08:45:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../recipes-multimedia/musicpd/{mpd_0.19.21.bb => mpd_0.20.4.bb}   | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)
 rename meta-multimedia/recipes-multimedia/musicpd/{mpd_0.19.21.bb => mpd_0.20.4.bb} (92%)

diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.19.21.bb b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.4.bb
similarity index 92%
rename from meta-multimedia/recipes-multimedia/musicpd/mpd_0.19.21.bb
rename to meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.4.bb
index c16f3be..1acb652 100644
--- a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.19.21.bb
+++ b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.4.bb
@@ -38,13 +38,12 @@ DEPENDS += " \
     zlib \
     libupnp \
 "
-
 SRC_URI = " \
-    http://www.musicpd.org/download/${BPN}/0.19/${BP}.tar.xz \
+    http://www.musicpd.org/download/${BPN}/0.20/${BP}.tar.xz \
     file://mpd.conf.in \
 "
-SRC_URI[md5sum] = "fc19f76b512bd471b6af5214965ff7c5"
-SRC_URI[sha256sum] = "8305b8bc026f4b6bde28b8dd09bfdddbe5590acf36358eed4d083a396e301730"
+SRC_URI[md5sum] = "2c0f2f8acad69e7f93cdef2859c674d0"
+SRC_URI[sha256sum] = "712b25351c12616630c580204e1c3dcba3ae2993a56cff1c346c87e334d69728"
 
 EXTRA_OECONF = "enable_bzip2=yes"
 EXTRA_OECONF += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '--with-systemdsystemunitdir=${systemd_unitdir}/system/', '--without-systemdsystemunitdir', d)}"
-- 
2.9.3


