Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24651CD4F25
	for <webhook@archiver.kernel.org>; Sun, 17 May 2026 08:24:09 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20204.1779006245228394539
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 May 2026 01:24:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@qualcomm.com header.s=qcppdkim1 header.b=cdrxTT58;
 dkim=fail reason="dkim: body hash did not verify" header.i=@oss.qualcomm.com header.s=google header.b=MIkDItlD;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64H4lrFj3246442
	for <openembedded-devel@lists.openembedded.org>; Sun, 17 May 2026 08:24:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JfAPDaMxC6fSaTWK5htzm5mWB2tVAXCzuGsx6fnlmk0=; b=cdrxTT583MUhSaw/
	vK9B7AgK47o5nsyiRPEAAb3XY2+9TYUGHZleaN74hl5e4fjqf6Cnnd99nyZ5wv1d
	hh40N9gDL3LZqNQGSEPxIjF96old+50Ur/O8C8wcjnMLnpPfuDxQz46zZTG9waHW
	gZ6cgV8GjsEdPO6JUJ3LfwBLS2/AUeEL+Vj9hYRC1ZthiNTEtmOIlWqXLNGpI8xJ
	WdLVuPyW1+1Rb7DLBcgo0lxySv/sZZBnom4PtWkSgeTuvX1vUesYWZZxqvAkyl6E
	2GPGRwuykNqj6tadUdUlYAiv+jU0DYxkdae+cSxmQefHWk/fArQV2wQ4T7RMvseJ
	M6nllA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6gvqtg39-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 17 May 2026 08:24:04 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3662e7756f0so827448a91.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 17 May 2026 01:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779006243; x=1779611043; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JfAPDaMxC6fSaTWK5htzm5mWB2tVAXCzuGsx6fnlmk0=;
        b=MIkDItlDIjyhPOeaa1f8WVZx2z4cw33jbZBL6vz9D80xQE9+3ngWug4JZSkCGmTJoH
         s/qMAtg9WSWKt+JO70cryYnyJC0Hs53QK05jeF0AeEpxIJiE5G7tn/hKgpAcnuhLdI76
         puB2dLefVKPnA585vXrt5iah7yRyaaH2wCaaO9FVWdBZGLqGolWc+RgRoOV+ojE1Ydqb
         bYPuLwoVGMwwo7NhEJ+XiZvcBqs3v2W6JbhuXRkBgk1BArFm/vbeXHHe2p1axs/vVRcH
         pkOJIYQyaadEr0V6BPVNMAFu5JiiMUY5jqSWXeFA+24ab/tePBx0NqFgZMfAWcd2I384
         +8Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779006243; x=1779611043;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JfAPDaMxC6fSaTWK5htzm5mWB2tVAXCzuGsx6fnlmk0=;
        b=gJjvIyx3xsEVEnIpKP6wKs0ZtGrQxkvTlDegchHkUshFV2lEOQkJmlrsrEF63njvg3
         6v6xGlXVjCk83/GMKq5LctxwKXIp78r6NKaPf8+y3p+BbpnHbkxDWTw0zdoMpw7gkvl1
         vBXEVVi+fYpSyFbMhelfJ1MV2JxTPk36UHXvk7+OWOMXaw1pNlYSlRu5lyGjsAaWtwg/
         e84nARPL5EO39+xGSBeHFT1I8dq/uR+HV5Wcx74y4DH9jTV4vldPTsASrEODUT8TYPwn
         B5paFpdM/vH39UT3+mMjOkj1dZKc64Opd4Js6fTNZx27QaHLD4PYa90e+XuHgd47tbXt
         KRow==
X-Gm-Message-State: AOJu0Ywm5ZVslBfQQ7M7ZnfnHHyyWKxMOkMgTjatHq+IptXuR512n9a2
	o0nzMRa3+MRceHPv6LDwsdgQ5qQs8V/xB/IG0n3ToKUjABN7TmQm6iS1EIQ51x31LnmfU3vdLk9
	val5KHvI4AARIeTGaWX/N3f6E3D+jrARr+aBDTpckb6vX7eYvwBY5vVf7T9GQiH4kCVyuGZS0EX
	vqDlRM7uMoxbaIfxY682HgrQ==
X-Gm-Gg: Acq92OFjnPCo0OcgFmpY5PMjhquVkQ4VWUaJqrOgmuGJcb/1sUFJEHdf9W+YC1axFAs
	qiofrAaBPOwyTJLTR9FFwPwjYWuNmIQvehHqKhs8W0rRigHX/MDPgnWoS5dfMCspDgSIQBVn9A7
	hFrqWJJSqatUZhZl/14sl+K4OjqUsA+Co9fwnwzBad4Sx0xZ9EVycJRqaV0mEDy8H6ZJsH/q61o
	sMgilxTEJzAISrh6WvBGwdwqIL4Y2J9SCzV8Q1QFyx9wkdRRoHxFXg8afQ/0IHVMygbmz+Ehtzo
	UWD8JiUMK2JGOyAZqSaSTl5N/UXUcU1Z0wLHsBLzRffaEd5dQOAZf/nOXdyY2Ln32V+XKckG/VS
	MQA8na3a/WXgXRlJEV857SZIkGFFsYfSre1K0hz/wQYmsMDcTBvOY
X-Received: by 2002:a17:90b:5904:b0:368:f179:ba07 with SMTP id 98e67ed59e1d1-36951a1cb7dmr10893109a91.9.1779006243086;
        Sun, 17 May 2026 01:24:03 -0700 (PDT)
X-Received: by 2002:a17:90b:5904:b0:368:f179:ba07 with SMTP id 98e67ed59e1d1-36951a1cb7dmr10893090a91.9.1779006242568;
        Sun, 17 May 2026 01:24:02 -0700 (PDT)
Received: from hu-anujmitt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36956f3723bsm2765033a91.1.2026.05.17.01.24.01
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 01:24:02 -0700 (PDT)
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [wrynose][meta-python][PATCH 02/29] python3-aspectlib: Fix pytest compatibility
Date: Sun, 17 May 2026 13:49:30 +0530
Message-ID: <21970fef899c2315de76ac714c5058c1b69e1a6f.1779004358.git.anuj.mittal@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1779004358.git.anuj.mittal@oss.qualcomm.com>
References: <cover.1779004358.git.anuj.mittal@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
X-Proofpoint-GUID: XBit2gduTOLixpIlcHcsCB89-IVVY783
X-Proofpoint-ORIG-GUID: XBit2gduTOLixpIlcHcsCB89-IVVY783
X-Authority-Analysis: v=2.4 cv=LKJWhpW9 c=1 sm=1 tr=0 ts=6a097b24 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=Ujd8b4A6AAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=EUspDBNiAAAA:8
 a=K_tvpBsfN6HfIlLrnKoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=-TmhFAHAl66zCO8_Mo53:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE3MDA4NyBTYWx0ZWRfX6bikfUJVXogm
 vzmZa64LNgEKJTamcSugS3C/KExiWoMNtqa1t4cC7+0qdm8BXqPwGYw95FizbG+nWcFeAp76E/b
 BIq9B76q7Ude/cwSMgFMHZeLeHyP/fEN6dHPl2tfSh+GQbooUN3vKSOkDIetUVtyEGPodlAIy4a
 UHiyCSUUQGjDyqZW76iH9uNPrYE7SEpYvqOhBRM0gYWdkmQQ54UwvlzUPnGf8zK6be7yuEbRmpy
 f/foDb/mwELvFE47fLxUxIF1J1JjPehvkx2EU4+dSGNbf2NIJ2WNSNCyCQqXq6k/uvBM0PFGO4U
 Kme6DucE9Uuvdm2Eu1z47sOwAb+HDOx0ihYMLM9m3HDkRfpdNVYC5DtZTGBGorDyxH4BoBmZcHg
 cpJ7uzgAQVLeSfazzdkeN6n4Ra4o0Y2ZWNuNa+jpg+TXA4xNeHx11Uf4os4KDSMgEHHGrduS9aV
 jg2UWrBm3w9t841cvBw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-17_02,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605170087
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0031df01.pphosted.com id 64H4lrFj3246442
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 17 May 2026 08:24:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127015

From: Zhang Xiao <xiao.zhang@windriver.com>

Partially backport upstream commit to fix pytest compatibility issue.

Fixes pytest errors e.g.
  | pytest.PytestRemovedIn9Warning: The (path: py.path.local) argument is=
 deprecated, please use (collection_path: pathlib.Path)
  | see https://docs.pytest.org/en/latest/deprecations.html#py-path-local=
-arguments-for-hooks-replaced-with-pathlib-path
  | ERROR: Exit status is 1

Signed-off-by: Zhang Xiao <xiao.zhang@windriver.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit d389ed9e3342aadcca29a18340b4fe07924ad69e)
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
---
 ...-aspectlib-backport-fix-for-selftest.patch | 37 +++++++++++++++++++
 .../python/python3-aspectlib_2.0.0.bb         |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-aspectlib=
/0001-python3-aspectlib-backport-fix-for-selftest.patch

diff --git a/meta-python/recipes-devtools/python/python3-aspectlib/0001-p=
ython3-aspectlib-backport-fix-for-selftest.patch b/meta-python/recipes-de=
vtools/python/python3-aspectlib/0001-python3-aspectlib-backport-fix-for-s=
elftest.patch
new file mode 100644
index 0000000000..05d7b63126
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-aspectlib/0001-python3-=
aspectlib-backport-fix-for-selftest.patch
@@ -0,0 +1,37 @@
+From 2e007c5c3ed048491c29e37991e6788f41728b31 Mon Sep 17 00:00:00 2001
+From: Ionel Cristian M=C4=83rie=C8=99 <contact@ionelmc.ro>
+Date: Fri, 24 Apr 2026 13:17:54 +0000
+Subject: [PATCH] python3-aspectlib: backport fix for selftest
+
+Partial backport of upstream commit b85abdb056("Fix some cleanup regress=
ions")
+
+Changes excluded:
+The stacklevel assertion updates in test_aspectlib.py and
+test_integrations.py are omitted. These are specific to upstream's
+test suite configuration and cause failures in this environment
+without providing functional value to the core library.
+
+Upstream-Status: Backport [https://github.com/ionelmc/python-aspectlib/c=
ommit/b85abdb0565d1598ce56bd49d49dc709d4e16081]
+
+Signed-off-by: Zhang Xiao <xiao.zhang@windriver.com>
+---
+ tests/conftest.py | 7 ++++---
+ 1 file changed, 4 insertions(+), 3 deletions(-)
+
+diff --git a/tests/conftest.py b/tests/conftest.py
+index ee54d9d..29caa50 100644
+--- a/tests/conftest.py
++++ b/tests/conftest.py
+@@ -1,5 +1,6 @@
+-def pytest_ignore_collect(path, config):
+-    basename =3D path.basename
++from pathlib import Path
+=20
+-    if 'pytestsupport' in basename:
++
++def pytest_ignore_collect(collection_path: Path, config):
++    if 'pytestsupport' in collection_path.__fspath__():
+         return True
+--=20
+2.53.0
+
diff --git a/meta-python/recipes-devtools/python/python3-aspectlib_2.0.0.=
bb b/meta-python/recipes-devtools/python/python3-aspectlib_2.0.0.bb
index 854a14441c..7bfee7ff7a 100644
--- a/meta-python/recipes-devtools/python/python3-aspectlib_2.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-aspectlib_2.0.0.bb
@@ -8,6 +8,7 @@ HOMEPAGE =3D "https://github.com/ionelmc/python-aspectlib=
"
 LICENSE =3D "BSD-2-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D80721ace117fd1f814049ecb81c6b=
e76"
=20
+SRC_URI +=3D "file://0001-python3-aspectlib-backport-fix-for-selftest.pa=
tch"
 SRC_URI[sha256sum] =3D "a4b461b9da0b531aebcb93efcde3de808a72c60226dd8d90=
2c467d13faf7ce92"
=20
 inherit ptest-python-pytest pypi setuptools3
--=20
2.53.0


