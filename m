Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jefflance01@gmail.com>) id 1QElp0-0002OL-Dx
	for openembedded-devel@lists.openembedded.org;
	Tue, 26 Apr 2011 19:13:12 +0200
Received: by yia13 with SMTP id 13so344173yia.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Apr 2011 10:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=h2OT+TVy17dpE9H/EZtunkmjypX/DG5SJjeJKicKm3U=;
	b=kOB7uV22Ke+AWZNK4ZMqJMO5qSiGelcpN38T1HJRUFJIrtrFZh/Gc/Y7wmxPUkhuzt
	n8qsz9taM0sEeHldJOvyxltJxR5dPSdF1lBLi/F2y+LBwjTG9WfpZbSFBFOLc+6OPhoW
	65Mr4XjRE2y44SvY4Wz6Kmay+WvlX5548TcIY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=lsTDaRN1lGKvHk75ojg/7Z6YevMpGuvbQS/w1PSk8ocFwQg6Bme8NkIhPkImwaoV6a
	XosUzq5vgxhRJi0HLn5oooydzolAltKl+6JwMTHhoasEuGg7WvbKZhsxZ4I0YpnpB1Bk
	qVgwWT9z+DvPjbiTLPA3ZkAWy7+WXST6f/c4k=
Received: by 10.236.78.10 with SMTP id f10mr1298997yhe.176.1303837835499;
	Tue, 26 Apr 2011 10:10:35 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id l73sm2760791yhn.98.2011.04.26.10.10.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 26 Apr 2011 10:10:34 -0700 (PDT)
From: Jeff Lance <jefflance01@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 27 Apr 2011 13:05:19 -0500
Message-Id: <1303927519-6262-1-git-send-email-j-lance1@ti.com>
X-Mailer: git-send-email 1.7.0.4
Cc: Jeff Lance <j-lance1@ti.com>
Subject: [PATCH 1/1] am-benchmarks: add return values * add return values to dhrystone and linpack for automated test
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
X-List-Received-Date: Tue, 26 Apr 2011 17:13:13 -0000

Signed-off-by: Jeff Lance  <j-lance1@ti.com>
---
 recipes/ti/am-benchmarks_1.2.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/ti/am-benchmarks_1.2.bb b/recipes/ti/am-benchmarks_1.2.bb
index 38c7056..21e62a7 100644
--- a/recipes/ti/am-benchmarks_1.2.bb
+++ b/recipes/ti/am-benchmarks_1.2.bb
@@ -8,7 +8,7 @@ LICENSE = "BSD"
 SECTION = "system"
 PRIORITY = "optional"
 
-SRCREV = "60"
+SRCREV = "61"
 PR = "r2+svnr${SRCPV}"
 
 COMPATIBLE_MACHINE = "(dm365|omapl138|omap3|ti816x|ti814x)"
-- 
1.7.0.4



