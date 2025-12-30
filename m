Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8B43EE0215
	for <webhook@archiver.kernel.org>; Tue, 30 Dec 2025 14:29:12 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.65072.1767104950394852944
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Dec 2025 06:29:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=d+51tWcQ;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-47795f6f5c0so53869275e9.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Dec 2025 06:29:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767104949; x=1767709749; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rPlHt6tx4s+ye9bn9eelCDneYV17iNzN1luCFGzV1v0=;
        b=d+51tWcQbByVxwkuuhkjLCVaClwDctIln9VASgJl0PCgMaum2ZDWjFvuj8oTH++7+C
         rIa6kV28SH+EsQntK489BhTwn6Y3QWYiiFB7qKhIx3CeLBnu4wpnl/VE1eJfK/dPKyPL
         YadDj5ELuapIhLsH6TByoS1e2IJ3Wk+Grgq0JeNnqn4sZ/Iw5MToEgie3+qZdb7wZEA6
         To0luxsSR9SgC02XiYchwptcALvhlIGAbvgCZjUHMmOPxvNYbvXXmMgMAuSFn5/aoGga
         6xWxEoUIeA+U5d8fCxAAaZve27blTnTKDF7C+Js/hnu3UcljgERV7kiCZAg4lXCHsb/1
         3y3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767104949; x=1767709749;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rPlHt6tx4s+ye9bn9eelCDneYV17iNzN1luCFGzV1v0=;
        b=TwYmFor6BchmakZ6AXtNQ8Q9SQ3xMHnKq+28q3l5o60DyKjn7LtwDeutuQvP8wOuCD
         X2h9nDCz19e5gL96Q6wFLJeQ1nZoNFk3pVlT/FN78nj1RVO/6hQA/Z26/eiiej+3/4t/
         hy71ySeDMWfUzj3ZybWZhZUnnigxllFATMTvu8Z2ytRCqJEeMvnxC8D9VhtiFKLJIpV0
         8Aul85lkT5RmoxLwIgkL9k8YBXjrU5FJfHuhdXmKsjwErpjQvcUhcWqq+9lb3Oc5kSkr
         qC6/YXPKW2WOR6v7b1nX7LNc9H0mGLWpqcgWBgDoQUfrh1xfPWsceC7CdaiC4CLIu5vL
         27HQ==
X-Gm-Message-State: AOJu0YwczLvEXRBll0ERCRj3tcaKptXTN+2A1mjI7yIA3aVkYVANs0qH
	jEXSwjdetNPJTo7x/2IPMA87cdMwIdMVucYxg+Ulyg1pPpiK1PMlqt0LWArK1A==
X-Gm-Gg: AY/fxX4rL4vEBRZt3QjdGWZXp83ktZDWSHMd/MKpu8fcO04MgXQl2GtHhRpYJ961n5n
	bewRQ7ZWsJDQflxIvTROaGylAcifEfvgV2nQs0bMSjxW4NMewHn38/M+G9VdyA5bxWwkF5h+2K0
	Co+v6u7hYdNGFL+YaF0BReCf+brgotQRb4zXIdgTHLd7Awevpb3LJQ2HHqRYuq/BveJIxohD8tf
	JhJkl+Xyfbpy53cccljuY1lbliLYrKg8juksTIJbOV+PTOMUQ0Y2L8fF+NbUDSdz1PztjRJyDZW
	0DTnMIde8pzDIauODrOulQFtzXsOFaZNR9WoLQue+Jjf2oWLIPuF7EJgWPZsrOxFYmyuEtxl0vu
	8U1RC/z9t+g1nXnW5xzORYKQ/RJCSW0EBwKiqI37Ywq5fbjerrzn4aRqFstf9YuuTRzT+VCREIw
	ajjdzKGuzb
X-Google-Smtp-Source: AGHT+IH64CSPehT6ncP8mBpCDzJQOQOYy+kyubixoS6NEXTYKkv3/TqDY47linD/mDACkiC6YzF+4Q==
X-Received: by 2002:a05:600c:1d1d:b0:477:8ba7:fe0a with SMTP id 5b1f17b1804b1-47d1957da90mr393682645e9.24.1767104948705;
        Tue, 30 Dec 2025 06:29:08 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be273e4d5sm653345045e9.6.2025.12.30.06.29.08
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 06:29:08 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 08/10] python3-html5lib: set CVE_PRODUCT
Date: Tue, 30 Dec 2025 15:29:00 +0100
Message-ID: <20251230142902.730667-8-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251230142902.730667-1-skandigraun@gmail.com>
References: <20251230142902.730667-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Dec 2025 14:29:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123024

There are currently 2 related CVEs in the NIST db, both of them are tracked with
html5lib:html5lib CPE, so the default python:html5lib CPE doesn't match.

See CVE db query:
sqlite> select * from products where PRODUCT like '%html5lib%';
CVE-2016-9909|html5lib|html5lib|||0.99999999|<=
CVE-2016-9910|html5lib|html5lib|||0.99999999|<=

Set the CVE_PRODUCT accordingly.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-python/recipes-devtools/python/python3-html5lib_1.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-html5lib_1.1.bb b/meta-python/recipes-devtools/python/python3-html5lib_1.1.bb
index 94fbe0455e..8b32580d4a 100644
--- a/meta-python/recipes-devtools/python/python3-html5lib_1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-html5lib_1.1.bb
@@ -13,4 +13,6 @@ RDEPENDS:${PN} += "\
     python3-xml \
 "
 
+CVE_PRODUCT = "html5lib"
+
 BBCLASSEXTEND = "native nativesdk"

