Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D5F3C433EF
	for <webhook@archiver.kernel.org>; Mon, 28 Feb 2022 22:22:00 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web12.1402.1646086918940276574
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Feb 2022 14:21:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=IUdMkBJs;
 spf=pass (domain: gmail.com, ip: 209.85.210.176,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id k1so1834187pfu.2
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Feb 2022 14:21:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KlpFhkMtFWffGHWepb+INS8xE9T7YtZqkhFhPtR6JoE=;
        b=IUdMkBJshpJ3CQxDtu/t8BT2JJeM5H0rtITaBKFfgV4XNIXK15Ek8SjScSQuqeweum
         DRwPwrqT8uAdznqygzRUtZanDPk0AgPOk9OUuEDuK7pB8SRgxbUefLmk9kuvUAUYTTT7
         tcDAIi6gSgk1x0OAK6f0wF6MKoQS2Fx99BB/kSGQNMK9zBEQum/izq77IHh6ju9aAGoa
         4RSjs4u6wi/KIC593aQjHIFly2dIw4xZpUUV/HQ1MOpwmiZGYQQd6BpLZ7a3mpM9vtF+
         3H04Znq8MHD14SzRThbX3Ae4M+w9V/0GzKzk5wkrpqyukG8qNQsaXJPNhzVAJv9QI4nk
         WMCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KlpFhkMtFWffGHWepb+INS8xE9T7YtZqkhFhPtR6JoE=;
        b=bkQvVXZNkBaMFkbOTonHD9tUeqb1ao9P8j5zoCaNGCjZQNd7/uHnnH+PoMe9ENJMSX
         X2MLbZ6AqZQikDO78kfH4FR/pT/7cHYTzvAFq9euWU+sMMz7V+8yWnHLkqT/EO8Nk1QW
         WSZjx46bFf8NTmN4/WUBsxRUjWWJb9sm25t4VPyRERekPqFi0cHW3hKu4YRdyonYTTFi
         7ozymJG6VRkYcJQijgBX5+o77cBO7PTjK6416RtRRojZ/IUqjcMiBCc/BKMWscb2+wl9
         gaSK0aWeZ7Sjr4frp67AeIEW6p9qXAQhqv58stEOOW0/sUdarWB1X8dT+N7NfjVq2jse
         tI3g==
X-Gm-Message-State: AOAM533w9jASzXCrtjoJvBt/ALnZMBCPi94D4IUZZqjuAr0GivATuS2+
	eY1IMwI/6JjLWyEhaGhv5Nt2ghHadwMK7Q==
X-Google-Smtp-Source: 
 ABdhPJwnXCN7uwWIwgUqm2k0cuarwv+rzvQ64cq+aZVeT+liC0QPyYwfrC3cM/t3CthEHfHaV2GB8g==
X-Received: by 2002:a62:ddcc:0:b0:4e1:c248:d4a7 with SMTP id
 w195-20020a62ddcc000000b004e1c248d4a7mr23842219pff.63.1646086918111;
        Mon, 28 Feb 2022 14:21:58 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::1a20])
        by smtp.gmail.com with ESMTPSA id
 o17-20020a056a0015d100b004e1c11d833fsm15430992pfu.90.2022.02.28.14.21.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Feb 2022 14:21:57 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 3/3] ufw: Upgrade to 0.36.1 bugfix release
Date: Mon, 28 Feb 2022 14:21:54 -0800
Message-Id: <20220228222154.210195-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220228222154.210195-1-raj.khem@gmail.com>
References: <20220228222154.210195-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Feb 2022 22:22:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95600

Forward port 0002-add-an-option-to-specify-iptables-location.patch

Use distutils3, since it still needs it [1]

[1] https://git.launchpad.net/ufw/tree/setup.py#n28

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-option-to-specify-iptables-location.patch | 30 +++++++++++--------
 .../ufw/{ufw_0.36.bb => ufw_0.36.1.bb}        |  8 ++---
 2 files changed, 20 insertions(+), 18 deletions(-)
 rename meta-networking/recipes-connectivity/ufw/{ufw_0.36.bb => ufw_0.36.1.bb} (88%)

diff --git a/meta-networking/recipes-connectivity/ufw/ufw/0002-add-an-option-to-specify-iptables-location.patch b/meta-networking/recipes-connectivity/ufw/ufw/0002-add-an-option-to-specify-iptables-location.patch
index 884fa1647e..ee935eb615 100644
--- a/meta-networking/recipes-connectivity/ufw/ufw/0002-add-an-option-to-specify-iptables-location.patch
+++ b/meta-networking/recipes-connectivity/ufw/ufw/0002-add-an-option-to-specify-iptables-location.patch
@@ -23,11 +23,9 @@ Signed-off-by: Silcet <camorga1@gmail.com>
  setup.py | 65 ++++++++++++++++++++++++++++++++------------------------
  1 file changed, 37 insertions(+), 28 deletions(-)
 
-diff --git a/setup.py b/setup.py
-index 09204d3..2343bc9 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -246,41 +246,50 @@ shutil.copytree('src', 'staging')
+@@ -245,45 +245,50 @@ shutil.copytree('src', 'staging')
  os.unlink(os.path.join('staging', 'ufw-init'))
  os.unlink(os.path.join('staging', 'ufw-init-functions'))
  
@@ -36,7 +34,11 @@ index 09204d3..2343bc9 100644
  iptables_dir = ''
  
 -for e in ['iptables']:
--    for dir in ['/sbin', '/bin', '/usr/sbin', '/usr/bin', '/usr/local/sbin', \
+-    # Historically iptables was in /sbin, then later also symlinked from
+-    # /usr/sbin/iptables to /sbin/iptables. Debian bullseye moves iptables
+-    # to /usr/sbin with no symlink in /sbin except on upgrades. To accomodate
+-    # buildds that may still have the old iptables, search /usr/sbin first
+-    for dir in ['/usr/sbin', '/sbin', '/usr/bin', '/bin', '/usr/local/sbin', \
 -                '/usr/local/bin']:
 -        if e == "iptables":
 -            if os.path.exists(os.path.join(dir, e)):
@@ -49,6 +51,14 @@ index 09204d3..2343bc9 100644
 -        if iptables_exe != "":
 -            break
 -
+-
+-if iptables_exe == '':
+-    print("ERROR: could not find required binary 'iptables'", file=sys.stderr)
+-    sys.exit(1)
+-
+-for e in ['ip6tables', 'iptables-restore', 'ip6tables-restore']:
+-    if not os.path.exists(os.path.join(iptables_dir, e)):
+-        print("ERROR: could not find required binary '%s'" % (e), file=sys.stderr)
 +if "--iptables-dir" in sys.argv:
 +    iptables_dir = sys.argv[sys.argv.index("--iptables-dir") + 1]
 +    iptables_exe = os.path.join(iptables_dir, "iptables")
@@ -59,7 +69,7 @@ index 09204d3..2343bc9 100644
 +
 +if not iptables_set:
 +    for e in ['iptables']:
-+        for dir in ['/sbin', '/bin', '/usr/sbin', '/usr/bin', '/usr/local/sbin', \
++        for dir in ['/usr/sbin', '/sbin', '/usr/bin', '/bin', '/usr/local/sbin', \
 +                    '/usr/local/bin']:
 +            if e == "iptables":
 +                if os.path.exists(os.path.join(dir, e)):
@@ -68,16 +78,10 @@ index 09204d3..2343bc9 100644
 +                    print("Found '%s'" % iptables_exe)
 +                else:
 +                    continue
- 
--if iptables_exe == '':
--    print("ERROR: could not find required binary 'iptables'", file=sys.stderr)
--    sys.exit(1)
++
 +            if iptables_exe != "":
 +                break
- 
--for e in ['ip6tables', 'iptables-restore', 'ip6tables-restore']:
--    if not os.path.exists(os.path.join(iptables_dir, e)):
--        print("ERROR: could not find required binary '%s'" % (e), file=sys.stderr)
++
 +    if iptables_exe == '':
 +        print("ERROR: could not find required binary 'iptables'", file=sys.stderr)
          sys.exit(1)
diff --git a/meta-networking/recipes-connectivity/ufw/ufw_0.36.bb b/meta-networking/recipes-connectivity/ufw/ufw_0.36.1.bb
similarity index 88%
rename from meta-networking/recipes-connectivity/ufw/ufw_0.36.bb
rename to meta-networking/recipes-connectivity/ufw/ufw_0.36.1.bb
index 40188cea21..c6beedf02c 100644
--- a/meta-networking/recipes-connectivity/ufw/ufw_0.36.bb
+++ b/meta-networking/recipes-connectivity/ufw/ufw_0.36.1.bb
@@ -8,18 +8,16 @@ SECTION = "net"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f27defe1e96c2e1ecd4e0c9be8967949"
 
-SRC_URI = "https://launchpad.net/ufw/0.36/0.36/+download/ufw-0.36.tar.gz \
+SRC_URI = "https://launchpad.net/ufw/0.36/0.36.1/+download/ufw-0.36.1.tar.gz \
            file://0001-optimize-boot.patch \
            file://0002-add-an-option-to-specify-iptables-location.patch \
            file://0003-only-make-one-reference-to-env.patch \
            "
+SRC_URI[sha256sum] = "1c57e78fbf2970f0cc9c56ea87a231e6d83d825e55b9e31e2c88b91b0ea03c8c"
 
 UPSTREAM_CHECK_URI = "https://launchpad.net/ufw"
 
-SRC_URI[md5sum] = "6d8ab1506da21ae003f4628f93d05781"
-SRC_URI[sha256sum] = "754b22ae5edff0273460ac9f57509c3938187e0cf4fb9692c6a02833fff33cfc"
-
-inherit setuptools3 features_check systemd update-rc.d
+inherit distutils3 features_check systemd update-rc.d
 
 RDEPENDS:${PN} = " \
                   iptables \
-- 
2.35.1


