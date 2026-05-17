Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 875F6CD4F3D
	for <webhook@archiver.kernel.org>; Sun, 17 May 2026 08:24:40 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20219.1779006280166641159
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 May 2026 01:24:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=lhoXV3uC;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=BlJT432R;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64H5Thcw3835038
	for <openembedded-devel@lists.openembedded.org>; Sun, 17 May 2026 08:24:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=TzyzJwCqlss
	lKbtK4/17nSBq2t7OCKAh3lpS5VDHF1o=; b=lhoXV3uCz/3tcQEiLxG1xqG/rnC
	tZxZDSCeGrkHobrLEWzyOeYTDWm6jf5TKEkaUXZYW/9F90/sCnLWgTHUaJ3de44l
	41/cz6f/cMbbpgPN8+G5NsxN80Sp9pJtnTUFRUwQGXP/k0tNkNEJVtLc77yf1PJ+
	17dSPpGiGWnlYMzvz3Tz/LnVB2z27Ap4WNslVVNlhn5mNmf07NIN/G+MGciLhogL
	rnzVoe5SXcUTq7GA8EgF+Gw8X8SgOfsVn0yytsFI7YWYp9s95plL/nXWMQkHmDpn
	p7+elMH5m5XXIjQOEJnACcokSMccQatQBF4kZrzEmgklfACnrNZH5foRk4Q==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6hbcaen8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 17 May 2026 08:24:39 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-365fc4636bbso2526209a91.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 17 May 2026 01:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779006279; x=1779611079; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TzyzJwCqlsslKbtK4/17nSBq2t7OCKAh3lpS5VDHF1o=;
        b=BlJT432R23uld45BIH/uL5KFQNa2UfQ0Eh1M9wp67SzfYmJFDs6cSehOag6G0lq4Nf
         c2pekBhFrpO/G+BTtEA3z7luzyFoH9YZXkP6buDU7ZHmrM3FX+vBWvfy2zt2uke1AeQU
         u6n0TXYSz0NfU7vy8gK04FExVyCZqJ4LFeEVDATYTRYsgknrPvtwsaAYnrJIxnhNzqUT
         qkUlKOkX0AnKAdLc4KVN/gO8q8yIDl2eOh0uEZSbiV2DyRwSgksnBYVEskwcYQWMYSKS
         tnBYGs1NhRmc6QpQGIkThebfncpeqzgqwuaIJSJcmYKvjRd0+JtII2rxERu4/2BkAFwg
         6qvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779006279; x=1779611079;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TzyzJwCqlsslKbtK4/17nSBq2t7OCKAh3lpS5VDHF1o=;
        b=sJyJqI5N7CxDBa1JudmluOM9MYZpMWX/qa39tq3ahnat2RnvPsoGptsyDtWBF2eHm0
         r3C/KD5ukgddjSkZBowJ5UA6sGxPZAUG1QazkkIPgtHnK2gVNQHMT3fRgTWAN3Yw6rth
         1+XSqIWgHhCSe/gC5Z/szr+ZQZ21zqLidCu0Q80yJfRJK8n3xJwTPL4AhlQG1QwmNe9k
         01ldHYntEW+0rrRTeCl2R5XWLBD6uVOaZBXjmNrABEmv6srqZGkQPM8CkYb+iNqu5pne
         FsoHJZTuuXHq4GQ2F5FEI+J+MdJVlSGzE2ouGO1dzfXMy66+BtilGTbXfniyPgz9roQ/
         jNcA==
X-Gm-Message-State: AOJu0YwVWt2MIxvhV0wfxfJc/g5mo7e18NRvs7MWIqgQE5pZ+MsaH000
	l9M33EGIZDEVUYQFGxdJC7WJtb3o0dBWk10sareLAaeAZchb+9HWIaCo6f7eRrc742lVWIQRV7J
	EWEfDO93DSbRTB1bBKsCxkMsoDQ0UR69oVPI0ys8ZrA5PYDb3657+yO+U/XMMkhuE9dekE3nfmz
	cqMutm4Rat1HI+rJcEwcVTqg==
X-Gm-Gg: Acq92OFjUexveIiV/HNcm2YQnKPHMmbC97Mm65Gj6WlX3pox7qeIAlcyVuYW6eRKXYb
	piFHGkEf/K7nYb67BW0c3nkC1NmtAKOfvB64J0xcLvwRC1or2xt91RybhBY/e0dwco6x7kumIti
	Jma9H4X451dgRkEcPQq1tHd1Io26oQig2HasNDdqdapdsI1NAwd3MHHb4yRvjR/fGkm1+Hczxnr
	Au1NQDolQvbWePDWPjNgtBk2LpCUGQDi+GRJOsgHaeN3vFdCj5zEAU+6C16Qy68W8aBHBf3a2pi
	GPnm73CwwbM/+lCwK6M9GXpCF9jUWeEviqXb6tqL9SP5jj0HDN1mbJcrWMdfo4e5Q8rK8ItlPhN
	OFbfkslytyi2YyrHgtkIPjmd1lXl3Qw7lwd+rGKiFvuQrIr+FSLG9
X-Received: by 2002:a17:90b:1b05:b0:369:223a:cb5a with SMTP id 98e67ed59e1d1-369519af834mr9902952a91.5.1779006278976;
        Sun, 17 May 2026 01:24:38 -0700 (PDT)
X-Received: by 2002:a17:90b:1b05:b0:369:223a:cb5a with SMTP id 98e67ed59e1d1-369519af834mr9902936a91.5.1779006278452;
        Sun, 17 May 2026 01:24:38 -0700 (PDT)
Received: from hu-anujmitt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36956f3723bsm2765033a91.1.2026.05.17.01.24.37
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 01:24:38 -0700 (PDT)
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [wrynose][meta-networking][PATCH 26/29] znc: upgrade 1.10.1 -> 1.10.2
Date: Sun, 17 May 2026 13:49:54 +0530
Message-ID: <e7a23908542609e82bc1ba3d5a73b5fe3fc92252.1779004358.git.anuj.mittal@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1779004358.git.anuj.mittal@oss.qualcomm.com>
References: <cover.1779004358.git.anuj.mittal@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=cuSrVV4i c=1 sm=1 tr=0 ts=6a097b47 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=omOdbC7AAAAA:8
 a=EUspDBNiAAAA:8 a=NEAV23lmAAAA:8 a=9msL-m7U43p9YzH9Z9kA:9
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE3MDA4NyBTYWx0ZWRfX8RHe7q4FKSJI
 jq4n5lrCc50XYurvrW1rbrNcEnZXPou6rlrjp874l1iIgBm1D7bZTvNzvi2G5wQXPF6s3Khb7Dp
 PRrZ2ZtRpsr4Dd4csi/bu46bjpTbrpvHLSoXY5/RUK123rAeULEaNm9X4daKpykJOtwj7d9fXhw
 CUlH1iHReFCLPdviWjAVQzSw4+95ykEWymN7SwwnjY/xLjQf2VzicP/Plle7YPLQdDxSDFcK5rv
 0gKbzV0La1rAzcY2dW3AlUAXSdEc5HN2ow5RfQg0zuGyrjdzEPnGW5fzlHcdo2pgC3pQZOkTYA2
 iLwxI++XAW3oDydMlaRrOEL5rAP96PjEOq/kqgBxpkz/8zjJQ88Ch0Injnzxxe4lJedtlnHWtAH
 JDV1jALxxw8W70I0W0FSylj6UGrB4xKnLHj+bIX1Cia5RZU96HuelGTZ8JX0q8/urBpRuJUng9A
 54TomuUvVUhvv0o+PUw==
X-Proofpoint-GUID: gNyzD7DnmcoAeGZn5vuDDiTOIMjaFzr3
X-Proofpoint-ORIG-GUID: gNyzD7DnmcoAeGZn5vuDDiTOIMjaFzr3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-17_02,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0 adultscore=0
 spamscore=0 clxscore=1015 suspectscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605170087
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 17 May 2026 08:24:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127039

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
- Fix build with SWIG 4.4.
- Fix build in the event some parts of Boost are installed but Boost.Locale is not.
- Make GetClient() work in the OnClientGetSASLMechanisms module callback.
- Stop accidentally requiring new perl 5.35.1, regression from 1.10.0.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 8b4ce3276c57cf2408f97a26a91464263e971e49)
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
---
 .../recipes-irc/znc/{znc_1.10.1.bb => znc_1.10.2.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-irc/znc/{znc_1.10.1.bb => znc_1.10.2.bb} (94%)

diff --git a/meta-networking/recipes-irc/znc/znc_1.10.1.bb b/meta-networking/recipes-irc/znc/znc_1.10.2.bb
similarity index 94%
rename from meta-networking/recipes-irc/znc/znc_1.10.1.bb
rename to meta-networking/recipes-irc/znc/znc_1.10.2.bb
index 4477068bba..7793813234 100644
--- a/meta-networking/recipes-irc/znc/znc_1.10.1.bb
+++ b/meta-networking/recipes-irc/znc/znc_1.10.2.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 DEPENDS = "zlib"
 SRC_URI = "gitsm://github.com/znc/znc.git;branch=master;protocol=https;tag=${BP}"
 
-SRCREV = "29694fd26f5e9ec46731ee13bf66224181984966"
+SRCREV = "59af2206c62724eec0d8c43d3c1c0b70610ca1d9"
 
 inherit cmake pkgconfig
 
-- 
2.53.0


