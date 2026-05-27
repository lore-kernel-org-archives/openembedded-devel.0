Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86C15CD5BD5
	for <webhook@archiver.kernel.org>; Wed, 27 May 2026 13:06:37 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16026.1779872466627490316
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 May 2026 02:01:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=kmgUtlbL;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=X4OFoy+C;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: wei.zhang@oss.qualcomm.com)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64R8mVrk879342
	for <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:01:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=1yJ1xU7/S8WCNNeE/ca7vsVyXOCXV4sXBNo
	wOpF6vXg=; b=kmgUtlbLVSWIDAPFqC71ZQZ2bT2kU7WpFyNlLazujjwP3MbXu7s
	ep4K0yky96NaL7HsTWuDlMwdZLWVFjM0q5B+nnITqwDwb5J3ThojmdmDO7jJvvuV
	dZBN76nLo9ZAFsCkunoCi2QpDkD8PQz7vybqF2nYfNkBPmySkpWNPr1/x43l6xZY
	ZuyheL4vlM8mXaTJI10Bj414/0+BcWc99h9yw/Dlpp9C2wdARxI8H+3ttsQ/7zW7
	4GbwCSxaOkMXECopNUQ4EC+EFz8/y21GjXSy/DKeQhZt/cs4ioxv5g4PvJTXkktJ
	SLgds6fQTTVgw0T0K9O0+4s94B02PhRUs/A==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edvvqr6kq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:01:05 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-304bbf2423cso390226eec.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 02:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779872464; x=1780477264; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1yJ1xU7/S8WCNNeE/ca7vsVyXOCXV4sXBNowOpF6vXg=;
        b=X4OFoy+CIbTSi5B6jZTowKgw5kKnCmtpu4TgS19fqdcS2xAYCa+SX4RrLX+r4vw1zF
         wXkG67bWrwOHr3iE9ahFJTtRUjJSFl1jUgVbMsEwcTlGdu8fd9sHWHHx6XckOnIxGyDR
         bz6/clCFcp4ySumnMKItZYAKbOkoQcocFo86ze3U+vUGMYI/NtVcTngUIBSbVR5kiJHi
         StiocSY7BWncI0CpW8LDTftC5CnKhQW/jFhV9kzKvJVamEmbUdbIrRik9E2UtJNkxqgd
         /yIilzMhyaYtJ+lA9njz47mQDxWOyKRcTL01yLllQm7hLCcoNNbpJfO6QrkriIxIYUe0
         pymA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779872464; x=1780477264;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1yJ1xU7/S8WCNNeE/ca7vsVyXOCXV4sXBNowOpF6vXg=;
        b=rxXpfevFxHxEU3A3fFPrCWWkLwoekOVLQgx8HR60RgN8S5ZZECsvutVs6EqiBTNY0J
         an4U4OHwZODLu9vt0yrp8KMSnVKTa//eXL/MabXq+8hRTQhzSu53cEE3oCOXeL2emjUK
         7EQPo8o4gYUfNYMafDAQSBV77iUi1R/bLV64pA3jq8pdtb6rN07qAfpjRa7BW8qhKJJl
         /xKZBLZG0kvJj746ZQLD8pg6znKvvnNczPuI0i7oWZqNIyfuVRdBYfTekqe1cXx0EdjR
         SlYijGUc7dlTt0iCUeZrqlMicfmsuxXA0h3+vSm3TeL0X4E0CWneOn3IFat9MoSy3sWq
         /Gbw==
X-Gm-Message-State: AOJu0YzvLbRhVqUwvd9kCqwT1m14ZUbXIJhkhUUKnbXHXG8Y4u6h8fJm
	vAIz3qXlZa+vEA/NPCggduJ0RTFA3d8rT/fEkz96fOQ5k4Hfrq4ypimZ73vz5U8VAHUkdTvu8ag
	8NDgyObIpGvV5GjV9cfOcLek7XkCHM32HfVYWr+phAGwBS675dudW7SohUgDii3xa44N5bbkjPm
	ch8TUbZl/dfhDLUfjumAg=
X-Gm-Gg: Acq92OEFgtr5xwgrZdcac+qbxKHOvasGOwgQoq+eSYrYWmgbAGLb42x/q9DcviGX2ld
	xiA2qp/G8UWQtIXwzddKbNQ/vezTu4DtREZRx+g2hJ3PLO1kApmkNWk5+kmucBytZBM477Udaz7
	s4dMMAtSKezHwzM0jM+4M6c9K84NFwSujzgXfjRmndjn3W7Wk0KZgbeLLECaV3nSM7uPbFnLvBm
	KiDNjQZb7urRs+3DpjAQ3gM07xDE36O7SZfHTR1o+CK6yUhX+IzHXViA+pYhR5eYRyndFsEiBkq
	ui8hq6dIZZ2aMmnGkMYFiO0JWrTUxWEDuc0u9Qi6f8WkM2AiIYQfmFQsy+GWk1hpciQZ/owZ4qd
	fu2XRfGUmanUpdwJX2UHDC/D4praYIgHXffTKmdouR5Cv4SjHh5DHBHfRJ4qVkMT53WIbjenaJK
	UEON6S3qF1JdSp
X-Received: by 2002:a05:693c:2d84:b0:2ee:f85:ec3c with SMTP id 5a478bee46e88-3044922a698mr8999978eec.30.1779872464052;
        Wed, 27 May 2026 02:01:04 -0700 (PDT)
X-Received: by 2002:a05:693c:2d84:b0:2ee:f85:ec3c with SMTP id 5a478bee46e88-3044922a698mr8999958eec.30.1779872463360;
        Wed, 27 May 2026 02:01:03 -0700 (PDT)
Received: from san-w175-na3-01.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30451ef470dsm12638435eec.4.2026.05.27.02.01.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 02:01:02 -0700 (PDT)
From: Wei Zhang <wei.zhang@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: raj.khem@gmail.com, dmitry.baryshkov@oss.qualcomm.com,
        Wei Zhang <wei.zhang@oss.qualcomm.com>
Subject: [meta-oe][PATCH v2] hostapd: Fix clearing settings for color switch
Date: Wed, 27 May 2026 01:59:58 -0700
Message-ID: <20260527085958.1191426-1-wei.zhang@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDA4NSBTYWx0ZWRfX8P1hha7rM3AE
 UFgQyDbNR1mCvoEwhSzPyCCbg9VomMHezqjACEVHP77O1+HvssXqqxagMDVCwDA2FB1nlAtkV6b
 izfs7Lhv7b4KmJPx5shw2ppsLVqqzljZ8JBYhi1y3ym6w91HqOPm7Cy7j1sQssAmdfjkXN4oZ7p
 d+aBMvpwECFL9jt5xr140usoB5ROKVEW1nE7SzDXckhGIiPe3BMh96CoMTL5SnXLOafQcjHBOVr
 F4f2EireJ+29Nyf52oMdgFA8JYZtDV5A9nujtPuJHB6vxowhBL4dc2MhB1caYvJ/1cFXNfmEZs3
 z78c36BszNcX7y5gO7iBC/BEfCHn7wfCgnrlrT6pyR+BEyfH4UrvuHyeubO8AAKZCLIv/w1BKRW
 ObWIBMgRojV32BKNmQHkWZMhVs6PnSn91Tgps7P1lwaG2TX8F871L+vklOo++lk6xP+B4AdmInT
 kDRR4JcDtYYsLKZNFzQ==
X-Proofpoint-GUID: ABJELoODI7JfzHfBDIrw5Dcs-alv6LE_
X-Proofpoint-ORIG-GUID: ABJELoODI7JfzHfBDIrw5Dcs-alv6LE_
X-Authority-Analysis: v=2.4 cv=fLMJG5ae c=1 sm=1 tr=0 ts=6a16b2d1 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=yaAG3qJ-AAAA:8
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=SiN_I-OOOzVvK2OlotEA:9
 a=bBxd6f-gb0O0v-kibOvt:22 a=oLVlbjkABFOu4cUI0CGI:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_01,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 suspectscore=0 spamscore=0 impostorscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605270085
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 13:06:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127267

cca_settings is used without zero initialization, which may
introduce random values and result in invalid nl80211
attributes.

Without this fix, BSS color switch may fail completely and
the feature becomes non-functional. Initialize the structure
before use.

Signed-off-by: Wei Zhang <wei.zhang@oss.qualcomm.com>
---
Changes in v2:
  - Add CC to layer maintainer and reviewer

 ...learing-up-settings-for-color-switch.patch | 34 +++++++++++++++++++
 .../hostapd/hostapd_2.11.bb                   |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/hostapd/hostapd/0002-hostapd-Fix-clearing-up-settings-for-color-switch.patch

diff --git a/meta-oe/recipes-connectivity/hostapd/hostapd/0002-hostapd-Fix-clearing-up-settings-for-color-switch.patch b/meta-oe/recipes-connectivity/hostapd/hostapd/0002-hostapd-Fix-clearing-up-settings-for-color-switch.patch
new file mode 100644
index 0000000000..5d6cce3f14
--- /dev/null
+++ b/meta-oe/recipes-connectivity/hostapd/hostapd/0002-hostapd-Fix-clearing-up-settings-for-color-switch.patch
@@ -0,0 +1,34 @@
+From 161327f91d956771996c96ea1b6e4e1cb8dc074c Mon Sep 17 00:00:00 2001
+From: Stone Zhang <quic_stonez@quicinc.com>
+Date: Mon, 14 Oct 2024 18:47:32 +0800
+Subject: [PATCH] hostapd: Fix clearing up settings for color switch
+
+Settings for color switch (struct cca_settings settings)
+is used without zero clearing, which causes the member
+settings->ubpr->unsol_bcast_probe_resp_intervalettings
+to be a random value. It is againsts the NLA policy of
+NL80211_UNSOL_BCAST_PROBE_RESP_ATTR_INT and causes
+BSS color switch failure.
+
+Fixes: 654d2395dddf ("BSS coloring: Handling of collision events and triggering CCA")
+Signed-off-by: Stone Zhang <quic_stonez@quicinc.com>
+Upstream-Status: Backport [https://w1.fi/cgit/hostap.git/commit/?id=161327f91d956771996c96ea1b6e4e1cb8dc074c]
+---
+ src/ap/hostapd.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/ap/hostapd.c b/src/ap/hostapd.c
+index 5ba2cab2c..90e93b6dc 100644
+--- a/src/ap/hostapd.c
++++ b/src/ap/hostapd.c
+@@ -4768,6 +4768,7 @@ static void hostapd_switch_color_timeout_handler(void *eloop_data,
+ 		struct cca_settings settings;
+ 		int ret;
+ 
++		os_memset(&settings, 0, sizeof(settings));
+ 		hostapd_cleanup_cca_params(bss);
+ 		bss->cca_color = r;
+ 		bss->cca_count = 10;
+-- 
+2.45.2
+
diff --git a/meta-oe/recipes-connectivity/hostapd/hostapd_2.11.bb b/meta-oe/recipes-connectivity/hostapd/hostapd_2.11.bb
index a6f7122847..ce1c145fd7 100644
--- a/meta-oe/recipes-connectivity/hostapd/hostapd_2.11.bb
+++ b/meta-oe/recipes-connectivity/hostapd/hostapd_2.11.bb
@@ -9,6 +9,7 @@ DEPENDS = "libnl openssl"
 SRC_URI = " \
     http://w1.fi/releases/hostapd-${PV}.tar.gz \
     file://0001-Include-base64-for-hostapd-CONFIG_SAE_PK-builds.patch \
+    file://0002-hostapd-Fix-clearing-up-settings-for-color-switch.patch \
     file://defconfig \
     file://init \
     file://hostapd.service \
-- 
2.34.1


