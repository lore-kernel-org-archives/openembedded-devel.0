Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4B12CFD313
	for <webhook@archiver.kernel.org>; Mon, 24 Nov 2025 15:11:08 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18888.1763997063583326919
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Nov 2025 07:11:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cq/ITVR1;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-477b5e0323bso28309915e9.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 24 Nov 2025 07:11:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763997061; x=1764601861; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ubC8xsk+sEiv+YwqyOM+6ViTsFgPivgQzieo+V0y4LY=;
        b=cq/ITVR1wrnRszmzs4Itj7BDGnowzYXdDlBgcBhR7Vk/ak1/qbSPmaV5aeTzL+p9Qf
         AaSxeaPD6x2f8yHsfqQzAXbycOLlHv9qoAy7AoRLrl1g6XZGZapUzoLognTJz6tZas+e
         3jhIQc5gpNqXC0XlcgrjqnGhjMoBMz4UsjoNV/W8VfI0iDGjQXk5N5Mqr5cNDKW40vb0
         Q3zxsQQi4JY4tOQBgnYwItbLtn0J840bF7G+zqe4TMpahrsuY/HBXM21q8ZlTko66vaA
         4RDteRN+b8yaExmFcpE0Z+oioie3WEm5/Zh+bczJNAGYXhEno6/QEEnROIqh3qg0KTqX
         L22g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763997061; x=1764601861;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ubC8xsk+sEiv+YwqyOM+6ViTsFgPivgQzieo+V0y4LY=;
        b=Cqjh24xO5aEhVkmCZHjirk0caVDbODBD34klRjpIcsx79fmqQU+xJAJKJ8sp2nh0aE
         MGnR8WSVQJrBddmRzUfS+6vB6KzkgINZ0i/F1PYbIscZavYQUL9HmYsnP05vDYfkSy8Q
         Ycvgz0WfWnOZ/GZk+3Kt/eCKR/6mWECqrv/jaWjn/WI5wPRmk43eO52ed8E4Y+VH7uv2
         Ean2o65Y+fVGS6qpjBwM7eVUmBDBqXu9Y4aDUT9LYbj9XL9ehUXS6HdcciixIHrqqVFW
         vtcLoTaQAezkuM7h+CWGFY6/ujUWZTjcbhVj5QeLeB8N1Y7OwLKpSjx2lLjbFGSFUthc
         pGMQ==
X-Gm-Message-State: AOJu0YyAlt86TbXna4I7SL1TcU6eDf0ma5y6nResjx2Re1Hx5/bZjjW1
	nRb/LjQRMbaVDPo5XID4LFQbmveKN6diF7m6/OPnObIcaqSf+SENOp41/JocUji9
X-Gm-Gg: ASbGncu+lb9DpAxCuw8jL30fH2txqLeYKIEsdtj+j1kMOQdCT460FV7kyi5SSay8XHy
	3AZ3BeKVlVdUPJ0548fMvOQvAS1/6rtL8moiZicsDDNknAQnZmjbMXMNRVj8JQiBC16Qi6AvEkZ
	7a5pCAXhm8rCbmdzNDKCYPBzYSQkRUnui4yB/CuHBCrJZgbFQgmCvraM1u12t0YBJla8aTQHT4p
	sc5Io98ad6+V/BG4SZ+hfVyiBD5a7f+fR+WiDJRERXCGZuDzPilwxG5Pn7A28P/OWDjBU7NZwiQ
	Ja/BmdPrD/r6UaYK8cvfP0H+HuSxTjeOg4xTguf0qvH2xFEjcR8yLoaSmOIisrWhpaNxcYkqrph
	T6iVKct8jg1SJhNgQpBThYtn4KF7KZ+pOeJVO6st/MU3OSnJuq+1pLfjZpGtSMR2B8uzob7nxzX
	t5mQs2ZM5OSwb0rfLy9EA=
X-Google-Smtp-Source: AGHT+IFE1P/1S7GWDTz2v+CifJ3smZip4/fn1ERzlvr58wYks0n06vcuatnzJ94WP6lhin+66DaU+A==
X-Received: by 2002:a05:600c:4746:b0:477:a289:d854 with SMTP id 5b1f17b1804b1-477c04cfa31mr125096505e9.5.1763997060490;
        Mon, 24 Nov 2025 07:11:00 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477a97412e3sm149092445e9.5.2025.11.24.07.10.58
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 07:10:59 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/2] tigervnc: ignore CVE-2014-8241
Date: Mon, 24 Nov 2025 16:10:57 +0100
Message-ID: <20251124151057.389723-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251124151057.389723-1-skandigraun@gmail.com>
References: <20251124151057.389723-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 24 Nov 2025 15:11:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122015

Details: https://nvd.nist.gov/vuln/detail/CVE-2014-8241

The vulnerability is about a potential null-pointer dereference, because
of a malloc result is not verified[1].

The vulnerable code has been refactored since completely[2], and the code isn't
present anymore in the codebase.

[1]: https://github.com/TigerVNC/tigervnc/issues/993#issuecomment-612874972 - attachment
[2]: https://github.com/TigerVNC/tigervnc/commit/b8a24f055f1a29886d8b18bb3f0902144dc5bd14

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-graphics/tigervnc/tigervnc_1.15.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.15.0.bb b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.15.0.bb
index dd4f79c314..d3159f8a88 100644
--- a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.15.0.bb
+++ b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.15.0.bb
@@ -85,3 +85,5 @@ FILES:${PN} += " \
 "
 
 SYSTEMD_SERVICE:${PN} = "vncserver@.service"
+
+CVE_STATUS[2014-8241] = "fixed-version: The vulnerable code is not present in the used version (1.15.0)"

