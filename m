Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 261D3D7788F
	for <webhook@archiver.kernel.org>; Fri, 23 Jan 2026 17:02:39 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.120.1769187753723563858
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Jan 2026 09:02:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=m5VBNxlc;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4801d7c72a5so18003175e9.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Jan 2026 09:02:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769187752; x=1769792552; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7tYZ6ixuJutWhTjTK0iZt2xwVMzy5mZqBOpgxeJU/VM=;
        b=m5VBNxlcfQrFjnJBgV4Oh9dLcBaTu/hNFWnQHkMojPQMVBRLEXpRHSoV14U8J3KLHD
         iv6a4artnrfQ0IUz1VJ/oZVWaYHndWMpf0m4DUSWmWZIOCoeso4RCwTklwKzhZ/aJ3Nv
         j060fAh3ejrW2ILcb6yRi7ZjEOdx0trPQNk0arMy/ZF9poD6WaU+moTk5JZIxcvx6EHn
         rAQvTs0lhxY5F4Dr2XnD+ypBWW6mB0TOMZpYEnbrxy5AzPZah13QaXi5idp9wVQe+Tj+
         /WA0g2IIpV1ofmXMf+2fSJQFB7Dvhx2znUi6h4o95db6rQzjnbhpikZ3UPqObRVHfRCI
         Z+zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769187752; x=1769792552;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7tYZ6ixuJutWhTjTK0iZt2xwVMzy5mZqBOpgxeJU/VM=;
        b=aVrh8iP3YJ8jXFqJ72eraFLBSVn/n4l8RBBNboyfolTihyMB37x0IbCrcuVJLKayTi
         XAiU98HHSfgqtyNFKM8qgE+QRUYFDAut/a/+iYhXfWCC6FyXd4mNY503kxKD796lQU5j
         PxH0sM9MoXvzEhqVK1IbQcZEjhFEKQG2jv4EZjCjblPfgJYKw8fiEyHefD9a/7lOb2Gn
         +uEWlC6zfN42BzrImEKYhguZBGXowtVb7JD/eDax04qMQFBVqCPzkuL678+Rmt/Yx+u0
         onavHOY0ECiHzpj6rD3VigpuSQignLOpUmEHFo+Ey2Uu3WNcxoVffA3NpKIAFIYN/Y9m
         5YLg==
X-Gm-Message-State: AOJu0YzEugeMKjtvOYsZUV6Wt+eJH97jO/BPly6S0xFS6m/eER632uMR
	VPzdCFkiR+FnWxN6x6FQxbT4wTe247Sup3rz8+d8kSA3GM2mR0a+xZfxo18n/g==
X-Gm-Gg: AZuq6aKpXPsDcdbI7/UyCV+RStKR0ErGgEBZZCTga9BrBbqNn35xkSnqkLqWivuzDT+
	LjgeMuwV9WfeKevbFE0TkUdsUTXOVmJY1saDGQJiOXqRQJu1QSr3Czt2c8fHQ93qMCHQpHf0dxP
	89iXhPJzAceQrKoUPTUISgs75dk5jvy4nFszViMp9KD++UA1skqUS2xQF/BJ+ni6Mf2xCiPqb9w
	bue39k+pzPVx7/HkTl54OuQmx8cB9kmNqMypqI8g+j5l+gO78FgznZH0natOIb0VkwYom+v6z9R
	zJbLN28OfylHNXhD8vbIAVB1h3Hv7q+hDws+8iFxGiZPDXZK4nQL8wcLWxYknBm3fNWMN3ePk5h
	ZAt8lE2IEsCWDhjER/9ohRWaBwFGHN7c6uiiXKP4OheDj9pySU/ieb6QgFjXhH1J/qXMNolhJhu
	iOm79rSScD
X-Received: by 2002:a05:600c:64c6:b0:47e:de23:dd6f with SMTP id 5b1f17b1804b1-48050d6aebfmr39479435e9.12.1769187750346;
        Fri, 23 Jan 2026 09:02:30 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804dbd4630sm25455165e9.17.2026.01.23.09.02.29
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 09:02:29 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 09/10] openvpn: ignore CVE-2025-13751
Date: Fri, 23 Jan 2026 18:02:20 +0100
Message-ID: <20260123170221.671471-9-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260123170221.671471-1-skandigraun@gmail.com>
References: <20260123170221.671471-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 Jan 2026 17:02:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123794

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-13751

The vulnerability is Windows specific, can be ignored.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-networking/recipes-support/openvpn/openvpn_2.6.14.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-support/openvpn/openvpn_2.6.14.bb b/meta-networking/recipes-support/openvpn/openvpn_2.6.14.bb
index 305a69bec4..d9c3a4e719 100644
--- a/meta-networking/recipes-support/openvpn/openvpn_2.6.14.bb
+++ b/meta-networking/recipes-support/openvpn/openvpn_2.6.14.bb
@@ -18,6 +18,7 @@ UPSTREAM_CHECK_URI = "https://openvpn.net/community-downloads"
 SRC_URI[sha256sum] = "9eb6a6618352f9e7b771a9d38ae1631b5edfeed6d40233e243e602ddf2195e7a"
 
 CVE_STATUS[CVE-2020-27569] = "not-applicable-config: Applies only Aviatrix OpenVPN client, not openvpn"
+CVE_STATUS[CVE-2025-13751] = "not-applicable-platform: The vulnerability is Windows specific"
 
 INITSCRIPT_PACKAGES = "${PN}"
 INITSCRIPT_NAME:${PN} = "openvpn"

