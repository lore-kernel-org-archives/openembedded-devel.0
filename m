Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
	[209.85.221.45])
	by mail.openembedded.org (Postfix) with ESMTP id 3A1D36C64A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Nov 2018 01:53:45 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id v13so236597wrw.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Nov 2018 17:53:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=t5/7VTZPe1zsAcHBZsoBmnEmkG/Tve6c27Yay2YtmQs=;
	b=aqJwmCEYnhPpDF0+2T2MK+VtzoYZ2HBomrO68o+YymYDrX4SUeeWFHS+jNN7v8y6wh
	h70+SqcWwOuIXVsxTRY1JKASDb3NTym5eKDJqq4nmwz13/DSjr2Fs9WArIA/bbcl1UCT
	wWtDsGoy+OP0kQYarkbkr/I+N6ZYjz2Fu1U0i1KT6ZjK3HQWxMOHtozLX+AnUvDj/cT0
	+ovtw7DDzrVv7JTB6IvNy9ZhxzPNvqpYYBKNUdvYDYxRy2OZXFfZnaN81L3vDaqDJdQg
	7a9e7mRLOv02Xe6Adv3eGbNLjSzZvV3/9yurGpYtzLqZrcSmkpD0ax9sWkXF46joatyO
	MwLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=t5/7VTZPe1zsAcHBZsoBmnEmkG/Tve6c27Yay2YtmQs=;
	b=pbX3mio/DfR/Z99PRU1XvbP6fEEDUX2PAQoISzC8bTUFqB/g0ZFPrHagaVTceD1JOf
	STvYWeAbU/JrfOlNVcjdbxxPVTlXcHkOhypeA1ow1fv/gHt/DYRi4TKBZkUJ/JTNMpeS
	8gpGebYCty4wr3Oe4A/Fv1aFpxb72d0Ngw46JjPKbyntKzKsAKdiBQ4AxVId6n8bDTc3
	gPgc+CKMNP2lu7NKZ7GP6Y7MlymSC+fO4TQYoE87R3XXc2KZ6NYzqrQrmn6ugsMx+aYo
	kdREEgu0z3mdkbWOT7RAQg4xb48wNx19HGZfuFp9g8nEcKQhVgzJoEtKmoExGfyS+6+8
	FZ3A==
X-Gm-Message-State: AA+aEWayZ/bapCTyszes7FDG6x9VJqJD5izgNFl1lGkLNKFaUJI1+409
	dQVz3qVgZFcUZXPf/OfIHkSTsAZm
X-Google-Smtp-Source: AFSGD/Vd+2eEa8D15IX7AHId6JhYEvqfhDDlvW5G3cQupLvZCWEc2zH22eCnArEWlN9VxyqB4je7Jw==
X-Received: by 2002:adf:a28d:: with SMTP id s13mr15429698wra.100.1543456425071;
	Wed, 28 Nov 2018 17:53:45 -0800 (PST)
Received: from localhost.localdomain
	(p200300F07BC0EA561E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc0:ea56:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id f66sm681480wmd.28.2018.11.28.17.53.43
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 28 Nov 2018 17:53:43 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 29 Nov 2018 02:53:32 +0100
Message-Id: <20181129015333.1274-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.5
MIME-Version: 1.0
Subject: [PATCH 1/2] libmtp: fix paths for packages
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
X-List-Received-Date: Thu, 29 Nov 2018 01:53:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Upstream has moved udev-rules/mtp-probe. That was not detected on previous
update commit so this is a follow-up.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-oe/recipes-connectivity/libmtp/libmtp_1.1.16.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-connectivity/libmtp/libmtp_1.1.16.bb b/meta-oe/recipes-connectivity/libmtp/libmtp_1.1.16.bb
index a648c890e..c7e2bafdd 100644
--- a/meta-oe/recipes-connectivity/libmtp/libmtp_1.1.16.bb
+++ b/meta-oe/recipes-connectivity/libmtp/libmtp_1.1.16.bb
@@ -38,10 +38,10 @@ PACKAGES =+ "${BPN}-common ${BPN}-runtime"
 RDEPENDS_${BPN} += "libmtp-common"
 RRECOMMENDS_${BPN} += "libmtp-runtime ${PN}-bin"
 
-FILES_${BPN}-common = "${nonarch_base_libdir}/udev/rules.d/*"
+FILES_${BPN}-common = "${nonarch_libdir}/udev/rules.d/*"
 SUMMARY_${BPN}-common = "The udev rules file for MTP devices"
 
-FILES_${BPN}-runtime = "${nonarch_base_libdir}/udev/mtp-probe"
+FILES_${BPN}-runtime = "${nonarch_libdir}/udev/mtp-probe"
 RDEPENDS_${BPN}-runtime = "libmtp-common"
 SUMMARY_${BPN}-runtime = "mtp-probe, used for the MTP udev rules"
 DESCRIPTION_${BPN}-runtime = "This package provides mtp-probe, a program to probe newly connected device interfaces from userspace to determine if they are MTP devices, used for udev rules."
-- 
2.14.5


