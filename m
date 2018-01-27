Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 4568D78876
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Jan 2018 03:24:54 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id e76so1462576pfk.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Jan 2018 19:24:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=tOuQ9yfVEYHOG8EoXte2cit5znv0BEpA4xL7s5ceHEg=;
	b=LFmf6TmwgKnI/RzxVvqRgsDOGQCE19DEtB6tk5HlriZhwB99TUD32z78DNCpIJfP9E
	fDUCP9DoO/6p15v8J3TjpE/iAuRezR3TRxTMUXGKRdKGKqS/X//8bmnqbtu68UawZ6rl
	R7qn5RaDoZDgJsyz9pGSSLRPv5V65LyiglwlGsg6XK1DMx8CkgBAN7chdh0Xwf31arrM
	TOMthZNlthiRjRZhEzrdKs3j/QqZk5yBF3LDdCT2qKLPJTjGJh4Dyv+UYaXAx+4pc8/U
	TcR8bmMylvoVFu5sSS8tTSH11AzQN+8ybiw9k143H/OdBXHbacQpc+gKsVjV8jaIy5cU
	4tVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=tOuQ9yfVEYHOG8EoXte2cit5znv0BEpA4xL7s5ceHEg=;
	b=oClXFm4obuPgQr/KbEwuzffp6bsibLq0UwerXG+EhWe+xsLEzHaWa5eMIXmmwxpG9u
	Jjf6ssb5B0lk+45HVKPY+b87uKkLAxIH5nMqSEr1LqF181XlViZA/iU/S/luwp+LM1sx
	5kc0sD3sjPQ63OgnDN62MMqYjlLTohi5bPBe6Ro4yXc1X/Z93Ue+BQlJo1lKjCxwlZwF
	hhxbwmNuL9Xpii0snFenZ0uJGAfSqcorFcMI+JaM+cau1HP1llgLiO52MLOEgnKbh2jE
	o0uLLa+WKKM9GKwHXQR+JiolQofNoJoxvkn6dHBUTA/CXqcksT86vf3B55EkLbN3ODYe
	T+AQ==
X-Gm-Message-State: AKwxytcfnLZAZ93/AcYV9eGNQyQWcWmroaHZ0M8YfJbnDg2ItC/5Sw/J
	ALTLOpl2aVrQ7CzocQS6yIBrKQ==
X-Google-Smtp-Source: AH8x226oS0Qh2UA9cUHJYlYyV7wPoLj4h+EkN0IeCUenhaqluJvZAbkWDlMe0KxEeOG3cMlth/3Nog==
X-Received: by 10.99.114.27 with SMTP id n27mr17380782pgc.424.1517023496406;
	Fri, 26 Jan 2018 19:24:56 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:2999:2a82:b9b6:e74c])
	by smtp.gmail.com with ESMTPSA id
	v22sm6692206pfa.158.2018.01.26.19.24.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 26 Jan 2018 19:24:55 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-devel@lists.openembedded.org
Date: Fri, 26 Jan 2018 19:24:16 -0800
Message-Id: <9310d5d388d1b5a7d7d761088c8a0725ab21dcc3.1517023286.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1517023286.git.akuster808@gmail.com>
References: <cover.1517023286.git.akuster808@gmail.com>
Subject: [PATCH 16/36] postgresql: Update to 9.4.15
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
X-List-Received-Date: Sat, 27 Jan 2018 03:24:55 -0000

From: George McCollister <george.mccollister@gmail.com>

Update to 9.4.15 to pickup "a variety of fixes" from 9.4.14.
Included are fixes for CVE-2017-15098 and CVE-2017-12172.

Upstream release notes:
https://www.postgresql.org/docs/9.4/static/release-9-4-15.html

Backporting all supported stable branches to this version should be
considered.

Signed-off-by: George McCollister <george.mccollister@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
(cherry picked from commit 9fb1739a7accfd2e7126ed9dcea756663bf3df07)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../postgresql/{postgresql_9.4.14.bb => postgresql_9.4.15.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/postgresql/{postgresql_9.4.14.bb => postgresql_9.4.15.bb} (67%)

diff --git a/meta-oe/recipes-support/postgresql/postgresql_9.4.14.bb b/meta-oe/recipes-support/postgresql/postgresql_9.4.15.bb
similarity index 67%
rename from meta-oe/recipes-support/postgresql/postgresql_9.4.14.bb
rename to meta-oe/recipes-support/postgresql/postgresql_9.4.15.bb
index 5a78ea3..eec099a 100644
--- a/meta-oe/recipes-support/postgresql/postgresql_9.4.14.bb
+++ b/meta-oe/recipes-support/postgresql/postgresql_9.4.15.bb
@@ -11,5 +11,5 @@ do_compile_prepend_libc-musl() {
     sed -i -e 's/\-lnsl//g' ${B}/src/Makefile.global
 }
 
-SRC_URI[md5sum] = "2b7e2a2b0232063b68b3f8a0a01902bd"
-SRC_URI[sha256sum] = "8e7df23a104b057b360d03180ebcb67f645e198a4a0bee94bf56b2bc9505ec6b"
+SRC_URI[md5sum] = "0aada0833a9208ae5fab966c73c39379"
+SRC_URI[sha256sum] = "12bfb3c7e8e45515ef921ad365e122682a5c4935dcc0032644433af2de31acc4"
-- 
2.7.4


