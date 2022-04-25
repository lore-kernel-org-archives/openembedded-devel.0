Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4925BC48BE8
	for <webhook@archiver.kernel.org>; Mon, 25 Apr 2022 19:26:13 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web09.26894.1650872530802977715
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Apr 2022 00:42:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=BohI2dMc;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1650872528; i=@fujitsu.com;
	bh=fbszr/D10KjxoYqJHLR70hvO/dF/GosFE3UHqiyr6EA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=BohI2dMcrNQX5rZkk5wAW3R2zxdGjhYh6fIVHMkv1SecyPJka3GNxgHRBEOKjsX7t
	 EB1dWIvhDh2QxiKiwbD5sI1sV327qAiourGJRwxj2qWyVHJAX1f1lzdGKifK/cyiig
	 nOJMsXv69BwRFUzhu3RPFkt5camD2FHmQwNDtI/2o91mN5n0nd2iYNu+3AjKLTiqFm
	 +WcOcIDdjku470Ujge10Dx53C6degTgzlKdW8eP2+29QD+7KnRp/A7hNMDOcb6bOh7
	 7xJKXLiX8fU3O8zHmG/PioTkU0zxUT32QyOC3N3q9r+arETNUATL7fiNssctOU+9D+
	 HLnqrCF+Ib18g==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrGIsWRWlGSWpSXmKPExsViZ8MxSfdCQFq
  SwaoTYhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8aaBUeZC15IV+y8vJG9gfGFeBcjF4eQwBNG
  iYVTJjB3MXICOReYJE5NFoKw9zBKzFtWAmKzCahJTL91gxXEFhHQl1g6ew9YPbOAisSL3z3sI
  LawgIPEwqaNYHEWAVWJxS8/g8V5BZwkzvf1sIHYEgIKElMevger4RRwlnjS3MECsctJ4tH9qc
  wQ9YISJ2c+YYGYLyFx8MULZoheRYnZl5tZIOwKiVmz2pggbDWJq+c2MU9gFJyFpH0WkvYFjEy
  rGK2TijLTM0pyEzNzdA0NDHQNDU11jY10DS0s9RKrdBP1Ukt1y1OLS3SN9BLLi/VSi4v1iitz
  k3NS9PJSSzYxAoM4pVhh7w7Gyyt/6h1ilORgUhLlvWeSliTEl5SfUpmRWJwRX1Sak1p8iFGGg
  0NJgne3L1BOsCg1PbUiLTMHGFEwaQkOHiUR3nRvoDRvcUFibnFmOkTqFKMux4dDV/YyC7Hk5e
  elSonzcgHjU0gApCijNA9uBCy6LzHKSgnzMjIwMAjxFKQW5WaWoMq/YhTnYFQS5n3nDzSFJzO
  vBG7TK6AjmICO+FSbCnJESSJCSqqBqUr65bNYoTr2jkNVYlabnBa6su9+Vzh5Q+bE9ediJUKe
  OgndO94cuXrBC/2H7rMe8iV6OBo632v12y84ue9beeI681NyhRXvdrj/lA9YOknYJkStO/TRp
  qpLi9b8v2e70n3HxdSdQh2cP5lmsL8N6RPXk7GOmhB+/MrSZeJ/774zDigun6lyP2njwoXzVm
  /2nndmS1Ox1471KQYVv1j15ipIzTRw3ekZxb5y7kzx2/EqcdJFN++tCty2VWu5unnkK4HswMq
  dsy4tuVAZvpPXzS8qZZ3E0+sCrNOLd2VcrVWf/WvqlhVa+Qe+70mPnVGstzpl7fR361I1r+za
  8z3VxVFMM7V5nV3Rk3qH70XnM5RYijMSDbWYi4oTATCSxz9pAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-17.tower-571.messagelabs.com!1650872528!132539!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 9731 invoked from network); 25 Apr 2022 07:42:08 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-17.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 25 Apr 2022 07:42:08 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id A3A95100459
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Apr 2022 08:42:07 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 89495100451
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Apr 2022 08:42:07 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 25 Apr 2022 08:42:02 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] ostree: upgrade 2022.1 -> 2022.2
Date: Mon, 25 Apr 2022 15:41:28 +0800
Message-ID: <1650872488-31555-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1650872488-31555-1-git-send-email-wangmy@fujitsu.com>
References: <1650872488-31555-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Apr 2022 19:26:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96778

Changelog:
==========
  lib/util: add syslog.h for ot_journal_print()
  lib/bootloader: use ot_journal_print() instead of sd-journal
  main: Also support CLI extensions in '/usr/libexec/libostree/ext'
  sysroot: Add a public '#define OSTREE_PATH_BOOTED'
  deploy: Add a 5s max timeout on global filesystem 'sync()'
  deploy: Also log to journal if we time out global sync()
  core: Mark 'ostree_create_directory_metadata' as '(not nullable)'
  lib/tar: Add some error prefixing
  build-sys: Drop '-Werror=aggregate-return'
  mtree: Use declare-and-initialize style
  mtree: Load traversed subdirs when creating parents
  Release 2022.2
  configure: post-release version bump
  github: Workaround glib/seccomp issue on Ubuntu impish
  lib/repo: Add commit version metadata to summary metadata
  .lgtm.yml: Fix gpgme dependency
  lib/deploy: When deleting staged deployment, delete any lock
  ostree/deploy: Test finalization locking
  tests/kolainst: Avoid recursive symlinks
  ci/libbuild.sh: drop yum/CentOS support
  ci/make-git-snapshot.sh: fix archive name
  ci/make-git-snapshot.sh: auto-initialize submodules
  ci/make-git-snapshot.sh: xz the archive
  Add COPR integration Makefile
  lib/gpg-verify-result: Add missing floating annotation
  configure: post-release version bump
  libotutil: avoid leaking builder memory on error
  ostree: check g_setenv return value
  libostree/sepolicy: get rid of a g_setenv() call
  lib/commit: always validate metadata
  lib/commit: reject empty metadata keys
  builtin: use GCancellable and GError everywhere
  lib/repo: open file only if required
  lib/commit: clean up assertions
  lib/core: introduce two new object types for split xattrs
  lib/core: introduce 'bare-split-xattrs' mode
  lib/repo: read split xattrs content from file-xattrs-link objects
  lib/commit: disallow writing content in 'bare-split-xattrs' mode
  tests/basic-bare-split-xattrs: add fixture, check read logic
  man: Fix typo in ostree-admin-switch
  man: Fix typo in ostree-find-remotes
  s390x: add "IBM Secure Execution for Linux" support
  s390x: add LUKS keyfile to 'sd-boot'
  Fix marking static delta commits as partial
  lib/repo-refs: Remove misleading newline
  src/ostree: Add --commit-only option to ostree prune
  man/prune, bash: Add --commit-only flag for ostree prune
  tests/test-prune.sh: expand testing for --commit-only
  tests/test-prune.sh: Use TAP API
  libotutil: Avoid infinite recursion during error unwinding
  Update submodule: libglnx
  build(deps): bump libglnx from '803adaf' to '88da8dd'
  build(deps): bump libglnx from '88da8dd' to 'c71f7ae'

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ostree/{ostree_2022.1.bb => ostree_2022.2.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/ostree/{ostree_2022.1.bb => ostree_2022.2.bb} (99%)

diff --git a/meta-oe/recipes-extended/ostree/ostree_2022.1.bb b/meta-oe/recipes-extended/ostree/ostree_2022.2.bb
similarity index 99%
rename from meta-oe/recipes-extended/ostree/ostree_2022.1.bb
rename to meta-oe/recipes-extended/ostree/ostree_2022.2.bb
index cf149aef9d..24a7513188 100644
--- a/meta-oe/recipes-extended/ostree/ostree_2022.1.bb
+++ b/meta-oe/recipes-extended/ostree/ostree_2022.2.bb
@@ -21,7 +21,7 @@ SRC_URI = " \
     gitsm://github.com/ostreedev/ostree;branch=main;protocol=https \
     file://run-ptest \
 "
-SRCREV = "6c903ab0b66e0542685108e837a23a9e29845949"
+SRCREV = "fbc6d21c2f71099fbab44cbdd74222b91f61c667"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+\.\d+)"
 
-- 
2.25.1


