Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 4907F71D97
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2017 18:07:25 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id u63so15682613wmu.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2017 10:07:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=oHO6gmaaFhrLwoR+Nf7Dgb5bl4pfVmFY9bsQZHbIuRQ=;
	b=N8Ie6FZ668bPVHNN8wCsDx0wdOzx23J7DMSSz/AMZfLHNZK4qXfE1ly2iYeh2wZwA2
	LIeJelcx77tEu7zEIP12hCaG0VfmNtedshiydjcqDalqeVMydmbp/tanbwTMNTIeMJzr
	LalHX5EmDrBprO4bG8C1YD22IeFzrsW9WySdfm8L1fRt7T/T65B+3fipC9P5jYyYJGm0
	nha647j52RC/rawAyiilDw1SElQCXW3E9tzytN0yQx33DKgMX/qn4HPkJNtQWEApt8+F
	hVIxCWxPNzmgvJombuXKAyt5sKGMdj4hXWwn4138MK/s7jWxh1hI1Lj3VNt4kW+RCiki
	7ftw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=oHO6gmaaFhrLwoR+Nf7Dgb5bl4pfVmFY9bsQZHbIuRQ=;
	b=D97jMmVRpqhQaq5YYTUdTcTRlLI1mGn3PusfOtUJvxZmsJhHrpOlDtQq8IQ8Aw5vyn
	0/+d8E8G4RhYzeqJDEKDRdys7dMuBD2oC7AcHDSBzaY+6gv9m/zpbvjYdkh/6NEhAAS9
	2Vg/9BMlTF1sI9lH0dFSaUnbHmSMs9hMy8rAEv4DM3y9RtSP/5djzVUPkpEsbKj5Lx3f
	vzp6cSRv7DBZXrNBhOyBVBEZiq7zDlnQdE4MthkPv15eOpYNoGhI2Y4xJEcSMQKNplQf
	3a4y28TKjaKxvTLJMsO+OfaZkxgmK9ftutrT2+a6A74CWqGAESYCILMO78CqigL7hh/4
	k0LA==
X-Gm-Message-State: AMke39kXf5GzU6q/PBbBSNLRswiCpdEI6ZvrMmRGDRTsro9DjpT8S1MDh7jsGm08bhHeGA==
X-Received: by 10.28.8.130 with SMTP id 124mr19406375wmi.65.1487614045327;
	Mon, 20 Feb 2017 10:07:25 -0800 (PST)
Received: from PC192-168-2-116.speedport.ip
	(p20030046E911DE631E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:46:e911:de63:1e6f:65ff:fe3e:7f61])
	by smtp.googlemail.com with ESMTPSA id
	96sm2863710wrb.14.2017.02.20.10.07.24
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Feb 2017 10:07:24 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Feb 2017 19:06:25 +0100
Message-Id: <20170220180700.29836-10-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170220180700.29836-1-schnitzeltony@googlemail.com>
References: <20170220180700.29836-1-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 09/44] mpd: update 0.19.21 -> 0.20.4
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
X-List-Received-Date: Mon, 20 Feb 2017 18:07:25 -0000
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
index 4f22e96..238f504 100644
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


