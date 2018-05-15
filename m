Return-Path: <texier.pj2@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 558BA605BF
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 May 2018 18:05:13 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id n10-v6so2799205wmc.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 May 2018 11:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=ae9zRjBcGdDTds5sKqdFrYXWmPV+S/n6uNocFyhXSn8=;
	b=N4EnOfTVeslJnwil2JwcV59PtyWo74HmZXmhxxHSPT3Y72aGW1VTrueCn5VP2gwJiM
	HbcwE0HmviRQkgT/eT1qrN2RF8VUftlXXyi60dIdNjSipExVdYWLNUpkzCmshZteMLBQ
	N8m5pDPxnTm4wJY3/gWFISB2vV6lwqM18u1KmzjpHVS7F5QlzzzEys8E1ou1ucEDu2qR
	5YAretK+xWap90t6VNIWtOX7RcCIgYbcbNk6VJogO64qRitbcnlvX7w3dFrPVev5BtB/
	i1dC14rG/G8rwb3zPB7mRtWCVq8kKvQ3CL+XWYOCMUIxnDId0wSZ6IEDZRxa+xn4IT3p
	L/ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ae9zRjBcGdDTds5sKqdFrYXWmPV+S/n6uNocFyhXSn8=;
	b=BtvxDNmjNUZeHPnSo7ICaAAOEVBOc5bdY3ioLP7IMlbnlMNv/vB6IdeeCWjjYdMhIj
	R5XHmGM9FSsrK+JUQuaQp2LNdp0MyW4lwfWRJmmFh6iDjCd5D7n00aonIMnLnJL3mBx4
	sH79q0XnSuBMxyDm/TFfLi6674zQpDQKseQK9XS57ZuWfi6YH70XSHKZ/5cml1R/UyVq
	fpruFfiCaaR6bhc4Db16PFhCKQRB3lQbhWwizwDKeoEVpeJALv3OGb5lFlG5D5DziCFM
	CBj4hPIz0/BJBdTDiGMuQxmwLAqfeDGsvoXq5qmL7sr1osQ7CbLlCvHtmRUesKjzkM6J
	ekyQ==
X-Gm-Message-State: ALKqPwcMwdYn/kCbL1+lHUDxR4GteCA7k+fM8/KWItjnsKDAxzu64+70
	wnCuu8Pm9wfAwz7esoXHHrUQbU0Y
X-Google-Smtp-Source: AB8JxZqw2r45/ppCFGrMiRuSpYxsXch2TVmlz/wV9Ix9fyTay9gNKG8Ck+ey7rYTe/Vcmyz6vFy+qw==
X-Received: by 2002:a1c:8611:: with SMTP id
	i17-v6mr8379449wmd.107.1526407514233; 
	Tue, 15 May 2018 11:05:14 -0700 (PDT)
Received: from localhost.localdomain ([2a01:cb19:190:c500:d1e2:5dc8:e091:db2a])
	by smtp.gmail.com with ESMTPSA id
	z63-v6sm921698wrb.34.2018.05.15.11.05.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 15 May 2018 11:05:13 -0700 (PDT)
From: Pierre-Jean TEXIER <texier.pj2@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 15 May 2018 20:05:11 +0200
Message-Id: <1526407511-29723-1-git-send-email-texier.pj2@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCH] minicoredumper: fixes for sysvinit and systemd
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
X-List-Received-Date: Tue, 15 May 2018 18:05:14 -0000

The sysv initscript and systemd service assumes minicoredumper is
installed in /usr/bin/. In our case minicoredumper is installed in
/usr/sbin/ by default. Therefore, fix this path.

Signed-off-by: Pierre-Jean TEXIER <texier.pj2@gmail.com>
---
 meta-oe/recipes-kernel/minicoredumper/files/minicoredumper.init    | 2 +-
 meta-oe/recipes-kernel/minicoredumper/files/minicoredumper.service | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-kernel/minicoredumper/files/minicoredumper.init b/meta-oe/recipes-kernel/minicoredumper/files/minicoredumper.init
index 90ef7fa..9c96e31 100644
--- a/meta-oe/recipes-kernel/minicoredumper/files/minicoredumper.init
+++ b/meta-oe/recipes-kernel/minicoredumper/files/minicoredumper.init
@@ -22,7 +22,7 @@
 
 case "$1" in
     start)
-        echo "|/usr/bin/minicoredumper %p %u %g %s %t %h %e" > /proc/sys/kernel/core_pattern
+        echo "|/usr/sbin/minicoredumper %p %u %g %s %t %h %e" > /proc/sys/kernel/core_pattern
         ;;
     stop)
         echo "core" > /proc/sys/kernel/core_pattern
diff --git a/meta-oe/recipes-kernel/minicoredumper/files/minicoredumper.service b/meta-oe/recipes-kernel/minicoredumper/files/minicoredumper.service
index 851b54c..45d098f 100644
--- a/meta-oe/recipes-kernel/minicoredumper/files/minicoredumper.service
+++ b/meta-oe/recipes-kernel/minicoredumper/files/minicoredumper.service
@@ -4,7 +4,7 @@ Description=Enable minicoredumper.
 [Service]
 Type=oneshot
 RemainAfterExit=yes
-ExecStart=/bin/sh -c '/bin/echo "|/usr/bin/minicoredumper %%p %%u %%g %%s %%t %%h %%e" > /proc/sys/kernel/core_pattern'
+ExecStart=/bin/sh -c '/bin/echo "|/usr/sbin/minicoredumper %%p %%u %%g %%s %%t %%h %%e" > /proc/sys/kernel/core_pattern'
 ExecStop=/bin/sh -c '/bin/echo "core" > /proc/sys/kernel/core_pattern'
 
 [Install]
-- 
2.7.4


