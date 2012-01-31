Received: from mail-yw0-f50.google.com ([209.85.213.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RsHnN-0001mn-Se
	for openembedded-devel@lists.openembedded.org;
	Tue, 31 Jan 2012 18:47:06 +0100
Received: by mail-yw0-f50.google.com with SMTP id p61so164532yhp.9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Jan 2012 09:39:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=HxWzgYNMESG7BMmW7+spXu0F8p3HctG4K6nHTB1Vur8=;
	b=mJWOBrabGV5uD8ZJVVtnk5QVs4wQewKQ1QXHUWOgXZn07THU5UQCwUYKXEnAYFUrjG
	5o2qI6P7oYR6DAFuTavUl2+S8/TLYZjywukegcn75dA6i3284iPR1fPCqkjqRiNh6oDT
	PVlM11W8+cbY/vdG7SQbyDHB1mrynMRFMlX7w=
Received: by 10.236.187.67 with SMTP id x43mr35430187yhm.94.1328031554001;
	Tue, 31 Jan 2012 09:39:14 -0800 (PST)
Received: from localhost.localdomain ([186.218.100.214])
	by mx.google.com with ESMTPS id 6sm43425979anp.14.2012.01.31.09.39.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 31 Jan 2012 09:39:13 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 31 Jan 2012 17:38:57 +0000
Message-Id: <72467639fd066bb55c32e60cec7cbb67a4a98805.1328031500.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1328031500.git.otavio@ossystems.com.br>
References: <cover.1328031500.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1328031500.git.otavio@ossystems.com.br>
References: <cover.1328031500.git.otavio@ossystems.com.br>
Subject: [PATCH][meta-oe 2/3] systemd.bbclass: depends on systemd
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
X-List-Received-Date: Tue, 31 Jan 2012 17:47:06 -0000

Packages that uses the systemd class need to have systemd build
otherwise they might fail to detect systemd as available or fail to
generate rootfs.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/classes/systemd.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-oe/classes/systemd.bbclass b/meta-oe/classes/systemd.bbclass
index 2ca7bfc..094a12c 100644
--- a/meta-oe/classes/systemd.bbclass
+++ b/meta-oe/classes/systemd.bbclass
@@ -1,4 +1,4 @@
-DEPENDS_append = " systemd-systemctl-native"
+DEPENDS_append = " systemd systemd-systemctl-native"
 
 systemd_postinst() {
 OPTS=""
-- 
1.7.2.5



