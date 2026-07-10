Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73FC6C43458
	for <webhook@archiver.kernel.org>; Fri, 10 Jul 2026 23:34:56 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2426.1783726488011639972
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Jul 2026 16:34:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=ZrOCB0fO;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=imi6eRNw;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66ANIk6F2163731
	for <openembedded-devel@lists.openembedded.org>; Fri, 10 Jul 2026 23:34:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=XXN1yam/KX31uO438/Y+ss
	2TV/bhd8i3b719tnI3Ft4=; b=ZrOCB0fOMQqX5fwHRKGJlEKFMXueg3PuseWEow
	aLMclM/sIA4NNtADtdHE4+sqotVaAuaeirqPaZh+RY64cE8s2xbGX24HH0ZBXLY9
	XQjboE1LHjaV0aJAU4d9MhUcMKAilQ0CVXd+0Ia9GQDw8MNfpuviFCewQix+DAvr
	2tCKulsHErDPgmKCXTk0ax/tIReWvoWjgN9SpqrV/wup2CT8RTxEHAf1dRnT/ti7
	jXdT7vZ6bwyETDlGhBENkSbRfZQk98n+ZosZZANOFkWDc6L8BGO/WBLcMjoI6WU4
	1/fvK9VUvaW7C45jzvZ4vAl5MgmpnMSSKADndY4dyTMdJpWw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fb2pc9rgh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 10 Jul 2026 23:34:46 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3811279d51aso384832a91.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 10 Jul 2026 16:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783726485; x=1784331285; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XXN1yam/KX31uO438/Y+ss2TV/bhd8i3b719tnI3Ft4=;
        b=imi6eRNw+e7nRcQcGwJe8RcviGmzkpfHNu5V3BNKsMJ6QcefGBxz+ykr2Yu0XgCLQn
         1ygd3OEBP8/LLlPynw9Sx2HU6u6dtdBIFBmlY4TmWAdAxYvd3TNjdrAf+nbY6XjC82uu
         YZ12diAO9BpOfl5+46/v7n3doHOUCogNSYWOTYCgJ6CqIUCqIhx5i/JSTY9L4UjUuRZi
         J1qAQeUfrY2jQI0aQrDXa5D4FcSCNu8KtxEan5U7keHm8hDitMyPEz/OdEauBr9dt2gc
         nw2Ph5LCmwVBAnQJEfRRgEqDk8H0cGmp5YVyVPlnuHkCrb11lCIr9TTxLoEp0y4CPWPl
         FehA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783726485; x=1784331285;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XXN1yam/KX31uO438/Y+ss2TV/bhd8i3b719tnI3Ft4=;
        b=FI1eR3PhCXzp9NQqsjsUeEsSch8WEmig/e5PUepY/c0rA9v9wKzApvafEse8iMJMyr
         Wy6iYd+8p35LBIRXnF3ZyDp26Vsj5/nhonZkuMPbd6UXsLlsXjZNRyz4vxoVmz2wWEXF
         d5QAooCYGDP+SR00Ph7aUYQamiopoZ+lPWaHsFxYbk0/p6QmRvywFN14p5L3h4NzoMd+
         tdXPulPMrLHld8P4xhS62pVYY1Udzf9h6JOtz1WlfeGY3KrBZejbW0VYA62LIzkZ7NRm
         npVVWmJzQ5hY95GykJJ6I7yUJGyrAUlX1JhpuoaD2WJghkJMGxsO10rEFH2bqTHIQswU
         oLVA==
X-Gm-Message-State: AOJu0YwQPg64nFrFAdfNqYI3bGqkdWCVlnbVULHLCtjI8p+UfQ5Uhq/0
	JzzJ6kDj5z3C/90qIUZLRGeCoB6Xv2PG5S2Ob1TkhhPmyTgcT44Uxwyoj/o2JPXcz9GyAJ57DE+
	Mu0mexjKr34AcpMWuGqtX0pYJSkQI3IElkQ95OEXtAN/Hq6sH7Cnx1ADFENFV0uX/v2P5e7f1+h
	aBIB+4HuoSprbSMQJOGw0=
X-Gm-Gg: AfdE7cmcB+Fn2GOYvOLDk/r5Ey4CInLdP4wpqVXWWrXQpycMApQ0K+juP8lOKazF6fF
	nuOx7PGRqE4YVpM2AUmeTa1brjePvHur2zOE7NHuycmxB2oM/TzOjxoWZAnKjsD1n9tq15yGLrX
	IUlFtH6tZnkIgeadnrWboGlb55zH0JjWMPZUGJ+iAZXhKAtbjdzFdpESTkEjL1igipI3R2W47w0
	Wo3yIQ9L8mhmqBdyOcInF8+U9nBgjz8Rom2+K72avXeaRMaA9FTqbmXFGBMi//Z8y9SHHXgwAvB
	quGXJJP/8tBXY8ZQn2bQAt2GSLzGYPZ8EMaTHlg4NGaVmQFxubOzPE+wMIwvd4xNvMTv5HgT35p
	epQqiYle4bDqVrHWOQvjOtgBgxJ5vg2H3YnGkxGf5Qw==
X-Received: by 2002:a17:90b:5344:b0:381:e74f:8a6a with SMTP id 98e67ed59e1d1-38dc74d5646mr925985a91.16.1783726485148;
        Fri, 10 Jul 2026 16:34:45 -0700 (PDT)
X-Received: by 2002:a17:90b:5344:b0:381:e74f:8a6a with SMTP id 98e67ed59e1d1-38dc74d5646mr925959a91.16.1783726484536;
        Fri, 10 Jul 2026 16:34:44 -0700 (PDT)
Received: from hu-anujmitt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3117d847e17sm42831479eec.18.2026.07.10.16.34.43
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 16:34:44 -0700 (PDT)
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 00/10] Wrynose pull request
Date: Sat, 11 Jul 2026 05:04:34 +0530
Message-ID: <cover.1783691257.git.anuj.mittal@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDIzNiBTYWx0ZWRfXzpv3T7xI/tqa
 ViM7gYJKxNRjYgcI3NSjGaZZLXhlHtt/qmDnyttkFyVY3dCiMwLPePiq189QDmled25VwjQ/sYG
 1x6lBWJgMgOohuP7fKWcqNz/wywfQzcIDhqfNjOIP1LlKZSTGUPBl81USk4dgmsDeVhKeBf+jf2
 SOWsVNROBtJLO4btLzzw2vV8HcSwbCQqV4EjG2s4Gj6jbVU54j8ddnu4sHHCZqS/NNTYMy2ge0e
 zPMrU4rTxlSTrJhpZH5G0Ojdol9e7sCtXaMp7ysAH15EZVIm+C3EqApd3p0YGNIbhjksH4cY+Gj
 zIS2RwCs5t0/bT8h6tKosCvIrbODrxek6kGMu7sJsROq0zCLQTvAKzjPWkS7xsXUedaBI/x/vIf
 lZpE5y0XeJuiT6Ach1ShMjoZyUloaoYRFRz09eeCBSh1M18Vz/f8NWxn5AkLYTOx5dzmL6JueHG
 tE0UAjhJp5PHs40nTaA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDIzNiBTYWx0ZWRfX084SBWsPE6rT
 OhrEdHH8CvG6MCmI6NkRkNRWN33AHJfBcif8Jay/z0LeFo1l4qdI+fh7Te5u7VvWib31nNbi8se
 9yc3L+oeIELR1XuJ87YQwwVrhxq+e7Y=
X-Proofpoint-ORIG-GUID: 139wmTHuAvIxKpvzZL2vH3kADrY5jE8F
X-Authority-Analysis: v=2.4 cv=J9SaKgnS c=1 sm=1 tr=0 ts=6a518196 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=iGHA9ds3AAAA:8 a=Q4-j1AaZAAAA:8 a=-A8QlWrh2tBxd8bCL1cA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=nM-MV4yxpKKO9kiQg6Ot:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-GUID: 139wmTHuAvIxKpvzZL2vH3kADrY5jE8F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_07,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0 adultscore=0
 clxscore=1015 suspectscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607100236
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Jul 2026 23:34:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128133

Please merge these changes in wrynose. Tested locally and on autobuilder.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1616

The following changes since commit 100027977216601000cbefc42c2ff6cf667e7b5e:

  hostapd: Fix clearing settings for color switch (2026-06-18 13:11:20 +0530)

are available in the Git repository at:

  https://git.openembedded.org/meta-openembedded-contrib anujm/wrynose
  https://git.openembedded.org/meta-openembedded-contrib/log/?h=anujm/wrynose

for you to fetch changes up to d97b5602d7f64422c94b7311466cda7f6b1962d5:

  libuio: fix FILE descriptor leak (2026-07-07 08:04:43 +0530)

----------------------------------------------------------------

Jason Schonberg (2):
  nodejs: upgrade 22.22.3 -> 22.23.0
  nodejs: upgrade 22.23.0 -> 22.23.1

Joao Marcos Costa (1):
  jsoncpp: fix GCC 16 (and Clang 22) build failure with u8 string
    literals

Qliangw (1):
  libuio: fix FILE descriptor leak

Shubham Pushpkar (6):
  jq: Fix CVE-2026-40612
  jq: Fix CVE-2026-41256
  jq: Fix CVE-2026-41257
  jq: Fix CVE-2026-43894
  jq: Fix CVE-2026-43896
  jq: Fix CVE-2026-44777

 .../jq/jq/CVE-2026-40612.patch                | 127 +++++++++
 .../jq/jq/CVE-2026-41256.patch                |  54 ++++
 .../jq/jq/CVE-2026-41257.patch                |  57 ++++
 .../jq/jq/CVE-2026-43894.patch                |  56 ++++
 .../jq/jq/CVE-2026-43896.patch                |  73 ++++++
 .../jq/jq/CVE-2026-44777.patch                | 243 ++++++++++++++++++
 meta-oe/recipes-devtools/jq/jq_1.8.1.bb       |   6 +
 ...build-failure-with-u8-string-literal.patch |  73 ++++++
 .../recipes-devtools/jsoncpp/jsoncpp_1.9.7.bb |   1 +
 .../oe-npm-cache                              |   0
 ....22.bb => nodejs-oe-cache-native_22.23.bb} |   0
 .../{nodejs_22.22.3.bb => nodejs_22.23.1.bb}  |   2 +-
 ...ix-fclose-leak-in-uio_line_from_file.patch |  31 +++
 .../recipes-extended/libuio/libuio_0.2.1.bb   |   1 +
 14 files changed, 723 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-40612.patch
 create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-41256.patch
 create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-41257.patch
 create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-43894.patch
 create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-43896.patch
 create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-44777.patch
 create mode 100644 meta-oe/recipes-devtools/jsoncpp/jsoncpp/0001-fix-GCC-16-C-20-build-failure-with-u8-string-literal.patch
 rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-22.22 => nodejs-oe-cache-22.23}/oe-npm-cache (100%)
 rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-native_22.22.bb => nodejs-oe-cache-native_22.23.bb} (100%)
 rename meta-oe/recipes-devtools/nodejs/{nodejs_22.22.3.bb => nodejs_22.23.1.bb} (99%)
 create mode 100644 meta-oe/recipes-extended/libuio/libuio/fix-fclose-leak-in-uio_line_from_file.patch

-- 
2.54.0


