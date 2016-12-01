Return-Path: <meerkoetter@googlemail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 13DB971B46
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Dec 2016 18:45:43 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id u144so35511045wmu.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Dec 2016 10:45:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=OI+/vMVdPrFsq0GxoNUV3ZgYCFAgRavluXArdKnmTEw=;
	b=o4iWxJui5Zv4kvPeU7u7ufy/C4xfE1rZ3ZMIhR0ZBLLlnxWkYCJyLKsuZIwQgQqvCB
	0mb85M7AahOOVmF9GxLme0IVjrEdOwm353yBJrcP0fy40e49Toh23BzW2NtkXNDA2/Vc
	l+I9NOYd1KbPF2qt8TLykrnKHrCjvj/xbR3+Z62gJOJeg3+Ll6uKu72N6bbz5WV8oK4m
	UvITJ3eM7smOgtssEDTBbNXi6HmqgDRcmEBjhBdPPgHS7U/HHdZVVtT6h0ad9HX6PlAN
	VDUrLN9zjAsWmyAVXS68EyXpVAyc6AgprwlLYOg0ZlNIL1ysmzrxvBpmLAt404NsJjmt
	KpFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=OI+/vMVdPrFsq0GxoNUV3ZgYCFAgRavluXArdKnmTEw=;
	b=K17KK+h1MjzWQainqCOyxMj4b+4nH/7aW4JzoyXoutMF5f11m8kFG2DW3D+ctDt0rm
	zEn0EGH4HiZcLfjDgPaXMcHkudnxLNGfe1uN0VbcpDugdRwmWioZBJj3f2qAYxOLFBVt
	puH91SGOxE1330d4vFraclOUR4qtzTZVFibNNT5E4plcTt1EmnY0pECuezlIEH7rQfW8
	P7m0Opg15tRykI0KrzZAwXXUzchLxyGrXhhhf2dRr18VzMzvU0P0dIFrkAEFpQhzIZ24
	lR3Sv3G4i3en/n7yFvO2pt286C+2XeKGu+SORcDvEctSop488uUlO9YkEJXjYrIp8dQ8
	/0lA==
X-Gm-Message-State: AKaTC01eXJK6ZLST38bLABabxKtR3+nYN0E5E7idAKWpJ316//mhIwPbBdSJwR1z3hMjkw==
X-Received: by 10.28.209.67 with SMTP id i64mr36396887wmg.48.1480617944470;
	Thu, 01 Dec 2016 10:45:44 -0800 (PST)
Received: from naos.fritz.box
	(p20030071EF34510078AFC66E4F3A2DFD.dip0.t-ipconnect.de.
	[2003:71:ef34:5100:78af:c66e:4f3a:2dfd])
	by smtp.gmail.com with ESMTPSA id w79sm2284746wmw.0.2016.12.01.10.45.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 01 Dec 2016 10:45:43 -0800 (PST)
From: Frank Meerkoetter <meerkoetter@googlemail.com>
X-Google-Original-From: Frank Meerkoetter <frank@meerkoetter.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  1 Dec 2016 19:45:24 +0100
Message-Id: <1480617927-26478-3-git-send-email-frank@meerkoetter.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1480617927-26478-1-git-send-email-frank@meerkoetter.org>
References: <1480617927-26478-1-git-send-email-frank@meerkoetter.org>
Cc: Frank Meerkoetter <frank@meerkoetter.org>
Subject: [meta-oe][PATCHv3 2/5] redis: do not expose the service to the network by default
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
X-List-Received-Date: Thu, 01 Dec 2016 18:45:44 -0000

Binding it to localhost is a safe default.
This affects both sysv and systemd based systems.

Signed-off-by: Frank Meerkoetter <frank@meerkoetter.org>
---
 meta-oe/recipes-extended/redis/redis/redis.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/redis/redis/redis.conf b/meta-oe/recipes-extended/redis/redis/redis.conf
index 923b98e..b932089 100644
--- a/meta-oe/recipes-extended/redis/redis/redis.conf
+++ b/meta-oe/recipes-extended/redis/redis/redis.conf
@@ -30,7 +30,7 @@ port 6379
 # If you want you can bind a single interface, if the bind option is not
 # specified all the interfaces will listen for incoming connections.
 #
-# bind 127.0.0.1
+bind 127.0.0.1
 
 # Specify the path for the unix socket that will be used to listen for
 # incoming connections. There is no default, so Redis will not listen
-- 
2.7.4


