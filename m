Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10.1794324459853605919
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Nov 2026 07:27:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=XbjBtpyN;
 spf=pass (domain: konsulko.com, ip: 209.85.128.51, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so12484725e9.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 10 Nov 2026 07:27:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1794324458; x=1794929258; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t0R3azMwiplxA33eQo8BwXzVLiE3X0fuXShqXzMDBVE=;
        b=XbjBtpyNGZnAOeqkrTrv6YtHkx8/iFehIsFIPNBCSOtiV1U7qs67eKEOrz78ej2EEE
         IGDmhKxe/e8Lc4v6Ghi0fQMaZL9cGWpuw5IfQcPW6K0gW4S08NfckHDZsgeIZz4b4XxA
         /NrL/IrAc/0UAzy21ec1Y9pdfqcBy5fIEJ94k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794324458; x=1794929258;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=t0R3azMwiplxA33eQo8BwXzVLiE3X0fuXShqXzMDBVE=;
        b=OOesEnPhXb7lkAk68OzEUPaW1+St2Beii0ZqGR/E9upUtpvJEgwjVGjsP3zVbm9QFA
         aoPPOGOuckP9oHzlEHfOtkGtAwsVC5PtpwF761HYys2pMlAt7qo8q8SUUCMInuP3EisM
         akQmNm9BOLz939oUhuE3gXFzTzYdoX8XPQgICEQmNq7kcr0ksctsnifYPkNbC/e14r2W
         oP0LWScYB9my5BTr0iMkViCEp/OCXP0bu1LqSzUAe7M9Q4uFsCtx7OZaZpgeRIy0qByJ
         AMa3qBp7C/YT6u8KsO0NPJN7oO/8hYxkkqitBlAAY8M/LIiM1I368jYDSiCvU7fDTGVq
         XXDA==
X-Gm-Message-State: APuU4Z+gy3fW/FZabHdHF5dXPO0hxAvFaYLio9f3UZVSggEdK183IZ3L
	tT99WPFGbZ4uUcoMT60X7V5MWK7EkD4P1CablE/fqXcFjdy/bZqmCwherHWmMT8pmJYO3WHPEa1
	11wj1
X-Gm-Gg: AYBFou31TUlCJrX4oCINrQspnglBhTId4ot1LzPO/tSfn6LI6cmyMvPRw/AAuoFnyGH
	2Q0vdvN2UaDkazzzLVkTMdxEb+wf8C7Mrh6nKKApcpp1vpFHxkufkeLQlcL771FwL5IiLfAf9vO
	iF1hNSyzgLfADspJaxWGEdeCW3BVp4XYKNcwPVRChxIRtrBVXlCytRa+6rhYtQ0qh5poUE+MTHI
	iwziVe2hhZHnCxKM3b9biGrQ+QLnJ9Zm73eCci76AFr34A+YBWOLLWyrGbzVMPa/KpNPMSo0wUA
	8nM4G7LjOiRmhhub2qM729m5V4VAtF2/UbboHnzIGlEJ/uGQ743Igx5pcsSoNkDJJb3udGbcQVw
	pn4I0b0t02QKuD/8egOOd4DLMrbwOKJocr6HJqJ9Q2bYAlA2XL7i0OYQ+0lZE2WearkqxTmgNK9
	k7PWUjgn8qE3nqeOlgUXglpcERlGwpsmqsVvT7aUs3yPafi+tnqjq4LkAEqpVTZdqj1eR7HgcIc
	u9yviLqZS2oFEEX+IJrEeoFXgfkVrSEIs8eYZBRs+lXUdSdFB+lDB9AhAeZEnHAdV+IvDBzhihk
	oHv2EJ0hKdPX3onX7Dns/a8yNfe0AGnI6wjbPlEa1gZDjrg0zAy7EXDr6a6gj9iEmOXi3lPdlq9
	22XKmKhoQIEKtNUy1KoTLlYK9G2MsQFQxodBY9HPE556/AUTxvWuZGAcXIQ/hI4kN/K6rxS5+GL
	m9
X-Received: by 2002:a05:600c:34d0:b0:4a5:87b3:ddc1 with SMTP id 5b1f17b1804b1-4ba0233c45cmr54260525e9.13.1794324458009;
        Tue, 10 Nov 2026 07:27:38 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498369a3f4esm6064071f8f.53.2026.11.10.07.27.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 07:27:37 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 07/19] python3-moteus: Upgrade 1.1.1 -> 1.1.3
Date: Tue, 10 Nov 2026 17:27:17 +0200
Message-ID: <20261110152729.1065911-7-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261110152729.1065911-1-leon.anavi@konsulko.com>
References: <20261110152729.1065911-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 10 Nov 2026 15:27:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132081
Content-Type: text/plain; charset="utf-8"

Upgrade to release 1.1.3:

- mpat: Fix inertia for the mad8318 and gbm5208
- Clean up after NamedTemporaryFile to avoid warnings with newer
  pythons
- Prevent inlining of some functions to prevent CCM size bloat
- Mark all enum mapping functions as constexpr
- mpat: Don't delete the entire chip when backspace is pressed
- Document the field weakening limit reason in the limited-torque
  guide
- Fix mpat handling of non-default controller and motor maximum
  temps
- Add a utility to plot hall effect calibration errors

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-moteus_1.1.1.bb => python3-moteus_1.1.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-moteus_1.1.1.bb => python3-moteus_1.1.3.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-moteus_1.1.1.bb b/meta-python/recipes-devtools/python/python3-moteus_1.1.3.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-moteus_1.1.1.bb
rename to meta-python/recipes-devtools/python/python3-moteus_1.1.3.bb
index be35c409d3..99ed6ad8a3 100644
--- a/meta-python/recipes-devtools/python/python3-moteus_1.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-moteus_1.1.3.bb
@@ -7,7 +7,7 @@ inherit pypi python_setuptools_build_meta
 
 DEPENDS += "python3-wheel-native"
 
-SRC_URI[sha256sum] = "a10a097100984ec16dfed7848bae1ee83e29cc00cd0bb3138cb599b697315820"
+SRC_URI[sha256sum] = "fb7babcde6293927ded01bcc79f75138412e4d2f18d149d421a9d71bfb6d6387"
 
 S = "${UNPACKDIR}/moteus-${PV}"
 
-- 
2.47.3

