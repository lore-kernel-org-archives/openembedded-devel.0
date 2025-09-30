Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 565BDCAC5B8
	for <webhook@archiver.kernel.org>; Tue, 30 Sep 2025 04:13:27 +0000 (UTC)
Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
 by mx.groups.io with SMTP id smtpd.web10.17582.1759205605251537178
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Sep 2025 21:13:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bGCV54xF;
 spf=pass (domain: gmail.com, ip: 74.125.224.47, mailfrom: schonm@gmail.com)
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-637dc2292cfso2631956d50.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 29 Sep 2025 21:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759205604; x=1759810404; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ye8qTrTFD0fPeV5SK72cStah4DjHuL4XROLwYgkkiPo=;
        b=bGCV54xF24pDebH+8YbUXktl1/ZHeYWiNy5feOmOMY9pjiTeiyFlRuPcj5Qr6U+wDk
         a7hZLBhiWUhgB3GId/I3EMw1tjNsILBfBo6ZLAr/G9SvHJydoDNErSepHR6ROKglZT28
         oPPSJSNMDgG9FwLQ2F7WZVbgUw5IYeJZrhrW2XGuYBrhtxnJVq2cdOVGkECRD47Y05eL
         D5CumyJYjSdmQ1Jeh0DEYIULPCptbeFc6IZo+vcTEC3WHQZ7BAfuC/E3naSyhXcHAVo/
         C7HkyEekxkyUaDbmfHZ74qTX8x3YCOB2pCdiObQgROxIi+XVEZWqkbRFiVlpCxrXwyB+
         B4BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759205604; x=1759810404;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ye8qTrTFD0fPeV5SK72cStah4DjHuL4XROLwYgkkiPo=;
        b=oMH8AJK7WBFyQvVnUmps7qT3xhq7i8XJcS0wTBpvPDvu7r9hns4E9m3bkIWZCPlJB7
         WIKm3aeV+cNLWeusoT0uBZme1Wb9G00i1rA/vSd3X6Z491BKov3cVP4NqqgAl+W6Y3Qz
         i9GJ/VwNvCkEixRIxwZ/FC1StojcgPQhHEaqubGg+1wIDDBZVMTrN25QE5KQBrJK33gw
         H6n4OiD5pE/H7VOLp+hZOl2tyw+XdrqlXXf23xhiX9Ib2pJ1hLsK5kfnnCpwurAGay3Y
         ftQaXCQugEGjD6eUVA/iRSHsYLzfzwVtUdizk4GTIgw7TvwHC3+ufSVfGJ7UEa2nz5F9
         GCqA==
X-Gm-Message-State: AOJu0YwS3YnM1sUF1b2BJV9/u1E5O4qb3edTWEEUDajCpggGYNYS2SbF
	IX5NOB+KST24pCZL1IbTDOrhzCf0HWj8Ih7FZUBr3mpWl20IUs1SiGrTC40lxte7
X-Gm-Gg: ASbGnctVJgOl305vIDE98pn2dG7cSCFL79v3/jl2elZ5sd4eCBLAfwoFGn3qywrMIIw
	vXp2X9B7fpmnGmN+fL0uZVeLPz2Ksv5wVN0KO7miLxHzp8VK9r+woJy4J59jLagYEkwYSPIXs40
	sOMR/FyRO4bIe3lfY9QaQ4RGuJaoQ/W3g/xiF0R69FNOu3mXRfEDuQn3wmsWf4pcPPyMYLTbS+R
	WxZgqO7SN6CrSI9MhGT5Id8lOov2+wNJm5NgXSsLVo4M8eBARJFkdBLCYSvzFRunytE3pYSBVAz
	Su9oTg+Z0ufKxBbnpkOMm9CWHVthY7J6KeYTUApc76e0HulsKcSZ+abpC+24qavh4yhivCWZB/G
	Bl3DqzqVk/uSy0jdfDc9ApGXjJhB90wm/yIJh/pj3GK2u9lD/onIL
X-Google-Smtp-Source: AGHT+IFkFxS8IT4LT+255tFd30NGB323mMNEjOSTlsOQR+s+XHQNRZ7eZNKX2S0+6bHk9GQwqmnPSw==
X-Received: by 2002:a53:b086:0:b0:636:d286:4833 with SMTP id 956f58d0204a3-636d286509dmr12800594d50.6.1759205603582;
        Mon, 29 Sep 2025 21:13:23 -0700 (PDT)
Received: from localhost.localdomain ([67.233.61.26])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-765be76d928sm33771587b3.31.2025.09.29.21.13.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 21:13:23 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH] webkitgtk3: add patch to fix qemuarm
Date: Tue, 30 Sep 2025 00:12:14 -0400
Message-ID: <20250930041240.41969-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Sep 2025 04:13:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120048

The patch here is backported from webkitgtk 2.50 and allows
32 bit arm to successfully build (qemuarm)

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../webkitgtk3/0001-Fix-32bit-arm.patch       | 128 ++++++++++++++++++
 .../webkitgtk/webkitgtk3_2.48.7.bb            |   1 +
 2 files changed, 129 insertions(+)
 create mode 100644 meta-oe/recipes-support/webkitgtk/webkitgtk3/0001-Fix-32bit-arm.patch

diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3/0001-Fix-32bit-arm.patch b/meta-oe/recipes-support/webkitgtk/webkitgtk3/0001-Fix-32bit-arm.patch
new file mode 100644
index 0000000000..fadef2a01b
--- /dev/null
+++ b/meta-oe/recipes-support/webkitgtk/webkitgtk3/0001-Fix-32bit-arm.patch
@@ -0,0 +1,128 @@
+From 014b9dad4ec5c432410254c0d0cab7d20b1f31d7 Mon Sep 17 00:00:00 2001
+From: Jason Schonberg <schonm@gmail.com>
+Date: Mon, 29 Sep 2025 14:34:48 -0400
+Subject: [PATCH] From: amaxcz <amaxcz@gmail.com> Date: Fri, 19 Sep 2025
+ 11:55:30 +0000 Subject: [PATCH] JSC: fix op_instanceof handler for 32-bit
+ C-loop build MIME-Version: 1.0 Content-Type: text/plain; charset=UTF-8
+ Content-Transfer-Encoding: 8bit
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+JSC: fix op_instanceof handler for 32-bit C-loop build
+
+Fixes missing 'op_instanceof' handler in LowLevelInterpreter32_64.asm
+which breaks 32‑bit builds.
+
+* No ChangeLog (raw external patch).
+
+Upstream-Status: Backport [https://bugs.webkit.org/show_bug.cgi?id=299166]
+
+Signed-off-by: Jason Schonberg <schonm@gmail.com>
+---
+ .../llint/LowLevelInterpreter32_64.asm        | 95 ++++++++++++++++++-
+ 1 file changed, 94 insertions(+), 1 deletion(-)
+
+diff --git a/Source/JavaScriptCore/llint/LowLevelInterpreter32_64.asm b/Source/JavaScriptCore/llint/LowLevelInterpreter32_64.asm
+index 0d7c92bb..0b81cc1a 100644
+--- a/Source/JavaScriptCore/llint/LowLevelInterpreter32_64.asm
++++ b/Source/JavaScriptCore/llint/LowLevelInterpreter32_64.asm
+@@ -3437,4 +3437,97 @@ slowPathOp(enumerator_has_own_property)
+ slowPathOp(mod)
+ 
+ llintSlowPathOp(has_structure_with_flags)
+-llintSlowPathOp(instanceof)
++
++llintOpWithMetadata(op_instanceof, OpInstanceof, macro (size, get, dispatch, metadata, return)
++
++    macro getAndLoadConstantOrVariable(fieldName, tagReg, payloadReg)
++        get(fieldName, t5)
++        loadConstantOrVariable(size, t5, tagReg, payloadReg)
++    end
++
++    macro isObject(field, falseLabel)
++        getAndLoadConstantOrVariable(field, t0, t1)
++        bineq t0, CellTag, falseLabel
++        bbneq JSCell::m_type[t1], ObjectType, falseLabel
++    end
++
++    macro overridesHasInstance(hasInstanceField, constructorField, trueLabel)
++        getAndLoadConstantOrVariable(hasInstanceField, t0, t1)
++        bineq t0, CellTag, trueLabel
++        loadp CodeBlock[cfr], t2
++        loadp CodeBlock::m_globalObject[t2], t2
++        loadp JSGlobalObject::m_functionProtoHasInstanceSymbolFunction[t2], t2
++        bpneq t1, t2, trueLabel
++
++        get(constructorField, t5)
++        loadConstantOrVariablePayload(size, t5, CellTag, t1, trueLabel)
++        btbz JSCell::m_flags[t1], ImplementsDefaultHasInstance, trueLabel
++    end
++
++    macro storeValue(tagReg, payloadReg, fieldName)
++        move tagReg, t0
++        move payloadReg, t1
++        get(fieldName, t5)
++        storei t0, TagOffset[cfr, t5, 8]
++        storei t1, PayloadOffset[cfr, t5, 8]
++    end
++
++.getHasInstance:
++    isObject(m_constructor, .throwStaticError)
++    get(m_constructor, t5)
++    metadata(t2, t6)
++    loadConstantOrVariablePayload(size, t5, CellTag, t3, .getHasInstanceSlow)
++    performGetByIDHelper(OpInstanceof, m_hasInstanceModeMetadata, m_hasInstanceValueProfile, .getHasInstanceSlow, size,
++        macro (resultTag, resultPayload)
++            storeValue(resultTag, resultPayload, m_hasInstanceOrPrototype)
++            jmp .getPrototype
++        end)
++    jmp .getPrototype
++
++.getHasInstanceSlow:
++    callSlowPath(_llint_slow_path_get_hasInstance_from_instanceof)
++    branchIfException(_llint_throw_from_slow_path_trampoline)
++    jmp .getPrototype
++
++.getHasInstanceInlinedGetterOSRReturnPoint:
++    # This path is taken when exiting to the LLInt from an inlined getter for Symbol.hasInstance.
++    getterSetterOSRExitReturnPoint(op_instanceof, size)
++    valueProfile(size, OpInstanceof, m_hasInstanceValueProfile, r1, r0, t2)
++    storeValue(r1, r0, m_hasInstanceOrPrototype)
++
++.getPrototype:
++    overridesHasInstance(m_hasInstanceOrPrototype, m_constructor, .instanceofCustom)
++    isObject(m_value, .false)
++    get(m_constructor, t5)
++    metadata(t2, t6)
++    loadConstantOrVariablePayload(size, t5, CellTag, t3, .getPrototypeSlow)
++    performGetByIDHelper(OpInstanceof, m_prototypeModeMetadata, m_prototypeValueProfile, .getPrototypeSlow, size,
++        macro (resultTag, resultPayload)
++            storeValue(resultTag, resultPayload, m_hasInstanceOrPrototype)
++            jmp .instanceof
++        end)
++    jmp .instanceof
++
++.getPrototypeSlow:
++    callSlowPath(_llint_slow_path_get_prototype_from_instanceof)
++    branchIfException(_llint_throw_from_slow_path_trampoline)
++    jmp .instanceof
++
++.instanceof:
++    callSlowPath(_llint_slow_path_instanceof_from_instanceof)
++    dispatch()
++
++.throwStaticError:
++    callSlowPath(_slow_path_throw_static_error_from_instanceof)
++    dispatch()
++
++.instanceofCustom:
++    callSlowPath(_slow_path_instanceof_custom_from_instanceof)
++    dispatch()
++
++.false:
++    get(m_dst, t5)
++    storei BooleanTag, TagOffset[cfr, t5, 8]
++    storei 0, PayloadOffset[cfr, t5, 8]
++    dispatch()
++end)
diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.48.7.bb b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.48.7.bb
index 6c105e7bb1..118592d42b 100644
--- a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.48.7.bb
+++ b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.48.7.bb
@@ -21,6 +21,7 @@ SRC_URI = "https://www.webkitgtk.org/releases/webkitgtk-${PV}.tar.xz \
            file://0001-Fix-build-errors-on-RISCV-https-bugs.webkit.org-show.patch \
            file://fix-ftbfs-riscv64.patch \
            file://0001-CMake-Add-a-variable-to-control-macro-__PAS_ALWAYS_I.patch \
+           file://0001-Fix-32bit-arm.patch \
            "
 SRC_URI[sha256sum] = "2c62aebb608e09f930a539f3623a5cc8023b5068029f42a208f45f9124da6e30"
 
-- 
2.43.0


