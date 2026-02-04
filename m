Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DB55E8B392
	for <webhook@archiver.kernel.org>; Wed,  4 Feb 2026 02:51:43 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10905.1770173494341191174
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Feb 2026 18:51:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=ZFCOrpwV;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=GExJlZnf;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 613ImLSD2732652
	for <openembedded-devel@lists.openembedded.org>; Wed, 4 Feb 2026 02:51:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=zx0yl+mWoh6
	PWkxCW3rhYVy3sN88rchHxTzw3iZ3IwA=; b=ZFCOrpwVuPfBhpqAUKTxzej7Zwg
	/JLolrnASxTqtP6d14H6FCmjAEZJJvP7XQaGjgLHTgIQFdGTwpvhiXbJKjza/Z/W
	UxmCSHQxMQmnkeRKTSKH4plFgGy2SOfe4nQZQYhX2YSRePyEgmkLsNMEGVSkBZT9
	F+XYZn/+naOniafk+Yo3J6PGJSYWNbyQGC54Qmb1rFGFN9h61TIFjfdPdx+EdNIa
	wY1gvMP/j6pnXhB8ptFe/zzeP2NStMyv+efIxkDXRZdo1MP+mtVy7Vsst6K5jwQO
	b52BTYBLsssxrYyz+nZkbHFa+zKcXQXgfD6n+ed+Yc4KfTeLdgvpZl3neaA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c3exjk29d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 04 Feb 2026 02:51:33 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-353c9d644b0so4968538a91.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 03 Feb 2026 18:51:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770173493; x=1770778293; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zx0yl+mWoh6PWkxCW3rhYVy3sN88rchHxTzw3iZ3IwA=;
        b=GExJlZnfPISdH9fiV/sMVRxxXlJp0MpZ1OXhOfO0m8LLDOJGOGItsozb6nTNo7YE7T
         WN1o22dU5cmVyyJydWjz+SX7kUWQ+JowPbW56aCtkuF+A1SNw2HABe8YW07Yuun960MP
         syzY3ezOcpwg9EnOFE3E9znwWHEDd1mnwxhjbzmdqBEeOryd30jWXaB0GIsPCf8YYIVf
         db0zK0GoIDKt2cUCol6UtKnx/C/wAbQcgnCNLL3kt1x49uf6Tkli9mXF3xTJnBlKEI9G
         ZhUz4OjU2bYdF6ATQkY6+q139jVyTgM9V9ARVD+H1UlNj18RB8vfAhnQr4aUCnp2Pzji
         HlnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770173493; x=1770778293;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zx0yl+mWoh6PWkxCW3rhYVy3sN88rchHxTzw3iZ3IwA=;
        b=A/svWOnue3mKCPovSTIYCfF7YxeTVXsvLZcGBjQLrdFm72IrYCm1GWmEXd5oW436Nx
         Ral8yIzCSvNlBcupNd2Xqdaeo9d+5VDY0Pv8IwVljPt7bu2g7WdyIEoOlLgCst6RajLx
         9q4aoPemOfGKJXF1FsU5WBLBCrL8ZsgmWuXqI0v7F74XPc4MGBnOXJcXsL7MIrM0aLKp
         Ttm9Xza2y0UV2oEfDEWFY5V8mbBU9/VWcnKbjZzQR09UFZtwFeyptrrMYtSs17K2ycwO
         w3TutcaCSB3/Nmvbm6aF/iWf3i3y2bGaZQit4QzUMc8SwmAOBKtSvmQIU2yBwh7Z4ykJ
         opgQ==
X-Gm-Message-State: AOJu0YwkfPRP2SSBSmyNVumcVxS9AhFVjz1gt2W2qf/uD7x5M6i8Iv5j
	O6PeYye8aURWuhMGWuLU6uATZdcJUqehvUrPOZA8o/WbAsDv0Onwcj5zV0D7WPHref7SF1T3GFd
	2nBRFS6v39t2WKu1ZpT9F1MYss0UKfDm8dI/rAybhjX5qGGhxQcKr1OfjTL7dMz0uyuzTzpFlY4
	aLLixx9Se8FRS+aCeDQrY=
X-Gm-Gg: AZuq6aLI6UjsNkctSWJ253oK26f1UXmr+YtO9zX264VnbIFXnWwJ4Y00e7cBg8Sm3u4
	X5hRA3CzSwL5BrDsYi/oIMPeMrVJJRz8ajqmOsEMN9rQtU0yaEH07nrT1Mk0aRq4+2fNIT0eMGI
	a1ANI3dUo//DvmdORz/i1ys+itIBodMexPAqT0gTmE9F7zo0cX9mm7LzgwgJx4c0urrM2yLUh1+
	fL6EMKoABlQGk4uAYv7CgrAnBH2uyMu2DIF8mAVTDnzBeBaNJgJig7yFO3e2QFpRWDjaSavBBsY
	gTYHCUjliBrVc9lPGop5HTHj7ft8Y8s4eyPPUG/dJaGIlp9N2k/iWjaO/Iy1nGUFz6A56Rez7Sh
	2/vIBkprBCXRweNHJKFkwrc2WeC0TkN05PEY3VBiQ
X-Received: by 2002:a17:90b:4b92:b0:34a:8e4b:5b52 with SMTP id 98e67ed59e1d1-354870ab6b5mr1103671a91.8.1770173493195;
        Tue, 03 Feb 2026 18:51:33 -0800 (PST)
X-Received: by 2002:a17:90b:4b92:b0:34a:8e4b:5b52 with SMTP id 98e67ed59e1d1-354870ab6b5mr1103659a91.8.1770173492717;
        Tue, 03 Feb 2026 18:51:32 -0800 (PST)
Received: from hu-anujmitt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3548630f6desm812490a91.15.2026.02.03.18.51.31
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 18:51:32 -0800 (PST)
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [whinlatter][meta-networking][PATCH 4/4] linux-atm: fix SRC_URI
Date: Wed,  4 Feb 2026 08:21:22 +0530
Message-ID: <20260204025122.2928723-4-anuj.mittal@oss.qualcomm.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260204025122.2928723-1-anuj.mittal@oss.qualcomm.com>
References: <20260204025122.2928723-1-anuj.mittal@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=W8c1lBWk c=1 sm=1 tr=0 ts=6982b435 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=FP58Ms26AAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=itfpLK5CVICf_Pv7crkA:9
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: lX_yXFZDi6ji9VFbdN1MSjtTw_P7QYdp
X-Proofpoint-ORIG-GUID: lX_yXFZDi6ji9VFbdN1MSjtTw_P7QYdp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDAxOCBTYWx0ZWRfX+x4aVs2TNNbZ
 1dOF6MUthAPYuOabQrTIGVMlSKSxPG7Vn6jPPB2TEZKcGHrUi+3ZUF8KmA4KA7Dps0YkMm20+YI
 +SJxLg13oJ3/sDEYrX+XDE10S7/OJxad+PIqJ1JTHO3gLXAoWtgNW4gPssduNBaGubZ78edcmCL
 DCCDzTvYR4WlFejvvQA+03CUf939Ts+DXe0X3NorDbipCLo8uBepAEbEeNhf2ppjkmpe4uymyt+
 3ZhSKCRzsBEycrquHc5uG9hndmQ+bNwGaNvxF1W550PkuBpUX7FlrNfOY0tfDKB9lfAN/61Zc8t
 B8MIPbJFVtUx6hs4qWQkzqLYMw0tT2//HPQk3bzK1pQISyuB3vXVzUmd0et9k/hndIpsEWpO9So
 odCOkQC408ErDd0iRoVhNbnZtXpuAddByNhAKO2Gou6vtAmZp44iZmZUkmLu+lux0g50h8BJAIh
 r2xeWFqUA9D8gSbCyDA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_07,2026-02-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 phishscore=0 impostorscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602040018
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 04 Feb 2026 02:51:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124118

From: Gyorgy Sarvari <skandigraun@gmail.com>

The original SRC_URI's certificate has expired - change it to a working URL.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit a1baa1c027cba6ba86d92b4ad5c2db0b7bba0d1f)
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
---
 meta-networking/recipes-support/linux-atm/linux-atm_2.5.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/linux-atm/linux-atm_2.5.2.bb b/meta-networking/recipes-support/linux-atm/linux-atm_2.5.2.bb
index 3d679d7dc7..b43900a94d 100644
--- a/meta-networking/recipes-support/linux-atm/linux-atm_2.5.2.bb
+++ b/meta-networking/recipes-support/linux-atm/linux-atm_2.5.2.bb
@@ -5,7 +5,7 @@ LICENSE = "GPL-2.0-only & LGPL-2.0-only"
 
 DEPENDS = "flex flex-native"
 
-SRC_URI = "http://nchc.dl.sourceforge.net/project/${BPN}/${BPN}/${PV}/${BPN}-${PV}.tar.gz \
+SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}/${PV}/${BP}.tar.gz \
            file://link-with-ldflags.patch \
            file://install-from-buildir.patch \
            file://0001-fix-compile-error-with-linux-kernel-v4.8.patch \
-- 
2.52.0


