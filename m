Received: from mail-la0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martiert@gmail.com>) id 1TRfxk-0002cg-8c
	for openembedded-devel@lists.openembedded.org;
	Fri, 26 Oct 2012 11:12:20 +0200
Received: by mail-la0-f47.google.com with SMTP id h5so2284492lam.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Oct 2012 01:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=BckMN4aAnqPZgiTdkauS7rSEtToSBiZ+L9Uwmr6pb1o=;
	b=kHO0b5gmpaNqm9mawbDI1G3GgbQHeo5GFYI+urOVMFkNVWtoWooUQLq6YMUaJQlorQ
	h9AzmJoADvPkhpueG6SSxoXkr2FJW67tM5tGEBCrzBoRayanfq77EQCoxdI73upLkKUX
	SF4vFgoDrYWr1fjwBUJ2Wd8fVTjAW7xqspvZZOfeSfjW27F2eR5UiZTRUWjQQNEXlRSR
	AwoA4IcJFSE7Gi3dHmHQygjsqZtwnTDqvSOO1eBgSmgHa/sTC88KFBthiKqjoSwRAF0y
	nU7+maVTvJhVshuFpWEUT3DxSZxOuPmd03RlYNYrBUL3moqsqBdUgNI+YKnwUx7/C6dQ
	JbsA==
Received: by 10.152.102.234 with SMTP id fr10mr20113408lab.28.1351241930358;
	Fri, 26 Oct 2012 01:58:50 -0700 (PDT)
Received: from Perrin.lynet.no ([37.191.128.59])
	by mx.google.com with ESMTPS id hu6sm283139lab.13.2012.10.26.01.58.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 26 Oct 2012 01:58:49 -0700 (PDT)
From: Martin Ertsaas <martiert@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 26 Oct 2012 10:58:40 +0200
Message-Id: <1351241920-15135-2-git-send-email-martiert@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <1351241920-15135-1-git-send-email-martiert@gmail.com>
References: <1351241920-15135-1-git-send-email-martiert@gmail.com>
Subject: [meta-systemd][PATCH v2 2/2] meta-systemd: ntp: Fix starting of ntpdate.service
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 26 Oct 2012 09:12:20 -0000

Make ntpdate.service run ntpdate instead of ntpd, as ntpd is not
necessarily installed. Also make ntpdate require network.target, as
you can not run ntpdate (or ntpd for that matter), without networking.

Signed-off-by: Martin Ertsaas <martiert@gmail.com>
---
 .../recipes-support/ntp/ntp/ntpdate.service        |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta-systemd/meta-oe/recipes-support/ntp/ntp/ntpdate.service b/meta-systemd/meta-oe/recipes-support/ntp/ntp/ntpdate.service
index b2bc632..a48d11d 100644
--- a/meta-systemd/meta-oe/recipes-support/ntp/ntp/ntpdate.service
+++ b/meta-systemd/meta-oe/recipes-support/ntp/ntp/ntpdate.service
@@ -1,10 +1,11 @@
 [Unit]
 Description=Network Time Service (one-shot ntpdate mode)
+Requires=network.target
 Before=ntpd.service
 
 [Service]
 Type=oneshot
-ExecStart=/usr/bin/ntpd -q -g -x
+ExecStart=/usr/bin/ntpdate pool.ntp.org
 RemainAfterExit=yes
 
 [Install]
-- 
1.7.8.6



