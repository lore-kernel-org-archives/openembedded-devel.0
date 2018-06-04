Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f52.google.com (mail-pl0-f52.google.com
	[209.85.160.52])
	by mail.openembedded.org (Postfix) with ESMTP id 576837472A
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Jun 2018 02:49:04 +0000 (UTC)
Received: by mail-pl0-f52.google.com with SMTP id c23-v6so7445876plz.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 03 Jun 2018 19:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Ss84HHj+uUF19+6JPnUtq6LdHC06zZF0wm/eurze/cw=;
	b=iVBBMAhu6/5qpAH5FaLj6mPXDFNhAMtta+NdUisug6qeoHZVX2QlDSrOLDRCp+Je0B
	q8FLSEv0RCCvyV3MCOceHp5ffUi6h5vMYNQDsLiz/kvvrpNMedglpmoXhIPo37coC2pO
	u3ZUyacqXJnPUjEpJ60Iynx4B5vfSVlHY2iC3Zt6kuxLokeq9Obg2cAGeoJqD7RD2NUw
	eLUQfXMNtw02h2gTWq2bDOPeYZutEJ/nALJb/743oKsFjqt+IyiCDmhahRsppo63VANT
	VMgkwZfb1bZn6PmqUEwJKdSdHnhh+JRZmd15WAIGfiK+vI68izfkR/FG7ibMv2GPCvcd
	Bq0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Ss84HHj+uUF19+6JPnUtq6LdHC06zZF0wm/eurze/cw=;
	b=cyzXdbyL0vdoLwvup0FABWqQRKdjsQQeS0sdI9y8oNU4HvAe88ceitlEGjtoebCNJu
	x8BlKTcB8d6IEO+r1iyAG9E4VJQvrJQmWPihSnTDDMY2DvdCkwJ3LwuQk0Sf2XjYI9IV
	+yCqNWYy3q0cmTgHtDoRHcKIIM1PS4b4steuse5mTFk4d9wChwtEAfqjjxU/cDgENG8C
	BZyRPxKf/tv5kJ/2k8vb3PYA0zSyvP4hVlLy5DBv5avFfj/DCa8ExW7rVV+08Qt1Bdek
	VGRPniexHanGZ6Z8N0JnNunnWXft0hprcK8RUOdW20zxfjZ705T8uw2rFbGEI51kPPHE
	lBCg==
X-Gm-Message-State: ALKqPweIYXySDDSOqf/8771kOtLIVytNUz++62BxPsNyVMuYq0mbSQxX
	ZxzZ+4ek4lYydNLJELRO8ww/XA==
X-Google-Smtp-Source: ADUXVKKjh+uThewuxgq/Nj5SgPOzM6FS/riO3mFg42xJ1OdbnIbhHOrUDWdGMoJb+NM3xFEjEzZ/Og==
X-Received: by 2002:a17:902:d886:: with SMTP id
	b6-v6mr20166023plz.361.1528080545589; 
	Sun, 03 Jun 2018 19:49:05 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4000:1184:f1bd:c539:22b:bbf1])
	by smtp.gmail.com with ESMTPSA id
	o10-v6sm62844021pgc.80.2018.06.03.19.49.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 03 Jun 2018 19:49:05 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Sun,  3 Jun 2018 19:48:44 -0700
Message-Id: <7f7fdd5e516946ced60b2e20d5f5ca2ce9a27fee.1528080420.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1528080420.git.akuster808@gmail.com>
References: <cover.1528080420.git.akuster808@gmail.com>
Subject: [morty 10/15] wireshark: 2.2.7 -> 2.2.8
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
X-List-Received-Date: Mon, 04 Jun 2018 02:49:04 -0000

From: Kai Kang <kai.kang@windriver.com>

Signed-off-by: Kai Kang <kai.kang@windriver.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../wireshark/{wireshark_2.2.7.bb => wireshark_2.2.8.bb}              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/wireshark/{wireshark_2.2.7.bb => wireshark_2.2.8.bb} (95%)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_2.2.7.bb b/meta-networking/recipes-support/wireshark/wireshark_2.2.8.bb
similarity index 95%
rename from meta-networking/recipes-support/wireshark/wireshark_2.2.7.bb
rename to meta-networking/recipes-support/wireshark/wireshark_2.2.8.bb
index 2f6f7b0..f94324e 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_2.2.7.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_2.2.8.bb
@@ -10,8 +10,8 @@ SRC_URI = "https://2.na.dl.wireshark.org/src/all-versions/${BP}.tar.bz2"
 
 PE = "1"
 
-SRC_URI[md5sum] = "a4d880554c7f925dafef60fa313b580d"
-SRC_URI[sha256sum] = "689ddf62221b152779d8846ab5b2063cc7fd41ec1a9f04eefab09b5d5486dbb5"
+SRC_URI[md5sum] = "bb81d0ecf3a8ed46bedfaeae6fd318a8"
+SRC_URI[sha256sum] = "ecf02c148c9ab6e809026ad5743fe9be1739a9840ef6fece6837a7ddfbdf7edc"
 
 inherit autotools pkgconfig perlnative
 
-- 
2.7.4


