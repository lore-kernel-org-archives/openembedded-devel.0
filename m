Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E3EAEE57F0
	for <webhook@archiver.kernel.org>; Wed, 31 Dec 2025 07:55:10 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.81885.1767167702514628542
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Dec 2025 23:55:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=A7D4NmhP;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4775ae77516so106713695e9.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Dec 2025 23:55:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767167701; x=1767772501; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cHkjRYeMrVueMgdXyrlSIgr+7LHXK8cnft2KQhjUOZ0=;
        b=A7D4NmhPLGiLE+PtVstg73D8xcW2G9zVqDvgR/3OmeJU/iiJrOJ7nWG3ZJDLoY1nUb
         ZsRrZO0/VPAJo50YNSzFnMdrZ3rylbYl67LcdzyseSLZ7j0mUoTtVRqBJNBShfbII21g
         Aum4mRFujR8w80VnlvL0KYr1K8+FJNcejbt1bX6PPdPGnriWlicSElvtP4zoJtnirkEV
         G0UhYSJF8D149U0JhOMBV/M9rsCHdUZMlQXFdRpYLpAl0OM8hlKSnBjii9rOWgP/7RHc
         64rORiIU7WchZSzGG0oiP3tOJJz7z85kXdyNT0MDEoJM6meajWwVgYE9QWW8uT19qaiE
         fUmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767167701; x=1767772501;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cHkjRYeMrVueMgdXyrlSIgr+7LHXK8cnft2KQhjUOZ0=;
        b=Q6DggCnAm+Vpw44rnUkW1jEh2YYhXcoNxruv4cJPpBUSd8hjCZur0LcQpD62ttdBoH
         toQuniqcFNqfwZc/r1Z1dd8lJDUxE1+n2HqCL9AHkal4pNAafNIXyHZtul4a8IUMc0Qr
         bvDzjtBGzNRrDL+jbG51U8RiyaBH3xVDIJD0kuZQpfd7QGbvej58NzfnC8EbSZLkMRZf
         CCmda01Jo8UAS8pRzZV6JkQn4uvk0UOp5m/wkJROvZLqUsUTyK+nhYooBGSB3BXzVaWa
         MYQdLD7kn450GgnMVAqS915gNwUkKbDK46DzSYyMXfaXHBCoi7ZAtSx+SLXgSM5u1veR
         drVg==
X-Gm-Message-State: AOJu0Ywn0F5mEauPEQ99vLMfjroci5aOmXIS6OYQAc73ZBaaprpID+5D
	br+cZ9reqdBMlWU1YFuHWXBtfIxDeFhaLMgLiZqxgmWFZgouOWr3MzdIL4cxmw==
X-Gm-Gg: AY/fxX5xqcR8pf9Ec4Gl+VLMoFYKA95YI4HN8KFMTNf45gtEMTP0RhAgkyCL2Bl7e9B
	KXAXvTPHiGa+xVZkMTwUWIR8fbiEso//jGUIHzMWt/awsZPitpJp1puTdwA/+M+5fFU7hU2twaU
	n2qi/2IN8qo+Lz0vLluUTsTn48wa1WYuaGzaiXw7gYkGfC9wwsJ6riPXhfi4MejmHiW7MXVBbdR
	XBSgqEeHzkHH1hnB4Q4y8rLIXhwmyniKm+HCZmB8zVjc6vEDGyN9/odwvPYVknnIf9gN+HxgpTd
	15RFQxahYJJSwInJWQr0gKezRXhEcekxL4niTWnuK5Hr81WlvklBjnt8vmI5aqWdc8jC//uE1Yh
	fnixqTvLyUe2z0b+ulUf5CU38+mu+MXsgquIuATysDzUi8EDSWtTSLMlb4mYlIF227YBOqgoklU
	eVUJz6z3Rizr5zvQke0nA=
X-Google-Smtp-Source: AGHT+IEIkqWrr/W0uD6mY3levIuYPyK5r9eISCYFqzEzM67Jv6TWKh5OJkKSTws+WPLWM9sai1fSDA==
X-Received: by 2002:a05:600c:3b1f:b0:477:9b4a:a82 with SMTP id 5b1f17b1804b1-47d36c75e0cmr291123795e9.35.1767167700859;
        Tue, 30 Dec 2025 23:55:00 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be273f147sm700559825e9.7.2025.12.30.23.55.00
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 23:55:00 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 31/34] python3-python-multipart: set CVE_PRODUCT
Date: Wed, 31 Dec 2025 08:54:33 +0100
Message-ID: <20251231075436.771395-31-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251231075436.771395-1-skandigraun@gmail.com>
References: <20251231075436.771395-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 Dec 2025 07:55:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123071

The default python:python_multipart CPE doesn't match relevant CVE entries,
because NVD tracks the related CVEs with fastapiexpect:python-multipart CPE,
and Mitre uses kludex:python-multipart for others.

Set the CVE_PRODUCT accordingly.

See CVE db query:
sqlite> select * from products where product like '%python%multipart%';
CVE-2024-24762|fastapiexpert|python-multipart|||0.0.7|<
CVE-2024-24762|fastapiexpert|python-multipart|||0.0.7|<

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../recipes-devtools/python/python3-python-multipart_0.0.21.bb   | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-python-multipart_0.0.21.bb b/meta-python/recipes-devtools/python/python3-python-multipart_0.0.21.bb
index 29054f47a7..6fc2b69f7e 100644
--- a/meta-python/recipes-devtools/python/python3-python-multipart_0.0.21.bb
+++ b/meta-python/recipes-devtools/python/python3-python-multipart_0.0.21.bb
@@ -8,6 +8,7 @@ inherit pypi python_hatchling ptest-python-pytest
 
 PYPI_PACKAGE = "python_multipart"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
+CVE_PRODUCT = "python-multipart"
 
 RDEPENDS:${PN}-ptest += " \
 	python3-pyyaml \

