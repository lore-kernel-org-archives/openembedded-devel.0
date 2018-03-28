Return-Path: <maxi.jourdan@wanadoo.fr>
X-Greylist: delayed 450 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 28 Mar 2018 22:46:15 UTC
Received: from smtp.smtpout.orange.fr (smtp05.smtpout.orange.fr
	[80.12.242.127])
	by mail.openembedded.org (Postfix) with ESMTP id 55B8F7851A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Mar 2018 22:46:15 +0000 (UTC)
Received: from mail-qt0-f181.google.com ([209.85.216.181]) by mwinf5d40 with ME
	id Tael1x0013vQKQ103aelhm; Thu, 29 Mar 2018 00:38:45 +0200
X-ME-Helo: mail-qt0-f181.google.com
X-ME-Auth: bWF4aS5qb3VyZGFuQHdhbmFkb28uZnI=
X-ME-Date: Thu, 29 Mar 2018 00:38:45 +0200
X-ME-IP: 209.85.216.181
Received: by mail-qt0-f181.google.com with SMTP id d3so1021383qth.8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Mar 2018 15:38:45 -0700 (PDT)
X-Gm-Message-State: AElRT7HfRhslL+FyWqfXMhiL6WV6mpR0uEm+3WZ5zs9mzrZzKYRwhUg4
	6rPn9CKPvic2uC5dlyg+FzEfrMQcOpNtFTj3B3k=
X-Google-Smtp-Source: AIpwx49QJz6gA0zdSg4YVHeLpYbr1uRmFI5dP/A6fD3gV8wYXV98XA13uowK1GKzxnPoyWFjP6OSyurbM3W7hpDZ2Ec=
X-Received: by 10.200.82.140 with SMTP id s12mr8076959qtn.55.1522276724700;
	Wed, 28 Mar 2018 15:38:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.200.39.14 with HTTP; Wed, 28 Mar 2018 15:38:44 -0700 (PDT)
From: Maxime Jourdan <maxi.jourdan@wanadoo.fr>
Date: Thu, 29 Mar 2018 00:38:44 +0200
X-Gmail-Original-Message-ID: <CAHStOZ6KXHrZMVa_iydoDd-N7p_098YqJYo5hBv7Jyxx9NMOYA@mail.gmail.com>
Message-ID: <CAHStOZ6KXHrZMVa_iydoDd-N7p_098YqJYo5hBv7Jyxx9NMOYA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: [meta-clang] [PATCH] nonclangable: Add python3
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
X-List-Received-Date: Wed, 28 Mar 2018 22:46:16 -0000
Content-Type: text/plain; charset="UTF-8"

While python3 will build "successfully" with clang,
it will silently discard a few modules in the process:

Python build finished successfully!
The necessary bits to build these optional modules were not found:
_bz2                  _curses_panel         _dbm
_gdbm                 _lzma                 _sqlite3
_ssl                  nis                   readline
zlib

The lack of these modules will generate empty packages
which can later break do_rootfs.

Signed-off-by: Maxime Jourdan <maxi.jourdan@wanadoo.fr>
---
 conf/nonclangable.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/conf/nonclangable.conf b/conf/nonclangable.conf
index 720b653..7d30bc1 100644
--- a/conf/nonclangable.conf
+++ b/conf/nonclangable.conf
@@ -58,6 +58,7 @@ TOOLCHAIN_pn-openjre-8 = "gcc"
 TOOLCHAIN_pn-perf = "gcc"
 TOOLCHAIN_pn-piglit = "gcc"
 TOOLCHAIN_pn-prelink = "gcc"
+TOOLCHAIN_pn-python3 = "gcc"
 # has dpkg source which does not compile
 TOOLCHAIN_pn-start-stop-daemon = "gcc"
 TOOLCHAIN_pn-syslinux = "gcc"
-- 
2.16.2

