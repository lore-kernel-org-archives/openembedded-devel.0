Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED77BC83F3B
	for <webhook@archiver.kernel.org>; Sat, 19 Jul 2025 01:35:22 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web11.2950.1752888919513629451
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Jul 2025 18:35:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=C7tlY7yg;
 spf=pass (domain: gmail.com, ip: 209.85.215.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b271f3ae786so1995680a12.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 18 Jul 2025 18:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752888919; x=1753493719; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=79XQLkPZpL0+DihZ+LcK8pHpujmuCoE3asvgM6nTqmg=;
        b=C7tlY7ygsxHZTneLhD0LxpJlPvHvdCZmpbSOdRxwDZHNlS4oU29F/DnJKVRQiKfyBN
         BOx30Zk4j9Pv5Y7qihr30kcJ+WEnod+Eu/5lbWbwVrhGuwyZsKrx3bZZLKQlEHyNOYfa
         nQan9leJdupI5gHXLLEvRUfXU2V7j2xn/bqwZ0Q8lq9o8++pZZWt3j2VejIDrrKl669L
         A+dw7KAOuCVXECTapFVINIcvF+a3Gd7Zi6fQkOETkBM87zIeVlDU9elZQix65XCqtZoJ
         c5QJf7Ww6p03dbuQ0WNEjj3FO19YqYa8B1Tv9vqQf3m7IG+N/C6L5H68QXGOnZs3jjyn
         IO4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752888919; x=1753493719;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=79XQLkPZpL0+DihZ+LcK8pHpujmuCoE3asvgM6nTqmg=;
        b=jZ5EQQP3lUgvoDJn8GqqeQtM5OCC5/LVBaeQu58a/nvTZrwB3QlYGdElGjq10zRpoc
         d1rHmW2mQtcERorsWFlVOko2MNqbhIehSSEFy8saumq6RAOz31Onid2RlnFN8KrgSsrW
         32GIngOusGRBBCx8hX75AesAh2cr4omMVLv2hDEWECQ4yCL71XGNkmBAc4pt0Qbuuo4J
         M1FnOXwg31axV3VhdunDlszsK9wTg+XdJygW8mT7v9OUw5fb0sPBU85XBvySbdHzADx7
         oLtz2nvP7Qz3IWzeXOePHLO05b9zjrFWVHCya6zNIaIMEakEqMqOk/pEZhpg8hadzOZ9
         tYbA==
X-Gm-Message-State: AOJu0YyDpDWlGvvJoIXXhPnzdMYKQahfikgFqOn6IPwBNKRp37Q4dBlC
	oUvp6LwuG+ZzHfil5FCUDRpecmnuR50YLPUytiKbuo7i5+9mkx5rjwuLEomktDDuOI0=
X-Gm-Gg: ASbGncu4u6xG7l4rOMHL1SUawU+25WQ4OjJAHj3fe9Zz3YF6DVlPMZDJ5rA8ga9DkwZ
	I7MokjqMwS3sFb6CpFDXcKJ3eYIoNPsTd33d+oR+2jOgG+KfhTfjEqKy3TpydqprGuoZ4CPhYZE
	5MGijhON8eIAkldJpmZo+Cvj4e2dCnneZxtmXjmeCQuGgHelA4/bkEO3x5JxaIgbnDvh3r1aSMi
	RVUSglbqxY/yYu7uiuyrqCPqUm8q3tw9FvA/tchcklMWS7HNoLj3rMk3kPvwnL/7nOU6bfgxqxI
	Z3SHHU/JvkfaTvltQPhzssO1WLBUUi5sY7ldnEGYNuPOz0fSvttwNOM7bEQZO9v/lS9W6qA2aW9
	e6t7ALysCQpYdKQ==
X-Google-Smtp-Source: AGHT+IE+p6OBdCxC0RIesgjcQnFwoXZqPxwZKYOWb3fLh5m6ahDLyUUxXdxmtHTaFFLU9cC9T7jW3Q==
X-Received: by 2002:a17:90b:3942:b0:30e:5c7f:5d26 with SMTP id 98e67ed59e1d1-31c9e77a443mr19586157a91.24.1752888918528;
        Fri, 18 Jul 2025 18:35:18 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::edf4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3f2fe69c80sm1818357a12.12.2025.07.18.18.35.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 18:35:17 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Jan Luebbe <jlu@pengutronix.de>
Subject: [meta-networking][PATCH 2/3] net-snmp: Do not pass LDFLAGS to compiler
Date: Fri, 18 Jul 2025 18:35:13 -0700
Message-ID: <20250719013514.277016-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250719013514.277016-1-raj.khem@gmail.com>
References: <20250719013514.277016-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 19 Jul 2025 01:35:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118632

This fixed issues like incompatible hash sections
it was added in 2009 [1], however these errors are
not seen in todays OE builds

On the contrary it regresses build with clang since
it rejects the options which results in some configure
test failures, resulting finally in build/compile failures

arm-yoe-linux-gnueabi-clang: warning: -Wl,-O1: 'linker' input unused [-Wunused-command-line-argument]

[1] https://git.openembedded.org/openembedded/commit/?id=07f750c6382476b799201b5ca47f93a5f7aa7e84

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Jan Luebbe <jlu@pengutronix.de>
---
 meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb
index 6a62304a1c..7c849cf5e7 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb
@@ -46,8 +46,6 @@ PARALLEL_MAKE = ""
 CCACHE = ""
 CLEANBROKEN = "1"
 
-TARGET_CC_ARCH += "${LDFLAGS}"
-
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6 systemd', d)} des smux"
 PACKAGECONFIG[des] = "--enable-des, --disable-des"
 PACKAGECONFIG[elfutils] = "--with-elf, --without-elf, elfutils"

