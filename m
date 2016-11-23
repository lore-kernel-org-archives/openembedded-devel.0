Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 5A43471AB3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Nov 2016 09:22:27 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id 144so452012pfv.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Nov 2016 01:22:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=2/vGuuB8xX0p+68S2XHr7Ar5S5/3c8rPtjd1T+TUGqU=;
	b=BPKCw1ojenGZruyV0rqzFxqM0rnw8JBfcBlF83z8Jh4DazoKF8mbnpBj2g4JjfLJ6m
	enixO7gOPRVfVMVNtJttEbTIVW4o4kbDbVQhJ2waerwxv3x4l48DjLtRq23W5PwzGj4Z
	Fb3w0nF8rOeIV7RBvFlnTdvJpLGzlUQCOS+QA7yFkcNnbNqycaCB7bu9G6SkwqeMQlk5
	HufJM70OM1JvOHG/BiobKFsJl6ndU8t9asu7+CCSEXfqNateJwH7PHjnukdWoHagReeu
	uJ5CixGwxF/xOIZMQaXnEwzgjD6aFhPBW+MpNpmlar2jw0Owob3BFJ/azBTtZ7UBF3T0
	ExIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=2/vGuuB8xX0p+68S2XHr7Ar5S5/3c8rPtjd1T+TUGqU=;
	b=Iyfh7rWj1YfoAK1c3ieSJYfTNHg4S/HW6GdSVeD569BBH/DAkK7T10MOqupNW5YBQ9
	ijd/DD8XIicQVQsXVNsWGA9WRn2RHpXWeFXQDz7kRTjkdZBFKgKBDUCxUTqYkFsx/3D9
	nwxknFWn9JDj+BF0BB/bMxLpj0S8TpxFxbWMsL06miB/2oaHDbhYtuB4HwI0ZZvzzUNh
	2VwOYR+NOhjLB7ggMnTTpD9AL+jWsNZAgdD0FMxmZxF75JeDpLnOcofOaf9R9HxIRXVM
	RmormcIWHpAhWDfSPEWBLqSgT3hf/YGEcPPPB8MM0fWSrl5qgt34Um14MbHqsWX2F3VD
	Z0Zw==
X-Gm-Message-State: AKaTC02N96nXd043o+T+MA5B0hFtsnlLcFQvb++sqovrCxZFt/39bAFuyexgLdOCiMfYTA==
X-Received: by 10.84.218.6 with SMTP id q6mr4564167pli.139.1479892949168;
	Wed, 23 Nov 2016 01:22:29 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	u23sm51056087pfg.86.2016.11.23.01.22.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Nov 2016 01:22:28 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 Nov 2016 01:21:36 -0800
Message-Id: <20161123092209.23699-16-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20161123092209.23699-1-raj.khem@gmail.com>
References: <20161123092209.23699-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 16/49] lockdev: Pretend GNU libc on musl
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
X-List-Received-Date: Wed, 23 Nov 2016 09:22:27 -0000

it has all needed features but expects " -D__GNU_LIBRARY__"
so make it happy when using musl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/lockdev/lockdev_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/lockdev/lockdev_git.bb b/meta-oe/recipes-support/lockdev/lockdev_git.bb
index 023b9a7..507ce3f 100644
--- a/meta-oe/recipes-support/lockdev/lockdev_git.bb
+++ b/meta-oe/recipes-support/lockdev/lockdev_git.bb
@@ -18,3 +18,5 @@ do_configure_prepend () {
     # Make automake happy
     touch ChangeLog
 }
+
+CFLAGS_append_libc-musl = " -D__GNU_LIBRARY__"
-- 
2.10.2


