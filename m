Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tfi2Z-00024s-S9
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Dec 2012 03:15:19 +0100
Received: by mail-ee0-f47.google.com with SMTP id e51so1925797eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Dec 2012 18:01:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=+7d/IVNq8aOYQhIAdHL53yDmL7g4VpqHk72GQfGQU3k=;
	b=Y6lY27wGWzRB7CPB5fKjzxJRUxC21czsyaeG/Ia9c+mQySL6h7p5oG4ObR8PjD4YX6
	TOdlPtf6RnDl5s06SYGZJ0i7ECoGYyt/AVeftoxOWgpjbT4DVMH/YCpjTWOa+TSj9Zrh
	rmLTcPqn8nLoNEmECCvXLb56AXohBIbxqexKHEKbx40SfX95m2px9mYum0tS226xu8wb
	IpcRqW/bNNZRaLAvOHJD65hcPsnIVFU6HYQCjpa41SeJioG56X0fcSOa5sr4Szd3WPMb
	jisHRq4X4YG7REGVc9IgAJ/s7MM7w+NUrKg5B+M0oNw9N//6Bx6eOM6G6m9wrkYrRdaq
	RaTQ==
Received: by 10.14.207.68 with SMTP id m44mr42613474eeo.40.1354586460290;
	Mon, 03 Dec 2012 18:01:00 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 43sm34792719eed.10.2012.12.03.18.00.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Dec 2012 18:00:59 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  4 Dec 2012 02:58:43 +0100
Message-Id: <5cbfbf6a1eae5268c4f22b4376674d6914973a7c.1354586187.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <cover.1354586187.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1354586187.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
Subject: [PATCH 10/58] gnome-terminal: add SRC_URI checksums
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
X-List-Received-Date: Tue, 04 Dec 2012 02:15:20 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-gnome/gnome/gnome-terminal_2.26.3.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-gnome/recipes-gnome/gnome/gnome-terminal_2.26.3.bb b/meta-gnome/recipes-gnome/gnome/gnome-terminal_2.26.3.bb
index 73f0b99..ac4cc00 100644
--- a/meta-gnome/recipes-gnome/gnome/gnome-terminal_2.26.3.bb
+++ b/meta-gnome/recipes-gnome/gnome/gnome-terminal_2.26.3.bb
@@ -14,3 +14,5 @@ do_configure_prepend () {
 	rm -f ${S}/src/terminal-type-builtins.c
 }
 
+SRC_URI[archive.md5sum] = "0395af0d444ed4fbfabf65d3583119c8"
+SRC_URI[archive.sha256sum] = "ecddbf523700820524b2646451c307c5b55078b9cebe5fa464ef626b4b4cbda2"
-- 
1.8.0



