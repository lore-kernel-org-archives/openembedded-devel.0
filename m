Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.683.1794204040341829405
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Nov 2026 22:00:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=Ihfk+haD;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=R6ssrUwx;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A93K0Fp3253943
	for <openembedded-devel@lists.openembedded.org>; Mon, 9 Nov 2026 06:00:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=e+5hVxbctZs
	Y3t4AtPJowMXpXL+s+fbt9mIym1ZDhPk=; b=Ihfk+haDFLDA6MUlD2lmAzK1dxK
	stiND4FGjM+MP1S9QFw6ssCjur3G3Vg2RAgeTum+QSg3KgG6bEQzJUBMwMxe4eco
	mg+6WIetUkKsO3BGJSF+Is3pFImhp+mtyNwrr8bEyMupteSKcSUDKnaLywNJVekz
	6NG7G7S/ZAt+nGllYirCg2bBgzf4ENr/0KcF4b57NWLrvgZm5q1ufwC8ghW+W7CT
	uog0SICZnUgHN5caj6C2RCQThLl7VdcZX8Tupw1IKzGlfxyDfN5gnxbA2HrISnpg
	qTcC9iHLz4EjmB7Xfy1CtNtDW6+YhMF16u+6s2iqfq8uUqT0AFO9dSP6Hpw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hssbnwaj6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 09 Nov 2026 06:00:38 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-341eff9e381so1461775eec.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 08 Nov 2026 22:00:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794204038; x=1794808838; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=e+5hVxbctZsY3t4AtPJowMXpXL+s+fbt9mIym1ZDhPk=;
        b=R6ssrUwxn7PrDlcBohhRtN8eDo2H/0Za8/H1/YrNo534FF8BLwoKEfs/shJQI/qChI
         yhMquBJfK50r1X/mVKr4veIs4RMY9ILKC4zF6ufUNlvnN1RZsab/isvKVaSRIN+MB53P
         kNGkWlJDdJXcbPwn+DBoJsbd3WQiAx7XfrUbGafRz0r1VCA4SIEQNTVNMSDBZgB8MDWR
         lVKlm2DILGkNbu47tuLKn6bWqc4OauBX/70gbFjAasHjXWiANBPSALXBmj4Dy0/qXKJz
         fnrNPDtWQtYTiV2R6HYXcQtITM1Evg/Nb+anWXAqU11ILV9nQ9hSSIbdAIksmpUnBkPk
         XsoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794204038; x=1794808838;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=e+5hVxbctZsY3t4AtPJowMXpXL+s+fbt9mIym1ZDhPk=;
        b=viV5X6ZcIIFhpPuWE/INLI9jC+8EHUNlVpXHHMcrTBZnvDksdDm8Oq/E78yP9oyX6N
         MLa+w0396pjClveMo1uXkCVtr1gvhRwC4Ss0koCLEdrAPWySTuU6tt9gMuCrsr3IQjC1
         xGCBhpTbx/LZq1IDOYo8bC7btzOy8xscILv3Z/vZCzWCO6F9voKH5XJaDzEXUErOrG8n
         0bSVkFKq31mRE1yA3eW3UMiUdLYRL+orUAtmbqZlk3o+rn513zmyqkM9HsYl06H8RIwK
         sXcDLLvGcZFlhK+vIrDIKfMYPZOrok+ADFpCaOIgn5hHTXHW4Gq6mH1aJAnDwWx9pXML
         6CtA==
X-Gm-Message-State: APuU4Z9M+d5hcihiRW5VJxrVc+odrxj/E2uLs1hXHCIXeqd6KG+xUR6c
	R/IZPSxfh7MTo1PJ0SAKsygozokdbIulYpVtPXuPCTnQdH/w4giz0n/YL0notZF6IWCr5pklwRQ
	y+BczJznNv3VlLfYjaoHIoNxT+8J4dxtkyIDSoMa9nAYqZk2IbpZuXv6rP+rmlLBXacoywBC934
	jPuSNYh+Hh28Mf8v3V9Qi/xg==
X-Gm-Gg: AYBFou1mLiA9BXmmi5MegFUxMcrEGLK6vfsqt9ZXrgLZlqHupyCsxEBC+MRvo7YmJCU
	05isy2MqA+7OVf6p3PaWRSoQRwrhLq3qDri7wnybS7CffCsnbqhUhqOGP3GlPm5CTgq6/PnEt57
	BODHdT6lH95Y70yIFZOzu6C/4x6CLaZCpCqvw1Dujjkx2eyXsKJxqqYKdyXR12anyGx7E/2aSMe
	H1S0cyjSszTfvoL7Wkiqjl3ufJQwVwzVTZVtv2zDeLQJazcUi2j3Qi68FHBFJcRUgG1KXYNa2b8
	TRGAOTO97DglVxrzloj89Ma59jYmNTXegrI5pqIMDIpulIU9NQyb169+QIr+gqCQfGoRogfnKaH
	OakuaE0TKXORKpiK4EOj2ofyL8GZO5uJ5zQaqZQlPq5bm1B/lrD0xGvj8UwTh9Q9+av/piQHaeM
	XYVSM=
X-Received: by 2002:a05:7300:7f19:b0:35e:da0a:75b0 with SMTP id 5a478bee46e88-372570dad9bmr6581003eec.25.1794204037781;
        Sun, 08 Nov 2026 22:00:37 -0800 (PST)
X-Received: by 2002:a05:7300:7f19:b0:35e:da0a:75b0 with SMTP id 5a478bee46e88-372570dad9bmr6580960eec.25.1794204037173;
        Sun, 08 Nov 2026 22:00:37 -0800 (PST)
Received: from hu-anujmitt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37265ff17f5sm10819979eec.16.2026.11.08.22.00.36
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 22:00:36 -0800 (PST)
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [wrynose][meta-oe][PATCH 02/10] mpv: fix a file descriptor leak in the render API
Date: Mon,  9 Nov 2026 11:30:22 +0530
Message-ID: <20261109060030.621745-2-anuj.mittal@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261109060030.621745-1-anuj.mittal@oss.qualcomm.com>
References: <20261109060030.621745-1-anuj.mittal@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: dVDMGm7uyi2y9w3FacTy3yRO4pFXBwr3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAyMyBTYWx0ZWRfX74pI2P+jieJ4
 wK1QGwH46c+lb7DM7Ci0pZnIYDMtVkORTitBhHX/oX1ejSTA8xOlhoGYCtOeiffJ98eR93neVuy
 9bneu4m69/TwqSE+JJAVoPqr1R5Hajx+rVu0JqO3/4BU8cqByxt5G3KtiQRgDOfNA7c3bfzFVQJ
 tZVjepFITyt+zBrlb2c3S84dwQhaWhnnNhXxo3w2T4bc0rXz1EyeyWODutO4X2HrzN7hG7Rtzr2
 oGTgdX9kKpUxjFApnw/7skaOM58mByam8tdALtcE/mHhsb5uawj+MiHCILG6RfXfP77H1pxGnqW
 jwtLuI78Y39j7f+/l0JWZ3UElVddIee3Wf2EYsM+8lcBpbL+/iYXoWhODPV/TPTz/4dYLoaRATY
 qsdoQrbQDHGztrI3/IbRW6uhltAfevSz6DuZ0vyjhK3eHPxhQuWjc8KspjUBOresh0npNYPaNyq
 URl3jwkUGRTeXtrK+Vw==
X-Proofpoint-ORIG-GUID: dVDMGm7uyi2y9w3FacTy3yRO4pFXBwr3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAyMyBTYWx0ZWRfX6lGefsDEE+Ld
 Z4g6ppCHDiff136bGFVbB9Lk1bW5FwOQUmVa6EUVo7UySjKFko3SwuISVd2R/Wvaib5sdk+zYPF
 TiznKAOTkwocTasZ6ku693XdEyW3YUg=
X-Authority-Analysis: v=2.4 cv=JtBkP84C c=1 sm=1 tr=0 ts=6af16186 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=NEAV23lmAAAA:8
 a=EUspDBNiAAAA:8 a=uRyvaSCQm9GtCkgrkxsA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090023
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 09 Nov 2026 06:00:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132039
Content-Type: text/plain; charset="utf-8"

From: Markus Volk <f_l_k@t-online.de>

With the OpenGL render API (vo_libmpv) every frame left a fence behind
that nothing cleaned up. On v3d each one holds a sync file, so after about
a minute of video the process ran into the open file limit and the
picture stopped ("MESA: error: Export failed"). Backport the upstream
fix.

AI-Generated: Uses Claude Code (Claude Fable 5.1)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 2826f6233d450a7cb788a9e04f77f2cd55d951f0)
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
---
 ...equire-swap_buffers-param-for-FenceS.patch | 35 +++++++++++++++++++
 .../recipes-multimedia/mplayer/mpv_0.41.0.bb  |  5 ++-
 2 files changed, 39 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-multimedia/mplayer/mpv/0001-opengl-context-require-swap_buffers-param-for-FenceS.patch

diff --git a/meta-oe/recipes-multimedia/mplayer/mpv/0001-opengl-context-require-swap_buffers-param-for-FenceS.patch b/meta-oe/recipes-multimedia/mplayer/mpv/0001-opengl-context-require-swap_buffers-param-for-FenceS.patch
new file mode 100644
index 0000000000..70ba81b34c
--- /dev/null
+++ b/meta-oe/recipes-multimedia/mplayer/mpv/0001-opengl-context-require-swap_buffers-param-for-FenceS.patch
@@ -0,0 +1,35 @@
+From f74adc4243bd9e1a8ee96d187c939e6232510650 Mon Sep 17 00:00:00 2001
+From: Dudemanguy <random342@airmail.cc>
+Date: Thu, 22 Jan 2026 11:12:22 -0600
+Subject: [PATCH] opengl/context: require swap_buffers param for FenceSync
+
+Commits 8854c742711705be1fcfcc6a5875960a3e2593dc and
+5ae0e0ff9a6974453c1aba41ddc8442d12ac9264 eliminated the external
+swapchain API that the render backend (vo_libmpv) was previously using.
+However, it was missed that this was being used to skip the
+gl->FenceSync calls and that logic change was not properly accounted
+for. This meant that vo_libmpv would leak fences since
+ra_gl_ctx_swap_buffers is never called to clean them up.
+
+Fix this by making sure the ra_ctx_params have swap_buffers defined
+before calling gl->FenceSync. All platforms are required to implement
+this anyway with the exception of vo_libmpv since it's a funny special
+case. Fixes #17217.
+Upstream-Status: Backport [https://github.com/mpv-player/mpv/commit/f74adc4243bd9e1a8ee96d187c939e6232510650]
+---
+ video/out/opengl/context.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/video/out/opengl/context.c b/video/out/opengl/context.c
+index 86e8d5daac8b4..86e5c797d670a 100644
+--- a/video/out/opengl/context.c
++++ b/video/out/opengl/context.c
+@@ -232,7 +232,7 @@ bool ra_gl_ctx_submit_frame(struct ra_swapchain *sw, const struct vo_frame *fram
+     if (p->opts->use_glfinish)
+         gl->Finish();
+ 
+-    if (gl->FenceSync) {
++    if (gl->FenceSync && p->params.swap_buffers) {
+         GLsync fence = gl->FenceSync(GL_SYNC_GPU_COMMANDS_COMPLETE, 0);
+         if (fence)
+             MP_TARRAY_APPEND(p, p->vsync_fences, p->num_vsync_fences, fence);
diff --git a/meta-oe/recipes-multimedia/mplayer/mpv_0.41.0.bb b/meta-oe/recipes-multimedia/mplayer/mpv_0.41.0.bb
index d619152902..0d28f4e25f 100644
--- a/meta-oe/recipes-multimedia/mplayer/mpv_0.41.0.bb
+++ b/meta-oe/recipes-multimedia/mplayer/mpv_0.41.0.bb
@@ -23,7 +23,10 @@ LIC_FILES_CHKSUM = "file://LICENSE.GPL;md5=570a9b3749dd0463a1778803b12a6dce"
 LICENSE_FLAGS = "commercial"
 
 SRCREV = "41f6a645068483470267271e1d09966ca3b9f413"
-SRC_URI = "git://github.com/mpv-player/mpv;name=mpv;branch=release/${@oe.utils.trim_version('${PV}', 2)};protocol=https;tag=v${PV}"
+SRC_URI = " \
+    git://github.com/mpv-player/mpv;name=mpv;branch=release/${@oe.utils.trim_version('${PV}', 2)};protocol=https;tag=v${PV} \
+    file://0001-opengl-context-require-swap_buffers-param-for-FenceS.patch \
+"
 
 inherit meson pkgconfig mime-xdg
 
-- 
2.55.0

