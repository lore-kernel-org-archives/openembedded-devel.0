Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 6653B783A0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Sep 2017 17:58:04 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id i130so1019970pgc.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Sep 2017 10:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=c6Vv3BC0u0rRvjSwevF/zm0QPawyLhDoEfW2OvQYCgk=;
	b=c1kNN1cJOK/JCXkPluCIo29X0UQaEzvcpQjZFng7jDicIxLlJSjhEhOMFjwt8zevwJ
	iIMu3lLx5jPCfZy9UrWE8ULgSti3h/o+a+/erLq86h56U9O1msdjSQOrNPxoKwqX4GRg
	Fmh4PEQM3cXS0dQ+o1ACu8UJWb9/Ftl6ijlt4cgWKK+b8mB1IjazTSpPRUF6lgrdf+Ut
	MH3a6RgL97p4UrzYsjRYHexKj2qmkG0yeEMHVdcTGRZEhKsJvOtTfzgmQvjk3JGZYukm
	1GPkXHVHiaLMlAA3YA1vivJfhFG/dYKPQx5C1njL6RCx9tIJahgKpf+JY6GPBrITk+NW
	mTKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=c6Vv3BC0u0rRvjSwevF/zm0QPawyLhDoEfW2OvQYCgk=;
	b=RqQz+y240b7PHQz+SZ8ChsMQxE2TzhoeZgT9bUbh49J97ipfnZxqQ9nVpHEjdb/gxE
	nwkENG/lFUQ4eJoSTjwlMLPKQ0GrodAG4XNh8c3CiZRhHlDvzHvTxceAvs28Tm5NgOhD
	jTzVHPZlQ9ZwnTlouJepN1LpmX2RQ04/VvzUucItv6kyFW0EyATaPSpi0mZYgfI+tnVa
	2jEjVRTUVJIfEKKghih+WCMN6Y00TH7HD3xk8AtrivGDNesWIZCyoBxVT1Pjp3/6Y3hD
	UxZZWjEyHwu4kN3u7QFnVjHy5DiipZj0qMOmTgeiKVqTcmRD0+1o95evGiI3fyZoid9T
	0Ljg==
X-Gm-Message-State: AHPjjUiRlztr7WV5c6SLuiziI6e/kRYdg+Eky+FCJRbcZmUTxH2w2dQk
	Nmv4qA6M1GYtns0xMRrSQNnBlg==
X-Google-Smtp-Source: AOwi7QAx2ePsWCynrv46uW8Bph2rIyX9buIA2vE4lvbofKgyc8ffq2uSyRY8v7vGQaE6Y3uVhdOhsA==
X-Received: by 10.98.5.4 with SMTP id 4mr9870178pff.175.1506103085573;
	Fri, 22 Sep 2017 10:58:05 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::e57f])
	by smtp.gmail.com with ESMTPSA id s86sm487003pfi.74.2017.09.22.10.58.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Sep 2017 10:58:04 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 22 Sep 2017 10:57:55 -0700
Message-Id: <20170922175756.34609-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.1
Subject: [meta-oe][PATCH 1/2] mongodb: Pass computed endian variable
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
X-List-Received-Date: Fri, 22 Sep 2017 17:58:04 -0000

If not passed to SCon, it will try to guess it
and do it by poking at build host, which wont
work in cross environment

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/mongodb/mongodb_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/mongodb/mongodb_git.bb b/meta-oe/recipes-support/mongodb/mongodb_git.bb
index d44d8d3c7..13ebd23f6 100644
--- a/meta-oe/recipes-support/mongodb/mongodb_git.bb
+++ b/meta-oe/recipes-support/mongodb/mongodb_git.bb
@@ -58,6 +58,7 @@ EXTRA_OESCONS = "--prefix=${D}${prefix} \
                  --use-system-zlib \
                  --js-engine=none \
                  --nostrip \
+                 --endian='${@bb.utils.contains('TUNE_FEATURES', 'bigendian', 'big', 'little', d)}' \
                  ${PACKAGECONFIG_CONFARGS} \
                  mongod mongos"
 
-- 
2.14.1


