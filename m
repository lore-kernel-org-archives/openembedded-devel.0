Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0637BC5DF7B
	for <webhook@archiver.kernel.org>; Sun, 16 Aug 2026 23:24:24 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19639.1786922654907152328
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 16 Aug 2026 16:24:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=bE66NqrE;
 spf=pass (domain: gmail.com, ip: 209.85.215.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-c998fd549a8so2013450a12.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 16 Aug 2026 16:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786922654; x=1787527454; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yW+/2Pj6crxCYQqV1qJ2hSn7BOYvRwnx3yXSYNglnJQ=;
        b=bE66NqrElCF1ZkIWGaqICnNb9BwP9K6mqL6rKLPaVVKLznPiaY4uFHLFZ19jq59/m2
         +pzAqffu9BORobCohJpUQNg2ZJM0t+kbs+0JUtBzd4+4gOzMbUS7u1h9CVrN4T08gyH4
         qEtCbXHEQMTR+qRJc1I80XZFprWTAZbPB+6zuaUwWNSFWLJ/GaxcxB3TuanPFakJ1/xc
         230d3rhQoW3FF5Pu2jkZzcr93PhmA5A4XCldrCXEGYd3uRlvba+2tTlmDkMT4u6e8EFR
         RzPp56sLV8wzN7ml5V3UW2RmReZFnelr3d3MK+yGCz0naTwkbtt9aauVCWqbDbWbRxEJ
         GWQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786922654; x=1787527454;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yW+/2Pj6crxCYQqV1qJ2hSn7BOYvRwnx3yXSYNglnJQ=;
        b=EsU7dy3Y2ssp4isVj36dXkr0G5cyH6VFOoSWDYCYlbyyTUAdH68BofxLrwLOALkyYJ
         oHJXSvcwS6FtslSxZsAOWK+qWye+hEvTRa5dMU9QeQ2GIcWO3IEnxsLTg8pJOjVbr2Dk
         OiRXexb3i6qBUxXb6PYPZ2vAwgTVMxTiebO0IXgu7xtrxWAz1INU675ClS7I3G8XLSCK
         KapRSLZaD8sF11RU7cFRfUk6pCOBKjSoj9uD4fAFpC8VOCMxbFbi0LuoNMWCRVnBshMd
         TR/YmFsazpiMz09smuTGYIjkMbKxFnAGV+e4HiGswL17vSrIFtVeB32IhdvAEzapJWd9
         IFeQ==
X-Gm-Message-State: AOJu0YwMuaLhQ9jXDcpt3vOhpzsZU7/NZLeJzTKNj2wOz/fa264/0/rD
	/glS8fujuJ/YwSY418+zMFpQT+BYLqzlfbrIpv6Am6D6ZdLnRwGKWFbthBGyTNER
X-Gm-Gg: AR+sD10E1rIQWiZa8W72mu9vNcDwzao0kfbpxKrFZ2XcmJGCSCU37skiZ2KtRnpixb8
	P3noAA4DDECjANi65znmnmJbHxI0mYWtWI+Tf8iMelYzXFb3QdlZ7jGMvAN/0WrhJ7RbL848yyy
	haOniQ8bvKlhQREJjB1ZYZTAj5CXgzaFxNdW/pzroxSNm8RNM9Pp1v6d8RZaPGGbRTn7dXDuBNb
	td8UN/anItodEwHk24ZqsRVReu9stqzhhfbl4Qs5rK3+0/JvitdcMCTfBXIpN/jc0lzHt7Eol96
	8h7EERwmADaL6B1Ek0MDFMThEMNdRriuUoD9A5uk3TOVxtan47vdIwgFc8kzPIdg/2Y8diHzUN3
	V3ArUECcJHY9j4sSCRiSAuETM4hq6Tah3fKPgLmCnLG+sMk9JyQR7Ohq/SBC1wgS4ju79cy/MKP
	PaQnTzAl0Do3/4PvAYAwlvMCQxwtfR1kLZxrGNKNtR6jeNFPbg60pu6pSgk5JykRcZTrfNUiw8i
	2hKM4A6g+XPiev2Suz3gr+akzAW8IHcipCDplK2zxFXNnRsO/jjSwqt4u0PROhYtj66+BRyzIRs
	FswhjXQ9nea5NsYf1R8ewXe3eQLXG19wuJDfYsxcnyqHVCMpJbCdY1my6530ZoKkaL6DGrZtafW
	N+blZUZQK8G4THy/wo+V6fccZdoXiSfI9QSYN1NjTKOLp4A==
X-Received: by 2002:a05:6a20:258e:b0:3bf:983d:e9b4 with SMTP id adf61e73a8af0-3cc71f7b02fmr20383763637.33.1786922654119;
        Sun, 16 Aug 2026 16:24:14 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320ea8fe3cdsm30368131eec.28.2026.08.16.16.24.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 16:24:12 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 08/12] python3-portion: add misc/statistics RDEPENDS for pytest-benchmark
Date: Sun, 16 Aug 2026 16:23:54 -0700
Message-ID: <20260816232358.1947922-8-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260816232358.1947922-1-khem.raj@oss.qualcomm.com>
References: <20260816232358.1947922-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 16 Aug 2026 23:24:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129185

From: Khem Raj <raj.khem@gmail.com>

python3-misc for timeit, python3-statistics for statistics, both used
by pytest-benchmark's storage/stats machinery.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-portion_2.6.2.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-portion_2.6.2.bb b/meta-python/recipes-devtools/python/python3-portion_2.6.2.bb
index f72784e23b..ecd524ed33 100644
--- a/meta-python/recipes-devtools/python/python3-portion_2.6.2.bb
+++ b/meta-python/recipes-devtools/python/python3-portion_2.6.2.bb
@@ -13,8 +13,12 @@ RDEPENDS:${PN} += "\
 	python3-sortedcontainers \
 "
 
+# python3-misc for timeit, python3-statistics for statistics (both used by
+# pytest-benchmark's storage/stats machinery)
 RDEPENDS:${PN}-ptest += "\
+	python3-misc \
 	python3-pytest-benchmark \
+	python3-statistics \
 "
 
 do_install_ptest:append () {

