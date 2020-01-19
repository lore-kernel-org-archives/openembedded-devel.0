Return-Path: <akuster808@gmail.com>
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
	[209.85.216.44])
	by mail.openembedded.org (Postfix) with ESMTP id E218C7FCB1
	for <openembedded-devel@openembedded.org>;
	Sun, 19 Jan 2020 20:50:10 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id s7so6058178pjc.0
	for <openembedded-devel@openembedded.org>;
	Sun, 19 Jan 2020 12:50:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=6N423vC7uaqenTkQg7mlTjBGrdQw1HmDK3jWUfRdnuk=;
	b=Uh+c28+4z8EJGlVyt6B9GYj4k4pyrr7nxfQhr5sgJAwEOdmZC87S2vHMrN+mtvUKVQ
	fAsNyou4BMQ49lSXZvhhXIgAiopFIq3RwLxue3lqJoObpCBBAVVsKhgG+Xtihl/Rd8du
	VdUqUQQ4KRwSv3Jq5hDCwKqP3q7xmrjsdsLllDcMUNGk/rG7ROxIYkeczhbZa2xB4lOP
	pMndctrxav7EICRU6r4P22dMAp39fsYT5u/CHq+Siq3hGl0wTICPzEo5f1/LOgFqmWL8
	BfCnod96ewoDwVXOfwy3yWsSIV0g/htYvaE+3Fr2yq1bs9VbWMHpKIxulDwNnrBAvTSf
	l4IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=6N423vC7uaqenTkQg7mlTjBGrdQw1HmDK3jWUfRdnuk=;
	b=UgbdEd2ViRD8c7k3onl5aQAhypGkx9Eet0RYLqpiMtP7NTHUEC8g9XygujTnFpWXLI
	G/nU4unCblPCT/MYRPgXL/YeoZW3EDrlATKuvSF0KBQcDiVqxFrJMWLFAeOwgculadel
	km1k5p3Qze33gYV4D7XZAgfx8dgUzLmalGc8cTmN/YRUiRmXBIN7+nO9Tv8KOmrG9hEK
	yaNo3T11Rq0G/pVW3gqDQGc5ZKuy9l450o7EXyrgE4ZFQu7O8b5o8rMJ0b9NO6uNy7Te
	kfYb2e+kZ04fNMcdich61Q2hDb5Az1YDY5AxqHQU9Ofz5lQ8JJgL8eCbSe4wJYDwGnUn
	Snfw==
X-Gm-Message-State: APjAAAWQfV71vbpNoMzE77DSOur+nVdNgTBOJdqvMFh6/t59rhkxGedh
	FpA2E0hfBjqXv5vq7m1Bjv34Qyyc
X-Google-Smtp-Source: APXvYqwBpShHQ58j+Ff/AtLpPGa2ffLKZgWGnfE7fora1TWinTqs3/Vli666vEJ2otnniB4wpiRSZQ==
X-Received: by 2002:a17:90b:1243:: with SMTP id
	gx3mr19828621pjb.117.1579467011732; 
	Sun, 19 Jan 2020 12:50:11 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:450d:e003:9142:f492])
	by smtp.gmail.com with ESMTPSA id
	k9sm14701403pjo.19.2020.01.19.12.50.10
	for <openembedded-devel@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 19 Jan 2020 12:50:11 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@openembedded.org
Date: Sun, 19 Jan 2020 12:50:00 -0800
Message-Id: <688e19d04d67afa8cc848e91b891ba0a84ec739b.1579466920.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1579466920.git.akuster808@gmail.com>
References: <cover.1579466920.git.akuster808@gmail.com>
Subject: [zeus 2/8] dnsmasq: CVE-2019-14834
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 19 Jan 2020 20:50:11 -0000

From: Zhixiong Chi <zhixiong.chi@windriver.com>

Backport the CVE patch from the upstream to fix the memory leak.

Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit c8ca82feb5d6ceb843aad33dada947b456f7fcac)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...-dnsmasq-fix-memory-leak-in-helper-c.patch | 49 +++++++++++++++++++
 .../recipes-support/dnsmasq/dnsmasq_2.80.bb   |  1 +
 2 files changed, 50 insertions(+)
 create mode 100644 meta-networking/recipes-support/dnsmasq/dnsmasq/0001-dnsmasq-fix-memory-leak-in-helper-c.patch

diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq/0001-dnsmasq-fix-memory-leak-in-helper-c.patch b/meta-networking/recipes-support/dnsmasq/dnsmasq/0001-dnsmasq-fix-memory-leak-in-helper-c.patch
new file mode 100644
index 0000000000..ccd6f82ae8
--- /dev/null
+++ b/meta-networking/recipes-support/dnsmasq/dnsmasq/0001-dnsmasq-fix-memory-leak-in-helper-c.patch
@@ -0,0 +1,49 @@
+From 69bc94779c2f035a9fffdb5327a54c3aeca73ed5 Mon Sep 17 00:00:00 2001
+From: Simon Kelley <simon@thekelleys.org.uk>
+Date: Wed, 14 Aug 2019 20:44:50 +0100
+Subject: [PATCH] Fix memory leak in helper.c
+
+Thanks to Xu Mingjie <xumingjie1995@outlook.com> for spotting this.
+
+CVE: CVE-2019-14834
+Upstream-Status: Backport
+Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
+---
+ src/helper.c |   12 +++++++++---
+ 1 file changed, 9 insertions(+), 3 deletions(-)
+
+diff --git a/src/helper.c b/src/helper.c
+index 33ba120..c392eec 100644
+--- a/src/helper.c
++++ b/src/helper.c
+@@ -82,7 +82,8 @@ int create_helper(int event_fd, int err_fd, uid_t uid, gid_t gid, long max_fd)
+   pid_t pid;
+   int i, pipefd[2];
+   struct sigaction sigact;
+-
++  unsigned char *alloc_buff = NULL;
++  
+   /* create the pipe through which the main program sends us commands,
+      then fork our process. */
+   if (pipe(pipefd) == -1 || !fix_fd(pipefd[1]) || (pid = fork()) == -1)
+@@ -188,11 +189,16 @@ int create_helper(int event_fd, int err_fd, uid_t uid, gid_t gid, long max_fd)
+       struct script_data data;
+       char *p, *action_str, *hostname = NULL, *domain = NULL;
+       unsigned char *buf = (unsigned char *)daemon->namebuff;
+-      unsigned char *end, *extradata, *alloc_buff = NULL;
++      unsigned char *end, *extradata;
+       int is6, err = 0;
+       int pipeout[2];
+ 
+-      free(alloc_buff);
++      /* Free rarely-allocated memory from previous iteration. */
++      if (alloc_buff)
++	{
++	  free(alloc_buff);
++	  alloc_buff = NULL;
++	}
+       
+       /* we read zero bytes when pipe closed: this is our signal to exit */ 
+       if (!read_write(pipefd[0], (unsigned char *)&data, sizeof(data), 1))
+-- 
+1.7.10.4
diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.80.bb b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.80.bb
index 6f3d5daa62..827565051d 100644
--- a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.80.bb
+++ b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.80.bb
@@ -5,5 +5,6 @@ SRC_URI[dnsmasq-2.80.sha256sum] = "9e4a58f816ce0033ce383c549b7d4058ad9b823968d35
 SRC_URI += "\
     file://lua.patch \
     file://0001-dnsmasq-fix-build-against-5.2-headers.patch \
+    file://0001-dnsmasq-fix-memory-leak-in-helper-c.patch \
 "
 
-- 
2.17.1


