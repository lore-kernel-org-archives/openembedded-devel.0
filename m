Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RIaZu-0004XS-9i
	for openembedded-devel@lists.openembedded.org;
	Tue, 25 Oct 2011 08:33:38 +0200
Received: by bkat8 with SMTP id t8so133034bka.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Oct 2011 23:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=21KfokwvJ2Urwm1K0M3hai1pD7jTMjebdOX4CqhLETc=;
	b=NB0CD12aQ1sDFLTTDPUXJyZwuPeoCdTfwzBnSWRNFtEButnH3E/FddsQFw/3u+FpRa
	MNSMQZE0vacgoykJ3gswXS8PsqFSWKaVv1CbAYTGBve8HBE0Gn6M/WClJNlxXq81iYOG
	x3OFoTalXvbUBHvXEX83Q61d3oFi0YcFsGMa8=
Received: by 10.204.7.147 with SMTP id d19mr7941923bkd.35.1319524060544;
	Mon, 24 Oct 2011 23:27:40 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id u10sm26290971bkv.3.2011.10.24.23.27.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 24 Oct 2011 23:27:39 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 25 Oct 2011 08:27:26 +0200
Message-Id: <1319524046-22472-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7
Subject: [meta-handheld] linux.inc: be more strict in CONF_SED_SCRIPT
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
X-List-Received-Date: Tue, 25 Oct 2011 06:33:38 -0000

* without this ARM_THUMB is also removing ARM_THUMBEE from
  defconfig and not setting it back

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-kernel/linux/linux.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes-kernel/linux/linux.inc b/recipes-kernel/linux/linux.inc
index 7a25b59..781d5ba 100644
--- a/recipes-kernel/linux/linux.inc
+++ b/recipes-kernel/linux/linux.inc
@@ -24,7 +24,7 @@ LOCALVERSION ?= ""
 
 #kernel_conf_variable CMDLINE "\"${CMDLINE} ${CMDLINE_DEBUG}\""
 kernel_conf_variable() {
-	CONF_SED_SCRIPT="$CONF_SED_SCRIPT /CONFIG_$1/d;"
+	CONF_SED_SCRIPT="$CONF_SED_SCRIPT /CONFIG_$1[ =]/d;"
 	if test "$2" = "n"
 	then
 		echo "# CONFIG_$1 is not set" >> ${S}/.config
-- 
1.7.7



