Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B526C3ABAA
	for <webhook@archiver.kernel.org>; Tue, 29 Apr 2025 12:24:07 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web10.18448.1745929440960828691
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 29 Apr 2025 05:24:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ne10gXT9;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5ed43460d6bso8843580a12.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 29 Apr 2025 05:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745929439; x=1746534239; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6mv2S6lc35GYvr3gcNnmr2lA+RU2/G2wcGm5TjMSNu4=;
        b=ne10gXT91uAgHYwcV3yFkEpa3mQsXbhABoyede+78eNPtAQUu1xR2ooysjfgcNYM7G
         8kj5MB6HIFrdw1tK2soa3uBS6HDS3iTI2p5D9LpkbGi79tMOfBjzp7cRHvAGJFMbCqd+
         6TRmNjo32nTTiFs5XERmCuRfuCOH6Ki1ikG5jFzWLNO+ZRg1al1cxk8cwNPwYJumjppv
         X8/DwzJX3UDYacdZsZma+F6bsjpjMy6NW7gTnlwLOvt1xpw7v1zQ8+hcqoqtgS8hfjpO
         oXbX6z8uCiBSH0FhWnwQw5ugqgNtD+pY+fCgUCcTKlEI2zgf7SsrLO6thJKE9zMdiamq
         OH5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745929439; x=1746534239;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6mv2S6lc35GYvr3gcNnmr2lA+RU2/G2wcGm5TjMSNu4=;
        b=BU7dssT2pIMbNeK/As95tH11MAyKUIuVkljayfE9vLXGppVI2zjO+ShKc9BP3qA64C
         nmCsf7U3nowCw/I7SnSa7eZna0nerEk3Awd7dbx51UhKHxoGYnzWQrdx4HDzY0VGP/HF
         x0nHl3twBAcoEkTgRFMLNrglM3M9ZIhtuB3YI1DapvNQE42G7+ynoxPvapAObIl5jvS/
         tn4L5mTl+Tybm1y15UnWrj9uTvNil+ozwT34b3Qfh6wVVgiHGpN6rQ0SDEon8Z2qRKum
         aKVFdfgpllj+tfBC2+htXNJf1GfcfCqOTCWOBwDRPjx2t8hNbJz5uzj/u3H7uLZyAM4g
         6llA==
X-Gm-Message-State: AOJu0YzSEqbClHjd2OOBXl0ZXyZ1VsNlwbROcdOsdJN0EDdFhMRqQ/5p
	BmL5XTLHbleSY/rZIJL3RgG3/g7My7kjNIyMRTtrdcePgmNOAcF8Q6sjgPL/
X-Gm-Gg: ASbGncs6ryX3XcA+HuOD24j9wdA7Li5O7yTNhxJzkHLTma5rHpo9hZ3uB/ch6pyLx+F
	KqgP8OxQ2WjT26fCdTv871m51VyvrOC+RvTLDv0TcjP3mAwl9XuME9juuSPyE1OBdUi/Zmbvgo3
	VPRSb1sUbC8wN2ApQ/T/JQ4OZWeNn0IaY3ZNCPACfk+SNgMgvbBYAUrtxXrcP2xY2OOexo6mBzU
	olVyoRJUTp8lWMm7vO2MzRjHXWoUVC85WXpMc7PKGr5+rYIdeSqP5iCHZTWZ6BfzUfhsCnbcaQS
	3Gwwq2uiIKQigjnNUcfO/PeRsCwHqWK9FGI3+yDBQ/nUagHCehkFHdSJ
X-Google-Smtp-Source: AGHT+IGqfrBwT86+A+CQl0RIxOu+11DOtObMK4kQNKrECVv7R3oGhrkTjKZOcQu31DqHz2r2MP6Vwg==
X-Received: by 2002:a05:6402:4307:b0:5f7:eb38:c06f with SMTP id 4fb4d7f45d1cf-5f83885f451mr3079472a12.18.1745929439130;
        Tue, 29 Apr 2025 05:23:59 -0700 (PDT)
Received: from localhost.localdomain ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f72ce7ba0csm6767873a12.6.2025.04.29.05.23.58
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 05:23:58 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/2] licenses/X11: remove license
Date: Tue, 29 Apr 2025 14:23:56 +0200
Message-ID: <20250429122356.577431-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250429122356.577431-1-skandigraun@gmail.com>
References: <20250429122356.577431-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 29 Apr 2025 12:24:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117241

This file had only one user, the keybinder recipe, which has been updated
with the correct license value.

This file actually contained MIT license text, with keybinder copyright
information.

Beside this, oe-core has the actual X11 license also available with the
same name, which shouldn't be shadowed by this.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/licenses/X11 | 23 -----------------------
 1 file changed, 23 deletions(-)
 delete mode 100644 meta-oe/licenses/X11

diff --git a/meta-oe/licenses/X11 b/meta-oe/licenses/X11
deleted file mode 100644
index da3e406240..0000000000
--- a/meta-oe/licenses/X11
+++ /dev/null
@@ -1,23 +0,0 @@
-/*
- * Copyright (C) 2008 Alex Graveley
- * Copyright (C) 2010 Ulrik Sverdrup <ulrik.sverdrup@gmail.com>
- *
- * Permission is hereby granted, free of charge, to any person obtaining
- * a copy of this software and associated documentation files (the
- * "Software"), to deal in the Software without restriction, including
- * without limitation the rights to use, copy, modify, merge, publish,
- * distribute, sublicense, and/or sell copies of the Software, and to
- * permit persons to whom the Software is furnished to do so, subject to
- * the following conditions:
- *
- * The above copyright notice and this permission notice shall be
- * included in all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
- * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
- * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
- * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
- * LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
- * OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
- * WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
- */

