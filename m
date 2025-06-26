Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79FFAC7115B
	for <webhook@archiver.kernel.org>; Thu, 26 Jun 2025 05:15:40 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web10.1500.1750914933126192632
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Jun 2025 22:15:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=IUnOq5yY;
 spf=pass (domain: mvista.com, ip: 209.85.215.178, mailfrom: hprajapati@mvista.com)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-b31e0ead80eso501156a12.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Jun 2025 22:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1750914932; x=1751519732; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YYgHn+B3jTvOFMtZVIRNhwf9QDubseytZE/BDPNS+ig=;
        b=IUnOq5yYzw5aUcCkZEo984DrNy1RH9Hbx1h8tPFZcUmLcAtzol3+c1VTEhkcqxGomZ
         4IkRg5wjzcY1jJ3h3l/x75S8dJu6YhwIW/XSR7QtBdJGfdAZM1m7QiVPz+AiHRKrGQN9
         IWW0PfOuHFiqHQ9bHNt0vvXsNC6F2XUB+V9nI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750914932; x=1751519732;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YYgHn+B3jTvOFMtZVIRNhwf9QDubseytZE/BDPNS+ig=;
        b=m39CppM/uQGi0hE6vpL7EEJICWG5zzZZ87Jf16atEVLye/fIR65mN2CajYMbXk5taz
         ynfitol80IMjIUv1VemiQTiIL7DayHu5jzjaZFu4uz/HupUmdwidElbpvM8Svht+dVyR
         6eUaELrzfUMe3Z+Xo/AXkuElmwhp8fZ6ciwnPDw99IcRn0XXW5ReSfUW+vCnm/0EAfmc
         c5KnQRgsFM0XNN4FJwQn/7MJzAKDacEMbyVe7E7zk4LyuYPkkTYNf38PgyEVLNCPngZ7
         4TImbHHxtyvls+F3OR+LbXaP8cPn5pBp5HInZrEDDEBjOVPEvcXgm4FrfS8lEI/hr48R
         WNcg==
X-Gm-Message-State: AOJu0Yx28cA+5JTk+jX7VIaTKjb7BPWKWkeQKzprR1iYfOA6Mo/nSeAx
	02WF5avfmS0TBWCSkjPEiHbUEpeGdxZSNYemW179G5UrwZ5pa9RJh+fb2/ZYg2poZduucp9aCvc
	UMrAX
X-Gm-Gg: ASbGnctDpB/whM65uUJp2A6sj/otC6zPpTRSjA4ZRkkAQJyPwv6GwJP1IlN94HrKeh3
	jDt8K+HyNGNMgldUETR3qtZLRA07MB2xUsMtbirTvU3t1Z9GKrdgPj49CogqWmk8vRlRHW4FnhR
	uVYgkfkvn2pXXbvz9LDOT4KajDG2586z+9xXGZ2qQIgdPzxKAqETjwsCwG/08V4io6ftADkyM9f
	/4OM2DoC1biLfyDqYRGcp2ZBp3Uh8ykhgl3Jn7duWsQAUPln2of2cPwvQ2yOXfV6ZkF1XXccpVt
	YaFetLDOd8sZRwIBm9AOMmof5K6c8r96jPuRptWpeUe8X0s1pz5BZ7szAsAYDw7nNuvFEqtqGOK
	T
X-Google-Smtp-Source: AGHT+IFqZ1PwklP2TJBOSAgo8FQWibDrY6hLnWJ+oZhKJNg3nC5TrMghcWJ5cFEfzkdEMgBZ05dsMA==
X-Received: by 2002:a17:902:ec91:b0:235:779:ede0 with SMTP id d9443c01a7336-2382405cae0mr106808585ad.35.1750914932346;
        Wed, 25 Jun 2025 22:15:32 -0700 (PDT)
Received: from MVIN00016.mvista.com ([103.250.136.149])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d8391494sm152062715ad.1.2025.06.25.22.15.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 22:15:31 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [meta-oe][scarthgap][PATCH] libssh: fix CVE-2025-5318
Date: Thu, 26 Jun 2025 10:44:47 +0530
Message-ID: <20250626051447.19801-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Jun 2025 05:15:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118116

Upstream-Status: Backport from https://git.libssh.org/projects/libssh.git/commit/?id=5f4ffda88770f95482fd0e66aa44106614dbf466

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../libssh/libssh/CVE-2025-5318.patch         | 31 +++++++++++++++++++
 .../recipes-support/libssh/libssh_0.10.6.bb   |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2025-5318.patch

diff --git a/meta-oe/recipes-support/libssh/libssh/CVE-2025-5318.patch b/meta-oe/recipes-support/libssh/libssh/CVE-2025-5318.patch
new file mode 100644
index 0000000000..02efc7a8f3
--- /dev/null
+++ b/meta-oe/recipes-support/libssh/libssh/CVE-2025-5318.patch
@@ -0,0 +1,31 @@
+From 5f4ffda88770f95482fd0e66aa44106614dbf466 Mon Sep 17 00:00:00 2001
+From: Jakub Jelen <jjelen@redhat.com>
+Date: Tue, 22 Apr 2025 21:18:44 +0200
+Subject: CVE-2025-5318: sftpserver: Fix possible buffer overrun
+
+Signed-off-by: Jakub Jelen <jjelen@redhat.com>
+Reviewed-by: Andreas Schneider <asn@cryptomilk.org>
+
+Upstream-Status: Backport [https://git.libssh.org/projects/libssh.git/commit/?id=5f4ffda88770f95482fd0e66aa44106614dbf466]
+CVE: CVE-2025-5318
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ src/sftpserver.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/sftpserver.c b/src/sftpserver.c
+index 9117f155..b3349e16 100644
+--- a/src/sftpserver.c
++++ b/src/sftpserver.c
+@@ -538,7 +538,7 @@ void *sftp_handle(sftp_session sftp, ssh_string handle){
+ 
+   memcpy(&val, ssh_string_data(handle), sizeof(uint32_t));
+ 
+-  if (val > SFTP_HANDLES) {
++  if (val >= SFTP_HANDLES) {
+     return NULL;
+   }
+ 
+-- 
+2.49.0
+
diff --git a/meta-oe/recipes-support/libssh/libssh_0.10.6.bb b/meta-oe/recipes-support/libssh/libssh_0.10.6.bb
index 31f29c1b7d..3123500f51 100644
--- a/meta-oe/recipes-support/libssh/libssh_0.10.6.bb
+++ b/meta-oe/recipes-support/libssh/libssh_0.10.6.bb
@@ -10,6 +10,7 @@ SRC_URI = "git://git.libssh.org/projects/libssh.git;protocol=https;branch=stable
            file://0001-tests-CMakeLists.txt-do-not-search-ssh-sshd-commands.patch \
            file://0001-libgcrypt.c-Fix-prototype-of-des3_encrypt-des3_decry.patch \
            file://run-ptest \
+           file://CVE-2025-5318.patch \
           "
 SRCREV = "10e09e273f69e149389b3e0e5d44b8c221c2e7f6"
 
-- 
2.49.0


