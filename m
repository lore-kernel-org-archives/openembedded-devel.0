Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EFEBE8304F
	for <webhook@archiver.kernel.org>; Tue,  3 Feb 2026 19:14:20 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1606.1770146055931194725
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Feb 2026 11:14:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=MgFM2f3F;
 spf=pass (domain: konsulko.com, ip: 209.85.214.176, mailfrom: tim.orling@konsulko.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2a0d67f1877so40001955ad.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 03 Feb 2026 11:14:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1770146055; x=1770750855; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vEU77NT/OGh5WtMT1SG/roJSh36UB2OZOHZ8k9WRVfQ=;
        b=MgFM2f3FMPz3Z9QDCs29meMwHge4vU+fA99KyzMfS/icURSq1O5T6NhX6Xn9NQ+XAc
         0VX0I4LyRBp46mwAaAoZDoS8R/by/aG8qHi5rdz1Wya+DIIIB0ZwoFPI6aYBdac6ONBr
         VX8tK8HoS2BJQlcG8NmBsbm/0kiK2yLPoVdC8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770146055; x=1770750855;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vEU77NT/OGh5WtMT1SG/roJSh36UB2OZOHZ8k9WRVfQ=;
        b=RxAYrtk/F+2AFzglFSGy7ppqh4Om4RYPOsHmF7hV3/OMS8hEsghH9FEibs4ne05WrW
         3s24uMOe5rrOlFm0bMLrtiCTyfpL+mokaXRxs6D/WGpOSzWKSNaUchJaMiGGOzEwGGKL
         3a5qJpxLXG6EpXkdqfKqicoPIQUUtzvIgI/G//z/QRJOS/6pidJsg6kFf6Vo/Kf3liF0
         2/YsdSW6DwyBBFc3SyQSXp5b3gibqV4b+gs8i6xjRpx3iv1d5UI3L9BMHICwyYTSvUkV
         /a1LPVcLyQSIWtOse5uqIKgxxHPySyR4l3XPM3oFatJGFKKx7xNm1NzB2AbOb6K2ZM8O
         Td4Q==
X-Gm-Message-State: AOJu0YxhB3CjMM4ikJQ4Jx14Yn2GkaQZAy8ePhymc7qHG8nZehtbg29p
	9uU8eFF0djqDVvH3St5//UUTMp25z4Uc6v8qIYVx9xbJmDcB/tFDiLJr/tve8lKqT60bBN9stmI
	lD3Gc
X-Gm-Gg: AZuq6aKL9OfzHrHJTEMKoRdP9TzCcajAD72QNDcwaugfnQFfPK1MQkDCV8X22Wufh1x
	MJeBrgZ31E3mIYRDP8QuwX9e+9qsZh/Lv4s10GEFnvezNa1sqcwY3IxEqepqN2mfXQCBjaX/sP3
	GtzgUSRGGCJT4QTIYpTHMlLCnDTFaUDYVotKfA+1zB2/DcuAqyDtZjwENBsB6lSx26FJIXshcDm
	7Ydms5nGd2hleAtFgWFPnp/7U0aH6qQzy4JvVlCiKviQ/yfiWqkrj0pEm5qMa5zDZItj2YUqaWI
	s/+fnztsRP1ZQlYY2jM2x4uzr6lcFYi8qxRbDJ1C74/shbX0vIeIploP7izXRXvXZyA6QnyuWMu
	6auuN/EV2UM4+Rp/Xk8I6GcGjmyWUPfmvK4uFP3QY/vQU8hDxAoLKtn/zh4yP6iVf1j/SqpZPJ6
	q9bb4brE6EUBgYIBe4OaW6FCEYzdECJnK0AK9039LkdQO5BzBk4Q==
X-Received: by 2002:a17:903:1107:b0:2a7:dd37:6e20 with SMTP id d9443c01a7336-2a933fa5ecemr3206215ad.30.1770146054937;
        Tue, 03 Feb 2026 11:14:14 -0800 (PST)
Received: from localhost (c-98-232-159-17.hsd1.or.comcast.net. [98.232.159.17])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a9338a7009sm2020725ad.39.2026.02.03.11.14.14
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 11:14:14 -0800 (PST)
From: tim.orling@konsulko.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH v2 v2 4/6] python3-time-machine: add at v3.2.0
Date: Tue,  3 Feb 2026 11:13:53 -0800
Message-ID: <32d30a45ae8eb70f7cd87aaf0bd34cd66a405cc2.1770145884.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1770145884.git.tim.orling@konsulko.com>
References: <cover.1769715106.git.tim.orling@konsulko.com> <cover.1770145884.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 03 Feb 2026 19:14:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124109

From: Tim Orling <tim.orling@konsulko.com>

Travel through time in your tests.

https://time-machine.readthedocs.io/en/latest/

Dependency for python3-pendulum ptests.
Based on the recipe in meta-homeassistant.
Enable ptests.
Use git fetcher so that we have tests/ for ptest.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../ptest-packagelists-meta-python.inc        |  1 +
 .../python/python3-time-machine_3.2.0.bb      | 28 +++++++++++++++++++
 2 files changed, 29 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-time-machine_3.2.0.bb

diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc b/meta-python/conf/include/ptest-packagelists-meta-python.inc
index bece6304e8..7f4c3cc48f 100644
--- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
+++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
@@ -105,6 +105,7 @@ PTESTS_FAST_META_PYTHON = "\
     python3-starlette \
     python3-tblib \
     python3-tenacity \
+    python3-time-machine \
     python3-tokenize-rt \
     python3-tomli-w \
     python3-tomlkit \
diff --git a/meta-python/recipes-devtools/python/python3-time-machine_3.2.0.bb b/meta-python/recipes-devtools/python/python3-time-machine_3.2.0.bb
new file mode 100644
index 0000000000..8e2fa51bb4
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-time-machine_3.2.0.bb
@@ -0,0 +1,28 @@
+SUMMARY = "Travel through time in your tests."
+HOMEPAGE = "https://github.com/adamchainz/time-machine"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=fb9b93a440d3ef2fb6eeebfa59384c53"
+
+SRCREV = "1b7ac45defb26c72076dc202aba46967c8c28fa9"
+PYPI_SRC_URI = "git://github.com/adamchainz/time-machine;protocol=https;branch=main;tag=${PV};destsuffix=time_machine-${PV}"
+
+inherit pypi python_setuptools_build_meta ptest-python-pytest
+
+PYPI_PACKAGE = "time_machine"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
+
+RDEPENDS:${PN} += "\
+    python3-tzdata \
+    python3-unittest \
+    python3-zoneinfo \
+    "
+do_install_ptest:append() {
+    install -d ${D}${PTEST_PATH}/tests
+    cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+}
+
+RDEPENDS:${PN}-ptest += "\
+    python3-dateutil \
+    python3-freezegun \
+    python3-tokenize-rt \
+"
-- 
2.43.0


