Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.39574.1793009950283873767
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Oct 2026 03:19:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=PtggjtKR;
 spf=pass (domain: gmail.com, ip: 209.85.215.174, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cd5e2d696e0so1479391a12.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 26 Oct 2026 03:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793009949; x=1793614749; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jzwb18IX82J2jZjACC1WDiXNaFJqOJrGuwWoGPsrXa8=;
        b=PtggjtKR0aX7hd9sLRRdYnyLKOD4kt44+MGx/v+KgP/XAaIppzo/Xy1u7jWExD/bDM
         yXv81BnlB5GXRgUdlRT/1FXZgeiBYYhsDAV4JAERisKr6z/C8SN3TxHtq9J4+nM9PoFO
         HmWjiiEWTKqB/QE3kdy1dwK0zKUpPENLFSnLN9uaFcD2EBo37eRiEmKtbreTsc1RLzqC
         MtiROrLO/2l0epOSFCehNq0bnl+S1EVRsnKOeWcvqT4RA+wi1+UkTy5Jd8hMh1SqKIkf
         viiYnpdB68QYmPv/6uTd19l/sjcET7JCupLfwgPQp7lxiz8CN2Ta58w1N9OcZj7/eShH
         B72A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793009949; x=1793614749;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jzwb18IX82J2jZjACC1WDiXNaFJqOJrGuwWoGPsrXa8=;
        b=zjIPfoaaXaoMdyjPfajIW58jOjNzoT0UaD5Xxt3I9rjV1N+r+Rp7Rah4Xv5/PGNyP8
         nYApLNP6hd2qCMUKDiMeXGctFscvWvVaWnBRaAb9vvqfwYBNMdiiP6Yxj3+WwzTFjePg
         7EOupSMFPn52k7EFg219yGQq+thwwUpRfk9zaHpPyMclZwUVunwivNsdTo0owcU+CoRq
         FXU8OlD0x9Xgyp40irIS9+pS2Bw/AM7X+Fvc5Fr0W4drSoRzGru9dZE6RxOwfMDZCjKC
         z1/tI8nvTx/3a2NDvaAo1C+MqqKb4HOwdQrh7H1LSg3EsXEndYgNbW9oA3oUVaYw5n8p
         AqaQ==
X-Gm-Message-State: AFq9FYJcMnWGTbYEE9LLO8uJTIETSE4BztgE024/Lv63wMgLE6TOyThU
	RTLF7Lfl5Pq9p9PCjxW1yARqMAIfpCC+b5lLwQCk6ALXxW3ewco6aokvxyokRg==
X-Gm-Gg: AYBFou0qEtt6NxzeSUYuMPLA5lIRST7O235aBfgigpXXh6MgQhFnaitUVAhrYZHgmAR
	W7MvySrZ3bXBVI1W6F0T5/1im0I+No97gPKneD3mzmwdVCTszTWJZ1pUx1JLGS+NprrkUzWpYNy
	uGVUYIi988VA6vQTp+uiR09dFGQdyAZjPBUYZ8dk+5zjCACL1VYOlKbl+jiHes9QAoAp/ys8TdW
	r82CSR33KCsK6Vevm+QQ7vBlV1veKFR55A/RcyAFuXia/w9elh54/Fj24Wu5q2Jrgh2QOOZAH//
	ihT6pFhlCftrvhRspk3CLf0W9v1CiQVx3wlgDtM0VxMieleTVYucc8i5ErxhUUTQ0KRXgo8qJrv
	twV0NkT6gInSMHcKSQ+F1GqK7jw4JZhxD/LPvm2Sf7IZjwua69368Gw6KKFMcrx5Ow2u6O5qTf3
	qFGtUHfU1SW6rT4nfr1qlfMX7KQkpQpRGUnYkdMzkIPSHXxK+PcpElT4cwHKR28MuPL7K70PDYp
	gjHUj6PwV7JzDmiZzuEPFyyjU1+v/nUA2hcWCU7FRKqv/VCo/7PHoGIA+qvAXUwPRNq3K62yD40
	b/Bz/He44Fk74GLDeTu3zTSCX58ky7A=
X-Received: by 2002:a05:6a20:db97:b0:3e2:278c:297a with SMTP id adf61e73a8af0-3e7b0bc785bmr5587623637.6.1793009949465;
        Mon, 26 Oct 2026 03:19:09 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8ccc4648dsm1383583a12.14.2026.10.26.03.19.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 03:19:09 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [oe][meta-networking][blacksail][PATCH 3/10] ntpsec: upgrade 1.2.5 -> 1.2.6
Date: Mon, 26 Oct 2026 23:18:43 +1300
Message-ID: <20261026101850.1470035-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261026101850.1470035-1-ankur.tyagi85@gmail.com>
References: <20261026101850.1470035-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 26 Oct 2026 10:19:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131425
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://gitlab.com/NTPsec/ntpsec/-/blob/NTPsec_1_2_6/NEWS.adoc?ref_type=tags

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit b730ef39a1ee020404c54922e1467403c1533a25)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../recipes-support/ntpsec/{ntpsec_1.2.5.bb => ntpsec_1.2.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/ntpsec/{ntpsec_1.2.5.bb => ntpsec_1.2.6.bb} (98%)

diff --git a/meta-networking/recipes-support/ntpsec/ntpsec_1.2.5.bb b/meta-networking/recipes-support/ntpsec/ntpsec_1.2.6.bb
similarity index 98%
rename from meta-networking/recipes-support/ntpsec/ntpsec_1.2.5.bb
rename to meta-networking/recipes-support/ntpsec/ntpsec_1.2.6.bb
index 26348f7c4b..832619edc4 100644
--- a/meta-networking/recipes-support/ntpsec/ntpsec_1.2.5.bb
+++ b/meta-networking/recipes-support/ntpsec/ntpsec_1.2.6.bb
@@ -17,7 +17,7 @@ SRC_URI = "https://ftp.ntpsec.org/pub/releases/ntpsec-${PV}.tar.gz \
            file://0001-wscript-Add-BISONFLAGS-support.patch \
            "
 
-SRC_URI[sha256sum] = "6fb191cddaf607e7754b1f6915a1a61dc4018b3e4eef3d2ffacec961c9682949"
+SRC_URI[sha256sum] = "8023beb9a0c86a93f0bf94d43fd388c71a6fa54d80bcbd747d899915191bb592"
 
 UPSTREAM_CHECK_URI = "ftp://ftp.ntpsec.org/pub/releases/"
 
