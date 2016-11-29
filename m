Return-Path: <meerkoetter@googlemail.com>
Received: from mail-wj0-f195.google.com (mail-wj0-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id DC7D571B0F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Nov 2016 10:04:34 +0000 (UTC)
Received: by mail-wj0-f195.google.com with SMTP id he10so3169594wjc.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Nov 2016 02:04:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=OI+/vMVdPrFsq0GxoNUV3ZgYCFAgRavluXArdKnmTEw=;
	b=QYqEhh+uqItw0uz1gC0wl55cLHzz/YHg+C9bUkEymUV7sNk/hZ1hZ1KYobQAy4wOzG
	bNil8Wuxy3Hv4ATkZLKR6rXN0q9n7pywM0V62v6jfp37Nm7MKjl3qbc4cTuTBh4CaT9o
	zeO2hef9Z5ql4BsWIDRvu4ur99MyuB+Ak7F+TZyvKIAxKAkdghEieNZNOyP4I8AWzzmX
	DSIv0UzHiPOnevrqFD7yfUnBSHhV2/kl8dE+GqZM7abHQIyrED+NvLIRS58dYCYibmET
	3xfRfTNQYHJxazX1hPgBpHVFYZjFCC6en3V3qKKBtz5NiyXn9a1DlGU11KGxhUpH/JSX
	QvLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=OI+/vMVdPrFsq0GxoNUV3ZgYCFAgRavluXArdKnmTEw=;
	b=Vc7xG79W8c9lD0QyggEXl3QeeHxwljxXUQwuBWJNPzUokCPgATBePOpS9FX9PV626a
	g6vJs1166NeeSN9LtWmSjRS/EyCjzOPT+qMmNzoLFCGpAIaJVj4IWI2w8GOi1sq2VWs8
	vgB37kduo8iNGWLHDXY2rmaCbFSQFG+yiHTz1zpkoY4NFrGNf14ab3s/KDDg8g633JAF
	2wTIKez+RqnQEh0rTB4189tRicqwmiIkNpUp2fW9UjpoCz9BX8R8Qy+HNgKaFDLfmCYc
	17qBR1FyTYJDNRhix2VEdM/pqd1BpTBpP3wHM5BnTnxSK6MBsjLW1Gl/9sf8uEhjTieh
	hIKg==
X-Gm-Message-State: AKaTC0285C5Oh0IZ+dzmyM+POH2dbHWYfr333gBn7m1pvohMky1PJKqGBi+0tgx0q53tcg==
X-Received: by 10.194.172.3 with SMTP id ay3mr22549369wjc.84.1480413875480;
	Tue, 29 Nov 2016 02:04:35 -0800 (PST)
Received: from naos.fritz.box
	(p20030071EF35F10038C08788B208AAEC.dip0.t-ipconnect.de.
	[2003:71:ef35:f100:38c0:8788:b208:aaec])
	by smtp.gmail.com with ESMTPSA id
	e188sm1919656wma.21.2016.11.29.02.04.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 29 Nov 2016 02:04:34 -0800 (PST)
From: Frank Meerkoetter <meerkoetter@googlemail.com>
X-Google-Original-From: Frank Meerkoetter <frank@meerkoetter.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 29 Nov 2016 11:04:23 +0100
Message-Id: <1480413866-25885-3-git-send-email-frank@meerkoetter.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1480413866-25885-1-git-send-email-frank@meerkoetter.org>
References: <1480413866-25885-1-git-send-email-frank@meerkoetter.org>
Cc: Frank Meerkoetter <frank@meerkoetter.org>
Subject: [meta-oe][PATCHv2 2/5] redis: do not expose the service to the network by default
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
X-List-Received-Date: Tue, 29 Nov 2016 10:04:35 -0000

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


