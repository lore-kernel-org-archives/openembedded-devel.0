Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C38C4CD37AC
	for <webhook@archiver.kernel.org>; Sun, 17 May 2026 08:24:19 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20209.1779006253147489568
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 May 2026 01:24:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=CxbcSkXN;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=LJ9aMl0X;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64GNvFeG970086
	for <openembedded-devel@lists.openembedded.org>; Sun, 17 May 2026 08:24:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=GuCZMYDGGpz
	+EJoWXu73a996LNtYXAKA2ha2lZ7YhEs=; b=CxbcSkXN0XLS9ayf2fNUum8M6rq
	Md7GcdCi0cCTSGIlZMaLqPGfgHPsSk5Yno6tVChpUh1nVlEx3rm2/5n03ZcvLmlU
	T81+1mxQmv3mXzd7y4/O5e+7xVsZgDMtZSkp9Dj6pwwZtneGLCGl0KV6zV3tKzK6
	lLTExTK0dsha2foqiIX/yb5RX31c5rnlv8qJ4mXMa7MXZ+fIzCHWX38wT9XnD108
	n/TlCY8kFVzkuTt/31jRhNhwn6V/H8nmjuXQkL7nZZyipW2KZnKwUvDiS8Lv2kkx
	zIq4dABrE5rUutuLftgsTV4XcsgolGaw7tDM2AdOs69PRCBWmg9M6iIqIhQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6hv7tctd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 17 May 2026 08:24:12 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3662e7756f0so827463a91.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 17 May 2026 01:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779006252; x=1779611052; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GuCZMYDGGpz+EJoWXu73a996LNtYXAKA2ha2lZ7YhEs=;
        b=LJ9aMl0X8uCdZ+a8G2+kjWChf31wgAFqizaxPHoR6zktwvw/3il9yDTRj3TT/VKAp9
         YugPTtvntlHnyJI916nu/4MeP2oO8M6eh58s5yieQygoTr4gazw58fA8SwajBx/SifR/
         o6UZN2KVmJxyQ/SsTHnx0/hjzUCBtiyOTxe1JFg8HRIFybO2ekcLcC8OnPbvJSvivG1f
         4R4dNvxl7s6Ke4xfReo4+3xvDfok+S/lKlekki6FlUhp3JwDUKkwEX4JlvAa+KoRhRdt
         MBinJqM8jAQ4xHG6msY+rC0XAwpZKtTwEScFe/vQp83N/6VSP0xuGA2JUH9o/VjpzUOj
         NjNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779006252; x=1779611052;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GuCZMYDGGpz+EJoWXu73a996LNtYXAKA2ha2lZ7YhEs=;
        b=FjUbFFT17JXdGGoQTF0txQZy2Hx/WX8R6/JU6LBZ2Z8gjYUVR/HDkq/P7FwKVSjWE4
         aJqBO1qBvpnP8AwMqCDdo/AI2OWeQlVj02lG85M79DQ9lnaWZAskTi5kb1zeeg1P4oO5
         HVQ9iBSxWSY5eI/A5ltd+cTmjan/lEX8RSrvF3Tamx03fbGdOinMzNbPd2EAqRZzqUGI
         ahy0tF0Xn4ZFLfFfHCtsP6d3wezEtBZi6b58HiDkruitBWSgeMn03JH6dJd9hRCPsM3w
         muCP1f087Ci3CwY7C3PijpGVxm3YuD1fZ0AqfdHhScUxWCgf5ckNaT+52Cd2Y7ZBVG8p
         SLSw==
X-Gm-Message-State: AOJu0YzeAyMQG1eKCnwtHf5m3eDPG0dBkbiDzVgQ+QZ0AGdVMJTtpzTZ
	r0z79GHGMl+5UeKj1yMHv/SOCbchQrGlgYPwlwodW77w6F1I4Id4wRKAaiuqKDQyCfD7qd8wG2P
	rX4Yg+1f98IUFNeshHjldApCnzboFkr5ibIWMm+4yV7UC4bAPuT9sKQId3mApBNRMo8RCnVQel9
	VU08BVP40pNr/n+WbuykBFMA==
X-Gm-Gg: Acq92OH6jK8eGJ7ih3dpC74OlI1yXEXtM+OqyQI9n8kZ/I6liHBOZTfiVc7PmmgCgfq
	4qyJ0jXT/39/vJBmRljhGddLvjEtROr7CpCcbX1/JuZYZ8vBFhn9fsHmNK8lECuE+icEUxU7Hf5
	JG5cf0xfhd6G5QGXy/x5HlCmu7CqVuxyOAKKZ3CSrTACHEzQWcQIqIjEXDFfoxZapL3YD1R0d0Y
	MgAblne6A4+1THta/z3IEjGFukNJ9sRTXHF1wdYRwCxDFHaAjKCWnC00it+rUnlSBb2lKVn6hn+
	FKOSGAp16IytiWuEs+gy/ySKB8VttxbIpVXwxQ/XG1bfiCGBwnuPOn0bh8V/q/aR55NI/elHOBS
	eCSZUFXV4HwmnCExOrxHC+5YwoyjDNFEQJh1lhH0oAN/o+9OxAlPT
X-Received: by 2002:a17:90b:2786:b0:368:12f3:fa4a with SMTP id 98e67ed59e1d1-36951cbd30cmr10487907a91.23.1779006251983;
        Sun, 17 May 2026 01:24:11 -0700 (PDT)
X-Received: by 2002:a17:90b:2786:b0:368:12f3:fa4a with SMTP id 98e67ed59e1d1-36951cbd30cmr10487893a91.23.1779006251407;
        Sun, 17 May 2026 01:24:11 -0700 (PDT)
Received: from hu-anujmitt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36956f3723bsm2765033a91.1.2026.05.17.01.24.10
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 01:24:11 -0700 (PDT)
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [wrynose][meta-oe][PATCH 08/29] bubblewrap: upgrade 0.11.1 -> 0.11.2
Date: Sun, 17 May 2026 13:49:36 +0530
Message-ID: <3255b7d35756201e01914e66f9d91e8301224e56.1779004358.git.anuj.mittal@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1779004358.git.anuj.mittal@oss.qualcomm.com>
References: <cover.1779004358.git.anuj.mittal@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE3MDA4NyBTYWx0ZWRfXxB60orAS9uqE
 bm7Dq+OQcH2/hhRoRY9q4/DX/IVtGSE/7Av7sdRM27n2UimZyR99bmBqp5bmu62gYsLETB7Yupb
 7CJQOhGQuEqzkgz4ushv3P240zIr0dxeL/htCYKfzcq36TfIL5k4VxbhfaxXypuTu/qEbmonZ9Q
 39APl9XMSjBVIYPhC4uElQBdceLNlR5zuph/3WGQVo6zIaZQcstini6+F9gs9tW1oa6mjfIeiWj
 IWRKNg03O3Q5QUzUHLtjxxaHBfC1HIfv6LO7+nrg6OqDHoDN4SCZol7768GADdqW0jpsbozL5a0
 5zK4DDftxCTCV2ZScWY8MriLU2ItIxuqwdUKXHtH8LkVwY6wGCzJ9N0MqXlsSrhoLbkzEMLxujT
 xs1l7ZB9GPX6ets44MddZqyz+LRrRyxSw0qSKgwyZA0ZAzGzsAuvVIr7jOd45VmPa/zVMael+fZ
 rqMiwo+EymvbZh93FDQ==
X-Authority-Analysis: v=2.4 cv=a8oAM0SF c=1 sm=1 tr=0 ts=6a097b2c cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=NEAV23lmAAAA:8
 a=omOdbC7AAAAA:8 a=EUspDBNiAAAA:8 a=t9LP_u0_T_5C7LT3DogA:9
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: N8kOeI40jJLzqN7mv6dZncdE6W_w2YWe
X-Proofpoint-GUID: N8kOeI40jJLzqN7mv6dZncdE6W_w2YWe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-17_02,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605170087
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 17 May 2026 08:24:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127021

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- bug fix: CVE-2026-41163
- enhancement : New build option -Dsupport_setuid, which if set to false (which
  is the default) disables the support for setuid.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 8cb0926b53d6b129fc301588cc64f23c8e977d8d)
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
---
 .../bubblewrap/{bubblewrap_0.11.1.bb => bubblewrap_0.11.2.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-security/bubblewrap/{bubblewrap_0.11.1.bb => bubblewrap_0.11.2.bb} (90%)

diff --git a/meta-oe/recipes-security/bubblewrap/bubblewrap_0.11.1.bb b/meta-oe/recipes-security/bubblewrap/bubblewrap_0.11.2.bb
similarity index 90%
rename from meta-oe/recipes-security/bubblewrap/bubblewrap_0.11.1.bb
rename to meta-oe/recipes-security/bubblewrap/bubblewrap_0.11.2.bb
index 0db94b40fa..7e63435e90 100644
--- a/meta-oe/recipes-security/bubblewrap/bubblewrap_0.11.1.bb
+++ b/meta-oe/recipes-security/bubblewrap/bubblewrap_0.11.2.bb
@@ -8,7 +8,7 @@ DEPENDS = "libcap"
 SRC_URI = " \
     https://github.com/containers/${BPN}/releases/download/v${PV}/${BP}.tar.xz \
 "
-SRC_URI[sha256sum] = "c1b7455a1283b1295879a46d5f001dfd088c0bb0f238abb5e128b3583a246f71"
+SRC_URI[sha256sum] = "69abc30005d2186baf7737feacd8da35633b93cf5af38838ecff17c5f8e924f6"
 
 inherit meson bash-completion github-releases manpages pkgconfig
 
-- 
2.53.0


