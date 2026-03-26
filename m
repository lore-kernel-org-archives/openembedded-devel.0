Return-Path: <hongxu.jia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD15510A3D8F
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 12:32:35 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.46274.1774528350488763561
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2026 05:32:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=bP+280rK;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7545558680=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62QAo2IA3761288
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 05:32:30 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=TUAUXp1MZvIo78Jx3Lc1
	r0LrPrl20EXdoV/yDbYcpC0=; b=bP+280rKJC/a8M1GSNWFWUQrieS+uoRVvccm
	Cv1T5pSYm2l0py/IKqubHIzyJmUhh+GUc0Yn1/FQdqdTSF8GFXm9AHGYDVY25Gz4
	PmDaNz8FoDQ9uNlgPVaoXR6TrsofCAeNL5Fg0lmTPZQKA8Z2TvXztWO9pDbypoWr
	OW30XheiI9xcr2vznbUGHAIqD4d4o7sNydS7C8Gy4opte3NoDRru6kllT5o1DQTg
	iIkGl5j/nUcFgj1aVD+4hv86d7PUKYpgc8NnQuXgpxi6g83+Q1/RyZm+SNS/3xLq
	2lNA/+0FW4YzwHoQmBbPDJa4pKiU4TAT4KvQ7gIaqts7fn/Tpg==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4d1tucx7ga-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 05:32:29 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Thu, 26 Mar 2026 05:32:28 -0700
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Thu, 26 Mar 2026 05:32:28 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH v2] webkitgtk3: fix compile failed on qemuarm
Date: Thu, 26 Mar 2026 20:32:27 +0800
Message-ID: <20260326123227.2212954-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: zcTEv5AE4aNzt9HmQ59czbsTR0CJlC7o
X-Proofpoint-ORIG-GUID: zcTEv5AE4aNzt9HmQ59czbsTR0CJlC7o
X-Authority-Analysis: v=2.4 cv=deCNHHXe c=1 sm=1 tr=0 ts=69c5275e cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=NEAV23lmAAAA:8
 a=Q1sTgoEvAAAA:8 a=LXCGm8LIAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8
 a=AL_9DjrWXvHzPdvtZEAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=FkGh3qDytyf094M0uOEt:22 a=NxI9r9ql2kHpUT0AVVEO:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDA4NyBTYWx0ZWRfX1zL0kq+qZQGd
 9XQGh9YWxm6/IWDbe/xJYX2dmjCj/i9hsZ7bDebW3ij87g9Ic+BP5aiBZrH3wP4ta3EjrAlncTW
 N4nlTicuHdOfBcJru0UZCXmBPUkdceBtQ+iM8Hhmy7YZhhKrUxe4pumdb/aqMtFq4HkXwacHyDi
 SQsQ4uyjdxRrjx/C7eZOgEXgTvvIDIwDMjRjMTjhNpcBiHVBvsQf6lsGZtihtufBdbPTNZoBoWq
 2miDVA1RvnNJM32+DB+THFSgsHO9cy+aeh0ExEr9+Y27QubEjTqhFA0pd0aFMcKkrl0QdtPx2Qw
 OsNI7YxzX7fx1vzW1C/QBJkihlLBeiukcUrFOgK1Apq9j9CnPe99N1M3JFV32Vw7AOtOi5pY2f5
 PAPJ3a1/HHc2b0d3fPVoP0H9RFK4No0M1cDQ6rgPYl4Yz6OHL9fdppm28/ixlz8wd2aJ1IVsRK7
 RihwVgZVFVve67hRGYw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_02,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260087
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 62QAo2IA3761288
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 12:32:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125720

$ echo 'MACHINE =3D "qemuarm"' >> conf/local.conf
$ bitbake webkitgtk3
...
| {standard input}:43622: Error: symbol `op_instanceof_return_location' i=
s already defined
| {standard input}:43623: Error: symbol `.Lop_instanceof_return_location'=
 is already defined
| {standard input}:44352: Error: symbol `op_instanceof_return_location_wi=
de16' is already defined
| {standard input}:44353: Error: symbol `.Lop_instanceof_return_location_=
wide16' is already defined
| {standard input}:45090: Error: symbol `op_instanceof_return_location_wi=
de32' is already defined
| {standard input}:45091: Error: symbol `.Lop_instanceof_return_location_=
wide32' is already defined
...

Drop 0001-Fix-32bit-arm.patch which conflicts with upstream solution [1]

[1] https://github.com/WebKit/WebKit/commit/fcaa289f6015595a638eb96b9f728=
eaaa7b13ab8

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../webkitgtk3/0001-Fix-32bit-arm.patch       | 128 ------------------
 .../webkitgtk/webkitgtk3_2.50.5.bb            |   1 -
 2 files changed, 129 deletions(-)
 delete mode 100644 meta-oe/recipes-support/webkitgtk/webkitgtk3/0001-Fix=
-32bit-arm.patch

diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3/0001-Fix-32bit-=
arm.patch b/meta-oe/recipes-support/webkitgtk/webkitgtk3/0001-Fix-32bit-a=
rm.patch
deleted file mode 100644
index fadef2a01b..0000000000
--- a/meta-oe/recipes-support/webkitgtk/webkitgtk3/0001-Fix-32bit-arm.pat=
ch
+++ /dev/null
@@ -1,128 +0,0 @@
-From 014b9dad4ec5c432410254c0d0cab7d20b1f31d7 Mon Sep 17 00:00:00 2001
-From: Jason Schonberg <schonm@gmail.com>
-Date: Mon, 29 Sep 2025 14:34:48 -0400
-Subject: [PATCH] From: amaxcz <amaxcz@gmail.com> Date: Fri, 19 Sep 2025
- 11:55:30 +0000 Subject: [PATCH] JSC: fix op_instanceof handler for 32-b=
it
- C-loop build MIME-Version: 1.0 Content-Type: text/plain; charset=3DUTF-=
8
- Content-Transfer-Encoding: 8bit
-MIME-Version: 1.0
-Content-Type: text/plain; charset=3DUTF-8
-Content-Transfer-Encoding: 8bit
-
-JSC: fix op_instanceof handler for 32-bit C-loop build
-
-Fixes missing 'op_instanceof' handler in LowLevelInterpreter32_64.asm
-which breaks 32=E2=80=91bit builds.
-
-* No ChangeLog (raw external patch).
-
-Upstream-Status: Backport [https://bugs.webkit.org/show_bug.cgi?id=3D299=
166]
-
-Signed-off-by: Jason Schonberg <schonm@gmail.com>
----
- .../llint/LowLevelInterpreter32_64.asm        | 95 ++++++++++++++++++-
- 1 file changed, 94 insertions(+), 1 deletion(-)
-
-diff --git a/Source/JavaScriptCore/llint/LowLevelInterpreter32_64.asm b/=
Source/JavaScriptCore/llint/LowLevelInterpreter32_64.asm
-index 0d7c92bb..0b81cc1a 100644
---- a/Source/JavaScriptCore/llint/LowLevelInterpreter32_64.asm
-+++ b/Source/JavaScriptCore/llint/LowLevelInterpreter32_64.asm
-@@ -3437,4 +3437,97 @@ slowPathOp(enumerator_has_own_property)
- slowPathOp(mod)
-=20
- llintSlowPathOp(has_structure_with_flags)
--llintSlowPathOp(instanceof)
-+
-+llintOpWithMetadata(op_instanceof, OpInstanceof, macro (size, get, disp=
atch, metadata, return)
-+
-+    macro getAndLoadConstantOrVariable(fieldName, tagReg, payloadReg)
-+        get(fieldName, t5)
-+        loadConstantOrVariable(size, t5, tagReg, payloadReg)
-+    end
-+
-+    macro isObject(field, falseLabel)
-+        getAndLoadConstantOrVariable(field, t0, t1)
-+        bineq t0, CellTag, falseLabel
-+        bbneq JSCell::m_type[t1], ObjectType, falseLabel
-+    end
-+
-+    macro overridesHasInstance(hasInstanceField, constructorField, true=
Label)
-+        getAndLoadConstantOrVariable(hasInstanceField, t0, t1)
-+        bineq t0, CellTag, trueLabel
-+        loadp CodeBlock[cfr], t2
-+        loadp CodeBlock::m_globalObject[t2], t2
-+        loadp JSGlobalObject::m_functionProtoHasInstanceSymbolFunction[=
t2], t2
-+        bpneq t1, t2, trueLabel
-+
-+        get(constructorField, t5)
-+        loadConstantOrVariablePayload(size, t5, CellTag, t1, trueLabel)
-+        btbz JSCell::m_flags[t1], ImplementsDefaultHasInstance, trueLab=
el
-+    end
-+
-+    macro storeValue(tagReg, payloadReg, fieldName)
-+        move tagReg, t0
-+        move payloadReg, t1
-+        get(fieldName, t5)
-+        storei t0, TagOffset[cfr, t5, 8]
-+        storei t1, PayloadOffset[cfr, t5, 8]
-+    end
-+
-+.getHasInstance:
-+    isObject(m_constructor, .throwStaticError)
-+    get(m_constructor, t5)
-+    metadata(t2, t6)
-+    loadConstantOrVariablePayload(size, t5, CellTag, t3, .getHasInstanc=
eSlow)
-+    performGetByIDHelper(OpInstanceof, m_hasInstanceModeMetadata, m_has=
InstanceValueProfile, .getHasInstanceSlow, size,
-+        macro (resultTag, resultPayload)
-+            storeValue(resultTag, resultPayload, m_hasInstanceOrPrototy=
pe)
-+            jmp .getPrototype
-+        end)
-+    jmp .getPrototype
-+
-+.getHasInstanceSlow:
-+    callSlowPath(_llint_slow_path_get_hasInstance_from_instanceof)
-+    branchIfException(_llint_throw_from_slow_path_trampoline)
-+    jmp .getPrototype
-+
-+.getHasInstanceInlinedGetterOSRReturnPoint:
-+    # This path is taken when exiting to the LLInt from an inlined gett=
er for Symbol.hasInstance.
-+    getterSetterOSRExitReturnPoint(op_instanceof, size)
-+    valueProfile(size, OpInstanceof, m_hasInstanceValueProfile, r1, r0,=
 t2)
-+    storeValue(r1, r0, m_hasInstanceOrPrototype)
-+
-+.getPrototype:
-+    overridesHasInstance(m_hasInstanceOrPrototype, m_constructor, .inst=
anceofCustom)
-+    isObject(m_value, .false)
-+    get(m_constructor, t5)
-+    metadata(t2, t6)
-+    loadConstantOrVariablePayload(size, t5, CellTag, t3, .getPrototypeS=
low)
-+    performGetByIDHelper(OpInstanceof, m_prototypeModeMetadata, m_proto=
typeValueProfile, .getPrototypeSlow, size,
-+        macro (resultTag, resultPayload)
-+            storeValue(resultTag, resultPayload, m_hasInstanceOrPrototy=
pe)
-+            jmp .instanceof
-+        end)
-+    jmp .instanceof
-+
-+.getPrototypeSlow:
-+    callSlowPath(_llint_slow_path_get_prototype_from_instanceof)
-+    branchIfException(_llint_throw_from_slow_path_trampoline)
-+    jmp .instanceof
-+
-+.instanceof:
-+    callSlowPath(_llint_slow_path_instanceof_from_instanceof)
-+    dispatch()
-+
-+.throwStaticError:
-+    callSlowPath(_slow_path_throw_static_error_from_instanceof)
-+    dispatch()
-+
-+.instanceofCustom:
-+    callSlowPath(_slow_path_instanceof_custom_from_instanceof)
-+    dispatch()
-+
-+.false:
-+    get(m_dst, t5)
-+    storei BooleanTag, TagOffset[cfr, t5, 8]
-+    storei 0, PayloadOffset[cfr, t5, 8]
-+    dispatch()
-+end)
diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.50.5.bb b/met=
a-oe/recipes-support/webkitgtk/webkitgtk3_2.50.5.bb
index 9be30506d6..e6007a6667 100644
--- a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.50.5.bb
+++ b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.50.5.bb
@@ -21,7 +21,6 @@ SRC_URI =3D "https://www.webkitgtk.org/releases/webkitg=
tk-${PV}.tar.xz \
            file://0001-Fix-build-errors-on-RISCV-https-bugs.webkit.org-s=
how.patch \
            file://fix-ftbfs-riscv64.patch \
            file://0001-CMake-Add-a-variable-to-control-macro-__PAS_ALWAY=
S_I.patch \
-           file://0001-Fix-32bit-arm.patch \
            "
 SRC_URI[sha256sum] =3D "8737631bac3e9c7ad3e5208f9370e076c09d9c45b3998002=
1ce54edadcc6f94f"
=20
--=20
2.34.1


