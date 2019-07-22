Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
	[209.85.208.172])
	by mail.openembedded.org (Postfix) with ESMTP id 136BF7EF64
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Jul 2019 01:02:58 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id r9so35824106ljg.5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Jul 2019 18:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=4n+fZtIe2Hp69nV5W861XXTFDj7ZpMPXAJ2OqoGGRaQ=;
	b=DYW6q4TQ3dpo8HPpavgxlwyuTK3cd5DSsX5VZ5IwHWSH6AL1Hzc+kwqIGMHc0Q8TKQ
	0x+3but7L4kNW1jmx1y8rPrxwgYYpa99D9cJ1/f96J0McxhkMvhGh8KyAF9n/Xcacan5
	KXPtVS0YI9fEUDC/Z0P/DSttbx+vCArAYa5hSrnLAQznl5/4VYFaQEmTrHtwdA56voGE
	O49bbhe6KHQA/jvHi3WxXxWTl5c9TweXYbe2Ch20P43G2ONTFp2QIcANMvlIMvCKwG8m
	tVxupmjpiit84JE4o9pVPqTabneSH0/fFelXGW2UkjFMUPchy5DPZTqid5I0Bm145+He
	11xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=4n+fZtIe2Hp69nV5W861XXTFDj7ZpMPXAJ2OqoGGRaQ=;
	b=sxmF8YZdF89kdX7mP1yHjNC1CKhnWIH2pFMVFQ4ZFwyVzsNG7svpiz7fH6UE0RSH5R
	DaWQynh2N9DoFw3Q0lDiUiYqvovkE9Fmz/EsDV3VH4oIAHV1OG6gjilx6+mfk4wl1mNl
	FD1jjgjbWP3+vPJAQqX/HSmnGUmFuGQT6q/49TXNq8kxCgk9TBHaoihlxWfLAZ+YBw31
	uqLxDeU+sKv3T91cCRtQcpJzOfjIs+xkIi7dGJL+Z081BxBMxNmiMVy/vxB3ZyE0Y3q2
	67JlOlSUGHLDs9Jw1QmY/VOs8acMegI09f42sWEgb71HkVjBfIheouNuJ9+SmETMnSTP
	/T7A==
X-Gm-Message-State: APjAAAVJUWSayj9lZC2wSTA8iU9D6p532sr3uOilMVOs110IYcV8786N
	FY+t4NsH3UAuQlR6d95j7ZCeNGP0
X-Google-Smtp-Source: APXvYqyx1EB7H/xeiNUAEQFUhIY7qEv5OPMdCWq+5yXuJiHIVPjSfvdLBB+1Ft5weLDq/Jr8WXzz9w==
X-Received: by 2002:a2e:2993:: with SMTP id p19mr33687889ljp.202.1563757379050;
	Sun, 21 Jul 2019 18:02:59 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id a9sm5769240lfj.79.2019.07.21.18.02.58
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sun, 21 Jul 2019 18:02:58 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Jul 2019 03:02:53 +0200
Message-Id: <20190722010253.29267-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-networking] uftp: update to 4.10
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
X-List-Received-Date: Mon, 22 Jul 2019 01:02:59 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../recipes-support/uftp/{uftp_4.9.11.bb => uftp_4.10.bb}     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/uftp/{uftp_4.9.11.bb => uftp_4.10.bb} (77%)

diff --git a/meta-networking/recipes-support/uftp/uftp_4.9.11.bb b/meta-networking/recipes-support/uftp/uftp_4.10.bb
similarity index 77%
rename from meta-networking/recipes-support/uftp/uftp_4.9.11.bb
rename to meta-networking/recipes-support/uftp/uftp_4.10.bb
index 8b47bd16f..86c0c222c 100644
--- a/meta-networking/recipes-support/uftp/uftp_4.9.11.bb
+++ b/meta-networking/recipes-support/uftp/uftp_4.10.bb
@@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=d32239bcb673463ab874e80d47fae504"
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/uftp-multicast/files/source-tar/"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/uftp-multicast/source-tar/uftp-${PV}.tar.gz"
-SRC_URI[md5sum] = "c0bc86b3067825a3866de9ef80c7451a"
-SRC_URI[sha256sum] = "2ddc835a35f669d55df27ab6883ba19bb00bc8e4b66897ceaedb160b02246b1a"
+SRC_URI[md5sum] = "df6407af3a0067b881431b3dad149ef3"
+SRC_URI[sha256sum] = "91ba8aae80c7c9ccaf04600b628cbeca4699ed48268fe43d2bf539a41083f292"
 
 DEPENDS = "openssl"
 
-- 
2.17.1


