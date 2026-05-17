Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC4CCCD4F4A
	for <webhook@archiver.kernel.org>; Sun, 17 May 2026 08:24:09 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20206.1779006248883536613
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 May 2026 01:24:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=LkjahTpJ;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=Omw89XP7;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64GJgpH31497050
	for <openembedded-devel@lists.openembedded.org>; Sun, 17 May 2026 08:24:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=hlpokovXzk1
	awuXfdVtIPmyvAJ7zgTB15Lz8JwkeqgA=; b=LkjahTpJHuiUv+Bo39rCmgNTlbk
	mDM/7+aCpLxa/Bc7xwVOv758RHA4OL7OjwGaeif8BioAHkRGREEdCY3j9lyrSMLi
	JS6DeaPhg7IHSlYrNADfio/qy+934PMg9dkZ7ViELGMyDQWx4GWmvUd69jVvEA1z
	LRJFhHJZw7/xm7GfFoQJu07j0S73McfdFb8crOOhHe/6hHPzLAb4znu5L8fQhEeJ
	v0XJ6rqYV+T6rmRtk61Vw4qSR8F/AidxKVi5BoEwqxuhxALbEiPrHoG2SoVpDHxZ
	yUk+48jc+hNsCv8FpIj/9PennZ7S4U+zrS2rN0OIvwWOvSuplN2RiNl5WOA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6gx6tf04-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 17 May 2026 08:24:08 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-367bb9caa54so993770a91.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 17 May 2026 01:24:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779006248; x=1779611048; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hlpokovXzk1awuXfdVtIPmyvAJ7zgTB15Lz8JwkeqgA=;
        b=Omw89XP7lsYh3I8xpCPFkxBJ1t5nMh3S4yWu+XqVL4gdxEoCgECNYLNzo0YTY6k5hg
         6ulRQIlZc7bhzZZGXazZBJzs0psfZICLfN3TXqfwD3mRe3lx4fCY1whQqyQr0yJAQwFf
         ihzyqI26AEORz3rsHRZB7ipO1VLZJNE1L5oU/xBi70fGzgid59IFnoVL+gzKQ7fVjLei
         Uszz+2qryk03cQONpKNrpTTSjhKZ4ArnX5bfYqcpCTnUtcCXF8Je2osUmnYEahBx6o2e
         p9lPIv7BLkE0eOXFYb/zGJHLnA/bL5jnA+K0Q2++ze3Q8CffuN2cNv8CgdgyMWhyDMWe
         0pdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779006248; x=1779611048;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hlpokovXzk1awuXfdVtIPmyvAJ7zgTB15Lz8JwkeqgA=;
        b=c9Wth/hDJ0Y2PWKBqx7Dvff0B+28ErlL6SwKWljkUrUIaP+ClJ+9eNEsy8OmlVOwWy
         LCv42evbPBbvg6OtuSU4/YFNjSKYY8A0yzBfkUrYGR8+iHt/R0ya1odsRhknWxMSyD1u
         Lv3f2VFhHlBSL444aCXx+Rwfrq5X3mfJcJlwyyIg9gYoFKh+eFXNy/DuAIBcXKEzn3Qp
         mMuQ4HEyUhlfyEKO3pqaYpgZCy4QgbPdr5qGhZ3YnjphD8WYGJSJjNeg8m1ovUtSjeDG
         yd0LWdU1R74TyDgxsnmDZ4PE7TDhpuK362O6TSht/f1lD5T44Pe8H8PJ+jQm0lVuCZYo
         Zk0w==
X-Gm-Message-State: AOJu0Yw2yVBglTuMpOfUsfiXUDmKSEE2KSulpFULkIvlfo6ndLT8bdSN
	0wn9btXi8Qe7xANnDTcpTMA4/Lte9/vxwSvZoxGi4419YTswGNC14jteNJ4xFgVpIHnvkYUelaP
	+A6beJ/Na/ukKF3DSR9N3uapNZqeNmePavJoauRkfPjX6L9joySOVp5C/8YIRlkfAqmCx/+/64o
	8qwN+lcMe1cNtRQ1ySfy6s6Q==
X-Gm-Gg: Acq92OEhDvyv+9iwxno6+yoo73kdcahltX2IHFFKbVsE1Hi65W5/cXZmFfhXboyCCfg
	cpibmy9uUdtJrE2GLKMCEpdzatZLdO+IGuxzbjqh40IL0ATQfKR59cgT3bGb/8O/HF6CODDGqu0
	ea+rO2G9byp6uFCxs5timQFNl0aZyBGdOHTLur4KpgUZdYm6d1JfuY4YOIsN+Jq/HcZ9qiNe8ik
	BN14qW7KZa7GPz/LISGlbRo9c9Un5JTqZMpc/Kj66msgYFGnSucEN4bJ/ADIoY5dhDClbCXP3TA
	wp2oFUJHJLfjJ169LEsoWe6AEJU0A8tgh5DCkn1sivsboyv6Ca7bbNStDkePjiZLso50gfb0mMs
	Ni/Xxu/isMw5tbQ4g+oNxUNaKZ77Xpw0anBgjtPjYpbTWIa3qoLq4
X-Received: by 2002:a17:90b:1cc8:b0:368:af5c:67f9 with SMTP id 98e67ed59e1d1-369519ff580mr10484206a91.8.1779006247698;
        Sun, 17 May 2026 01:24:07 -0700 (PDT)
X-Received: by 2002:a17:90b:1cc8:b0:368:af5c:67f9 with SMTP id 98e67ed59e1d1-369519ff580mr10484193a91.8.1779006247201;
        Sun, 17 May 2026 01:24:07 -0700 (PDT)
Received: from hu-anujmitt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36956f3723bsm2765033a91.1.2026.05.17.01.24.06
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 01:24:06 -0700 (PDT)
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [wrynose][meta-xfce][PATCH 05/29] xfdesktop: upgrade 4.20.1 -> 4.20.2
Date: Sun, 17 May 2026 13:49:33 +0530
Message-ID: <668890a1d0ca866c054a298a9cf83f029dad42b1.1779004358.git.anuj.mittal@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1779004358.git.anuj.mittal@oss.qualcomm.com>
References: <cover.1779004358.git.anuj.mittal@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: pESRqXtOYcszj6CeTkDqJxmfD4l6vXMd
X-Authority-Analysis: v=2.4 cv=f614wuyM c=1 sm=1 tr=0 ts=6a097b28 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=O24Aq5uEAAAA:8
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=wfv4uKtGBtG3YRDSJ8AA:9
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=SYBONWESK5muIIdMMRMZ:22
X-Proofpoint-GUID: pESRqXtOYcszj6CeTkDqJxmfD4l6vXMd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE3MDA4NyBTYWx0ZWRfXxqN/DYik2ES/
 j4BJDj2DkYGvhuP4G7xi/x4sECGzeT7EyGzKPY+9HePZWCzpKMhrHWmudnRHloPouFANZZv7vK3
 XDOST0xNoNTM5MkikMGkjvcCbcfk3KkwPYSEN/YTvQn5L3xUqcQBQkhjbLc4gybVecWY824vxFv
 pGxQfK1jC3l9607+tmksZF5jL49U3wkjnnfz7shYjItIOwgciHvMCd1u2WswpLf9U63Y6vj2UXU
 JIEN7e6VtUh780tba2YVHqmw1WldZ1NSghsDuNshf4apL3ERIB7f2+0FMbbxbPMAtuszwqtR/qu
 GlITl26I0wdTubO9lXcyq+OUKZbPzarSbVCwcy4eV2ZnWGvUEeO6FtU0tyqh/7O+6USXhoEHDos
 gv7DIWbSypd8ZDWelmnSjcHonbTqxNIhUY2ZvBaOCigN3k6nbm3YnhhaBXgFPJO+el7nc7ZzGzL
 hjlaZDEhwnJWyt8sQpQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-17_02,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 spamscore=0 suspectscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605170087
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 17 May 2026 08:24:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127018

From: Jason Schonberg <schonm@gmail.com>

Changelog: https://gitlab.xfce.org/xfce/xfdesktop/-/tags/xfdesktop-4.20.2

Signed-off-by: Jason Schonberg <schonm@gmail.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit ee2048e9dfd60d4ea747d832889ccdb6af427476)
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
---
 .../xfdesktop/{xfdesktop_4.20.1.bb => xfdesktop_4.20.2.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-xfce/xfdesktop/{xfdesktop_4.20.1.bb => xfdesktop_4.20.2.bb} (88%)

diff --git a/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.20.1.bb b/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.20.2.bb
similarity index 88%
rename from meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.20.1.bb
rename to meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.20.2.bb
index 5cd0213951..996330cc45 100644
--- a/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.20.1.bb
+++ b/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.20.2.bb
@@ -24,7 +24,7 @@ inherit xfce features_check
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[sha256sum] = "acccde849265bbf4093925ba847977b7abf70bb2977e4f78216570e887c157b8"
+SRC_URI[sha256sum] = "1d9bd76015fb6e9aca05e73cd998c7c66ed4fc8c10b626e08fc2eb7c39df3f7b"
 
 PACKAGECONFIG ??= "notify"
 PACKAGECONFIG[notify] = "-Dnotifications=enabled,-Dnotifications=disabled,libnotify"
-- 
2.53.0


