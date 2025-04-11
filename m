Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 096D6C369AC
	for <webhook@archiver.kernel.org>; Fri, 11 Apr 2025 00:42:17 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web11.14148.1744332133596588816
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Apr 2025 17:42:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=U/PV9Y/T;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7369ce5d323so1274167b3a.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 10 Apr 2025 17:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744332133; x=1744936933; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cqSyYCCuqlzJsz/rV1G6M1dHcvfJATkHSfS55uOAicU=;
        b=U/PV9Y/T93huwmUZ91Opq+VUFGoWgpHb0h8hkGwbH9Yny5JK0yqOxYJQCVtgI5Mrol
         MMW3cleo/YUOZDmqpsPP6EKileR4z6YWhg+DjWPBzpHS2nMV5PxRf5D3l9Uqtc0zXOM+
         cUAvTzKGcBviEnW45Z/27CbpcMinMQ63GPG5+sLDhDG659zMeEkYOs1g4MjJ0o+C5cxt
         tPKZXNYo1gMSKSu7eWZB23EPyAfHi1Mr8eEx3264oAGDytMvQbBXHD68DkO0dQL8wCzb
         RRnOmfeRdL+hZyljEqYULqWv2zoMC2ms64fwmeWWFEGG9J0Vr33VMnHnZzpIp3XX93TK
         XtCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744332133; x=1744936933;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cqSyYCCuqlzJsz/rV1G6M1dHcvfJATkHSfS55uOAicU=;
        b=tgMn7GXF9/61ynCyLlXkdg3FhNhAeXQCcpVF693to5KOmRvomcfyqzHiLHlRu8JlLn
         VGw1np8da0jQLSJoDI6DJWkkDNYBYNmo5cGkigVEtj+l1CcfLvdiw/W22sEea/NREo40
         hbu4TvtQEny+hieVGhRwYCvquXRuIvpNeHa4ltAdkV+7J/LI3KLR6mfx63oku3/rbpCw
         yalBVpvlLw7CyAIqWS5qOu4gqzM9feKcWXsCy3H9WvkzKKse0BEFCyeGeHP/ffNB/rCG
         W2krAquODR1PHk3ztpzBFgwx5wT8ssGD1SRCajJc+VNrhatV16oZ2dkEN4kh2Uu+ztiP
         01hQ==
X-Gm-Message-State: AOJu0Yyi/Q/117+I35D61jgglAKZ0XMbk87XsAzFCmap9hYEN5U8pbHn
	9z9X+l+O9kJXRdzAUzU4DUtG9rrSUUcKy2I01M41RH/AGdtrcdb/APVrcPwa
X-Gm-Gg: ASbGnctW+vASue/pZilTe/9f/EdKU84/UXSNDbtn/ikFhEYnb71JO1HF956dOFfgjpX
	zZa7l01zP2l6PF2VvsqX+fhCS/IVst2sP2plrVL0Iq3Nvcuyb1DdTnpiD5Z2eonqb7OJhp8Q3L0
	ynY31Ck5mc4hbxdTdpYCkW+RBVaUCHtNDLjtMUa4WnzDUwOVR+LGhJzKh20QWsrfFmd/rc5LoY1
	odNXLODI/pn5smVcA+CocG0jA/pt5TQ1PcK7xFuQ0RYIKymxI3EyQxpjNVc5G/wf5VET2fdzV27
	mr1wg+5K51vpm05FGZnaDTY1zoQvUZBs
X-Google-Smtp-Source: AGHT+IEVX3cmulbNKkpAiuCFXZ/B6rYsE2wrjjj3hO4np36/le1llUpu6l6kowfzNq78NsVZAePCCA==
X-Received: by 2002:a05:6a00:b8a:b0:736:339b:8296 with SMTP id d2e1a72fcca58-73bd126735amr1216895b3a.18.1744332132742;
        Thu, 10 Apr 2025 17:42:12 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::c043])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd21c6464sm226987b3a.64.2025.04.10.17.42.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 17:42:12 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 08/12] python3-pyais: Add recipe
Date: Thu, 10 Apr 2025 17:41:57 -0700
Message-ID: <20250411004201.3826913-8-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250411004201.3826913-1-raj.khem@gmail.com>
References: <20250411004201.3826913-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Apr 2025 00:42:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116782

Ptests take < 1mins on qemux86-64/kvm

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../ptest-packagelists-meta-python.inc        |  1 +
 .../python/python3-pyais_2.9.2.bb             | 29 +++++++++++++++++++
 2 files changed, 30 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pyais_2.9.2.bb

diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc b/meta-python/conf/include/ptest-packagelists-meta-python.inc
index 03b4d685f1..47a6430c96 100644
--- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
+++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
@@ -57,6 +57,7 @@ PTESTS_FAST_META_PYTHON = "\
     python3-precise-runner \
     python3-prettytable \
     python3-propcache \
+    python3-pyais \
     python3-pyasyncore \
     python3-pydantic \
     python3-pydantic-core \
diff --git a/meta-python/recipes-devtools/python/python3-pyais_2.9.2.bb b/meta-python/recipes-devtools/python/python3-pyais_2.9.2.bb
new file mode 100644
index 0000000000..a1ae92985a
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pyais_2.9.2.bb
@@ -0,0 +1,29 @@
+SUMMARY = "AIS message decoding"
+HOMEPAGE = "https://github.com/M0r13n/pyais"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=79d9e278b76e3e5b3358cd70b328173c"
+
+SRC_URI = "git://github.com/M0r13n/pyais;protocol=https;branch=master"
+
+PV .= "+git"
+SRCREV = "9ce53ae21f19e8dc6e7b841dd0ccc246898730ea"
+
+S = "${WORKDIR}/git"
+
+inherit python_setuptools_build_meta ptest-python-pytest
+
+PYPI_PACKAGE = "pyais"
+
+do_install_ptest:append() {
+	install -d ${D}${PTEST_PATH}/examples/
+	install -Dm 0644 ${S}/examples/*.py ${D}${PTEST_PATH}/examples/
+	install -Dm 0644 ${S}/examples/*.nmea ${D}${PTEST_PATH}/examples/
+	install -Dm 0644 ${S}/examples/*.ais ${D}${PTEST_PATH}/examples/
+}
+
+RDEPENDS:${PN} = "python3-attrs python3-bitarray"
+RDEPENDS:${PN}-ptest += "\
+						 python3-coverage \
+						 python3-mypy \
+						 python3-pytest-cov \
+						 "

