Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RyRxW-00021v-K9
	for openembedded-devel@lists.openembedded.org;
	Fri, 17 Feb 2012 18:51:02 +0100
Received: by ghbf19 with SMTP id f19so1923731ghb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Feb 2012 09:42:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=BfpFdliYToiBLoHC0zYJfzpc+FdOQjbdOjOXcMU0BPI=;
	b=WxCyrR77uukd+uJHVYO2AyveWBPBlZbIjyweEmFh9SJymuK3W+kDDCVytPIuHBwhbY
	9C76JNP1Hfo29yKirZXyoWHG8P7VKVgwujFZya9dRutt0va35O1DalBXR+bTBPc2Wknv
	8F4mX8p0ZCZ5nkGB9scl7nmzj/3Mq/1KCZn0E=
Received: by 10.236.187.5 with SMTP id x5mr10762643yhm.35.1329500567939;
	Fri, 17 Feb 2012 09:42:47 -0800 (PST)
Received: from localhost.localdomain ([186.218.100.214])
	by mx.google.com with ESMTPS id d5sm15769900anm.22.2012.02.17.09.42.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 17 Feb 2012 09:42:47 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 17 Feb 2012 17:42:29 +0000
Message-Id: <b4097e4145cd6bda860464a69c8043893a6f7aa4.1329500479.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1329500479.git.otavio@ossystems.com.br>
References: <cover.1329500479.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1329500479.git.otavio@ossystems.com.br>
References: <cover.1329500479.git.otavio@ossystems.com.br>
Subject: [PATCH][meta-oe 1/7] Revert "systemd.bbclass: depends on systemd"
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
X-List-Received-Date: Fri, 17 Feb 2012 17:51:02 -0000

This reverts commit c029d4a268de1ac7076fbeb9e337e96fdb1b226d.
---
 meta-oe/classes/systemd.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-oe/classes/systemd.bbclass b/meta-oe/classes/systemd.bbclass
index 094a12c..2ca7bfc 100644
--- a/meta-oe/classes/systemd.bbclass
+++ b/meta-oe/classes/systemd.bbclass
@@ -1,4 +1,4 @@
-DEPENDS_append = " systemd systemd-systemctl-native"
+DEPENDS_append = " systemd-systemctl-native"
 
 systemd_postinst() {
 OPTS=""
-- 
1.7.2.5



