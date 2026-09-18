Return-Path: <devanshp@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BF78C982DC
	for <webhook@archiver.kernel.org>; Fri, 18 Sep 2026 10:06:37 +0000 (UTC)
Received: from rcdn-iport-3.cisco.com (rcdn-iport-3.cisco.com [173.37.86.74])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7653.1789725987930565833
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Sep 2026 03:06:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=U09u/Ji5;
 spf=pass (domain: cisco.com, ip: 173.37.86.74, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=5222; q=dns/txt;
  s=iport01; t=1789725987; x=1790935587;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=/4Waw1PufmU1Jw1ZGK3wrsq6JH9VPSzj9c0/GsHeNME=;
  b=U09u/Ji5u2JR/8yG96VirzM8HSHXc4Y7ej1LzJe6EZ1XVMaYnRhAhsHM
   xbOH61r5f+4zloMUtiia3iI4wi+yGW7mSsLPrVVXT/eHbgz22UUWOibOc
   ZY6uSpfW4eb9r2C23WlW+ImilbGI8itdQumMdJnQR29hkaM92spq4GxA3
   SbJcOYe+c1Crx6GPcKHUsbtzH4Gg5h8wweBowemO2f6ROKhkpLsTGpDWq
   CS2T8weazy/YD/syHFnvf0B0ADHNZgwLV5kTQne+3vSkIcCTm+21jouN3
   1tK00Ja7z/JDF0AC4VMa11uBpTmUWEQKVnnSaOXlNwb8Ap1DOebsKcJux
   g==;
X-CSE-ConnectionGUID: 6viE7xPYTbugU/7IE4xpcw==
X-CSE-MsgGUID: qtYIVir1ScWxHaClVi79ZQ==
X-IPAS-Result: =?us-ascii?q?A0BFAgCYDK1q/5D/Ja1aglmCV3VhQkkDlkeeHhSBag8BA?=
 =?us-ascii?q?QEPRA0EAQGFBY4JAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFAQEBAgEHB?=
 =?us-ascii?q?YEOE4ZPDZASAQIBNQFGLAMBAlojIRuCZwGCdAIBEcJRgiyBAYR+2zIBCxQBB?=
 =?us-ascii?q?YEzhT+IIl0ZhHwnGxuBcoEVg2mBBQGBWwKBIwSGfgSCInoSgVoebkqRFUiBH?=
 =?us-ascii?q?gNZLAFVEw0KCwcFgWYDNRIqFW4yHYEjPheBBxsGBYEdgSeCGiMZNnqBCV6BK?=
 =?us-ascii?q?ylgARAXgQeCCAKCVIIBAgFJQw4HRVMJJ0EKEkcpIggSCQETGjALfhgNSBEsN?=
 =?us-ascii?q?xUZBD5uB49KH4JaAT1RAQckgQUqFkAJHhEMBaVUoQ8KKIN2jCKVOhozhVulE?=
 =?us-ascii?q?pkIizeCU5YDTSuEPoFoPIFZcBU7gmcJShkPjjmDa8w5JDULAy8BAQcCBw4DC?=
 =?us-ascii?q?4FokAACJgeBTwEB?=
IronPort-Data: A9a23:g0wec6ICTQdW3Y/wFE+RgZQlxSXFcZb7ZxGr2PjKsXjdYENShTwHz
 TFLWWGDb/bYa2ajfNh/aIWy9kxSvp+BndNjTwcd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZpCCea+Uf1WlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnS0
 T/Oi5eHYgH9imcoajh8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN0wEkAbYp0gy9p9HG5zs
 qM5BWwddhuc0rfeLLKTEoGAh+w5J8XteYdasXZ6wHSBUrAtQIvIROPB4towMDUY358VW62BI
 ZBENHw2MEiojx5nYj/7DLoykfmhgGL/axVTqUmeouw85G27IAlZjeKwbYWLJ4XTLSlTtl+El
 0P4/n6gORolJPyW4j678y39tNaayEsXX6pXTtVU7MVCh0WewGEWAhAaWVa35PW0lEO6c9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc8BbH+t/7ESGzbDZpl7GQGMFVTVGLtchsafaWAAX6
 7NApPuxbRQHjVFfYSn1Gmu8xd9qBRUoEA==
IronPort-HdrOrdr: A9a23:NMYOX6qCrQYnNp9MfwvbkG8aV5oHeYIsimQD101hICG9vPb2qy
 nIpoV/6faaslcssR0b9OxoW5PwI080i6QU3WB5B97LN2PbUQCTQr2Kg7GP/9TIIVybygck79
 YCT4FOTPvtEFN9kcH2pCO8E9om3Z271ZrAv5a485+oJjsaEp2JKGxCe2CmLnE=
X-Talos-CUID: =?us-ascii?q?9a23=3A6ACX7moZG5FwKufaVvMJd/rmUZ47c1CC3E/hH0W?=
 =?us-ascii?q?lBlsuF5y4FU+I87wxxg=3D=3D?=
X-Talos-MUID: 9a23:6Zf9UQRXtfX+F3i/RXT1mABDCsZyup+lN1AtmL4ChcjbZB5JbmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,103,1787011200"; 
   d="scan'208";a="525576511"
Received: from rcdn-l-core-07.cisco.com ([173.37.255.144])
  by rcdn-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 18 Sep 2026 10:06:27 +0000
Received: from sjc-ads-8099.cisco.com (sjc-ads-8099.cisco.com [171.68.208.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-07.cisco.com (Postfix) with ESMTPS id C61B6180003DE;
	Fri, 18 Sep 2026 10:06:26 +0000 (GMT)
Received: by sjc-ads-8099.cisco.com (Postfix, from userid 1887503)
	id 6E9EFCC1611; Fri, 18 Sep 2026 03:06:26 -0700 (PDT)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-core][wrynose][PATCH v2] vim: Fix CVE-2026-28417 hostname regression
Date: Fri, 18 Sep 2026 03:06:26 -0700
Message-Id: <20260918100626.2884271-1-devanshp@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-8099.cisco.com [171.68.208.137];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 171.68.208.137, sjc-ads-8099.cisco.com
X-Outbound-Node: rcdn-l-core-07.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Sep 2026 10:06:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130113

From: Devansh Patel <devanshp@cisco.com>

The older Vim patch 9.2.0073 fixed CVE-2026-28417 by tightening netrw
hostname validation. That CVE fix requires follow-up regression patches
because it rejects valid hostnames containing optional ports or
underscores.

Vim 9.2.0340 already contains that CVE fix and patch 9.2.0089, which
corrects optional-port handling. It still needs patch 9.2.0553 to accept
underscores, so backport that commit and retain its _gateway regression
test.

The netrw history hunk is adapted to preserve Wrynose's existing
multi-line history and append the upstream 2026 May 28 entry. The
src/version.c hunk is omitted because this backport does not change the
recipe version or Vim's upstream patch-number table.

[1] https://github.com/vim/vim/commit/79348dbbc09332130f4c86045e1541d68514fcc1
[2] https://github.com/vim/vim/commit/a6198523fb28a50d96945458792cdb4787d3cdda
[3] https://github.com/vim/vim/commit/93d177cd2b69bac58fc51a5a514d7bc71e264b11
[4] https://github.com/vim/vim/security/advisories/GHSA-m3xh-9434-g336

Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
Changes in v2:
- Refreshed the patch against current Wrynose so the netrw history hunk applies cleanly.
- Renamed the embedded patch because Wrynose requires only one regression commit.
- Clarified the netrw header adaptation in Backport Changes.

 .../vim/files/CVE-2026-28417-regression.patch | 65 +++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |  1 +
 2 files changed, 66 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-28417-regression.patch

diff --git a/meta/recipes-support/vim/files/CVE-2026-28417-regression.patch b/meta/recipes-support/vim/files/CVE-2026-28417-regression.patch
new file mode 100644
index 0000000000..e5d947b737
--- /dev/null
+++ b/meta/recipes-support/vim/files/CVE-2026-28417-regression.patch
@@ -0,0 +1,65 @@
+From a058d0dcd289ddb934b30125ac732f737bf89eb7 Mon Sep 17 00:00:00 2001
+From: Christian Brabandt <cb@256bit.org>
+Date: Thu, 28 May 2026 20:53:53 +0000
+Subject: [PATCH] patch 9.2.0553: runtime(netrw): netrw rejects hostnames
+ containing _
+
+Problem:  runtime(netrw): netrw rejects hostnames containing _
+          (lilydjwg)
+Solution: Relax the restriction and allow the underscore
+
+fixes: #20344
+
+CVE: CVE-2026-28417
+Upstream-Status: Backport [https://github.com/vim/vim/commit/93d177cd2b69bac58fc51a5a514d7bc71e264b11]
+
+Backport Changes:
+- Wrynose's netrw header uses a chronological change-history list instead
+  of upstream's "Last Change:" field, so add the equivalent 2026 May 28
+  history entry.
+- Omitted src/version.c because this backport does not change the recipe's
+  Vim version or its upstream patch-number table.
+
+Signed-off-by: Christian Brabandt <cb@256bit.org>
+(cherry picked from commit 93d177cd2b69bac58fc51a5a514d7bc71e264b11)
+Signed-off-by: Devansh Patel <devanshp@cisco.com>
+---
+ runtime/pack/dist/opt/netrw/autoload/netrw.vim | 5 +++--
+ src/testdir/test_plugin_netrw.vim              | 1 +
+ 2 files changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/runtime/pack/dist/opt/netrw/autoload/netrw.vim b/runtime/pack/dist/opt/netrw/autoload/netrw.vim
+index c240bbd13..54be15b3f 100644
+--- a/runtime/pack/dist/opt/netrw/autoload/netrw.vim
++++ b/runtime/pack/dist/opt/netrw/autoload/netrw.vim
+@@ -24,6 +24,7 @@
+ " 2026 Mar 01 by Vim Project include portnumber in hostname checking #19533
+ " 2026 Apr 01 by Vim Project use fnameescape() with netrw#FileUrlEdit()
+ " 2026 Apr 05 by Vim Project Fix netrw#RFC2396() #19913
++" 2026 May 28 by Vim Project allow underscores in hostname checking #20344
+ " 2026 Jun 16 by Vim Project Fix filename escaping in local file deletion
+ " Copyright:  Copyright (C) 2016 Charles E. Campbell {{{1
+ "             Permission is hereby granted to use and distribute this code,
+@@ -2604,8 +2605,8 @@ function s:NetrwValidateHostname(hostname)
+   " Username:
+   let user_pat = '\%([a-zA-Z0-9._-]\+@\)\?'
+   " Hostname: 1-64 chars, alphanumeric/dots/hyphens.
+-  " No underscores. No leading/trailing dots/hyphens.
+-  let host_pat = '[a-zA-Z0-9]\%([-a-zA-Z0-9.]\{0,62}[a-zA-Z0-9]\)\?'
++  " No leading/trailing dots/hyphens.
++  let host_pat = '[a-zA-Z0-9_]\%([-a-zA-Z0-9._]\{0,62}[a-zA-Z0-9_]\)\?'
+   " Port: 16 bit unsigned integer
+   let port_pat = '\%(:\d\{1,5\}\)\?$'
+ 
+diff --git a/src/testdir/test_plugin_netrw.vim b/src/testdir/test_plugin_netrw.vim
+index a0a3915f5..8d7167793 100644
+--- a/src/testdir/test_plugin_netrw.vim
++++ b/src/testdir/test_plugin_netrw.vim
+@@ -574,6 +574,7 @@ endfunc
+ func Test_netrw_hostname()
+   let valid_hostnames = [
+   \   'localhost',
++  \   '_gateway',
+   \   '127.0.0.1',
+   \   '::1',
+   \   '0:0:0:0:0:0:0:1',
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 77f681410a..ce02c8b92d 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -45,6 +45,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https;tag=v${PV}
            file://CVE-2026-73076.patch \
            file://CVE-2026-73077.patch \
            file://CVE-2026-73078.patch \
+           file://CVE-2026-28417-regression.patch \
            "
 
 PV .= ".0340"

