Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF912CD37B5
	for <webhook@archiver.kernel.org>; Mon, 11 May 2026 10:42:19 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.46467.1778493496100308682
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 May 2026 02:58:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=Cqb5Zstr;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=Y73y4JDB;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: bartosz.golaszewski@oss.qualcomm.com)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B7A64a1258560
	for <openembedded-devel@lists.openembedded.org>; Mon, 11 May 2026 09:44:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=iscswj0E7q5mU+8YQFO+NCGMePrEb4dKyhP
	iyBaGfc4=; b=Cqb5Zstrh1qaJnQYL4+FNZhrWJJdpzRhQlXAcPRqpAyh66CLQzm
	ge3cSOGlNQwW+N6h9wGbjX+8YsbkRQZt0A2q5anNGQAesRMoaAQ+haDzXUYZvTnR
	c0kW8twmlgfs06kDGOQcPGhojl9EP71ffAR3k3WQxmm9vo0stKE587+BHioxdge9
	ElFsYOHvh/Iwcj45maTYUgleAO55P7VJBBeBtxnloO73H1NRBuvVDvKhja4FmdE3
	H0nABOp1qkrsUcJTzKICGKGuiDjhhT57WZE0QINNSatW1mmDC3t6D1tU3eJcVA/r
	iiqW3qu+A5czrrLLgTJfC90F2SIjaK5BMHg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3ag20jtd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 11 May 2026 09:44:21 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-514b5d6bb45so26253611cf.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 11 May 2026 02:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778492661; x=1779097461; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iscswj0E7q5mU+8YQFO+NCGMePrEb4dKyhPiyBaGfc4=;
        b=Y73y4JDBq9gaWKooicFWEbL8QoDs3RlEHfzw0XCtxzFtHu6roY5eNmzeArPq52hNpw
         n0EiRspbD73KUi43BoA30wiCeBfiurF+y0zSwSQTDjMJJijXuTqcPw4yGW7CqtyGn8G3
         us5AuBFqUTqm4Qi1TY5c1gTUdvtxd1Hu8A5G3faQr9ivUmossbovR0u4fn9tmxDpzPGI
         cCFfhKcty9i9HKffecW3/SLFRpLph7ssSc0ywOmEvWCVhfX0SYCu4PAILxWj7oXZkk4V
         Eqx2JGnDdl9+qG0gylaEir28WaLOU6yL81+ZKqY6Kh4WT3mw1VzkMrQ9dXjdsNpOyw2y
         Hp6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778492661; x=1779097461;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iscswj0E7q5mU+8YQFO+NCGMePrEb4dKyhPiyBaGfc4=;
        b=L6+6NryxecURnMRDHntx+R1Oxr2JJq7eXms4XnmP+V92mThG3IzT20UCjMzTLyU63v
         7Ab1YVlQcdRkcHPskph/p+MBJrPFugpQdexiAdmd3tTyyb2sTeItfh3PX60tXKs3ojnS
         yyUCXJxe650yuOkUIGapatOmLNwsP2n6oE/A2SNi9CpUFs0yo/ZT+KwE2UJJgHSlVg6D
         7Pm/VnNuL+5YeD4zcd4OvGd09xL/SjfCjc2RKkkJQMCFD6dMJiyRs8zb7F6eYc13sJcU
         66nP7r1u7Ighzz96qbnbYJCLFD3+h7MqzCeXtd2ch9UajyeyhqD/nfqUSEaj4vnv+KHx
         MQ1A==
X-Forwarded-Encrypted: i=1; AFNElJ+X7wTtbLnPB/WeJbozTdilPjFIFgthM2sILTY/xtI+1MQgEvLP0N8e0peUjBPW6oNSlM16hdjqoDPx4QhqPd9G0+U=@lists.openembedded.org
X-Gm-Message-State: AOJu0YyeQ9n8mhQqkJ2slv4OuxgBpKHqDfEIwNstj7NZMz7kEWUnFp0s
	e4Lw5uG9vG/JDB9BV/lizvmO8qu7WBuajRT+OtY2+ZlQvfOgsWox37BEPFax/8kZMc9ypNFWJn5
	RStU/sIduF9CzevAeudAZzl7S+2g0KNVzRAN+w5LPRRH8BEO1UsNETEWdpjTcJEKIM+1sDMm5y3
	vIeCm2Iacq
X-Gm-Gg: Acq92OEFIQNr3BrO4yJBKo2fvA5spoe2MTU2E6TF+SAUV5W3e7O/5UPUtRxrsoaHVY6
	1sFjK985CcN0GqNUskRlGe44LtRF66BW8E3qxcjG0FWeIXcHKaZYMRXmYgjjo9mXcnXLAK7TBNK
	xS2MvAPhukAvOh6/j9EXjxIDURXhW+Mr0N+FaeN/44nnjQRtrElmLeXcY552CjmEgn2uL6SQ5V9
	4Yy0/Gb9ihC8yR52pg9268aP9eLZtdqEmStD2D9Gf52IFW8CeFddTmqBbgiImEQD1JuAGl2V5xW
	gb183SMa0BAFSNVeAT6aCWx9Cf9xIyFDvBCti9tkU7DtZZwW7PzFPgppCRd6nhMUc2YQaNkp7tu
	A45e/RNVdHrGt6uBzbQzk32TEu6Zff2aViI/asNs3msxU7yVZjQ==
X-Received: by 2002:a05:622a:514d:b0:50f:340f:ff37 with SMTP id d75a77b69052e-51461c268d4mr303907891cf.22.1778492660690;
        Mon, 11 May 2026 02:44:20 -0700 (PDT)
X-Received: by 2002:a05:622a:514d:b0:50f:340f:ff37 with SMTP id d75a77b69052e-51461c268d4mr303907651cf.22.1778492660192;
        Mon, 11 May 2026 02:44:20 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:63bd:c2f9:cedb:aa32])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e6dafa61esm76717625e9.4.2026.05.11.02.44.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 02:44:19 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Khem Raj <raj.khem@gmail.com>, Bruce Ashfield <bruce.ashfield@gmail.com>,
        openembedded-devel@lists.openembedded.org
Cc: brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [meta-oe][PATCH] libgpiod: clean-up sub-packages
Date: Mon, 11 May 2026 11:44:15 +0200
Message-ID: <20260511094415.37134-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: f_xDLht0WoUNNbc5jbo_rh1nBDXOFDpa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDEwNCBTYWx0ZWRfX1WPRtYrHTCz5
 RH0+o4yQzA6xyv0/8fC/NrYjS+PrCEDUcizVlnCJfJK70OSYieDwrT14E2QUomSuoehFzVAPISJ
 99WWJkgCd0UICt/NmYVeBH8q7Dj83CY/JMTytJbPIf9o1nZrt8Fr7OdS4kmFAu8VQf2DDzmOm0j
 c3fWPS9oVrIxHnOSToKRBI1bgqAYEbNhAsqFOZc918e74fmIIzYf8VrVTpEKVDkuj87hHL5zjKk
 lOmjPINttMJfW5ArMClkzWFmkM66CUNL+TYPl2rwfJVLIZVnnx6dSYzmjMEw+j+Ihm8+zRiM+b5
 rK6ICOf8nNMpmSYZ0xp8YjwDnOTaEBqfSgMBAOhFvZ4c/N/rkSogMtu3awKLf+PxM/miXL4AJTI
 eZykdOVpV+52fokyjV2rSqw663qbtDrlMcvovFZBe8tFn9D6pTgypO5FE/qOMcdvR7YMt6uo4Ms
 3LsDYG5Y6TcBafg86LQ==
X-Proofpoint-GUID: f_xDLht0WoUNNbc5jbo_rh1nBDXOFDpa
X-Authority-Analysis: v=2.4 cv=NODlPU6g c=1 sm=1 tr=0 ts=6a01a4f5 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=EqU-zman_-j1k7VoJq8A:9
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_03,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605110104
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 11 May 2026 10:42:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126844

The libgpiodbus shared library and the .typelib file for libgpiod GLib
bindings are currently packaged in the main libgpiod package which
should really only contain the core libgpiod shared library. Move them
to libgpiod-manager and libgpiod-glib packages respectively.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 meta-oe/recipes-support/libgpiod/libgpiod_2.2.4.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_2.2.4.bb b/meta-oe/recipes-support/libgpiod/libgpiod_2.2.4.bb
index 2c8d9f1873..e6de4b0313 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod_2.2.4.bb
+++ b/meta-oe/recipes-support/libgpiod/libgpiod_2.2.4.bb
@@ -32,9 +32,13 @@ PACKAGES =+ "${PN}-gpiosim ${PN}-glib ${PN}-manager ${PN}-manager-cfg ${PN}-cli"
 FILES:${PN}-tools += "${bindir}/gpionotify"
 FILES:${PN}-gpiosim += "${libdir}/libgpiosim.so.*"
 FILES:${PN}-gpiosim-dev += "${includedir}/gpiosim.h"
-FILES:${PN}-glib += "${libdir}/libgpiod-glib.so.*"
+FILES:${PN}-glib += " \
+    ${libdir}/libgpiod-glib.so.* \
+    ${libdir}/girepository-1.0/* \
+"
 FILES:${PN}-manager += " \
     ${bindir}/gpio-manager \
+    ${libdir}/libgpiodbus.so.* \
     ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '${systemd_system_unitdir}/gpio-manager.service', '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', '${sysconfdir}/init.d/gpio-manager', '', d)} \
 "
-- 
2.47.3


