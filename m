Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1048CC61DDB
	for <webhook@archiver.kernel.org>; Sat, 29 Aug 2026 00:11:23 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.249.1787962278047032905
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Aug 2026 17:11:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=HQ18tVHH;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so1724527a91.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 28 Aug 2026 17:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787962277; x=1788567077; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0CtQ8CUgzbxsUwSdFqmUxmB/1vmMOOCPAmIsi9Ppkmk=;
        b=HQ18tVHHkEV/RORYHfVqP0rZSQiameuHpcv9C1tzGucjOEba3hKwN+kPVrhKeso5bR
         Ze8GnxL8dStXUbCQO5oBYZ493RhpRg3QIEWNkNeeSKT/WYdn/gWxBfQdStI+FlhTyiqb
         LPSkclpJcKsRaKnNKEMO/+MDEcaaF7IrIbHkKX2SF5XJIXzvovEnw+Qu2O4NNv1qMj+4
         A3v6fxIDgO30BmHdcvl4EEQYQVpasR9pUHH9Fwdy1uq6q4hn2rJ0Zivti6FrTsgNdXPe
         BSeh4kjwNbAtEAzFi3Zt5mZ0nJE2kCqQi44TWAs3rjwlyIjNe0r9OUg0Fj92QCW57703
         aWKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787962277; x=1788567077;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0CtQ8CUgzbxsUwSdFqmUxmB/1vmMOOCPAmIsi9Ppkmk=;
        b=MYniln2necQPK8bQs+aRYsY1ubrtihCIMpLaRqJBSeOFjxFM75Y+1TL72z/3PP/E4B
         X258e/GxbGQQZo0pvP1bqpdYLfAyTIK2F+kIPlHktXqUAIz3uoRp6V3a7ebffuWde04S
         cmqNJYMCxudosYiTd8w7Ow9Hp/zAmuUo7K96QjcFdEnTlFr0K1DqnbyeqLF3bW9vsQew
         98jT/Y+cbAeNpLiWBq93iLUKcJHisf4ay7WBMfNu6FiNQTgp6/+7B7lV8nyTv9v3ZHw8
         IyNe83/x6WQLZ7JZzAzElx2mnWMtpsF9i/coCxsmwuJ8PkaOeZVgbMlt+50p6OCGngnJ
         l7Jg==
X-Gm-Message-State: AFuF++lKKE2Lh7xGUrHvLgQtCZlG3fRpDUQHcDo/wgaP7ALO6dHhsPUj
	5z5FKBwXcz800uXRH9pQjQRq1CBmLHKHdIhhFhmPW9G36psi34xl6ZrO+b6wCA==
X-Gm-Gg: AYBFou3wXw8JmK0ZE69WJIGfeZkNByzO62CzG5SNbfhKnxksvUPlsWeo+Nbq8qGp79S
	soKc89eZFHMb7IO7th1w+eB7aJvGTJfTc18d2k1JGlPGPvch06jadd6IC6lh+iVHHL6YXjgsp1G
	QuWHykmXL15+EVOlSN175WGoiwNaTh+7a+bImAKy/pNy4EXISTqSs2A50fYsG4v0wW1Dp3/2nmz
	Z9nTbyrVNjfUtBToSIwH6lcxFjx752r+XP7wG9cvjmln7ogbG/ROh/KI45wrjqjlvj1EEzPDQdI
	7PoocJ036/QgEjWB+4R3vVZvr2i92xgumUQA+Fsj4+ef56ZUNnxZ0+4cVtKO57PITojC5qJt4iM
	JKUUtiy8szl7j/yv/21JqkNduMmJnJ9Ao7OMow076aHuzy2vHg01rX8BHOJhsouBMgjvojVbDtB
	kweOTSpoPXHx4hOisOu5s7J4owTUePMagM7dxtpWt2pUGFibSigHJReMkNIO2g0d3zKRB1wmRXX
	Nj1nRajwCfwqxzF9YnPvnUClA83o4maujq9qdhM/Q7cHJz2I6qk+IA5aaSKGbCz7DfOaccUTLtD
	1vziOpDWU7/OmTPNxenutdqIgFFPvH9Cw3p3+uAEAeqIEOh+OBQ/YS3/fQLf1Fa0RSVbafxIlGj
	I3+eFLXDv415MFvIyVmxOCjzSw2MpIVWmDOPvmk5z0Go4Wow=
X-Received: by 2002:a17:90b:538e:b0:38e:c232:9d3f with SMTP id 98e67ed59e1d1-396d0e20f00mr20356965a91.5.1787962277395;
        Fri, 28 Aug 2026 17:11:17 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0d38207sm9236668c88.5.2026.08.28.17.11.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 17:11:16 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 05/16] python3-pydantic: fix ptest ruff-version skew, pytest.warns skew, missing dep
Date: Fri, 28 Aug 2026 17:10:56 -0700
Message-ID: <20260829001108.559544-5-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260829001108.559544-1-khem.raj@oss.qualcomm.com>
References: <20260829001108.559544-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 29 Aug 2026 00:11:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129564

From: Khem Raj <raj.khem@gmail.com>

test_docs.py lint-checks every doc/docstring code example through
ruff (via pytest-examples). The installed ruff's rule set is not
version-locked to what pydantic's examples were written for, so ~130
style rules (import sorting, future-annotations, datetime-tz, etc.)
get flagged as failures that are not runtime bugs. Disable only the
lint step in test_docs.py; the examples are still executed.

test_deprecated_fields.py uses pytest.warns(Warning, callable,
match=...); newer pytest forwards match= to the callable instead of
consuming it, so these raise "unexpected keyword argument 'match'".
pytest API version skew; deselect via the existing -k mechanism.

test_internal.py's test_representation_integrations needs asttokens
(via executing/devtools.debug); add python3-asttokens to
RDEPENDS:${PN}-ptest.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../python/python3-pydantic_2.13.4.bb              | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-pydantic_2.13.4.bb b/meta-python/recipes-devtools/python/python3-pydantic_2.13.4.bb
index 52d2c855ec..17a6941d14 100644
--- a/meta-python/recipes-devtools/python/python3-pydantic_2.13.4.bb
+++ b/meta-python/recipes-devtools/python/python3-pydantic_2.13.4.bb
@@ -61,6 +61,8 @@ RDEPENDS:${PN}-ptest += "\
     python3-ruff \
     python3-pytest-examples \
     python3-devtools \
+    python3-executing \
+    python3-asttokens \
     ${PN}-doc \
 "
 
@@ -80,7 +82,17 @@ do_install_ptest:append() {
     rm -f ${D}${PTEST_PATH}/tests/test_mypy.py
     # We are not trying to run benchmarks
     rm -rf ${D}${PTEST_PATH}/tests/benchmarks
-    sed -i -e "/--automake/ s/$/ -k 'not test_config_validation_error_cause and not test_dataclass_config_validate_default and not test_annotated_validator_nested and not test_use_bare and not test_use_no_fields and not test_validator_bad_fields_throws_configerror and not test_assert_raises_validation_error and not test_model_config_validate_default and not test_readonly_qualifier_warning'/" ${D}${PTEST_PATH}/run-ptest
+    # test_docs.py lint-checks every doc/docstring code example through ruff via
+    # pytest-examples. ruff's rule set (import sorting, future-annotations,
+    # datetime-tz, etc.) is not version-locked to what pydantic's examples were
+    # written for, so the installed ruff flags ~130 style issues that are not
+    # runtime bugs. Disable only the lint step; the examples are still executed.
+    sed -i "s/^    if not lint_settings.startswith('skip'):/    if False:  # OE: skip ruff lint (uncontrolled ruff version -> lint-only failures)/" \
+        ${D}${PTEST_PATH}/tests/test_docs.py
+    # test_deprecated_fields.py uses pytest.warns(Warning, callable, match=...);
+    # newer pytest forwards match= to the callable instead of consuming it, so
+    # these raise "unexpected keyword argument 'match'". pytest API version skew.
+    sed -i -e "/--automake/ s/$/ -k 'not test_config_validation_error_cause and not test_dataclass_config_validate_default and not test_annotated_validator_nested and not test_use_bare and not test_use_no_fields and not test_validator_bad_fields_throws_configerror and not test_assert_raises_validation_error and not test_model_config_validate_default and not test_readonly_qualifier_warning and not test_deprecated_fields and not test_deprecated_fields_deprecated_class and not test_computed_field_deprecated and not test_deprecated_with_boolean and not test_deprecated_field_forward_annotation'/" ${D}${PTEST_PATH}/run-ptest
 }
 
 FILES:${PN}-doc += "${docdir}/${PN}"

