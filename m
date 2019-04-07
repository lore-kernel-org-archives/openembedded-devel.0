Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
	[209.85.210.178])
	by mail.openembedded.org (Postfix) with ESMTP id 623A37D5B8
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  7 Apr 2019 00:06:43 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id t21so3076869pfh.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 06 Apr 2019 17:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=lLPRg+xww53p/uGVz92x3lqoVxG+jY7ZS20mk9mXwMg=;
	b=lIqD6+aneuxzIrElvcDHkqJL52KPpP9l8XrowgTCx8NvOHLnZyknk9NDZ4cO21t+s6
	mmPUP2bryO1T7juZzfGnvu0feUOxGVAPLHCi9wVu88UkGj7K+YkGIhVwzysoflbc6R3/
	QQcFA8BcIrRJTFwwLIoq9NQqo544eN8hqPdM77FiZAgvN7H0ZEYXpNLKn8/S1aEDv10M
	jJrG1vkMNmyslCQYpkKKkPyyjMELaXNeQf+4NGFhok4Pd0YmJUKznSiO7U+StMorhdck
	FPg81Y2zM0sPe+BtudFHbLfCN27xeKxgi3HfJjIvxWZzRDNd5LxrIqn49it0v2u6iFJz
	yVGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=lLPRg+xww53p/uGVz92x3lqoVxG+jY7ZS20mk9mXwMg=;
	b=qvw169R5NfQNkN91E+b3+xuYANoq30qiMQK+fxc2/M7A5ZgtmTtofzeP229MEh8IOI
	DQER2t5JjfClEOrZITywqqMrFOiZwpOeVJIjrU9+KZBUA23g4j8LbOtgFpy2n4g4hEWR
	T4DzwQ0M1yrzMCY3zUK/hCjqL+1yjggES4YQ71py/Fmz6jdrNH0b3gS7MrkEB31SJOlB
	CVo56Uh4FncOgfdSzASw0EyN4iCmGk/aokzlShiEfgQqPB1K2E4exxCGuVeTzcb0jN4d
	tYdkQxeC9tWTnAAJdPhFH0KzsaGW/uhZGeomp1iXur0QYv+wra12iU1hNdi7IqZV/QW8
	V/UA==
X-Gm-Message-State: APjAAAVZ3tBuTUQtV7TUcYCKpghFotKChBYno+gDpdNWWNMNzhPrfwSs
	pxMNuKaCw56hpzmADp74gaVCAPD+gXg=
X-Google-Smtp-Source: APXvYqyVmzmCr+S8VxLotuI0g9fTR+/Kry6yUFE7TfiMlNIPH2WxokSkB5DHQ8iU/BlzN23Gid8Q2w==
X-Received: by 2002:a63:5b0a:: with SMTP id p10mr20474029pgb.282.1554595603492;
	Sat, 06 Apr 2019 17:06:43 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::8ec8])
	by smtp.gmail.com with ESMTPSA id
	k6sm22372469pfj.173.2019.04.06.17.06.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 06 Apr 2019 17:06:42 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  6 Apr 2019 17:06:33 -0700
Message-Id: <20190407000633.38920-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] redis: Fix ocasional parallel build failure
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
X-List-Received-Date: Sun, 07 Apr 2019 00:06:43 -0000
Content-Transfer-Encoding: 8bit

Sometimes with high parallel build we see compile errors e.g.

clang-8: error: linker command failed with exit code 1 (use -v to see invocation)
make[3]: *** [Makefile:52: lua] Error 1

Therefore try to build dependencies before main build

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/redis/redis_4.0.12.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-extended/redis/redis_4.0.12.bb b/meta-oe/recipes-extended/redis/redis_4.0.12.bb
index af99537f52..2e54f665d2 100644
--- a/meta-oe/recipes-extended/redis/redis_4.0.12.bb
+++ b/meta-oe/recipes-extended/redis/redis_4.0.12.bb
@@ -31,6 +31,10 @@ GROUPADD_PARAM_${PN} = "--system redis"
 
 REDIS_ON_SYSTEMD = "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}"
 
+do_compiler_prepend() {
+    (cd deps && oe_runmake hiredis lua jemalloc linenoise)
+}
+
 do_install() {
     export PREFIX=${D}/${prefix}
     oe_runmake install
-- 
2.21.0


