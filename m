Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RyRxZ-00022E-UG
	for openembedded-devel@lists.openembedded.org;
	Fri, 17 Feb 2012 18:51:06 +0100
Received: by ggeq1 with SMTP id q1so1944712gge.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Feb 2012 09:42:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=HahUZGue5dTEeLnY2AdGS4x5f9Ns3i7u0v4G0rWgyTY=;
	b=D/IXMskbxmr7z8Xyzy/IRP/ylQHnR29Qc9yfVmmHad9uaLv9+5Ozw3q1W8zjoMlVYV
	hYxqBxjEZCxTtnozcbcAWy0RR3p78cMc10QfniO7f3uyJh9CM/HOb0m+AgSYITqzh+Xw
	4R10BPgGoscEBxWxQ9oevZ1x6VlOwrerNBY9w=
Received: by 10.236.133.210 with SMTP id q58mr11155029yhi.6.1329500571173;
	Fri, 17 Feb 2012 09:42:51 -0800 (PST)
Received: from localhost.localdomain ([186.218.100.214])
	by mx.google.com with ESMTPS id d5sm15769900anm.22.2012.02.17.09.42.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 17 Feb 2012 09:42:50 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 17 Feb 2012 17:42:31 +0000
Message-Id: <ec40b0cf0436738ab76988ab5d41618a72c4d3c4.1329500480.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1329500479.git.otavio@ossystems.com.br>
References: <cover.1329500479.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1329500479.git.otavio@ossystems.com.br>
References: <cover.1329500479.git.otavio@ossystems.com.br>
Subject: [PATCH][meta-oe 3/7] polkit: depends on systemd
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
X-List-Received-Date: Fri, 17 Feb 2012 17:51:06 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../recipes-extended/polkit/polkit_0.104.bbappend  |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-extended/polkit/polkit_0.104.bbappend

diff --git a/meta-oe/recipes-extended/polkit/polkit_0.104.bbappend b/meta-oe/recipes-extended/polkit/polkit_0.104.bbappend
new file mode 100644
index 0000000..3c43970
--- /dev/null
+++ b/meta-oe/recipes-extended/polkit/polkit_0.104.bbappend
@@ -0,0 +1,3 @@
+DEPENDS += "systemd"
+
+PRINC = "1"
-- 
1.7.2.5



