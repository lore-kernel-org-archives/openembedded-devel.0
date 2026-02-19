Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79B8EE9A03B
	for <webhook@archiver.kernel.org>; Thu, 19 Feb 2026 11:30:04 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12033.1771500595601234358
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Feb 2026 03:29:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=Hbq3YpQ4;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=g6cA3H0b;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61JBMNrT3564509
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Feb 2026 11:29:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=GlZ4MOYYaE5
	BaXskrV9XAG8BJ2ofeC4glHYvU8BSgek=; b=Hbq3YpQ49tnWal4XdpWlMkvQtbJ
	1ScBwmdp0bfVIJfVOKu+ufP619p+Cw1vEyK0CuhF2mgSowSVrN/QiqYbIOeXmUQs
	w3HjSSZSrozmoV8xUy/aVGS7yJGQhk9GSJll77S5/IYLTx9TP2SUt2DT9CV6KNF7
	mBrUGTKM7OOI40UmWKFb1TLWHsUvja5mh+MmiN5UgoW5aYMtvi+m6L7Y1FRCzGkn
	j0Vm6ZYRfLur8zu4KUoLFo/yWkIc8VGluGx7UmfTzBw6TjjuinepgwdhPR4ncJTi
	ivHDnzoIuGIIj+N9XQmMEcElBE/o7Ett0s9zfcjTQPaDOAmNGAbtNEd2Hnw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ce1k800mq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Feb 2026 11:29:54 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8252714ba29so1974746b3a.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Feb 2026 03:29:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771500593; x=1772105393; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GlZ4MOYYaE5BaXskrV9XAG8BJ2ofeC4glHYvU8BSgek=;
        b=g6cA3H0bu23CLjthHFbhDi5w94iUk3q1cTtD3seeGxmabVommBWZ4du6fswJQPSLJ4
         cAc36d0wzPgV3H/QujsfIijhX1nvDt+XKi3yCw4cGhuZkP7MG7D6tVMEbn5opL0Cjeow
         N61+X74wB/21ETDnzqkVQlV69Rstk5HVA9//FjF3hKOoUJVAW1wmiWeizfMUKwRX6+q4
         fVYGIb66aZb+peNmUe+3q7r2CjHf9wic9Wm9V9Q+Lu4JtvP1xHg2Vhz09xlyS98vJhbs
         CfQ9F1iOBOwpf0CyN/r+RxlSIRNAMJJ9/oxM5M27Ghp8JFK9OFbwUy5RTcN4WLyxXlqy
         vT5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771500593; x=1772105393;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GlZ4MOYYaE5BaXskrV9XAG8BJ2ofeC4glHYvU8BSgek=;
        b=ChZVWq9zQNbbk1zY2V2xAfnYVUrO9MsG1vvxnFj5UtlzY4VohBZ1wDqB0j1Qf7zw0m
         BtV/EwkcpzUXi6F7NDmUrynBXUrdEJ5VEnLJOlLp+1JEN5ZRtPsnUb9YPvP+MfhD8iHW
         szYAAliSg4Zmq18zq7xm9KYcjXgtwEQNfzpy0LFRezNlDOD+OxBKVKpHUrCk9+PAsDK5
         WESm55TLh+61LxSryyvalvhMs4TL7SEh3Alc8PLtu9B18LJkyxKApbIkEwjOgFVrtmBT
         Xjot6pu2vTHG5bE2kq/kINeL73ybQ10YF8zm94kL/1zvDokwlycEMHfmtLdXWd2tuBDF
         ABhQ==
X-Gm-Message-State: AOJu0YzEYoKbVDRGFcAOwoHv394xjM02T1mPjehLFheZ1uztNMvAWxBw
	xVdjD8tGWhzaFaVApY5vrG838uyhM2WDkoNceSQ9a78Wy39BWJw/jTyQ30rH8QSLPZQpd4c372J
	g/4KyvAFBlBK4dkq/P1iBk3DUOLS4/m/zbaWZX6OsBU4/PBYLjau6jf8n7qxpxhuFfN2to7cEcr
	jZScZsPFthFHT2nOYEOFU=
X-Gm-Gg: AZuq6aKSJw+CCkhXwopXpMLEeNUGufRRvJ9eW8A+2KsLtmtKkT0PtlmtYplJE4GO0T8
	T0YnJGACJJJ4iNL2zRIMbVv6R+a7PFSLHQwTmPcSCJO6Bn6fJJDYjrZUdiG1+eNyAbF7v5t+jTW
	Ku1eHd4e1YYrBsvhSemSIqDcujeWLsbYjIS2wQz+dyG/Yw2Or4Wecx0GkZSXz90n1ahd2HvjSn0
	XJUL7yShwJj5hgZIIhEg7Uk0Jmew6TDsM03kHYPbqwq6a9pJRRPnnNrENHzqNpHn8ztPvToJL79
	LpSc3GNhAA/XKTqX0HJiiynAtsVYXHrDkEemru0cLT2O+2E5SSSDWU/XavfQGn/uthocPCnEtQj
	6KMZtToGVmFzlI70EUzgXzIhly/RXygjWOy8tM+KiMKdkmOJOOu1f
X-Received: by 2002:a05:6a00:2d21:b0:824:a16e:7eb6 with SMTP id d2e1a72fcca58-826bad50c98mr1709965b3a.14.1771500593510;
        Thu, 19 Feb 2026 03:29:53 -0800 (PST)
X-Received: by 2002:a05:6a00:2d21:b0:824:a16e:7eb6 with SMTP id d2e1a72fcca58-826bad50c98mr1709952b3a.14.1771500593023;
        Thu, 19 Feb 2026 03:29:53 -0800 (PST)
Received: from hu-anujmitt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-824c6a3e15bsm19697056b3a.19.2026.02.19.03.29.51
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 03:29:52 -0800 (PST)
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/3] thermald: include the correct HOMEPAGE
Date: Thu, 19 Feb 2026 16:59:43 +0530
Message-ID: <20260219112944.1555772-2-anuj.mittal@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260219112944.1555772-1-anuj.mittal@oss.qualcomm.com>
References: <20260219112944.1555772-1-anuj.mittal@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: NI23aOCb8wYeLHYTl2qvyvpEaoGbNQdn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE5MDEwNSBTYWx0ZWRfXybUngUT00QBc
 K7O48spQfIFmk07rQh7Dz7VDTpmlOpypQA5Qkp8cm+GKowaYcrRD5sRS6npSnTnVLTniU5EjyjS
 7Q8QAW+cShRP0tSIaDGFDbyj2ei+QO4ZuB08UYbYRgMqs7PYOqp1KZIY5bYLHjxUCAiBvYzy/nM
 JerNCSIcICPVU99GMuAF8KCbh4X+qBasQsNNSDxup8ZeUDKZa+wmEDTAUrTwh05w7cjQ2vuPqyS
 z8kCqUMhwnxfeFAdaXSW/HURAB6kPCSKg6zGfmusS1xO4cnTvPCnWtoGIUEK6Ri69Q1K0L8/5ia
 KUYbS8jZ3PkVn8NW9JdZoW80hdrQc05HuCZKM0PQddm1KFKgSAgdm/FC+tMifve/tSit5/vnG1U
 q0UieIH9ltktGYsKzoCqgFWjy1mupx2/RMzxMOebRlnWBZebdjoDgouQKesh8lSJAjKnwz4j0lj
 inwYnRrZqwbwOhs5Etw==
X-Authority-Analysis: v=2.4 cv=cdrfb3DM c=1 sm=1 tr=0 ts=6996f432 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=NEAV23lmAAAA:8
 a=EUspDBNiAAAA:8 a=fTS1B5eMO5KGea5McacA:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: NI23aOCb8wYeLHYTl2qvyvpEaoGbNQdn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_03,2026-02-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602190105
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Feb 2026 11:30:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124508

From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>

Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
---
 meta-oe/recipes-bsp/thermald/thermald_2.5.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-bsp/thermald/thermald_2.5.10.bb b/meta-oe/recipes-bsp/thermald/thermald_2.5.10.bb
index 6310602813..3ee31f9df7 100644
--- a/meta-oe/recipes-bsp/thermald/thermald_2.5.10.bb
+++ b/meta-oe/recipes-bsp/thermald/thermald_2.5.10.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "Thermal Daemon is a Linux daemon used to prevent the \
 overheating of platforms. This daemon monitors temperature and applies \
 compensation using available cooling methods."
 
-HOMEPAGE = "https://github.com/01org/thermal_daemon"
+HOMEPAGE = "https://github.com/intel/thermal_daemon"
 
 DEPENDS = "dbus dbus-glib dbus-glib-native libxml2 glib-2.0 glib-2.0-native upower libevdev"
 DEPENDS += "autoconf-archive-native"
-- 
2.53.0


