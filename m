Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
	[209.85.210.172])
	by mail.openembedded.org (Postfix) with ESMTP id 148847E16F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 May 2019 03:57:02 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id 13so8302984pfw.9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 May 2019 20:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=jbbnK01scK8GCsewLWwyQkbDqj9pZtPo6WNmDs57VJg=;
	b=qTGEKEXkKjA46TzNMI5Gkg3qAyFuZHBYOpz8G/0M1AikCQGZeX0RrymSPgiA217HzV
	zG6nfz2UncoOS4jT72fyU3kJjhuPbkFYKOT6asX0L9VAEwSJRCnqXvWjvv/pZIhzgfAz
	WN8NEzx70+0mcRQoIO+PjRo/523zzOSZ6rZirCsLNU6DyFtDad78q/GmICe6CS3vNcmr
	+PluXwDtDULjytFKbklqEPcUTGp0O+hNQjR+s/BDZ/Kk7LMBJWbDIvKqVFAif3aMOwWi
	C+bzeASfzgp06zCvieTMnrP33Q9nLInuTiIrFGZTc4DXFpni5lreGxnYNLyq52Ed94Kt
	a+FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=jbbnK01scK8GCsewLWwyQkbDqj9pZtPo6WNmDs57VJg=;
	b=I6fFiWOhFoo1S+EzDEE5WKQfqDAMVd6UPU5eBKNcotQD5t7XXKVXVMFV2JltyuhWGP
	nRYf8vx9uJjudIUzibjGqR9pqEkD/7a44wLk6T/pa8qwmJoX0Z0aQezLqHm8YB5sivbM
	aumUb+kLBMpMbt7uIPP1ti/QS36HxukYpqgazqXGDzb7rLNg0/DZIOjD3dN3bYm82gHS
	90GdDHncHZ5AKg3hZhwZQdbaBxfZxcgkOhrB/I4oxYYOXVlEAycjSJGKQpBXpn9e6Zu9
	B8i3aG354vMQdCoqGWdcplbdWnXSUOOjaHgK6YULs9k8Okf7K/yQxlnwkYp2SiGZrQ3h
	ilzA==
X-Gm-Message-State: APjAAAU+bJAAwNFcX+NHv82MauCuxqLvgiZ7U3BpesNuEYVP5o5Mvzbq
	xuySEupmtfuMv5tin8XVJGdPm6cx
X-Google-Smtp-Source: APXvYqyWGtH/Dzd6EfkMTj0kToknu3BOrwHp9MWlfwlPvD+lF20psoWW8bTpDEDGccjblv8bbN0wKA==
X-Received: by 2002:a63:4c54:: with SMTP id m20mr79929846pgl.316.1558411024149;
	Mon, 20 May 2019 20:57:04 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:199d:e2fe:5a4f:97f4])
	by smtp.gmail.com with ESMTPSA id
	h13sm23045273pfo.98.2019.05.20.20.57.03
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 20 May 2019 20:57:03 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 May 2019 20:56:32 -0700
Message-Id: <396aad10c9d9d762efbfa1eac333681872a45054.1558410874.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1558410874.git.akuster808@gmail.com>
References: <cover.1558410874.git.akuster808@gmail.com>
Subject: [warrior][patch 32/34] efivar: prevent native efivar depending on target kernel
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 21 May 2019 03:57:03 -0000

From: Martin Jansa <martin.jansa@gmail.com>

* fixes:
  ERROR: efivar-native different signature for task do_populate_sysroot.sigdata between qemux86 and qemux86copy
  Hash for dependent task linux/linux-yocto_5.0.bb.do_populate_sysroot changed from de9e49b4f66adddf9a0943db020b4eb677404e0b6ddac60073184a3855d406cb to a912d6ea21336c85c8d8a5e9db4800fccb95197744465b641eda60339bee8901

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-bsp/efivar/efivar_37.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-bsp/efivar/efivar_37.bb b/meta-oe/recipes-bsp/efivar/efivar_37.bb
index 8a56e7a..b3e8485 100644
--- a/meta-oe/recipes-bsp/efivar/efivar_37.bb
+++ b/meta-oe/recipes-bsp/efivar/efivar_37.bb
@@ -42,4 +42,4 @@ do_install_class-native() {
 
 BBCLASSEXTEND = "native"
 
-RRECOMMENDS_${PN} = "kernel-module-efivarfs"
+RRECOMMENDS_${PN}_class-target = "kernel-module-efivarfs"
-- 
2.7.4


