Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EB56C5475B
	for <webhook@archiver.kernel.org>; Fri,  8 Mar 2024 05:51:55 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web11.14898.1709877112405278230
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Mar 2024 21:51:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=R8BNUlGm;
 spf=pass (domain: gmail.com, ip: 209.85.167.50, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-51326436876so2198503e87.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 07 Mar 2024 21:51:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709877110; x=1710481910; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xNoj7QirskXF0ZRybIWoMI4Z8yp1GjoANnO2gx+XMKQ=;
        b=R8BNUlGm3+T08bQlBNXrra91oAMscYhBpIUyXvVg/HmbtyeUOYFfZbBl5pbe8uv+1g
         T2EHpBEzPA+pUBDIEHNQwkEihiE27YzOIfZRPvktvncIYihGlbbCA+YtUGOW7VNmeeD6
         xptclKNOWYv4MRdhUxKN2h0myRSqZ9qHYeLEoSLDsGQWk9v8L4tm2FL2J1rR94Eu5nVu
         5jF+jHsvVXT4t8A48XmtCS8jkVipZA/RmG77EEaNQhkx8KMyqMqo2VXYZ+z5QlAaNd3X
         P/Sq0zeLGJoeC+CDtIOvw7Q4knz542RL8Gm9lqdCaR5oWJ+QpthOr+x/8rVELUDaMzt4
         VnHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709877110; x=1710481910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xNoj7QirskXF0ZRybIWoMI4Z8yp1GjoANnO2gx+XMKQ=;
        b=w+Sp4NMVNQTOh0sbyREbJHw7OYOg7MqKjPgqZ7eqgxk6ryeuKT5bK31DIO26PfQSr+
         8vqdXrPwtr3DejiLoBquk5qENK059CGsk1uoliy2sqz1ShJET6wnWqpERa4l3vB1ivfw
         hoN1RR8kJojlHFJvOw3R/QNml6y47dh1gnzQLspa9rticBkTz6JbhrH2zsBtRA7oQ6BL
         I6/WbZwIWMX6YYbFvF1ZQtUuc3bymsda5to7tzxfUdj2jLEQVAyTlQLAvOVgTIbdTW3G
         kU07Yd33KyWtczdtzE9zGmhO1u/chz/mM2AGj4bRtO9jdGEEpfgpixJkC74ImeUDTD0i
         1zvw==
X-Gm-Message-State: AOJu0YwZMHRwTnHDR9Kjbsx0D7Dqmyz6hQG8lkcY+H2qVIqrN2javCp+
	4IeKjOp9afR0LvCjvapp9x7W1YoRLTNs0fQU79WScrjic8Gk/3GLyLzBu0lyvGE=
X-Google-Smtp-Source: AGHT+IHq7a/PJdYuANdzadBhlsP0ZDyxxqGRkpvrSkxfo0DE4AB5WrgZIMd8PFmK9tnOm/dkERDOmg==
X-Received: by 2002:ac2:494d:0:b0:513:5c10:309c with SMTP id o13-20020ac2494d000000b005135c10309cmr2534062lfi.3.1709877109508;
        Thu, 07 Mar 2024 21:51:49 -0800 (PST)
Received: from localhost.localdomain ([176.33.65.159])
        by smtp.gmail.com with ESMTPSA id bt12-20020a056000080c00b0033e3a110d7fsm13829593wrb.71.2024.03.07.21.51.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 21:51:48 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-python][PATCH 2/3] python3-responses: add recipe
Date: Fri,  8 Mar 2024 08:51:35 +0300
Message-Id: <20240308055136.81476-2-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240308055136.81476-1-alperyasinak1@gmail.com>
References: <20240308055136.81476-1-alperyasinak1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 08 Mar 2024 05:51:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109220

A utility library for mocking out the requests Python library.

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 Couldn't add ptest because throwing ERROR: Exited from signal Killed (9) after 300 sec. 
 When I tried with tox after cloning the upstream in docker, there was no problem. Somehow this error is encountered in QEMU. 
 This could happen for a variety of reasons, such as running out of memory, being killed by the system due to resource constraints, or potentially due to a bug in the code.

 .../python/python3-responses_0.25.0.bb            | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-responses_0.25.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-responses_0.25.0.bb b/meta-python/recipes-devtools/python/python3-responses_0.25.0.bb
new file mode 100644
index 000000000..f4b59c750
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-responses_0.25.0.bb
@@ -0,0 +1,15 @@
+DESCRIPTION = "A utility library for mocking out the requests Python library."
+HOMEPAGE = "https://github.com/getsentry/responses"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=0e601511a8517f4daf688a8eb95be7a2"
+
+inherit pypi setuptools3
+
+SRC_URI[sha256sum] = "01ae6a02b4f34e39bffceb0fc6786b67a25eae919c6368d05eabc8d9576c2a66"
+
+RDEPENDS:${PN} += " \
+	python3-mock \
+	python3-pyyaml \
+	python3-requests \
+	python3-urllib3 \
+"
-- 
2.25.1


