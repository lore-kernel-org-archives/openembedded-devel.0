Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8993DC531CC
	for <webhook@archiver.kernel.org>; Fri, 24 Jul 2026 01:08:05 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10435.1784855279182068263
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Jul 2026 18:07:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=c/7MhulA;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=TdO/8TkE;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66NLePJ11351344
	for <openembedded-devel@lists.openembedded.org>; Fri, 24 Jul 2026 01:07:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=INlsOxZt4xL
	1bePZL7OB4ZcFAsWLgRkvk0Hmbw8fE0U=; b=c/7MhulAyqSBblVIkAIkfgfOwxW
	38/CSYtpWWHlJKvVsJWIK8rkOLULUO+DQrVCwxPEH2oOB1K0OmXr5svQ2GtC6SQ/
	wj9ouoTzx1Bz7K+CpSvdiql3ZjbhhHcJMgZhjnBKSLqi7bGpCqM3NUHDkfwCP0D7
	SFdH+zVCQxwybaTwWI20L2H2lzk9f2EZDQ7mk7J1+qsoBaPTnh+Tt55+yoNK/IKW
	LTwp98bU7tPeMk4J3oslN06SHQ8fm5+F+YavlHuIVdrHEyjjvP7325N+nNaHCCK/
	hVNThc/aKQBjz6hmd9xBnRA3JbEsnTfSAQskV9C7JtK0KOaMID5LgpPlmIQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkqa09ear-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 24 Jul 2026 01:07:58 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cfbf3e4a63so11337595ad.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 23 Jul 2026 18:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784855278; x=1785460078; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=INlsOxZt4xL1bePZL7OB4ZcFAsWLgRkvk0Hmbw8fE0U=;
        b=TdO/8TkE/A0yxP7UIkMFVgn0KpLqwkJvOgtNn0XaljuXtJ1Dg76qSChCoy9ZgGu0kY
         zR8y5QPJ/DedN1pWRaipNYKx8v4KQs+ZoMh3dBAqEY9VH8NLoTwOsFO+vsL2d/hzphRM
         B2Bqn0ZPQY7qwfJ7XR37WJTHbF0a9dzJEO2Uo/QgHKQAZ7E7y/RI4pSQhK4f6Wl+hsc7
         NNmqT63DeUTw47yHfAPPhxto38BbcD8A1b1fHa0f173lUoJgLTczbYUboT0bdkLafAlu
         07HKUeZUGXfs/a1+Xcf2ObENaRkFIP6Www2xa2gT1FPYV5gjNpuVyNuiNux9d4tKD6Us
         TF2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784855278; x=1785460078;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=INlsOxZt4xL1bePZL7OB4ZcFAsWLgRkvk0Hmbw8fE0U=;
        b=XNC/bqmVx7eG653FPqE0qyQadf8lEzJp3PwNeqK+iU9ecfOz6JsOtrr1bk4QO8wzus
         AydFsgvy+ntswvWPiJqOxO/3OAavWrSLmrOKxqOHXJeSAbqpPv1XNrl0AtdBLBNoA/od
         2IFYkt73qG3mwum9I3DHzC4HfokoWJWoc+TnZAS0PMUEiZZxoMOxizdxTttsk9K7y5AX
         ylwr1uUr4Vx6R/1J/5YOwDIxmW5b4o1ns0YOI/KoXq+WmjbK/YcOoG6+7d3G98mU9oUw
         SNGgMZBzRdMkVYFNM3Hp40io3tlv0kF0S3EB6klggFOtkm+nuCkQI6MnMM9tFxvYQiyH
         QRbA==
X-Gm-Message-State: AOJu0YwRv5MZhneGagz8Lpr2ziPgvD2gNxuqF75Mksp0SK0PaGVzw35p
	zz+f3igF7h6VtIK8z7RZx9r1+r4HSWPMqLk7RrP72rvl4ngA5Zl6aT+jXOQKBwSZI4bf6xGfCfP
	xg0isr6tTcwM+J3NexEBRroSQUm3cGoDK4UVyzwDOW08ItZocOoFNau0lmEq/RVq+oh2tPmU0To
	WC0iLImnN0Sf7rniU6zN+bzA==
X-Gm-Gg: AR+sD13/p2x0uIt4pnxtCB3N41vgkHhCwvZVUhHL0aN8bjr5nX7cOJhnzVwLXEcp0Id
	S2FZzJXitvNDCxHqrrV2WCwUDNylTpfyA1WwvHowNeNDLCaxsH6X5oAycy0OOHSZN5mqoyaO3rt
	8qbdMxaLwnMgu3ll3s7WZ7MXjMxp1/dCIIrAXjY+pQCuIedN0ULG2Hb/KzDMnT4l+m5RZ8ihbPp
	1onstPMyeBPIZqA1PaY81GWGeY+wgKsRHKpYPnGH78z1h0opOG8kLYKWWj097CKc6/cXDjvctPC
	6EnHWEUEF6Co1gH9gSOttqPHjEenb5Jjz3DrXgegNaAsAJUXVA87bbm+LI3ze6YhN/XckegFko+
	CU8kUpKICer9ia4lH1sAr1a3iv4vafyo=
X-Received: by 2002:a05:6a21:9d8a:b0:3c3:7bb9:c93 with SMTP id adf61e73a8af0-3c44b1e4bb0mr5718085637.53.1784855278092;
        Thu, 23 Jul 2026 18:07:58 -0700 (PDT)
X-Received: by 2002:a05:6a21:9d8a:b0:3c3:7bb9:c93 with SMTP id adf61e73a8af0-3c44b1e4bb0mr5718059637.53.1784855277685;
        Thu, 23 Jul 2026 18:07:57 -0700 (PDT)
Received: from hu-anujmitt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e07000fsm44906934eec.21.2026.07.23.18.07.56
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 18:07:57 -0700 (PDT)
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [wrynose][meta-oe][PATCH 4/4] sysdig: Use LuaJIT headers to match the linked LuaJIT library
Date: Fri, 24 Jul 2026 06:37:46 +0530
Message-ID: <20260724010746.2638347-4-anuj.mittal@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260724010746.2638347-1-anuj.mittal@oss.qualcomm.com>
References: <20260724010746.2638347-1-anuj.mittal@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: bC--Tqmm8FRtJ-MeYX9fPsjb6FCAz-lI
X-Proofpoint-GUID: bC--Tqmm8FRtJ-MeYX9fPsjb6FCAz-lI
X-Authority-Analysis: v=2.4 cv=e/k2j6p/ c=1 sm=1 tr=0 ts=6a62baee cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=6gl_cCoBAAAA:8 a=qQrxp82UNMj1BDdyP6UA:9 a=GvdueXVYPmCkWapjIL-Q:22
 a=Bor9z-CvbNo2M6AZn8_k:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDAwNyBTYWx0ZWRfXxeG5buqoRyU+
 DKC9gP1oBoOySHs1hAvaErmHl1bmQs1uWg9dfUTzAabTltMDmU6bpe0gJWCPGn5YUs7HgOTz4ic
 09UG/uGPiEWCYEaS/itPkjYpTFrftDSKTlC4GQtDMDlRZuSsu/IkD0I+AbKg6NDi7cYnNG9h8X9
 9AHeu7bI3ENZjtTDRQdbXhpxcu6qXwz9/cRBRlf6oZIw0cdgQweKl+EkjwNl9BLGfVmXJu9dVoR
 qnV9Ayf5907taZvo+kCavZHoeo8IQyFKDqKra97uoe1gJLfl0GyeWvrbc7viVGregzVUJPq+2Ly
 aMgCfLf4vRu4Q4zt665Xk6XlPKplHLYklvXMaA+YfzlnB5MU3ybMsi/xBrGiYR/u5SR/l7AYllS
 usO1nxSUmvEch6DSRH5PyVJ4Z59HqtztA/mXAR9KveoiGuE/z3MARTMV1VXTN0mDJhMIeJG61cI
 Fjd5bv9CwPhv/oCrOIg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDAwNyBTYWx0ZWRfX3UgdaN5k3vSc
 yFiy52KKiwles/5daDB4kk+7ch4v5fHirxz86VfPM2ooh3ITahYCxJnIol9UwTkW0ZagSxtvkiu
 ysJ5dTR0SOty8rm9qI1340GoJIgturY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_07,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607240007
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Jul 2026 01:08:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128422

From: Khem Raj <khem.raj@oss.qualcomm.com>

csysdig fails to link when stock Lua is also present in the sysroot:

  ld.lld: error: undefined symbol: luaL_openselectedlibs
  >>> referenced by chisel.cpp:1190
  ld.lld: error: undefined symbol: lua_pcallk
  ld.lld: error: undefined symbol: lua_setglobal

sysdig's chisel code does #include "lua.h" and links against LuaJIT
(lua${JIT}), but the recipe-sysroot also carries stock Lua headers
(openembedded-core lua installs lua.h into ${includedir}). Those headers
win the include search over ${includedir}/luajit-2.1, so the chisel
objects are compiled against stock Lua while the binary links
libluajit-5.1.so. In Lua >= 5.4.4 luaL_openlibs is a macro for
luaL_openselectedlibs and lua_setglobal/lua_pcallk are real symbols,
none of which LuaJIT (a Lua 5.1 ABI) provides, hence the undefined
references. -DLUA_INCLUDE_DIR does not help: sysdig's luajit.cmake only
consults it in its stock-Lua fallback, not when it finds LuaJIT.

Prepend ${STAGING_INCDIR}/luajit-2.1 to CFLAGS/CXXFLAGS. These land in
CMAKE_CXX_FLAGS, which precede CMake's generated -I includes, so LuaJIT's
lua.h is found first and matches the linked library.

Co-Authored-By: Claude Opus 4.8 (1M context) <noreply@anthropic.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 00e7a9118097cbcf4677cbcfebb772357623f4cd)
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
---
 meta-oe/recipes-extended/sysdig/sysdig_0.39.0.bb | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-extended/sysdig/sysdig_0.39.0.bb b/meta-oe/recipes-extended/sysdig/sysdig_0.39.0.bb
index 6d754b9bd0..bea66ad17c 100644
--- a/meta-oe/recipes-extended/sysdig/sysdig_0.39.0.bb
+++ b/meta-oe/recipes-extended/sysdig/sysdig_0.39.0.bb
@@ -62,9 +62,18 @@ EXTRA_OECMAKE = "\
                 -DCREATE_TEST_TARGETS=OFF \
 "
 
+# sysdig's chisel code does #include "lua.h". The recipe-sysroot also carries
+# stock Lua headers (openembedded-core lua installs lua.h into ${includedir}),
+# which are ABI-incompatible with the LuaJIT library sysdig links against: in
+# Lua >= 5.4.4 luaL_openlibs is a macro for luaL_openselectedlibs and
+# lua_setglobal/lua_pcallk are real symbols, none of which LuaJIT provides.
+# sysdig's luajit.cmake only honours LUA_INCLUDE_DIR in its stock-Lua fallback,
+# not when it finds LuaJIT, and the LuaJIT include dir does not win the search
+# order, so lua.h resolves to the stock header and the link fails. Put the
+# LuaJIT include dir first so its lua.h is used and matches the linked library.
 #Add include dir to find driver_config.h
-CXXFLAGS:append = " -I${WORKDIR}/driver_Make/driver/src"
-CFLAGS:append = " -I${WORKDIR}/driver_Make/driver/src"
+CXXFLAGS:append = " -I${STAGING_INCDIR}/luajit-2.1 -I${WORKDIR}/driver_Make/driver/src"
+CFLAGS:append = " -I${STAGING_INCDIR}/luajit-2.1 -I${WORKDIR}/driver_Make/driver/src"
 
 #To fix do_package QA Issue
 do_compile:append() {
-- 
2.54.0


