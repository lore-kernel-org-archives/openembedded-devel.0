Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94EA8C5CFC1
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 06:23:06 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4366.1786671241835485314
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2026 18:34:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=EFjumTpV;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=NkHjsnrA;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: hangtian.zhu@oss.qualcomm.com)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67DLX2xq3576662
	for <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 01:07:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=c2/lr+OVyC30Q7y1PaS03Qj+UbYIQ/PD6rl
	OdrNb3Vc=; b=EFjumTpVe0ErRL20cLlLeVNzJ6Z3k2Bz17mUK5pYzVuYOQagTRL
	H1nRl96RGLQ9b840cYaio23I7b3vL6O6jzIo4uUEZrleHPPdTtPJuhkAdoBPyRCf
	QnUSvlgwQeKykTlFvtIYHodkilMMslCIs6XFpSJLc04jhwjnDdZ5l+Z2nsh9biLX
	4vROdtoM1XTnfdbvSH2chKUhXH3oCwmyy9Nvsz+25VZodpjN8VIsQbqx0W69YLxm
	K1QTnz2ZAO39t0Mnhrd30Svz/cs0rwLHmMNfhOfD4WOqpuUN0RWqN4FDSm3ya6dC
	nBnnxV7o4mYZWtgM6h3FtKbTMEO+94T3ncw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1cb5kcx9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 01:07:24 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8484f26852dso404520b3a.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 18:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786669643; x=1787274443; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=c2/lr+OVyC30Q7y1PaS03Qj+UbYIQ/PD6rlOdrNb3Vc=;
        b=NkHjsnrAOHw/YCf6Knso6EcsDAEz5crOgRRUMWfvX55dPMrsEBm4NO7qNblSJndaKv
         2HLVBe86+IwUblE7FnoGDF3D8C8x4oqbbTT5/xyMihWZwbisGo27Zy6DoKqPXf9PaBC0
         pKqOgE4bbtfFlAH1Bp/LddrRsRSa8vJyzB15eQLrhQP456xt0ZtqzTAyQUgOvH9YE0ut
         zG5InHJCZy3B9Ff3hKukG7UXXBn0rKM7+2vfod2SKM7bb28dimGGJAQitmEcXAzPDQDJ
         xtSgMlk+NbJGF/1kmad8vI25eh0jxBNdXiW7nF2n4v1Dzc6xFLfmvDTKIkB0Lr6OS8WC
         2xlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786669643; x=1787274443;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c2/lr+OVyC30Q7y1PaS03Qj+UbYIQ/PD6rlOdrNb3Vc=;
        b=sRbSRA4wtwT6dQaeYRsgqDxJZ7Ks5p8o9VuSfRI7303fE6hiGcCJCPOevs05I14MJB
         +QEm3OsSp7dgB9gi+5SvB+4U0wFIZGMZpA/m+zTw3RNXvh/20zW3b8n/nVXYEA6nI6Jv
         BWjNwV1Crkptauc+5ehgFc2cGYvKc1LbM/di15YbNzG0WvOxAbT/Zu+AL6RZucOcHctr
         csNcINhnStOKG4nqjIg/SX+YbTT8pK8kO6EnplkeyrrAJCRrJgIpUihPy1ozOjB+U5UO
         oSbCqSxjTeNPVwWf2xf1JzBpHhCnDopP3D5FaBSLqxRCNz/mOzMeHHw9DMiaK11b3MN1
         87oQ==
X-Gm-Message-State: AOJu0YyNjBICDvN+gz15cI88+hTgV+uh6JeHQwguzPCKqFIwij5qsII2
	IrWf4BMJFsyZpzLfSKpWRaruwd9h5jgJujhWAvI5iBxyMFZ9uqwLg2Y6epzSQxmC3wQ6alW2bMe
	3EeqeE7oIZnnrIqJocUZ5RqYFQz/OtAXQzqNIQlS7DVWnlvgJlhrW8fI2V3P1vW1GcvtpGHi4/h
	L2qSSMim+t+wsF5hne
X-Gm-Gg: AR+sD13GI/BA8/+Go+aKNfB+q5cZT0i9OU10Ma1SuGjN1m/iO/54jd9czGRcYBdmhLf
	M9Pg5wfso0/m4HFz1jd6c8szuSfMjIrZ7geodMZL9ISaxOJldcLAD+2NuU5hTKfW5FLCuMzKE9C
	cjMS4+CCXUjM85W6xlYbUYRyDkZb8sPtMpJm3CkGrY5y1sR9S+9r8V56ENDGDd3M6+T/YPmfOun
	+s7WjCSrhVNLqhiNGDHxffCDA3NK2qxfq6oZs2mwM31aY0j785H5lXXxvFqWyNKDBPmGgscvSd8
	0JdOuC2O/SOCFmpk+w2qCxr0ibXGDIrUtPJQgYypKf2x/ha9fjvYLv/GunN1rrqW0eI/V9pe7iL
	gTvvSZwYzLsxafrUb1z8Fv1InkT7yzZ7KMr668vd8KiYMp5hH6on7nQNmzUXrcgUG
X-Received: by 2002:a05:6a00:4c1a:b0:848:6447:e0a6 with SMTP id d2e1a72fcca58-84fde00137dmr2084803b3a.9.1786669643268;
        Thu, 13 Aug 2026 18:07:23 -0700 (PDT)
X-Received: by 2002:a05:6a00:4c1a:b0:848:6447:e0a6 with SMTP id d2e1a72fcca58-84fde00137dmr2084728b3a.9.1786669642423;
        Thu, 13 Aug 2026 18:07:22 -0700 (PDT)
Received: from hangtian-z2-2004.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbef7217132sm1680253a12.23.2026.08.13.18.07.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 18:07:21 -0700 (PDT)
From: Hangtian Zhu <hangtian.zhu@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: qli_sdc_iot_wlan_host_oss.external@qti.qualcomm.com
Subject: [PATCH] hostapd: upgrade 2.11 to 2.12
Date: Fri, 14 Aug 2026 09:07:18 +0800
Message-Id: <20260814010718.286760-1-hangtian.zhu@oss.qualcomm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: rqdlHWWBlq74jSUPqbg_IOlLOPno7Al9
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDAwNiBTYWx0ZWRfX3uBxOCYJFsL7
 600sXLoiD4TWXYprQxudCDwwwiCOPN+GVl8HnjPwQEUnVBow+adDQB7Eu6r/806dmojw1abjRNd
 opzpW6ctxzMID6hHti4qpurcbudg3s8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDAwNiBTYWx0ZWRfXwuwc++wvk5+Y
 uZxVshFd+TYkn3ohiOae8hmeetF1f+1fAZ7LpHrFAmFWU+DIcKFzRN0j1+rtWIBlb7BWWyxQOMD
 PeVBCzDZ7+/vk+/SAqfm99s6gywyCzWDL0ojAVVdtV7Z28qAp9kQvqfREpqtOu4fBNlQEXHCZut
 4gKQQaFdoPU8v9/VZhgHLPLYQWnXx88OYSf9G247qaWGiyspc67Muu/PyOQOLGxT60DEDIK24LF
 bFRDiTfpmZHokeuKvZ45QHbiefiI5NQuPu/NkJWfSwY+mhCoNkSF8m2r2OcJM8ve2/qt207usKv
 5GYk6fl1/dT/2ylWNvWXwPVpWRd7WlMdHXLTri1VK/ODuNPIkERGScEqo2JSciBFMo7mZuE2d3n
 URIiXA0I2ZuVCUnJVRIzXn2dXcc4kRq5xJ5dhOfB9UGXY5amEvCDx7uxRaS5/RtJJTSVZQexXnV
 SAYJobGJ4jBsRxm5Yww==
X-Authority-Analysis: v=2.4 cv=GoNyPE1C c=1 sm=1 tr=0 ts=6a7e6a4c cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=yaAG3qJ-AAAA:8
 a=EUspDBNiAAAA:8 a=3-RhneuVAAAA:8 a=COk6AnOGAAAA:8 a=a_U1oVfrAAAA:8
 a=g9gh2NdiATZAZWeT5MIA:9 a=IoOABgeZipijB_acs4fv:22 a=oLVlbjkABFOu4cUI0CGI:22
 a=VLVLkjT_5ZicWzSuYqSo:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: rqdlHWWBlq74jSUPqbg_IOlLOPno7Al9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-13_07,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0
 impostorscore=0 phishscore=0 suspectscore=0 clxscore=1011 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608140006
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 06:23:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129040

Rename the recipe to 2.12 and update the upstream source checksum.
Refresh LIC_FILES_CHKSUM for README changes in the new release.

Drop local backports no longer needed with 2.12: CONFIG_SAE_PK
base64 build fix, color switch settings initialization, and
CVE-2025-24912 RADIUS fixes.

Signed-off-by: Hangtian Zhu <hangtian.zhu@oss.qualcomm.com>
---
 ...e64-for-hostapd-CONFIG_SAE_PK-builds.patch | 40 ----------
 ...learing-up-settings-for-color-switch.patch | 34 --------
 .../hostapd/hostapd/CVE-2025-24912-01.patch   | 79 -------------------
 .../hostapd/hostapd/CVE-2025-24912-02.patch   | 70 ----------------
 .../{hostapd_2.11.bb => hostapd_2.12.bb}      |  8 +-
 5 files changed, 2 insertions(+), 229 deletions(-)
 delete mode 100644 meta-oe/recipes-connectivity/hostapd/hostapd/0001-Include-base64-for-hostapd-CONFIG_SAE_PK-builds.patch
 delete mode 100644 meta-oe/recipes-connectivity/hostapd/hostapd/0002-hostapd-Fix-clearing-up-settings-for-color-switch.patch
 delete mode 100644 meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2025-24912-01.patch
 delete mode 100644 meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2025-24912-02.patch
 rename meta-oe/recipes-connectivity/hostapd/{hostapd_2.11.bb => hostapd_2.12.bb} (80%)

diff --git a/meta-oe/recipes-connectivity/hostapd/hostapd/0001-Include-base64-for-hostapd-CONFIG_SAE_PK-builds.patch b/meta-oe/recipes-connectivity/hostapd/hostapd/0001-Include-base64-for-hostapd-CONFIG_SAE_PK-builds.patch
deleted file mode 100644
index e790e8e0f2..0000000000
--- a/meta-oe/recipes-connectivity/hostapd/hostapd/0001-Include-base64-for-hostapd-CONFIG_SAE_PK-builds.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 430bc89b9a29537d9d22bb42406f3d14072a01d4 Mon Sep 17 00:00:00 2001
-From: Jouni Malinen <j@w1.fi>
-Date: Sun, 22 Dec 2024 18:53:12 +0200
-Subject: [PATCH] Include base64 for hostapd CONFIG_SAE_PK builds
-
-CONFIG_SAE_PK=y needs base64 functionality, so set NEED_BASE64
-automatically for it.
-
-Signed-off-by: Jouni Malinen <j@w1.fi>
-Upstream-Status: Backport [https://git.w1.fi/cgit/hostap/commit/?id=430bc89b9a29537d9d22bb42406f3d14072a01d4]
-Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
----
- hostapd/Android.mk | 1 +
- hostapd/Makefile   | 1 +
- 2 files changed, 2 insertions(+)
-
-diff --git a/hostapd/Android.mk b/hostapd/Android.mk
-index e6c2fbf18..6e0d77d28 100644
---- a/hostapd/Android.mk
-+++ b/hostapd/Android.mk
-@@ -260,6 +260,7 @@ OBJS += src/common/sae.c
- ifdef CONFIG_SAE_PK
- L_CFLAGS += -DCONFIG_SAE_PK
- NEED_AES_SIV=y
-+NEED_BASE64=y
- OBJS += src/common/sae_pk.c
- endif
- NEED_ECC=y
-diff --git a/hostapd/Makefile b/hostapd/Makefile
-index fa0d366a8..c3419c10e 100644
---- a/hostapd/Makefile
-+++ b/hostapd/Makefile
-@@ -299,6 +299,7 @@ OBJS += ../src/common/sae.o
- ifdef CONFIG_SAE_PK
- CFLAGS += -DCONFIG_SAE_PK
- NEED_AES_SIV=y
-+NEED_BASE64=y
- OBJS += ../src/common/sae_pk.o
- endif
- NEED_ECC=y
diff --git a/meta-oe/recipes-connectivity/hostapd/hostapd/0002-hostapd-Fix-clearing-up-settings-for-color-switch.patch b/meta-oe/recipes-connectivity/hostapd/hostapd/0002-hostapd-Fix-clearing-up-settings-for-color-switch.patch
deleted file mode 100644
index 5d6cce3f14..0000000000
--- a/meta-oe/recipes-connectivity/hostapd/hostapd/0002-hostapd-Fix-clearing-up-settings-for-color-switch.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 161327f91d956771996c96ea1b6e4e1cb8dc074c Mon Sep 17 00:00:00 2001
-From: Stone Zhang <quic_stonez@quicinc.com>
-Date: Mon, 14 Oct 2024 18:47:32 +0800
-Subject: [PATCH] hostapd: Fix clearing up settings for color switch
-
-Settings for color switch (struct cca_settings settings)
-is used without zero clearing, which causes the member
-settings->ubpr->unsol_bcast_probe_resp_intervalettings
-to be a random value. It is againsts the NLA policy of
-NL80211_UNSOL_BCAST_PROBE_RESP_ATTR_INT and causes
-BSS color switch failure.
-
-Fixes: 654d2395dddf ("BSS coloring: Handling of collision events and triggering CCA")
-Signed-off-by: Stone Zhang <quic_stonez@quicinc.com>
-Upstream-Status: Backport [https://w1.fi/cgit/hostap.git/commit/?id=161327f91d956771996c96ea1b6e4e1cb8dc074c]
----
- src/ap/hostapd.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/ap/hostapd.c b/src/ap/hostapd.c
-index 5ba2cab2c..90e93b6dc 100644
---- a/src/ap/hostapd.c
-+++ b/src/ap/hostapd.c
-@@ -4768,6 +4768,7 @@ static void hostapd_switch_color_timeout_handler(void *eloop_data,
- 		struct cca_settings settings;
- 		int ret;
- 
-+		os_memset(&settings, 0, sizeof(settings));
- 		hostapd_cleanup_cca_params(bss);
- 		bss->cca_color = r;
- 		bss->cca_count = 10;
--- 
-2.45.2
-
diff --git a/meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2025-24912-01.patch b/meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2025-24912-01.patch
deleted file mode 100644
index 36660b5880..0000000000
--- a/meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2025-24912-01.patch
+++ /dev/null
@@ -1,79 +0,0 @@
-From 726432d7622cc0088ac353d073b59628b590ea44 Mon Sep 17 00:00:00 2001
-From: Jouni Malinen <j@w1.fi>
-Date: Sat, 25 Jan 2025 11:21:16 +0200
-Subject: [PATCH] RADIUS: Drop pending request only when accepting the response
-
-The case of an invalid authenticator in a RADIUS response could imply
-that the response is not from the correct RADIUS server and as such,
-such a response should be discarded without changing internal state for
-the pending request. The case of an unknown response (RADIUS_RX_UNKNOWN)
-is somewhat more complex since it could have been indicated before
-validating the authenticator. In any case, it seems better to change the
-state for the pending request only when we have fully accepted the
-response.
-
-Allowing the internal state of pending RADIUS request to change based on
-responses that are not fully validation could have allow at least a
-theoretical DoS attack if an attacker were to have means for injecting
-RADIUS messages to the network using the IP address of the real RADIUS
-server and being able to do so more quickly than the real server and
-with the matching identifier from the request header (i.e., either by
-flooding 256 responses quickly or by having means to capture the RADIUS
-request). These should not really be realistic options in a properly
-protected deployment, but nevertheless it is good to be more careful in
-processing RADIUS responses.
-
-Remove a pending RADIUS request from the internal list only when having
-fully accepted a matching RADIUS response, i.e., after one of the
-registered handlers has confirmed that the authenticator is valid and
-processing of the response has succeeded.
-
-Signed-off-by: Jouni Malinen <j@w1.fi>
-
-CVE: CVE-2025-24912
-Upstream-Status: Backport [https://w1.fi/cgit/hostap/commit/?id=726432d7622cc0088ac353d073b59628b590ea44]
-Signed-off-by: Peter Marko <peter.marko@siemens.com>
----
- src/radius/radius_client.c | 15 +++++++--------
- 1 file changed, 7 insertions(+), 8 deletions(-)
-
-diff --git a/src/radius/radius_client.c b/src/radius/radius_client.c
-index 2a7f36170..7909b29a7 100644
---- a/src/radius/radius_client.c
-+++ b/src/radius/radius_client.c
-@@ -1259,13 +1259,6 @@ static void radius_client_receive(int sock, void *eloop_ctx, void *sock_ctx)
- 		       roundtrip / 100, roundtrip % 100);
- 	rconf->round_trip_time = roundtrip;
- 
--	/* Remove ACKed RADIUS packet from retransmit list */
--	if (prev_req)
--		prev_req->next = req->next;
--	else
--		radius->msgs = req->next;
--	radius->num_msgs--;
--
- 	for (i = 0; i < num_handlers; i++) {
- 		RadiusRxResult res;
- 		res = handlers[i].handler(msg, req->msg, req->shared_secret,
-@@ -1276,6 +1269,13 @@ static void radius_client_receive(int sock, void *eloop_ctx, void *sock_ctx)
- 			radius_msg_free(msg);
- 			/* fall through */
- 		case RADIUS_RX_QUEUED:
-+			/* Remove ACKed RADIUS packet from retransmit list */
-+			if (prev_req)
-+				prev_req->next = req->next;
-+			else
-+				radius->msgs = req->next;
-+			radius->num_msgs--;
-+
- 			radius_client_msg_free(req);
- 			return;
- 		case RADIUS_RX_INVALID_AUTHENTICATOR:
-@@ -1297,7 +1297,6 @@ static void radius_client_receive(int sock, void *eloop_ctx, void *sock_ctx)
- 		       msg_type, hdr->code, hdr->identifier,
- 		       invalid_authenticator ? " [INVALID AUTHENTICATOR]" :
- 		       "");
--	radius_client_msg_free(req);
- 
-  fail:
- 	radius_msg_free(msg);
diff --git a/meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2025-24912-02.patch b/meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2025-24912-02.patch
deleted file mode 100644
index add2e47048..0000000000
--- a/meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2025-24912-02.patch
+++ /dev/null
@@ -1,70 +0,0 @@
-From 339a334551ca911187cc870f4f97ef08e11db109 Mon Sep 17 00:00:00 2001
-From: Jouni Malinen <quic_jouni@quicinc.com>
-Date: Wed, 5 Feb 2025 19:23:39 +0200
-Subject: [PATCH] RADIUS: Fix pending request dropping
-
-A recent change to this moved the place where the processed RADIUS
-request was removed from the pending list to happen after the message
-handler had been called. This did not take into account possibility of
-the handler adding a new pending request in the list and the prev_req
-pointer not necessarily pointing to the correct entry anymore. As such,
-some of the pending requests could have been lost and that would result
-in not being able to process responses to those requests and also, to a
-memory leak.
-
-Fix this by determining prev_req at the point when the pending request
-is being removed, i.e., after the handler function has already added a
-new entry.
-
-Fixes: 726432d7622c ("RADIUS: Drop pending request only when accepting the response")
-Signed-off-by: Jouni Malinen <quic_jouni@quicinc.com>
-
-CVE: CVE-2025-24912
-Upstream-Status: Backport [https://w1.fi/cgit/hostap/commit/?id=339a334551ca911187cc870f4f97ef08e11db109]
-Signed-off-by: Peter Marko <peter.marko@siemens.com>
----
- src/radius/radius_client.c | 10 +++++++---
- 1 file changed, 7 insertions(+), 3 deletions(-)
-
-diff --git a/src/radius/radius_client.c b/src/radius/radius_client.c
-index 7909b29a7..d4faa7936 100644
---- a/src/radius/radius_client.c
-+++ b/src/radius/radius_client.c
-@@ -1099,7 +1099,7 @@ static void radius_client_receive(int sock, void *eloop_ctx, void *sock_ctx)
- 	struct radius_hdr *hdr;
- 	struct radius_rx_handler *handlers;
- 	size_t num_handlers, i;
--	struct radius_msg_list *req, *prev_req;
-+	struct radius_msg_list *req, *prev_req, *r;
- 	struct os_reltime now;
- 	struct hostapd_radius_server *rconf;
- 	int invalid_authenticator = 0;
-@@ -1224,7 +1224,6 @@ static void radius_client_receive(int sock, void *eloop_ctx, void *sock_ctx)
- 		break;
- 	}
- 
--	prev_req = NULL;
- 	req = radius->msgs;
- 	while (req) {
- 		/* TODO: also match by src addr:port of the packet when using
-@@ -1236,7 +1235,6 @@ static void radius_client_receive(int sock, void *eloop_ctx, void *sock_ctx)
- 		    hdr->identifier)
- 			break;
- 
--		prev_req = req;
- 		req = req->next;
- 	}
- 
-@@ -1270,6 +1268,12 @@ static void radius_client_receive(int sock, void *eloop_ctx, void *sock_ctx)
- 			/* fall through */
- 		case RADIUS_RX_QUEUED:
- 			/* Remove ACKed RADIUS packet from retransmit list */
-+			prev_req = NULL;
-+			for (r = radius->msgs; r; r = r->next) {
-+				if (r == req)
-+					break;
-+				prev_req = r;
-+			}
- 			if (prev_req)
- 				prev_req->next = req->next;
- 			else
diff --git a/meta-oe/recipes-connectivity/hostapd/hostapd_2.11.bb b/meta-oe/recipes-connectivity/hostapd/hostapd_2.12.bb
similarity index 80%
rename from meta-oe/recipes-connectivity/hostapd/hostapd_2.11.bb
rename to meta-oe/recipes-connectivity/hostapd/hostapd_2.12.bb
index ce1c145fd7..7673ce0d38 100644
--- a/meta-oe/recipes-connectivity/hostapd/hostapd_2.11.bb
+++ b/meta-oe/recipes-connectivity/hostapd/hostapd_2.12.bb
@@ -2,23 +2,19 @@ SUMMARY = "User space daemon for extended IEEE 802.11 management"
 HOMEPAGE = "http://w1.fi/hostapd/"
 SECTION = "kernel/userland"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://hostapd/README;beginline=5;endline=47;md5=8e2c69e491b28390f9de0df1f64ebd6d"
+LIC_FILES_CHKSUM = "file://hostapd/README;beginline=5;endline=47;md5=4d666937756a064d6d90d128a32c3571"
 
 DEPENDS = "libnl openssl"
 
 SRC_URI = " \
     http://w1.fi/releases/hostapd-${PV}.tar.gz \
-    file://0001-Include-base64-for-hostapd-CONFIG_SAE_PK-builds.patch \
-    file://0002-hostapd-Fix-clearing-up-settings-for-color-switch.patch \
     file://defconfig \
     file://init \
     file://hostapd.service \
-    file://CVE-2025-24912-01.patch \
-    file://CVE-2025-24912-02.patch \
 "
 
 
-SRC_URI[sha256sum] = "2b3facb632fd4f65e32f4bf82a76b4b72c501f995a4f62e330219fe7aed1747a"
+SRC_URI[sha256sum] = "f43502561c28ba47ab77e18e1a973d07361c68cc8b14178e619bd5796b70eabd"
 
 inherit update-rc.d systemd pkgconfig features_check
 

base-commit: ea7c7c4f2e21a0aadb53d1691de6d5a85dc11a8e
-- 
2.25.1


