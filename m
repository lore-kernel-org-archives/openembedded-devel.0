Return-Path: <viswanath.kraleti@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EABEBC47BE8
	for <webhook@archiver.kernel.org>; Tue,  6 Jan 2026 10:42:27 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.87320.1767696142933934859
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Jan 2026 02:42:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=TO3ef5iZ;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=XGWNEOam;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: viswanath.kraleti@oss.qualcomm.com)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 606A672v2922979
	for <openembedded-devel@lists.openembedded.org>; Tue, 6 Jan 2026 10:42:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=UwqDdwjKJDJ
	1+rHfUIpLpVrX+xzO2YAcGTBDhmNmYMg=; b=TO3ef5iZileq59QaBKCiHU2eHg4
	ftZiWyDIezVS5wCnxk7XlDqy1Zru3dXRzxkI2oWdqz1FlXifkh4dfvTo6PgqmLXL
	5So80m5bH1MwjrRWAYABttVkWEsBu71eDODFQPKEjGBKt4GnAY2enfmbgwkRTC54
	uqQqu1nZfMEupAXJoahvujDw8+rKO/oDqdREYustTmxDqPa3LzBEVSsULG8qYAPD
	pWd9jWW0p6QF6anNq/bDWiqhzBCT2yrMAmmdlzqCxMbSZrp3QYKY8HRFSAX6HzSb
	XZH3DLtUdPrhD3QGyR+p1wsZEdyrvR3pVvU3AIpktQoUB6yzePG8BaTLrQg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgscy9d0w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 06 Jan 2026 10:42:22 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a0e9e0fd49so29213955ad.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 06 Jan 2026 02:42:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767696142; x=1768300942; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UwqDdwjKJDJ1+rHfUIpLpVrX+xzO2YAcGTBDhmNmYMg=;
        b=XGWNEOamlnGHjr+npbGEK/g338UI4JaaceBiqyOuS0EwoACkcfvz0Yk2ZxKKNUyEyB
         x+Wy7T419K9stIQBsKHrONZOFhF3ot5RX9iNI8tTH5h0GHiUq4vA6Mlsd/AqxBGqtUde
         NQ2ORF0HzN0hpbXr4BCwLI+WOdM+kyVPq2KJbgRPNT8ypvf+rKMv3DwJYvdyJjamcEzp
         +GY5n5X8pUWh4jnH0TtmMzeU3WuQtfU5wd0/CdNVontqIq4bNO8orxhr6Q8whNMhwctD
         7+Mm4dVnb8MFeBNVGjoL10yzxS6r0ON9vuPZSBq1O+hoh2PoLnVN+nS1t+2csvkoD6YK
         zsuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767696142; x=1768300942;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UwqDdwjKJDJ1+rHfUIpLpVrX+xzO2YAcGTBDhmNmYMg=;
        b=mIi9HvqvSR6rZHyG4Zo6xP5RLuxucDNcAxREQMWl+3gBve1d/8h5koJkosiABGL7aM
         K6IvF3dcmokdDK2gHsnzKSYg5FOI6BAgqKFqgogb1GfcqDFk7jE8s5N4BwIKIsKPN6Yt
         sm1obaLvYs30WwqQAKrxkGtudynvlTG6YRhv60DOpeybiZVCTe11KUMWBzX+obtWRe4J
         DjujD+rEInqQVNpxb4wnd58GhbbxcNb/M/aLCc62PjO/u5C9LoE8dXHgSsDyMyLRU70x
         TI+9D5j2vHUVh5RGoCy9Wi54ocUCI3NqXHJ3n6+DzedYYH7ChFjCn65GlYscIkN8DJfy
         ULvw==
X-Gm-Message-State: AOJu0YyU12FaNBUPV53XyMF/9xE2KKUhJRO8+z8wHWW3+cxZlHKhe7H+
	5xqG8OIWeyvdfBF7TE5p9f1odN3cbnQg3YbtC83L4bdpuXkUvQh1cadpmw/I4hyZ3/ZRuZIb42k
	opqy2CCIAK24BBOWl+wRlrr9xWMGp2YtODJ7I03eDsrTqa6NBS0jnR12Mpk2ubgJOJZJesHuMOg
	eZ8Sjaw6XmW9z0E37G
X-Gm-Gg: AY/fxX4QcBoKC2ug8lwvYWOmkQgVSu283lulu/ZZ8F/pzbXvcpFVKLPrqrzKlWJl5M+
	vNQTC44v/hnCL6W0bI44UzWSBs4nvqw/dNVGByc9J4qAIi66d2xXL0pm3YWybXlCF3EC9YSrfWd
	JLaN8hxUfvUOa+KYISQYur2Ue6raKyB9LtVZbn4m+3aEScUIEZnXLxo4yfwONvzV1lt5rokkpHa
	3iquNp0dIdIjMFb1QBdsmnRGI8SGMYWm36+DYrignh58lCa1ppbLOvZqO385HGz4tYVyJMejvyU
	BEWj1H9l89mrWqWR2tTrUFFabCp7fRvai8UO9U3sdM+eGfuw+S8AxHu+iSPtLrMfosjKfB5uSLX
	l6Bvc5UZye8dYUnt/a5iXLxGe1ECxDj/9ISvnd2X+sMsj3TcX
X-Received: by 2002:a17:902:d2d2:b0:2a1:3769:1d02 with SMTP id d9443c01a7336-2a3e39ad712mr22458935ad.12.1767696141751;
        Tue, 06 Jan 2026 02:42:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGePY5o8AYEYVLrpnrnCFIgp3uKczfQEdZsDlk2zfteBBwrPhxVit3AJsIn6vCmtdlqYTcb9A==
X-Received: by 2002:a17:902:d2d2:b0:2a1:3769:1d02 with SMTP id d9443c01a7336-2a3e39ad712mr22458685ad.12.1767696141207;
        Tue, 06 Jan 2026 02:42:21 -0800 (PST)
Received: from hu-vkraleti-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cd469dsm19102145ad.94.2026.01.06.02.42.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 02:42:20 -0800 (PST)
From: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
Subject: [oe][meta-oe][PATCH 2/2] modemmanager: upgrade 1.22.0 -> 1.24.2
Date: Tue,  6 Jan 2026 16:11:51 +0530
Message-Id: <20260106104151.2027936-2-viswanath.kraleti@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260106104151.2027936-1-viswanath.kraleti@oss.qualcomm.com>
References: <20260106104151.2027936-1-viswanath.kraleti@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: JRQo7874ZCh-SnH-5xhkm-kXTk86BgW2
X-Authority-Analysis: v=2.4 cv=fOw0HJae c=1 sm=1 tr=0 ts=695ce70e cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=RASuxCJZQsJVp6H_dTYA:9
 a=uG9DUKGECoFWVXl0Dc02:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: JRQo7874ZCh-SnH-5xhkm-kXTk86BgW2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDA5MSBTYWx0ZWRfXzVKS04NQcM8Q
 k49U1LQCDbdJkzFKgfTUzvHxdriqKhr5M5H2IOX/lS/T/waunAC8VPzl4PbST8QTTY8G4vrCQDr
 GDPFvT6idxuCxBQHaiNxgvebz6KoNcJyBqlPfpgsH8HkXp+l44G1nqnl7e/xcDsxKWzitqQuGCX
 eKZpecUSEF3sBkmNgrlyrJ8FcLe8AR5XwHNGFtU9Q4MQUrhzvYRJvwIhafS1mghAuKb7esV3BtZ
 VDON1lEAZI92Yz38ODqB2A+icDrKzWbwCSht/Pda5jBVz+dTEDR54YCNZ8ONMdvQBe0o0U4vvIE
 H80h1xR8c8RxjR5ILCQtAgFGtaaFE0jnHOndCy8zZarN6UwvFDr5EtR9nMnLHrvbrV5UEdDXDgL
 ze4pH9nY3jjFX8jyaXPidYBdPA8sfTy9GMaG3F/eE1kRTsuL2l0BsYJdNDQuomjD47i7jBDoJYk
 XSS8/E6TsCee09BLYeQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060091
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Jan 2026 10:42:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123177

Changelog:
https://gitlab.freedesktop.org/mobile-broadband/ModemManager/-/blob/mm-1-24/NEWS

Signed-off-by: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
---
 .../{modemmanager_1.22.0.bb => modemmanager_1.24.2.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-connectivity/modemmanager/{modemmanager_1.22.0.bb => modemmanager_1.24.2.bb} (95%)

diff --git a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.22.0.bb b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.24.2.bb
similarity index 95%
rename from meta-oe/recipes-connectivity/modemmanager/modemmanager_1.22.0.bb
rename to meta-oe/recipes-connectivity/modemmanager/modemmanager_1.24.2.bb
index 82cc1167e2..95adfa9a0a 100644
--- a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.22.0.bb
+++ b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.24.2.bb
@@ -11,8 +11,8 @@ inherit gnomebase gettext systemd gobject-introspection bash-completion
 
 DEPENDS = "glib-2.0 libgudev libxslt-native dbus"
 
-SRCREV = "03f786ce66360d67c669f4f122f8aa458e6f01ea"
-SRC_URI = "git://gitlab.freedesktop.org/mobile-broadband/ModemManager.git;protocol=https;branch=mm-1-22"
+SRCREV = "f2b9ab1ad78d322f32134a444b5b54c6e8160e19"
+SRC_URI = "git://gitlab.freedesktop.org/mobile-broadband/ModemManager.git;protocol=https;branch=mm-1-24"
 
 
 # strict, permissive

