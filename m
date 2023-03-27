Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BEE9C77B61
	for <webhook@archiver.kernel.org>; Mon, 27 Mar 2023 12:50:09 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web11.33983.1679921408983622836
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Mar 2023 05:50:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Rq7XmBOU;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: zboszor@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id b20so35773281edd.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 27 Mar 2023 05:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679921407;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6J8fTL+eVcuYN0SqDwmN3qElWHc0xv04VMPCuFUcW8I=;
        b=Rq7XmBOUNZURQH5RIbO746hkggRCJlru+PALNk8wYfTf1ARok/A9W70YrN3iqm5cXJ
         UGfqpaOZUjMHfwdvnuTzOqES8/o1S5Opm4srb5scZzZobpCuST3JACHFcSsyvhF0dBc2
         oGZcRrKcJbOBRzuIGAEHgoHOlVngwNkLl79FqhfKhCiswMlPe0kzc3U14bM4D8ZP1NZM
         uz3EyjRZpO0Zo5PDs/Q3+XAmluRFRZ+7itFYCjGV9MpERpOUfyZ6wnvRAqUXX4NJloj/
         9rKxAZSFJtdhNs+PpHpsmAiZlVGbu4Ha3sE0tdDiyBxe+kyZlPP9wcc0awI8l598rANM
         FUhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679921407;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6J8fTL+eVcuYN0SqDwmN3qElWHc0xv04VMPCuFUcW8I=;
        b=2vsSKGl6OSMaa6zsn4IBk2klSY2MpIgpKof1413QztOATg7KrlkFlB2f4ETlZYaFbw
         aqFAMEt4qE0hugkoHl4edkW3+QWQx+8XMpPCzyQh1Cu7G/8lx53Z7cxL146ZU4fdpyKT
         kldXEv+gRpFH61ZeWkQAIMSeGsA5XQGz3lee/l5KyURjnbJLxGUASYPgT8CMW7g0UeTP
         EGMiFJCbjl5Lsuk+41GgoFpZKTUvIQrxkMF7qWVHujy+rMQsEFyQT8kiBUW6vs8aY6Ju
         wvtbI0qVrsea8e6WlI3aT4R4tQdm3yF7Cic0f9Gz09Qu3ie6jkmXzXw/N8Rb4gLLSMR/
         o26w==
X-Gm-Message-State: AAQBX9daIOYDGWaFLMf8083Q9Vbt5+ecaJHLrzlyJ6f/FqOcS1QfyV2G
	ljhGZeJgZmFwxEqgF1XtBm9rXS+IEvo=
X-Google-Smtp-Source: AKy350b6qUbmsUQRasqENRH6W/1LFimlQzVCfgpcyDXLHoTQzXpruOmPVwhwSTkRJ2eYflFTjfLU7g==
X-Received: by 2002:a05:6402:125a:b0:4fe:9689:96bb with SMTP id l26-20020a056402125a00b004fe968996bbmr12696171edw.35.1679921407248;
        Mon, 27 Mar 2023 05:50:07 -0700 (PDT)
Received: from localhost.lan (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id z21-20020a50cd15000000b004acbda55f6bsm14657722edi.27.2023.03.27.05.50.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 05:50:06 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [meta-python][PATCH 3/4] python3-stack-data: New recipe
Date: Mon, 27 Mar 2023 14:50:01 +0200
Message-Id: <20230327125002.90472-3-zboszor@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230327125002.90472-1-zboszor@gmail.com>
References: <20230327125002.90472-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Mar 2023 12:50:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101781

Dependency of python3-ipython.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 .../python/python3-stack-data_0.6.2.bb          | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-stack-data_0.6.2.bb

diff --git a/meta-python/recipes-devtools/python/python3-stack-data_0.6.2.bb b/meta-python/recipes-devtools/python/python3-stack-data_0.6.2.bb
new file mode 100644
index 000000000..4d62471ed
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-stack-data_0.6.2.bb
@@ -0,0 +1,17 @@
+SUMMARY = "Extract data from python stack frames and tracebacks for informative displays"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=a3d6c15f7859ae235a78f2758e5a48cf"
+
+DEPENDS = "python3-setuptools-scm-native"
+
+PYPI_PACKAGE = "stack_data"
+
+inherit pypi python_setuptools_build_meta
+
+SRC_URI[sha256sum] = "32d2dd0376772d01b6cb9fc996f3c8b57a357089dec328ed4b6553d037eaf815"
+
+RDEPENDS:${PN} = " \
+	python3-executing \
+	python3-asttokens \
+	python3-pure-eval \
+"
-- 
2.39.2


