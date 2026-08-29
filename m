Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C2A9C61DDB
	for <webhook@archiver.kernel.org>; Sat, 29 Aug 2026 00:11:34 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.279.1787962284817532711
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Aug 2026 17:11:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=dClnxTny;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2d6fe26ef1cso14478285ad.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 28 Aug 2026 17:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787962284; x=1788567084; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V+C8LtWh9Dt7CGalatXUrKqwtTaEAFkXTUwczkXZbsU=;
        b=dClnxTnyjMAXsD2bApJkew28eRMgRYb161FeLkvYgUy2deTvA93bzUj+XQHGVaT8SC
         4GlclXTwhh4ZGXa/xE8QuJ4afpdLr0CTQjF/O9p3z7NQHA1yWZo0fyEKS94HjHTg9Qwq
         aPrw2cGz+iz5rkqEt1cQVMD70Abl7MvLNSGa5ZiE5o1kOub3y6BP8FRh2cpQXgudbUvm
         gRZxdHpsonAwZOecr0FkagV5pZ389jU6b7SqtpxVvPvgda7Dn1N1UJ28BShlcy71PL9N
         xeC3lNTHfRk+H+GWUIJPTDET3OaT1KG5Gvl/KUIJruVCIP0/+isln/jAgkLAudpC+oqp
         CK0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787962284; x=1788567084;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=V+C8LtWh9Dt7CGalatXUrKqwtTaEAFkXTUwczkXZbsU=;
        b=hseb8PXnJ651eS2veDoojKtbq6G9dbqkf9MI2r/1gSOM+Iz6T3TfjrtaIJF3KS9xVS
         3msDb6EXooqyr+YEGfWts9/qmgq2X2467NjFHvMlOLJQRaXX+CCuHBv8iAC4nGCceYfp
         UwlVOAx1zXwhP5+qmT+ufozBMdTivjbXgrfwLqyqtIqT+qGmGkz0DGZZu9/e3qQlywMY
         AXMic61ekjBDnwNbHq+i8d3NS0DmdeClik2vRIdr0x2ASe6NZ+pKN7Zf/pZkV6pwnPpE
         v48zyeLSjqL9L8oBNaIBN8QMy8Zntac2PlqOQ4ShzodBKnK6JZ7sVIdp+CnNF1QrICRC
         QsQw==
X-Gm-Message-State: AFuF++mRmriQIwJtuT8Am8r1Nhoov/M999gbdKb/wze5WvhO+IGvtpSe
	7tIZwBENAK1jyLvci95xAOM/7RyZNyKKarocATmOPSYj6x3nqY7Kz0EvKtiiP6vF
X-Gm-Gg: AYBFou220Nt0F0iGTRriHnGEpJOuy/kE4QJ8V4bS7dfmMNgBYZWAtNgbNMqFlLXMXbP
	kfKZBW82wHNqNx6YWEzqaJpjngR2N727B6rctbjf/0ga+BBBvxj0aVCcVWkXcsb2nPm+lapAgie
	AzPfHd/qoG4zeOpIxXPE/Dfj08OjztPObfwYAW82+K8DGxYNFQ19zEEvZEtinPPRq4KFP5tl0FQ
	eF96ZmAf1VVAWNSPn2/df4iOokGNf4ktK4JrsMF1Jvtgv39qsTDu3DVoUQzItl4SluOHwRvvuIC
	1siG3JFNtqNFcx0A19OigsX/X5eUISgC+lj32yJ0bL6BwrWVgKPkq9Q0D6oXeypzu0MgPVQIVEU
	jfFBGrLqRFyo4rDk24S3KvNQf4Xucm5k9ax/rEmULlQWFeCqqOr+yRmjQT7K1uURTFFYIdHuKa5
	hIdKCoOhQtV8NVraM1fkObbVkS3I+nF8qP/YM44wavKtMFU3B5La0rAo/tHIDuw7tfkKdOq/IXI
	HvlLSj2htb7190nTulOvcLUfAXWNLk2HQuvU0ZXTUGUnVhKo50WPQiPcG/Ug3bYCnuk3bUzavTl
	yrPjIXSqwkXvvkxTCNUH7IYm4VnRLGZGhcQY/8lqkEyO6Yh48vGyJCEB1mULPKuwUpnc4/jIOYW
	VOcHiNQ/FFG0uHXPa1ja16IU9VAeurNZ3hp4S3JeWqMnSQQ==
X-Received: by 2002:a17:90b:184d:b0:398:9c00:29ed with SMTP id 98e67ed59e1d1-3989c003c3cmr4771813a91.21.1787962284137;
        Fri, 28 Aug 2026 17:11:24 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0d38207sm9236668c88.5.2026.08.28.17.11.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 17:11:23 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 11/16] python3-typing-inspection: skip test broken by CPython 3.13.15 Literal dedup
Date: Fri, 28 Aug 2026 17:11:02 -0700
Message-ID: <20260829001108.559544-11-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260829001108.559544-1-khem.raj@oss.qualcomm.com>
References: <20260829001108.559544-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 29 Aug 2026 00:11:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129570

From: Khem Raj <raj.khem@gmail.com>

test_literal_values_unhashable_type asserts that duplicate unhashable
Literal values (e.g. Literal[[1, 'a'], [1, 'a']]) are preserved, but
CPython 3.13.15+ deduplicates unhashable Literal args at construction
time (python/cpython#153914). Upstream fixed this the same way
starting in 0.4.4 by skipping the test on newer Python; backport that
same guard here since this recipe is pinned to 0.4.2.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../python/python3-typing-inspection_0.4.4.bb        | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-typing-inspection_0.4.4.bb b/meta-python/recipes-devtools/python/python3-typing-inspection_0.4.4.bb
index ce601d79b8..7694732817 100644
--- a/meta-python/recipes-devtools/python/python3-typing-inspection_0.4.4.bb
+++ b/meta-python/recipes-devtools/python/python3-typing-inspection_0.4.4.bb
@@ -12,4 +12,16 @@ RDEPENDS:${PN}-ptest += "python3-typing-extensions"
 
 PYPI_PACKAGE = "typing_inspection"
 
+do_install_ptest:append() {
+	# test_literal_values_unhashable_type asserts that duplicate unhashable
+	# Literal values (e.g. Literal[[1, 'a'], [1, 'a']]) are preserved, but
+	# CPython 3.13.15+ deduplicates unhashable Literal args at construction
+	# time (https://github.com/python/cpython/pull/153914). Upstream fixed
+	# this the same way starting in 0.4.4 by skipping the test on newer
+	# Python; backport that same guard here since we're pinned to 0.4.2.
+	sed -i \
+		-e "/^def test_literal_values_unhashable_type/i @pytest.mark.skipif(sys.version_info >= (3, 13, 15), reason='Unhashable arguments are deduplicated (https://github.com/python/cpython/pull/153914)')" \
+		${D}${PTEST_PATH}/tests/introspection/test_literal_values.py
+}
+
 BBCLASSEXTEND += "native nativesdk"

