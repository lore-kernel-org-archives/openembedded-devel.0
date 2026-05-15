Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2F49CD343F
	for <webhook@archiver.kernel.org>; Fri, 15 May 2026 14:41:12 +0000 (UTC)
Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36491.1778856072086169998
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 May 2026 07:41:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=OUFwhNS8;
 spf=pass (domain: gmail.com, ip: 74.125.224.47, mailfrom: schonm@gmail.com)
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-65c305f381eso13263739d50.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 15 May 2026 07:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778856071; x=1779460871; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qNoEYbKgnKv73H7Da8rx5VV8dpON3iK7KVcumOHBCdE=;
        b=OUFwhNS8lt56iJY5wrnTPrbftQG2AkXcCqP//PiWDSev9qGkhYPvNoH1Axxeusw5Ig
         4RqxRheuEoCHSGyWYqe7VOfxINys7QXg4WavdUlysidbuY8T58eHvUcoseQazfMbCK4U
         UagmPvYK6IU2wmdzFgRrkeDEYwuf7E3TsLU9c933/rwfnS2N7bwb04xurUXtdPkZDRFk
         suB11OBnpDiC+jvQYWC3B3wwUHBgKUIS9j7s2mseiw92M7dRnuJa31g0/OF/8kF3XlFx
         Us+Zi94KL4qYFQV7GEJF2paeMDyN71YF4cy0Nt0Xn60qA1EPbFv3di0xHhvxOz03+5mX
         KS5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778856071; x=1779460871;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qNoEYbKgnKv73H7Da8rx5VV8dpON3iK7KVcumOHBCdE=;
        b=gD2aJX/Swc6AADy+5urC1CI6rbiP6RYUU5U+/f4O/nH9QhSbhRSHRhTH6NBYdUZgO4
         Q4FiauqYHnDYAMfOjRU8ED3UWCNPrTetRF6CeBCbG7zepYONEX2jYQIlDdp5wWNFJ3i5
         sOZA1SoaRDPM2vrCm2O4vTgAYCSr/3w/48ErNsbmQcbhVi5H0M3WKR6HAULfqCqog3QA
         mDFuCmu3v1Tp1Y7kN2scJ4oKpOGryPdtf2dgflMmpIPAOtLiEdHxbFGa+NTqenfreqs9
         t2YhXJvZ3+tfZFaWLOQ75WfKfAG0k8BEE8t5xjjarj0udqX1Z+B2vVNWjJ3fhlPEKNGS
         AM0Q==
X-Gm-Message-State: AOJu0Yw7IO1c+Gs9qbAEzeCx0XQ5jG4CyzX+EKkstx0+cmysbCkyRWN3
	/HucNuH5wxKdPkgcLQEUHi7GSAkhcxdUY1FY74MnAcAVF389Ksq1FAVh+ZHbgVn4
X-Gm-Gg: Acq92OFDPTJ1/YG8cRM8zi9BNURGQgY7zIqScOmM3ohe4aUy9g2Sy/IRA//d02cyuyk
	HrM854UTAW8rWINEQChV1+hxAqFJfeeabLma9CRCz7JAqD4jo8es501qhOM4lj92i+wvUTJqu59
	p7r0vGGkE2EChag+s2iBFcW5uvgltfFE2DCGy/JPTQWAaokO1v7HwaKjTY8wUDA6DaLsEwaRv6r
	FIW7rXaR28ApNpSz2n7zceQEzjokI1sR8WTDNX6Wk9xkyjuPKi0x9NlVVbd945u2XlD2kty199x
	a7NsohDmD7s8Qt+V2ZyL4hshAaRhNMEA3VcOMCD8UkzlsHSubnZp/TRZouMl30c6kWDm1cbZiQi
	hsTvP+oN7h+zlBzl0f3Dd1w0nJsQdKa9du3jCzS4NTD6z3jON97fa8y8zu/I779ER0A0oAxEXcC
	mzBBrTbE66X3jJv9G0FiAt794YMmG+vVYuRLi1ZQ0/bBYuI409XelYrg4MQo6YtlAvb3f1SCxCR
	uTm0Oh6JNsfNvHohAa38SmUcfEjsBxyfvSfoWQIk5d2YGmZnMQ=
X-Received: by 2002:a05:690c:c6ce:20b0:7bf:55b:8f9e with SMTP id 00721157ae682-7c95bf12374mr35290167b3.28.1778856070938;
        Fri, 15 May 2026 07:41:10 -0700 (PDT)
Received: from localhost.localdomain ([71.54.207.93])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7c7f5c965d6sm30662817b3.47.2026.05.15.07.41.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 07:41:10 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-webserver][wynose][PATCH v2] Update README.md example with new branch name.
Date: Fri, 15 May 2026 10:40:54 -0400
Message-ID: <20260515144054.35848-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 May 2026 14:41:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127010

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-filesystems/README.md | 2 +-
 meta-gnome/README.md       | 2 +-
 meta-initramfs/README.md   | 2 +-
 meta-multimedia/README.md  | 2 +-
 meta-oe/README.md          | 2 +-
 meta-perl/README.md        | 2 +-
 meta-python/README.md      | 2 +-
 meta-webserver/README.md   | 2 +-
 meta-xfce/README.md        | 2 +-
 9 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/meta-filesystems/README.md b/meta-filesystems/README.md
index 78a4429ce2..0fec1ee2d2 100644
--- a/meta-filesystems/README.md
+++ b/meta-filesystems/README.md
@@ -30,7 +30,7 @@ When sending single patches, please use something like:
 
    git send-email -1 -M \
         --to openembedded-devel@lists.openembedded.org \
-        --subject-prefix='meta-filesystems][PATCH'
+        --subject-prefix='meta-filesystems][wrynose][PATCH'
 
 
 Table of Contents
diff --git a/meta-gnome/README.md b/meta-gnome/README.md
index 6c23b4e671..579a4f11bb 100644
--- a/meta-gnome/README.md
+++ b/meta-gnome/README.md
@@ -11,6 +11,6 @@ branch: master
 Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-gnome]' in the subject'
 
 When sending single patches, please use something like:
-git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix='meta-gnome][PATCH'
+git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix='meta-gnome][wrynose][PATCH'
 
 Layer maintainer: Khem Raj <raj.khem@gmail.com>
diff --git a/meta-initramfs/README.md b/meta-initramfs/README.md
index e074142be7..eefaa9a387 100644
--- a/meta-initramfs/README.md
+++ b/meta-initramfs/README.md
@@ -22,7 +22,7 @@ Send patches / pull requests to openembedded-devel@lists.openembedded.org
 with '[meta-initramfs]' in the subject.
 
 When sending single patches, please use something like:
-git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix='meta-initramfs][PATCH'
+git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix='meta-initramfs][wrynose][PATCH'
 
 Interim layer maintainer: Khem Raj <raj.khem@gmail.com>
 
diff --git a/meta-multimedia/README.md b/meta-multimedia/README.md
index bda470a6f6..f55d965787 100644
--- a/meta-multimedia/README.md
+++ b/meta-multimedia/README.md
@@ -10,7 +10,7 @@ branch: master
 Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-multimedia]' in the subject
 
 When sending single patches, please use something like:
-git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix='meta-multimedia][PATCH'
+git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix='meta-multimedia][wrynose][PATCH'
 
 You are encouraged to fork the mirror on github https://github.com/openembedded/meta-openembedded to share your patches, this is preferred for patch sets consisting of more than one patch. Other services like GitLab, repo.or.cz or self hosted setups are of course accepted as well, 'git fetch <remote>' works the same on all of them. We recommend github because it is free, easy to use, has been proven to be reliable and has a really good web GUI.
 
diff --git a/meta-oe/README.md b/meta-oe/README.md
index da6c4cbe79..dee6fb4cd4 100644
--- a/meta-oe/README.md
+++ b/meta-oe/README.md
@@ -19,7 +19,7 @@ sudo apt-get install gcc-multilib linux-libc-dev:i386
 Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-oe]' in the subject'
 
 When sending single patches, please use something like:
-'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix="meta-oe][PATCH"'
+'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix="meta-oe][wrynose][PATCH"'
 
 You are encouraged to fork the mirror on GitHub https://github.com/openembedded/meta-openembedded
 to share your patches, this is preferred for patch sets consisting of more than one patch.
diff --git a/meta-perl/README.md b/meta-perl/README.md
index 9d56dbe8c6..3cf0bb7b9d 100644
--- a/meta-perl/README.md
+++ b/meta-perl/README.md
@@ -76,7 +76,7 @@ Send patches / pull requests to openembedded-devel@lists.openembedded.org with
 '[meta-perl]' in the subject.
 
 When sending single patches, please use something like:
-git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix='meta-perl][PATCH'
+git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix='meta-perl][wrynose][PATCH'
 
 Layer maintainers:
     Hongxu Jia <hongxu.jia@windriver.com>
diff --git a/meta-python/README.md b/meta-python/README.md
index 36c193957c..33caca8a19 100644
--- a/meta-python/README.md
+++ b/meta-python/README.md
@@ -31,7 +31,7 @@ Send pull requests to openembedded-devel@lists.openembedded.org with
 '[meta-python]' in the subject.
 
 When sending single patches, please use something like:
-git send-email -M -1 --to=openembedded-devel@lists.openembedded.org --subject-prefix='meta-python][PATCH'
+git send-email -M -1 --to=openembedded-devel@lists.openembedded.org --subject-prefix='meta-python][wrynose][PATCH'
 
 Maintenance
 -------------------------
diff --git a/meta-webserver/README.md b/meta-webserver/README.md
index 17c7c76d94..35e04853de 100644
--- a/meta-webserver/README.md
+++ b/meta-webserver/README.md
@@ -54,7 +54,7 @@ with '[meta-webserver]' in the subject.
 
 When sending single patches, please use something like:
 ```
-git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix="meta-webserver][PATCH"
+git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix="meta-webserver][wrynose][PATCH"
 ```
 
 Layer maintainer: Derek Straka <derek@asterius.io>
diff --git a/meta-xfce/README.md b/meta-xfce/README.md
index 564590ff39..e7386b576b 100644
--- a/meta-xfce/README.md
+++ b/meta-xfce/README.md
@@ -16,7 +16,7 @@ BBMASK = "meta-xfce/recipes-multimedia"
 Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-xfce]' in the subject'
 
 When sending single patches, please use something like:
-git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix='meta-xfce][PATCH'
+git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix='meta-xfce][wrynose][PATCH'
 
 Layer maintainer: Kai Kang <kai.kang@windriver.com>
 Layer maintainer: Khem Raj <raj.khem@gmail.com>
-- 
2.43.0


