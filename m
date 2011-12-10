Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RZPyz-0001Mh-Al
	for openembedded-devel@lists.openembedded.org;
	Sat, 10 Dec 2011 17:41:05 +0100
Received: by mail-gx0-f175.google.com with SMTP id h1so4238975ggn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 10 Dec 2011 08:34:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=8nuyBiPqGmZ5rbUkoqFI0ZKJ1GNH8D9yBZ2gxU4/9w0=;
	b=dQJej2fMiqyY7i6e65P/h9r/Q3ZdZToo33orN6WdktS0HovbVZfdjveVjbhiC+Kqhv
	Zf3tJZZFSFz4bpWXa5dwby3tJ0LsjgI8cUtzm7OEcyGgzeSSTvU8RD9Hyy3AKX805Kgw
	LrlcqlrEpJo0dAmhbetE6RnFzqFycSBgtTdIg=
Received: by 10.236.128.197 with SMTP id f45mr11598983yhi.44.1323534855278;
	Sat, 10 Dec 2011 08:34:15 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id w68sm21079531yhe.14.2011.12.10.08.34.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 10 Dec 2011 08:34:14 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 10 Dec 2011 16:33:56 +0000
Message-Id: <245d6eebe4dae1107eda2cfc74433ab9d545fbbd.1323534795.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1323534795.git.otavio@ossystems.com.br>
References: <cover.1323534795.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1323534795.git.otavio@ossystems.com.br>
References: <cover.1323534795.git.otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 2/2] dropbear: convert PR to use PRINC on bbappend
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
X-List-Received-Date: Sat, 10 Dec 2011 16:41:05 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../dropbear/dropbear_2011.54.bbappend             |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-core/dropbear/dropbear_2011.54.bbappend b/meta-oe/recipes-core/dropbear/dropbear_2011.54.bbappend
index a642235..874a7d4 100644
--- a/meta-oe/recipes-core/dropbear/dropbear_2011.54.bbappend
+++ b/meta-oe/recipes-core/dropbear/dropbear_2011.54.bbappend
@@ -1,6 +1,6 @@
 inherit systemd
 
-PRINC = "1"
+PRINC := "${@int(PRINC) + 1}"
 
 # look for files in the layer first
 FILESEXTRAPATHS := "${THISDIR}/${PN}"
-- 
1.7.2.5



