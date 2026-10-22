Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20966.1792668915882908691
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Oct 2026 04:35:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=UpVL/iG/;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=jbXqA26M;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: jose.quaresma@oss.qualcomm.com)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M9xl6E2573548
	for <openembedded-devel@lists.openembedded.org>; Thu, 22 Oct 2026 11:35:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=JMhjaR40U/Tmz8aTcTQVEJG4rf/v84CCXjm
	Umw8+czE=; b=UpVL/iG/WH21hZUpJnKLs+5ldFBIV26ddivXUvrGKCFOb7KTU+l
	qH2TjRan47QvYEAMSkZFd3aJpBuxZ1tpoXNdEO/kDckj0+gvtjpKcUMk50mc+DhH
	p0KuoQW9AUMOEG5Gx5sy1O0xRIz0Hdu8lktQOE+3IerG7dryzvvtCYwwHI7kz75g
	TXk8TG5AXTcpjm113EZ/dxcW1WDIU/xE+rTT6cvkYjiip9vdq+h1AUyBBAUdSBtS
	fo/mw97X4df2kPDnK+ElkhY2lYPxBwkD9Umgob/bSRtsaFxidhLiBKmD1gKlIUYO
	qu93cOZdFtyu7/G6Lly3Ay+IPCrL8HPeSmg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93ajshd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 22 Oct 2026 11:35:15 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f3969a2a7so286405485a.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 22 Oct 2026 04:35:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792668914; x=1793273714; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JMhjaR40U/Tmz8aTcTQVEJG4rf/v84CCXjmUmw8+czE=;
        b=jbXqA26M6p9goRwf6B15D2uIcWcpi5qYueworgXNCUBiWZKO0+4m6BxpKpD9rWw9MA
         8W0ewbzvfYzd1TGWwSAMw7F40G711aa/jPnHHIemFs4C5HTADIABjI3oAhxmpMjwpBU7
         PB+iGxJygYHKrjNDk9qbePpgR5v2HQN4v/chlIVpniWQ6D0XNI6cDfmGgg9Qk05ntZ1r
         zXLJsN3OqPCDuAgt9pQyL9AjUZNOyQm305crTZO2FOQGSNVtdAWg+amlOZ4qRsKp/Lx8
         kWvMmYN+kyPxAOWVerKlfgUIzK/UduYV7mLt5TTlACFaNXXvARF66TIWWmkwLRVavLPE
         yY2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792668914; x=1793273714;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JMhjaR40U/Tmz8aTcTQVEJG4rf/v84CCXjmUmw8+czE=;
        b=g/x5c+f/J7AKExVdjLyi4DJrKgxVYnIFsZLBZ5mdGur8rnt+gz+ykh8F71qgDmQPe4
         aPThcPo1iw31FPisQX+wKK+ks0TSSLfctTsowSdYTB5OXr4C9bi2/u5h0aUu4Mq+r78I
         rj+5rfzxz9eC45XjbwgDXgo3VYwKjWBCkMfuM2skyUJTpuqyp4b9W/lHf9R+QC9uhzJv
         y/ze2BMkFZXgXgM+6jiSD+F0zLEQoGx8EERJwDuZdaYPjcnnUqAWD8PU1ZIxcBUzoyWD
         CJIR4pd1v//SyP5/+QT4eRL9I3un0w9FrV+lIlSO+3mRoR1pnRz1c/D/D4Fo/MWVlV8K
         Pdbg==
X-Gm-Message-State: AFq9FYLiKq6D6ur+OVNtbDavQt/gVoLoRR2ZYjO1PfTRVziyK8QyMYtA
	D9KkMEnurEOeN5YByyxEdyIqmsTYbJTvXJeqOVM3C8+qswI55rnzlZa8m9Mk45FrDZlYOM3oipu
	qPFVGBQZgK/dHVA2g2xvi83cMVvr8/9GvpYn7d7H8mbd0j+OrxLyefiGJT+6h3EIdVN8bW9hl/q
	jjhyvCEas7HelLAWO4
X-Gm-Gg: AYBFou2k3oEzOdEkAC/5r+JKMADKP2bJqxBwnceTWadrq6VdTX9xPxi32Oer5QDKPGw
	t5y5XfCUi44uJPaiqrFhjehAjY/Q3WMJ9stV7Mv+rV9+dEJYTTWe8ZmSJMmuLQ81BnZuMY/cKh8
	GJsoPOoYdVV6tiS13GzTmncNL+LESmgEFXjePeChPD65hbh8FgvJv49+g2jA67O7xc2GXaepod6
	WsVBMm9N2O/W5y+VjwmJafhYUF8xZOdgmk5521JronKkLTVtyc1whyoKzvCzZ6sb474fTnVYjJA
	lhXlt3QVG2BHnDEgG6JcdwwfdoMDsb19pscaUEsbXj8+VpS8yazjm43/1L5vQv/Wwdf6reun2F3
	Y8uVttm7FDygQaA==
X-Received: by 2002:a05:620a:258b:b0:93f:e52:40ec with SMTP id af79cd13be357-93f57f7a4f3mr817119685a.81.1792668914064;
        Thu, 22 Oct 2026 04:35:14 -0700 (PDT)
X-Received: by 2002:a05:620a:258b:b0:93f:e52:40ec with SMTP id af79cd13be357-93f57f7a4f3mr817115585a.81.1792668913562;
        Thu, 22 Oct 2026 04:35:13 -0700 (PDT)
Received: from toster.lan ([185.228.162.222])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2581fa7fsm11121152f8f.17.2026.10.22.04.35.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 04:35:12 -0700 (PDT)
From: Jose Quaresma <jose.quaresma@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: anuj.mittal@oss.qualcomm.com, Markus Volk <f_l_k@t-online.de>,
        Khem Raj <khem.raj@oss.qualcomm.com>,
        Jose Quaresma <jose.quaresma@oss.qualcomm.com>
Subject: [meta-oe][wrynose][PATCH] fwupd: create the fwupd-refresh user
Date: Thu, 22 Oct 2026 12:35:02 +0100
Message-ID: <20261022113502.1446749-1-jose.quaresma@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: iv18o-WxMTStvsHhTUXj5fUbzTgRlMSk
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA0NiBTYWx0ZWRfX7ZVwj+hjguUS
 Cfcz6JuiKJAgZ+tC10k0ckIiLeh+Xu0XJwFm+HfRIuGUTXcSFgXOLtN6bDrk1w+MN4duizvAjCK
 sxo2INf9eK9quMAAzPtLdOFjzReYZiE=
X-Proofpoint-ORIG-GUID: iv18o-WxMTStvsHhTUXj5fUbzTgRlMSk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA0NiBTYWx0ZWRfXyJ4jMGl/50Po
 F4tW8ykAgupmlp5UyZVfE/x1cVSKTt/CpqkvDXafADPnZWn8FnuLEEOnt4nBOctbZsKoWERkkn2
 GMsqlHZjZi9MQ+lS9qsqudUYk5IxzeJt6bb63G3QSrNmWJ07iQnl1uqDsIbmh3MJ3CbXUS0lu2e
 lr1L5639ti6zr6J6zP8PJIHJPstVM3N4aHDqeyUgWxy6+Uw1ZUYFfqcOxM9ZYJC2x9oWTq0diI1
 Jwh4+JcZtaOniPFIWgnzI0clitZ0Dutp6io0io+upvM6IKXrxt8IYSZTtvf/aGM+3Ee7K28l0B0
 +ndZDywT8VBYLJRlCaGyoIdlxjjBovG7awmjurSH3DAFGbHx3QKsGokKC2XkqMlkwwoobWRjcmn
 DlMZ05NbnksMZhAMTeaPRg2JHWOT5aG27f13qngFfkymjUrVslCIegUlz02C0Uqg/wbGnH3NgNe
 0wiiiAIOoYsI2jG1oXA==
X-Authority-Analysis: v=2.4 cv=dOszC+Zb c=1 sm=1 tr=0 ts=6ad9f4f3 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=qOKIifoFPMYe9XV0Ag7/Dg==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=WsMKa497a1L9nkBoHCYA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 spamscore=0 adultscore=0 phishscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610220046
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 22 Oct 2026 11:35:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131311
Content-Type: text/plain; charset="utf-8"

From: Markus Volk <f_l_k@t-online.de>

fwupd-refresh.service runs as fwupd-refresh, which is only declared in
sysusers.d, so do_rootfs warns "User fwupd-refresh has never been
defined". Create it with useradd.

AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit c2c882778760df4d08c2035cb1d3397359f71461)
Signed-off-by: Jose Quaresma <jose.quaresma@oss.qualcomm.com>
---
 meta-oe/recipes-bsp/fwupd/fwupd_2.0.19.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-bsp/fwupd/fwupd_2.0.19.bb b/meta-oe/recipes-bsp/fwupd/fwupd_2.0.19.bb
index 586f7ad1f9..b7ca9b0794 100644
--- a/meta-oe/recipes-bsp/fwupd/fwupd_2.0.19.bb
+++ b/meta-oe/recipes-bsp/fwupd/fwupd_2.0.19.bb
@@ -27,7 +27,7 @@ UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
 # Machine-specific as we examine MACHINE_FEATURES to decide whether to build the UEFI plugins
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-inherit meson vala gobject-introspection systemd bash-completion pkgconfig gi-docgen ptest manpages
+inherit meson vala gobject-introspection systemd useradd bash-completion pkgconfig gi-docgen ptest manpages
 
 GIDOCGEN_MESON_OPTION = 'docs'
 GIDOCGEN_MESON_ENABLE_FLAG = 'enabled'
@@ -37,6 +37,9 @@ GIR_MESON_DISABLE_FLAG = 'disabled'
 
 EXTRA_OEMESON = "-Dvendor_ids_dir=${datadir}/hwdata"
 
+USERADD_PACKAGES = "${PN}"
+USERADD_PARAM:${PN} = "--system --no-create-home --user-group --home-dir ${localstatedir}/lib/fwupd --shell /sbin/nologin fwupd-refresh"
+
 PACKAGECONFIG ??= "\
     ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} \
     ${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \
-- 
2.56.0

