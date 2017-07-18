Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lf0-f65.google.com (mail-lf0-f65.google.com
	[209.85.215.65])
	by mail.openembedded.org (Postfix) with ESMTP id 24CE277F70
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Jul 2017 09:51:03 +0000 (UTC)
Received: by mail-lf0-f65.google.com with SMTP id w198so665986lff.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Jul 2017 02:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ga++qS2FK3ryOI8tINjck3cpG8pzh3kBaZ2HNHm+bOw=;
	b=CG9Xoyz0Vvy1PhxrJHl6zbJ5ctbXqkXZR6xe/1hraILNJM3pJKrKgMpKmnNd2jJuLg
	WoyogLf9SfP4qjA0jR/ZicMT9781Z+Lae29kmGnRiB9FvCkdFGdSZ7uRsg6wg4qSFewI
	lM3xoYZY22p2QLv6vDs11hiDToHgvCrVMsXBfLPjLfbTnQ4pokf+/QjikDfL4G4sixZA
	D6jP/kmKaniI7QbUfHJz+ZDe9DChvayZFsxMdGuRRFTIIHe3tyzz3SdfMLrvRGXaL9Xp
	RyBh3qMqR8HVjj+dG/iNXf1yn0ydTZDMxZ2GtKWsrCqABA97bdZP/VpEtLJCdnPuF3xv
	v59Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ga++qS2FK3ryOI8tINjck3cpG8pzh3kBaZ2HNHm+bOw=;
	b=qL3e9dGHWC2th38CeEIKHyAo4GhM7+idLUqR2tLvkbOzkeX7KppcSC7noBC6EENk2c
	6PH3WimHW/cEju8npkslCWGS/YQMyQPg9VJn4bC2ghP4afDvekx3hZJI3NItcaQkGlTr
	PnXYYJaogVzqVedryKXkWKCzw/hm8SVoQZP/E+RHRvD/03Bp6iaS3x3TDO9B+R9PmvZS
	usOOWvIh8BOOE20n8AVoUwQELRelmHecc10fzHXnFLLh5xGNqUHFgMmZhZofaR67XNKp
	6bY4AktEeUi/RPX9EOYSxylJre8DFwjHoYAPO5JiE0TT8ZW4oQ4jA3fJfGA9m/8R3mvg
	vhCg==
X-Gm-Message-State: AIVw113E57p7/0+SS6pSBP7MUPq0fNo3ktYpVdTIfg8wlZ0fbUbYD1wr
	yucqA6KPDxf6XH9ZOJQ=
X-Received: by 10.46.71.207 with SMTP id u198mr349759lja.33.1500371463900;
	Tue, 18 Jul 2017 02:51:03 -0700 (PDT)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id x62sm441459lfa.13.2017.07.18.02.51.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Jul 2017 02:51:02 -0700 (PDT)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Jul 2017 11:50:55 +0200
Message-Id: <20170718095055.32249-4-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <20170718095055.32249-1-ricardo.ribalda@gmail.com>
References: <20170718095055.32249-1-ricardo.ribalda@gmail.com>
Subject: [PATCH] llvm-config: Fix implementation of --libs flag
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
X-List-Received-Date: Tue, 18 Jul 2017 09:51:03 -0000

llvm-config is called by mesa with the following parameters:

llvm-config --libs liba libb libc libd .....

This result in an invalid call of llvm config:

llvm-config --libs
llvm-config liba
llvm-config libb
llvm-config libc
....

Fix this use.

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 recipes-devtools/clang/llvm-common/llvm-config | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/recipes-devtools/clang/llvm-common/llvm-config b/recipes-devtools/clang/llvm-common/llvm-config
index 9fb14cb74cdc..4462896af6e2 100644
--- a/recipes-devtools/clang/llvm-common/llvm-config
+++ b/recipes-devtools/clang/llvm-common/llvm-config
@@ -14,6 +14,10 @@ if [[ $# == 0 ]]; then
   exec "$NEXT_LLVM_CONFIG"
 fi
 
+if [[ $1 == "--libs" ]]; then
+  exec "$NEXT_LLVM_CONFIG" $@
+fi
+
 for arg in "$@"; do
   case "$arg" in
     --cppflags)
-- 
2.13.2


