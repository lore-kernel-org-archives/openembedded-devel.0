Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jefflance01@gmail.com>) id 1PevvM-0008K1-5Z
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 Jan 2011 21:43:36 +0100
Received: by ywi6 with SMTP id 6so1882263ywi.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Jan 2011 12:42:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=V7BZxarAYlZgpzWkLFKouVwkU7LQbfZE1gyB3sfFlIQ=;
	b=rfgwU4+8bjFMRf9jRIwJTkswsavlYLrVLHcuX6e/tLQEeOLxBSI62pbw6U+Ai9hvYV
	rAivGVSqDYXMvNRa5pmawdNUdoQfwhrcesVzswY4eZTQlAqPS3ebvSWR4ZtbUMCR50lL
	3Vh5bpeG+aBxT7innr0e157khKih6ZcXO72gk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=TmaPF8Q4ZZHQYbSH//V2BateumKRhFeeOge7lvcDH0MZ1MLM50HK1cgza56+VQnA64
	JTL+pRK3r0SwzcXz4VqK8JLngYFgYyQXdBlAkIoDT3Sar69W7fj1srEaWXjpurJBbB3i
	onCgWWHFZjIXbGuNfUQEReIO4qmdDIw9cmlRo=
Received: by 10.90.72.16 with SMTP id u16mr5044052aga.146.1295296977892;
	Mon, 17 Jan 2011 12:42:57 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id 2sm5907487anw.38.2011.01.17.12.42.57
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 17 Jan 2011 12:42:57 -0800 (PST)
From: Jeff Lance <jefflance01@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 17 Jan 2011 14:41:38 -0600
Message-Id: <1295296898-11309-1-git-send-email-j-lance1@ti.com>
X-Mailer: git-send-email 1.6.3.3
Cc: Jeff Lance <j-lance1@ti.com>
Subject: [PATCH 1/1] am-sysinfo: Update SRCREV to add CCSv5 support
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
X-List-Received-Date: Mon, 17 Jan 2011 20:43:36 -0000

  * Update SRCREV to pull in the following:
    * Update the makefile to support the debug and release versions utilized by CCSv5
    * Add a top level Makefile
    * update support files used by CCSv5 - .cproject and .project

Signed-off-by: Jeff Lance <j-lance1@ti.com>
---
 recipes/ti/am-sysinfo_svn.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/ti/am-sysinfo_svn.bb b/recipes/ti/am-sysinfo_svn.bb
index 80203f5..fc0c7ce 100644
--- a/recipes/ti/am-sysinfo_svn.bb
+++ b/recipes/ti/am-sysinfo_svn.bb
@@ -4,7 +4,7 @@ LICENSE = "BSD"
 SECTION = "system"
 PRIORITY = "optional"
 
-SRCREV = "5"
+SRCREV = "6"
 PV = "1.0"
 PR = "r1+svnr${SRCPV}"
 
-- 
1.6.3.3



