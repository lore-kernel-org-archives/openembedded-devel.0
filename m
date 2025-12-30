Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7367EEE021F
	for <webhook@archiver.kernel.org>; Tue, 30 Dec 2025 15:49:13 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.66628.1767109746793989141
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Dec 2025 07:49:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XX6EDqhu;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-477632d9326so62356225e9.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Dec 2025 07:49:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767109745; x=1767714545; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l8KIP4MSOLQ/kyer+BwzYAPfdszbR82r0Unif9Sa4Nc=;
        b=XX6EDqhu6aAjf+1HTeXIWgfNN6ffM3GuuQMxEy8Oe0sydZxUWm0jtvcVbVkub6QS1+
         Rr3QWlefT3NPhTNKQK/4OtoxNKWFu32oKC/egw43kJpbZhqOSovqS7U5/ENC86pIW71x
         zfnWelm5OS0dFksekIfsNPyHMIBsZ0ke5MC2oaPDGdHY7MGiQoGcWjFIE2+fRtrHjAR0
         bysrFxS6np293qL4JLsqSPCDt9pt4vkijQRH9Ilp0DplGlGMfyolq+bt5wnUhln0C4+J
         ouESolDAxcgQmwvNTQfY8Y2NdGrnjR/wE642VQcIuFyfHKDMjNVpp/cp1yaQkmoU0Ngs
         dWCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767109745; x=1767714545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=l8KIP4MSOLQ/kyer+BwzYAPfdszbR82r0Unif9Sa4Nc=;
        b=ep8eyJUTAnMJ3vpjRlJUhgpPPQy8/dAx4uIx+OwvVX3g4k0r3cVUc6GyFiW2zW9gmm
         LazvuqahG03+FNRjpYYor5WtLFsZqRNATwWlBBIMghu5YzIbmc4InMw4/7tQmPnl4eWm
         fsdSxRZuAAJE9WZDNszm9SbeO1uxmtjkiNl90Z9u05d2AZaTytUYXeRBhtP6YFYM1mEr
         n2OZ2lrVMLy3n1GprUO67YwiHeCBsTaXqYCpeUsSnsqW+LaAW83VQMQEkKj2gD+d2uUU
         VHg/bBmzSTVenL7kGMHEDJRrwheOf7GOgxvCoUM+VpRpBLsN9gkHeT+F+K1pbvg393wo
         WIyA==
X-Gm-Message-State: AOJu0YwiirMdhfwM0MXImiQinr6znS5KO6sXc9DZH57uT8Mc/3rGy0Rd
	2R8Cnk8IXwdU+cqDqPxByvn5iSmeMPYjPnx0akgjMtHnThKCZ3TPtFBT+TYqPQ==
X-Gm-Gg: AY/fxX4zRVeo5KbY3pxiYSppsJ7TlGP1+/0MhvhvkEjX7x2x4fCvvBfrQQsN4qw7JKy
	E8nSyuld/+3xnw32greMzAZDoOMQKKOUcgA6kyjE09HSgjMTgOwIG4+rz3hua6Z8eR5tJSH7iWi
	4+I741uML2C7rwcxD8X/fbLI+xKAimizwoemqgcDEfHEOmv+0MB1JpVKcNRQAc7vzrDenlubm9o
	cRzHPPiyFkizydSYZ669+5pvtGrQxt/B8ko80eAe/2nti5fQ7y2OUSmdbXQewYtkIq82dKVemEO
	eYghhHtEHKgu2hnLuK3lRIb28iELMnl1PThigcDQll82WzUUy6He5g8oWg0t/Qc0HbVBdOrJPHo
	hJ0OvWiYW3a74nKUo8wFnETqU1f37ukoUJLFs0DN2bzTkfh6e9n8dPml+zQaMwD7dyBPjdXXePt
	aGaB89XNJsQy6zC/mxaOY=
X-Google-Smtp-Source: AGHT+IEtXsHMCryDGwtTkrng0lsR84kBrHfkj+dIxj8jfzXtrw8c3r9Uiy2VUl/aOL0lKRiE4fajDQ==
X-Received: by 2002:a05:600d:6405:20b0:477:7a87:48d1 with SMTP id 5b1f17b1804b1-47d216bab2fmr279594865e9.30.1767109745052;
        Tue, 30 Dec 2025 07:49:05 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be3a210e7sm253051225e9.3.2025.12.30.07.49.04
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 07:49:04 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 02/10] python3-flask: set CVE_PRODUCT
Date: Tue, 30 Dec 2025 16:48:55 +0100
Message-ID: <20251230154903.736590-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251230154903.736590-1-skandigraun@gmail.com>
References: <20251230154903.736590-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Dec 2025 15:49:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123028

The default python:flask CPE doesn't match relevant CVE entries which are
tracked under palletsprojects:flask CPE.

See CVE db query:
sqlite> select * from products where PRODUCT like 'flask';
CVE-2018-1000656|palletsprojects|flask|||0.12.3|<
CVE-2019-1010083|palletsprojects|flask|||1.0|<
CVE-2023-30861|palletsprojects|flask|||2.2.5|<
CVE-2023-30861|palletsprojects|flask|2.3.0|>=|2.3.2|<

Set the CVE_PRODUCT to "flask" so it matches relevant entries.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-python/recipes-devtools/python/python3-flask_3.1.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-flask_3.1.2.bb b/meta-python/recipes-devtools/python/python3-flask_3.1.2.bb
index de4a558bff..1b289c7227 100644
--- a/meta-python/recipes-devtools/python/python3-flask_3.1.2.bb
+++ b/meta-python/recipes-devtools/python/python3-flask_3.1.2.bb
@@ -8,6 +8,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=ffeffa59c90c9c4a033c7574f8f3fb75"
 
 SRC_URI[sha256sum] = "bf656c15c80190ed628ad08cdfd3aaa35beb087855e2f494910aa3774cc4fd87"
 
+CVE_PRODUCT = "flask"
+
 inherit pypi python_flit_core ptest-python-pytest
 
 CLEANBROKEN = "1"

