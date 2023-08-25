Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AFB6C71134
	for <webhook@archiver.kernel.org>; Fri, 25 Aug 2023 08:54:14 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.9422.1692953649658023699
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Aug 2023 01:54:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=bx3gT/5e;
 spf=pass (domain: konsulko.com, ip: 209.85.221.42, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-317f1c480eeso548737f8f.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 25 Aug 2023 01:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1692953648; x=1693558448;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Xg/r9d9I/KLS3KNlwnqXtBvW0dfUaZMYIgSMsRIaaiA=;
        b=bx3gT/5eMsvHaB1RS7LYrlYwIK9AJ6mNhRvirZ7oK9BH/p6N8ByAS+PyhbhjmDqKqu
         /9d6kXMaBLtAvFVlC0APAANhOfuxktFDeNZESI3b5+3kBuymVuxCnx6hbW7gsW8RnNNB
         2YIr8EtG2xTqh7PBtq9SHbvuKMsPLg+YTIXWE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692953648; x=1693558448;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xg/r9d9I/KLS3KNlwnqXtBvW0dfUaZMYIgSMsRIaaiA=;
        b=d//sYhBSXbXnxnlwLCHlPF1KO2jLjtrah+nQorDichOtFjyDc6gEjGwH6VZHo82yZf
         jcSVN54hL/PyYHiPlkibsq38v5K9LqNjUo5ve+6uOAXqrceLJoAhJBjX03TuAWuVGnPz
         ZbI02nyn1PH661VTI3WzW5t2bPkWufL7X3eqEf6LQy7A5hI/8E+T2RHx3yhN6CYvhlIr
         ifB6xSn7ojzHmyzna3qW+Q9c344SdZMwYrLithZVTKYDlnWoD5BgE4VJdGL0mNEitYra
         rmqltO69zQtOIvdZSDXVZSXkr3k08n7UEUIu667YTTgehgHGMxEfFVB3Ecg46cGCG+3K
         LM3g==
X-Gm-Message-State: AOJu0Yxq6RFvKVGKjpC8HOTLYcLOhOy8x09OPh+jFh8KDCTCnMj96Cgk
	wrjtLAq3VoL6pI0ofKXXvkzHQMVmSfMfNOANmxA=
X-Google-Smtp-Source: AGHT+IFXLN9P/qjxpa72R6y75Xk25ukucozbTd3sAFDhAATLEV+BIlpzpP8GRrPSkauX9XP1WgipNg==
X-Received: by 2002:a5d:6d42:0:b0:316:e249:c285 with SMTP id k2-20020a5d6d42000000b00316e249c285mr11875165wri.71.1692953647704;
        Fri, 25 Aug 2023 01:54:07 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id n14-20020a5d51ce000000b0031ad5470f89sm1597128wrv.18.2023.08.25.01.54.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Aug 2023 01:54:07 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-oe][PATCH 1/2] aml: add new recipe
Date: Fri, 25 Aug 2023 11:54:04 +0300
Message-Id: <20230825085405.2956415-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 25 Aug 2023 08:54:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104607

Add a new recipe for aml (Andri's Main Loop) v0.3.0. It is
required for neatvnc which is required for building Weston with
VNC backend.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 meta-oe/recipes-graphics/aml/aml_git.bb | 35 +++++++++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/aml/aml_git.bb

diff --git a/meta-oe/recipes-graphics/aml/aml_git.bb b/meta-oe/recipes-graphics/aml/aml_git.bb
new file mode 100644
index 000000000..eed62adae
--- /dev/null
+++ b/meta-oe/recipes-graphics/aml/aml_git.bb
@@ -0,0 +1,35 @@
+SUMMARY = "Andri's Main Loop"
+DESCRIPTION = "Andri's Main Loop"
+HOMEPAGE = "https://github.com/any1/aml"
+LICENSE = "ISC"
+LIC_FILES_CHKSUM = "file://COPYING;md5=e6f3cfaa39204b96e14b68b9d50d3e4e"
+
+SRC_URI = "git://github.com/any1/aml;branch=master;protocol=https"
+
+SRCREV = "b83f3576ce4187d9285f06e9066ef43a691464d4"
+
+PV = "0.3.0+git${SRCPV}"
+
+S = "${WORKDIR}/git"
+
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[examples] = "-Dexamples=true,-Dexamples=false"
+
+PACKAGE_BEFORE_PN += "${PN}-examples"
+ALLOW_EMPTY:${PN}-examples = "1"
+FILES:${PN}-examples = "${bindir}"
+
+inherit meson pkgconfig
+
+AML_EXAMPLES = "ticker nested-ticker reader"
+
+do_install:append () {
+	if ${@bb.utils.contains('PACKAGECONFIG', 'examples', 'true', 'false', d)}; then
+		install -d ${D}${bindir}
+		for bin in ${AML_EXAMPLES}; do
+			install -m 0755 ${B}/examples/$bin ${D}${bindir}
+		done
+	fi
+}
+
+BBCLASSEXTEND = "native"
-- 
2.39.2


