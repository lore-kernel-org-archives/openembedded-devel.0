Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33F58CD4F3D
	for <webhook@archiver.kernel.org>; Sun, 17 May 2026 08:24:09 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20198.1779006245674016803
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 May 2026 01:24:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=Udgqe85D;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=Nis5xxgH;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64H5R0VG2975188
	for <openembedded-devel@lists.openembedded.org>; Sun, 17 May 2026 08:24:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=dH5CvHeQfmC
	4OLQNGDHlEDNjAQs6to/iCZ9U0MMhMvM=; b=Udgqe85D+fR3e69XKSE/u+r22rl
	5r6ovlHRHziR7LfxkPTpMULp3spq5x+VuMGuTdSTWxWESu7fAu0eTkaLMOez3uh7
	5TuO7BhbmnbOpclAUo37BM4cA/qSuI3C2SoZRpxXiYsTBQ40Xj3hNWg78J82+Vns
	LpU2UMLgpjUzPzhW/zLKDb8bvhcEdT1yMonFOvzSr1raeXW9NPAJj2T+l7dqU7ms
	ZU4dUnjRRYJiTrrFd/PD2zxxaEFvk5hmmOfsNpn4SEVCjFwIxF2JmBG9OekECYtD
	ZdwIbVhqCvm9s8cUotcYqLtIB2v1gZmCYwrx3cXBHgzso+eTObwub2tpMKg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6tvchcay-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 17 May 2026 08:24:05 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-36629e48023so1012144a91.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 17 May 2026 01:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779006244; x=1779611044; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dH5CvHeQfmC4OLQNGDHlEDNjAQs6to/iCZ9U0MMhMvM=;
        b=Nis5xxgHUY9hLqUvwWVpI07EDUGq4hzOOH0hqdZFf95+UAKdRYC19ji4Kf3SYCQtH2
         mHpModNetA4Q3ClBnxgc9zqR0VDNcRUudauwx5lb86wn9nmjpQXgudEuv3TJ2Orm4zaF
         RA2vce9FfNhQbBJZT2PYexXKhPo2gXJSIQzh1o3r4b62a1w7JpZfGKbf4YvOflQVpJbw
         IRxLfoCeoGLcEq/A5CY04/kIVvlRE+ZANsQOxRu8BlEqr22CjNIkLpdOiXLng68z3NC7
         L2MV++CtoZNPjfMAISVDQtvxftLHBHzZUlVcBDrpcxgJ+EtUU42NEeoRJYCJn7O+weNP
         Vgtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779006244; x=1779611044;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dH5CvHeQfmC4OLQNGDHlEDNjAQs6to/iCZ9U0MMhMvM=;
        b=oOgBMUEEEeE7EVxiZrnSHqKtk/eXXhfKDSux9LaldcfKycbuL8sGazJu2rCWvHq0VG
         DdU4qpw73La2vFKoIm4U3lc02EWgp/p6kSj49fF2bTqELzfdETAizTEz3EbhPr+ylIJ2
         kyekTTZp/PbyeLzBR+y1qHwZgFyW+SD3rOFS/mcbSU9+4JwfuzgeXxp5MYNjcw1Fgn9J
         KejKLC4aialInhBqK9vjsfN0xUrxfToQZGWF6HyQt4FvoxzjesfrS6scSATh0J2j5RIR
         sojCMZeHRv7TULWJsa3EQwsmV2j95fx6ogYq8+oh7enkJNjNJHVdZbj66phBjdgZrgtT
         gwhg==
X-Gm-Message-State: AOJu0YyxaQwJz8t3j1DXYE4ebXB6RMlbWnwP99qL81cyGPtrfyzc25mr
	tP25Dni3wffbRXTloeRUpqA3vUwF8kDgua4rF4u4uxBqBYfVXOOLYgO61mrVvc360RrRYlI1kCd
	tglNEMheVX7BVH+7tGeT6YySj7HG7loZ+pyoGImIX0ZcZkYfMVXZ3wFDh1nXqh4MoqloY84fQJL
	EazjBHJnCiaBhbSCm7FACOdg==
X-Gm-Gg: Acq92OGQgbULmTyHCimAy3QolmxYmePOsF0m1nVpmdyNZgw2uE8cwvuByBsay2fmuGV
	kQ5UYjgBPV7X+ZknZHVObaqsvsqZj7uJa/8OLqEU6RieRf0xEiCEf5qoEtq+xAFpIY/mLqs6YYO
	wUQRnpxF18EuqaeFtsOrXTe86I+WACqYuMnhkUMn8FIgn2N8YuwYRB007JBoHuW6cjrdi3UHOTG
	59XKwWw+cJQ/zCgXXIIWEp8nbS3lUj7OIvkl9Xq7dm7pHiY086GyyYZB40YsBh6j6u3pZp0NHZr
	Egk/zrxsEFP7l6omaTHk4apzt2Gtv/vl6NvhZP8siHqy3kpbxFY6pZ5jyGTPc67i23SNmngVZ38
	4NczUVjuVC1euLcdUSZvtwZwVQzaU0y3vBvqBgUsfpFo3i9Lm5aYjBlOtwXb3EPY=
X-Received: by 2002:a17:90b:1b05:b0:366:132:fda3 with SMTP id 98e67ed59e1d1-369519c4b9cmr9542641a91.11.1779006244555;
        Sun, 17 May 2026 01:24:04 -0700 (PDT)
X-Received: by 2002:a17:90b:1b05:b0:366:132:fda3 with SMTP id 98e67ed59e1d1-369519c4b9cmr9542627a91.11.1779006243988;
        Sun, 17 May 2026 01:24:03 -0700 (PDT)
Received: from hu-anujmitt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36956f3723bsm2765033a91.1.2026.05.17.01.24.02
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 01:24:03 -0700 (PDT)
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [wrynose][meta-python][PATCH 03/29] python3-blivet: switch from setuptools3_legacy to python_setuptools_build_meta
Date: Sun, 17 May 2026 13:49:31 +0530
Message-ID: <5b67c1cc012275d7b4a5eac3b8094709f8bcc75c.1779004358.git.anuj.mittal@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1779004358.git.anuj.mittal@oss.qualcomm.com>
References: <cover.1779004358.git.anuj.mittal@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 8GoDmJTAhzGtilr-FDAiPWbIyzuBB4Ly
X-Authority-Analysis: v=2.4 cv=UIDt2ify c=1 sm=1 tr=0 ts=6a097b25 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=t7CeM3EgAAAA:8
 a=EUspDBNiAAAA:8 a=z3LoEqdEC6-UC3gmmHMA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 8GoDmJTAhzGtilr-FDAiPWbIyzuBB4Ly
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE3MDA4NyBTYWx0ZWRfXyx+L30F2AbmC
 WecubMux8XR09rIh388Dnwm1n1YIRFEISz38hBqvMTVoNvpmolAnc65EipmBc/TYYVbhCjcfBvI
 62EGa+YAetyaKYy5foC5uieAWrfed8jocAMCcI24FIIvDjf9CSwxNOhiUGNjiElSduYxDWo4I2W
 qARQm4WJt/A28dV7SXSIyQQQMivqqETTRzX7iuBsE2WfrttskjTcIct7XcPSpIJsy+j/SYVTrmn
 ocJVXZmGNkFp6q/GDsW0r5mleuG6BYhYzfip3I5r99//ytqYRGyGn3C3pVCI+oUlWaE0eOySESE
 0GCnH4v0mg3eYfLgbwbhEBV6p/qROS/zIwhC/MD/jg6LugR0UAeKAyUipPErP98L3oq3XV6c7k7
 yicp7P08ywUY49XgAqO8+uELWU0O3f/YrN14FbZSPOHCI2Mg2YnYufpizUwMtD78XMc9/2oyZ+m
 CSvEnYAGIXD1rx3oOew==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-17_02,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605170087
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 17 May 2026 08:24:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127016

From: Jiaying Song <jiaying.song.cn@windriver.com>

Upstream blivet 3.13.2 ships a pyproject.toml declaring
setuptools.build_meta as its PEP 517 build backend. Update the recipe to
use the correct build class to resolve the pep517-backend QA warning.

Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 17850288474672b6939204b16898e26389664bbb)
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
---
 .../recipes-extended/python-blivet/python3-blivet_3.13.2.bb     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-extended/python-blivet/python3-blivet_3.13.2.bb b/meta-python/recipes-extended/python-blivet/python3-blivet_3.13.2.bb
index a159979b73..69ec8c0487 100644
--- a/meta-python/recipes-extended/python-blivet/python3-blivet_3.13.2.bb
+++ b/meta-python/recipes-extended/python-blivet/python3-blivet_3.13.2.bb
@@ -17,7 +17,7 @@ SRC_URI += "\
 "
 SRC_URI[sha256sum] = "6d8374d05eeab513b2a26cf01267e853df7b31e13ad1a1ba7d73a856190d0518"
 
-inherit pypi features_check systemd setuptools3_legacy
+inherit pypi features_check systemd python_setuptools_build_meta
 
 REQUIRED_DISTRO_FEATURES = "systemd"
 
-- 
2.53.0


