Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
	[209.85.210.174])
	by mail.openembedded.org (Postfix) with ESMTP id 4152160CC9
	for <openembedded-devel@openembedded.org>;
	Sun,  9 Feb 2020 16:17:22 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id k29so2403566pfp.13
	for <openembedded-devel@openembedded.org>;
	Sun, 09 Feb 2020 08:17:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=NEirFD7SDZMMxPJRT5gvVZdqPhn0vNWmTYUBu+2nwhk=;
	b=by5LVj55OfHQSufncgzkzvzwrXVHZsQ57Op19x3LUA2yE3zYmzeVID/HngaZqXEu8S
	aLq8WasD2EvxDYf9t6L5c+Zx+Vozh3Lsx7SerpoT323pi07TqcUnkg7smtGm/0C5UYI1
	ebhqsNhsqM1wrif0m51Bbea7Ml0091nvaVgm3dePinzaEjQD1eYjG/36lLmL60jDpG1q
	IJQqUKiUP6nj9DqzwMR2j62GqqsnISkrYGoIATXsLmXOj9VMQsCQmZbm/DzA1q1WHnHa
	f39bvGGZJqcnaKpqTDKIu3NP5Ih8dTqKhBeU/QCWlCwe3UQPlq6lYUPN8ZpOT6Lv+Idg
	Ar8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=NEirFD7SDZMMxPJRT5gvVZdqPhn0vNWmTYUBu+2nwhk=;
	b=mXdMsVVIRkcrmipdW9lJkvT4axL3dD5hi2JvcFA1gPfhNqPUAWThjZscnaTbE+AdwC
	QXGSxwxn0DmGuTJUE8h947JxYrR9p2hVP5LLu9G/JR/vYpQ2y2kPGZn3KrUYjisiteK2
	tXUxkByPFLKMK8Sif3qDURgrC/zsfVo8Mtx/N5LXiG1OhlaXEzhi8jm/5SVzEVlRWYVP
	J/p8CTbA2u2Z6RE1TTqqpUjqfzFz3lvmnoMWifo/AZpv2qZQ816/ZicFJaDYfrVYWbJo
	hNpxjHi9CZCw4rMvOp87DSFlaexZa7eU4TDP/DbxNdDQgUu3wRKK/HywmAQsYbiI1m//
	X4+g==
X-Gm-Message-State: APjAAAWeLlKjZO+cnMSuP8hmhR/uLGzKZ9BcPlz3cMzXTDvapIcnUjOB
	+lWokm81O2Kap1aPoB26MJYcFevh
X-Google-Smtp-Source: APXvYqwOgJCj5Je+fehUoFHd7fxfy7wqqP/mjBFmsXu+dyP/r4gfsluHf4mMtglX6hH63lZdrlKsIA==
X-Received: by 2002:aa7:8605:: with SMTP id p5mr8856694pfn.87.1581265043126;
	Sun, 09 Feb 2020 08:17:23 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:154b:3780:5122:4aa9])
	by smtp.gmail.com with ESMTPSA id
	a19sm8831737pju.11.2020.02.09.08.17.22
	for <openembedded-devel@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 09 Feb 2020 08:17:22 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@openembedded.org
Date: Sun,  9 Feb 2020 08:17:08 -0800
Message-Id: <cover.1581264950.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [zeus 00/11] Patch review
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
X-List-Received-Date: Sun, 09 Feb 2020 16:17:22 -0000

Here are the next set of changes for meta-oe zeus.
Please have commnets back by Tuesday

The following changes since commit 81e186f6141a6e8f4ab3185b00b9f1392bb89ca1:

  adduser: set default shell with /sbin/nologin (2020-01-19 09:05:19 -0800)

are available in the Git repository at:

  git://git.openembedded.org/meta-openembedded-contrib stable/zeus-nut
  http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=stable/zeus-nut

Khem Raj (6):
  squid: Link with libatomic on riscv
  grpc: Link with libatomic on clang/x86
  grpc: Link with libatomic on powerpc
  grpc: Link with libatomic on riscv
  netdata: Add libatomic to link step
  fluentbit: Fix packaging in multilib env

Peter Kjellerstedt (1):
  gitpkgv.bbclass: Add support for extending the supported tag formats

Sumit Garg (1):
  mariadb: fix library LZ4 lookup

Trevor Gamblin (2):
  python-twisted: add required RDEPENDS for twistd
  pyhamcrest: add python3 version of recipe

Yi Zhao (1):
  libldb: upgrade 1.5.5 -> 1.5.6

 .../recipes-daemons/squid/squid_4.6.bb        |  2 ++
 .../recipes-devtools/grpc/grpc_1.24.1.bb      | 16 ++++++++++
 .../{libldb_1.5.5.bb => libldb_1.5.6.bb}      |  4 +--
 meta-oe/classes/gitpkgv.bbclass               | 14 ++++++---
 meta-oe/recipes-dbs/mysql/mariadb.inc         |  1 +
 .../mariadb/0001-Fix-library-LZ4-lookup.patch | 30 +++++++++++++++++++
 .../fluentbit/fluentbit/cmake_multilib.patch  | 18 +++++++++++
 .../fluentbit/fluentbit_0.12.19.bb            |  1 +
 .../python/python-twisted.inc                 | 18 ++++++++++-
 .../python/python3-pyhamcrest_1.9.0.bb        | 10 +++++++
 .../recipes-webadmin/netdata/netdata_git.bb   |  2 ++
 11 files changed, 109 insertions(+), 7 deletions(-)
 rename meta-networking/recipes-support/libldb/{libldb_1.5.5.bb => libldb_1.5.6.bb} (95%)
 create mode 100644 meta-oe/recipes-dbs/mysql/mariadb/0001-Fix-library-LZ4-lookup.patch
 create mode 100644 meta-oe/recipes-extended/fluentbit/fluentbit/cmake_multilib.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-pyhamcrest_1.9.0.bb

-- 
2.17.1


