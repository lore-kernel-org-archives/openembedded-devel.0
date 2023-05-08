Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A95DC77B73
	for <webhook@archiver.kernel.org>; Mon,  8 May 2023 10:08:18 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web10.103656.1683540488708915370
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 May 2023 03:08:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=d9YxYyev;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1683540487; i=@fujitsu.com;
	bh=croRJ7uIP3tZnfQoVU9y79XOlGrF/+e25z8TgWB/jUs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
	b=d9YxYyevKtWE16PqYM2PSs78tuSKZIXjCPLHw3uFjx/oaybdeKeIIjz2gWsdKkvYt
	 eQz0QG4ERnaWBFn0Xzsw6rlzVGsGOiAX7/3AJTdUYwC4YbEcD/7JP4RaPd1WbW25PY
	 jLezoN4m1PSOHyzgfQoZCQ8Qi+Fpw/NXxjelq9dy54IRirtIkPKwoVEJsz+QS8t4p4
	 2qFpAcKAY+MKzoebt5zr8kr3ze087L9ZiNjBKg3pJ7uLAS5B4F+INqh+2oTSl4YNNB
	 LHj0A1WJ/OX0DH6Qs5EzlTeitJl/fJjGsvif3agYHxx2IUPax3h/2TbflQxgaZwH3o
	 UkLcIGvrSMTuQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrHLMWRWlGSWpSXmKPExsViZ8ORpMt2KiL
  FYGarocXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmnFpk1rBTaGKm5eOMDcwfuXvYuTkEBLYyChx
  7JVAFyMXkD2NSeLb7kesIAk2AQmJ6XtPsoPYIgK6Eh8/zGUEsZkFVCRmTD7CBGILCzhIdBw/x
  wJiswioSnxdsp0ZxOYVcJJYdeQkWFxCQEFiysP3QHEODk4BZ4nbCwQg9jpJdJ48zgRRoiZx9d
  wm5gmMPAsYGVYxmhanFpWlFuma6SUVZaZnlOQmZuboJVbpJuqlluqWpxaX6BrpJZYX66UWF+s
  VV+Ym56To5aWWbGIEBkNKsaLmDsYPO//qHWKU5GBSEuU1PRiWIsSXlJ9SmZFYnBFfVJqTWnyI
  UYaDQ0mCt21bRIqQYFFqempFWmYOMDBh0hIcPEoivLJHgNK8xQWJucWZ6RCpU4yKUuK8IieAE
  gIgiYzSPLg2WDRcYpSVEuZlZGBgEOIpSC3KzSxBlX/FKM7BqCTMuxlkCk9mXgnc9FdAi5mAFv
  tfDgdZXJKIkJJqYIrYcbnq8t03Hm8agpfzTZ4Tdei5tcLMGwa+k7s8n7532VbwP2R2g9qRkm2
  OOZL2r/70da2UiL3s8b1l6gZv3TlHdm0RDZDQW6nFv2rJJR6xu6yFwi6BryRvhtVLpTeJxba1
  K9VKSkuJLLgfV+QW5ZbL13J/CSdvqj0T95xpS5otWT49eK90t/HNp61N30PFjroZvvoqdb3pY
  tyy6tuHo1+IJmcFOxq1eJ+eI/CxWPf7hVXRzQunTt83rS5VIrhAv1lQVXz3+6MVVmqJyz8qrx
  QLXcscYe7J4hjxjWW2ywOH/NK9HuYO0hIO0/566/9bmGjadyus1XCNrNKTt7uECh9tELAT3LV
  1x6TgstenlFiKMxINtZiLihMBemSTeAEDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-17.tower-571.messagelabs.com!1683540486!414061!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.105.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 20553 invoked from network); 8 May 2023 10:08:06 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-17.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 May 2023 10:08:06 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 85F5A1D4;
	Mon,  8 May 2023 11:08:06 +0100 (BST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id AD2631C2;
	Mon,  8 May 2023 11:08:05 +0100 (BST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] libssh: upgrade 0.10.4 -> 0.10.5
Date: Mon,  8 May 2023 18:07:50 +0800
Message-Id: <1683540471-25268-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1683540471-25268-1-git-send-email-wangmy@fujitsu.com>
References: <1683540471-25268-1-git-send-email-wangmy@fujitsu.com>
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 May 2023 10:08:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102398

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
 * Fix CVE-2023-1667: a NULL dereference during rekeying with algorithm guessing
 * Fix CVE-2023-2283: a possible authorization bypass in
   pki_verify_data_signature under low-memory conditions.
 * Fix several memory leaks in GSSAPI handling code
 * Escape braces in ProxyCommand created from ProxyJump options for zsh
   compatibility.
 * Fix pkg-config path relocation for MinGW
 * Improve doxygen documentation
 * Fix build with cygwin due to the glob support
 * Do not enqueue outgoing packets after sending SSH2_MSG_NEWKEYS
 * Add support for SSH_SUPPRESS_DEPRECATED
 * Avoid functions declarations without prototype to build with clang 15
 * Fix spelling issues
 * Avoid expanding KnownHosts, ProxyCommands and IdentityFiles repetitively
 * Add support sk-* keys through configuration
 * Improve checking for Argp library
 * Log information about received extensions
 * Correctly handle rekey with delayed compression
 * Move the EC keys handling to OpenSSL 3.0 API
 * Record peer disconnect message
 * Avoid deadlock when write buffering occurs and we call poll recursively to
   flush the output buffer
 * Disable preauthentication compression by default
 * Add CentOS 8 Stream / OpenSSL 1.1.1 to CI
 * Add accidentally removed default compile flags
 * Solve incorrect parsing of ProxyCommand option

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libssh/{libssh_0.10.4.bb => libssh_0.10.5.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/libssh/{libssh_0.10.4.bb => libssh_0.10.5.bb} (96%)

diff --git a/meta-oe/recipes-support/libssh/libssh_0.10.4.bb b/meta-oe/recipes-support/libssh/libssh_0.10.5.bb
similarity index 96%
rename from meta-oe/recipes-support/libssh/libssh_0.10.4.bb
rename to meta-oe/recipes-support/libssh/libssh_0.10.5.bb
index 4b2ced5e50..4995e9cfe4 100644
--- a/meta-oe/recipes-support/libssh/libssh_0.10.4.bb
+++ b/meta-oe/recipes-support/libssh/libssh_0.10.5.bb
@@ -11,7 +11,7 @@ SRC_URI = "git://git.libssh.org/projects/libssh.git;protocol=https;branch=stable
            file://0001-libgcrypt.c-Fix-prototype-of-des3_encrypt-des3_decry.patch \
            file://run-ptest \
           "
-SRCREV = "e8322817a9e5aaef0698d779ddd467a209a85d85"
+SRCREV = "479eca13aaaa46b43e68c52186e3783f06ae6f34"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


