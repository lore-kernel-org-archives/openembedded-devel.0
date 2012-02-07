Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RusFM-0001Ob-UD
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Feb 2012 22:06:41 +0100
Received: by ghbf19 with SMTP id f19so3349173ghb.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Feb 2012 12:58:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=HahUZGue5dTEeLnY2AdGS4x5f9Ns3i7u0v4G0rWgyTY=;
	b=j3D/U5QZ5weeOIlubYjvzCoLWMkp1VjYNvgsbIhoeDggYjgREMYBxy0KwNU4d2/jLy
	YbY3pEno6VsyirhkU6Sh9aGINONs42N2EUnkbzliNptKWGTqif95vt7ZkbKDgYdqLv+R
	UNpyJebYMSVM+LhTDJBKqrj715+N8YMs6gnJY=
Received: by 10.236.184.129 with SMTP id s1mr34641593yhm.21.1328648318074;
	Tue, 07 Feb 2012 12:58:38 -0800 (PST)
Received: from localhost.localdomain ([186.218.100.214])
	by mx.google.com with ESMTPS id o61sm30096056yhk.10.2012.02.07.12.58.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 07 Feb 2012 12:58:37 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  7 Feb 2012 20:58:24 +0000
Message-Id: <1cd08c798a7b335ba66ed186d6fbd3b4002d2f8a.1328648257.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1328648257.git.otavio@ossystems.com.br>
References: <cover.1328648257.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1328648257.git.otavio@ossystems.com.br>
References: <cover.1328648257.git.otavio@ossystems.com.br>
Subject: [PATCH][meta-oe 3/3] polkit: depends on systemd
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
X-List-Received-Date: Tue, 07 Feb 2012 21:06:41 -0000

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



