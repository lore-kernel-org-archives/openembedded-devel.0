Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B50FCCA473
	for <webhook@archiver.kernel.org>; Fri,  3 Jun 2022 19:19:45 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
 [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web09.2394.1654283979414392827
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Jun 2022 12:19:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ptNeCLv7;
 spf=pass (domain: gmail.com, ip: 209.85.215.171,
 mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id c14so7890256pgu.13
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Jun 2022 12:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=OhTt5WW9yjS3f8+jqr/0j+HhzWq29/uKlly49zsNjpE=;
        b=ptNeCLv7/N+VUFmvmg/2WtomO5pCA7oUeoGaPxuwXsfP+IaOMoNUJod2PKrso905fW
         ZYdbxGdsGmoi34wn/X9VsfpgejUvi4PQSBjrIeh36Et0h5CjYFKS2mX/UDDZuNQijxkd
         E5sInAx5m9wT7QfnQDjraTyXzPTMGolrH/1jKfWONwdvfk+hTunrV6bQqT/pHl5SAo5f
         UTF9lGWq3GgQGiUGqP2d8sZmB+zjbooJynz2bO1jDKoHg+5Ch4toI2A9/65F7H5KcWZJ
         IDAsk2y5pjMJbK60tZLRF35ImfKeXuQR3ov9nuKr/HOhzTwlevNfvwT9YXeqcepWn7NK
         6DHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OhTt5WW9yjS3f8+jqr/0j+HhzWq29/uKlly49zsNjpE=;
        b=oJG8stODFJ81GAWSHxqyqZDOMIowIUPcbiNFphoBHXOR8oqz9iXGkI4lNKkqJHDt4l
         hDDVKduXf/oJyi7rZW5HqsaToYOjIHKWFuJ6pBD6xmKMoqBWm0CtLgeduPXAvgvUtTUT
         FDjPtsrT28COIS2ZmHo7wTiHbC0Y/10afNR6scTYfH4SZZ21Ku5WQuXp1+X0SRsWRIJ0
         3wwPePeAuWRTOYIHjNPEhzzWVGNdhl6SiS+utp1kbV8E56zDmN49+mOXC6lHpLyubYW2
         E/Kc+mnYqPuTwO0UJSmfGVWHLDWmzUcC/vIQjchZjlkLpcgmNsojNnU1JDxw1bHPtmB4
         qLGw==
X-Gm-Message-State: AOAM531YduJ5tj9q9hRrlEA15WsR7TrpwpbUZ9hv2hO3OJuchNNK2Pe5
	tlCoNWdDS5nbstxVU1RM11W59xH/CqY=
X-Google-Smtp-Source: 
 ABdhPJySPPpj9POa+bLG/z56gUR0YXGe/y9hiP1emm682l+O8wGi+McfqxGKlk1QnXhcPPkIeyBd5g==
X-Received: by 2002:a63:2b49:0:b0:3fd:2d30:c6a6 with SMTP id
 r70-20020a632b49000000b003fd2d30c6a6mr3262246pgr.590.1654283978588;
        Fri, 03 Jun 2022 12:19:38 -0700 (PDT)
Received: from keaua.caveonetworks.com (c-67-181-203-136.hsd1.ca.comcast.net.
 [67.181.203.136])
        by smtp.gmail.com with ESMTPSA id
 p2-20020a170902c70200b001617541c94fsm5770620plp.60.2022.06.03.12.19.37
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jun 2022 12:19:37 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [kirkstone 11/20] unattended-upgrades: Disable auto-detecting modules
Date: Fri,  3 Jun 2022 12:17:10 -0700
Message-Id: 
 <442af705f0dc1d8211892bd0e1de5135fee6e1fa.1654282423.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1654282423.git.akuster808@gmail.com>
References: <cover.1654282423.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Jun 2022 19:19:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97400

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit e7193af6c94436a577ebd472c6294eaef7c7cd15)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...up.py-Disable-autodection-of-modules.patch | 28 +++++++++++++++++++
 .../unattended-upgrades_2.6.bb                |  1 +
 2 files changed, 29 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/unattended-upgrades/files/0001-setup.py-Disable-autodection-of-modules.patch

diff --git a/meta-oe/recipes-devtools/unattended-upgrades/files/0001-setup.py-Disable-autodection-of-modules.patch b/meta-oe/recipes-devtools/unattended-upgrades/files/0001-setup.py-Disable-autodection-of-modules.patch
new file mode 100644
index 0000000000..ec70dd6570
--- /dev/null
+++ b/meta-oe/recipes-devtools/unattended-upgrades/files/0001-setup.py-Disable-autodection-of-modules.patch
@@ -0,0 +1,28 @@
+From 8fd80ead718ffc53d7182b9df6f49974113ff8fc Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 23 May 2022 11:23:58 -0700
+Subject: [PATCH] setup.py: Disable autodection of modules
+
+This helps to fix build with latest setuptools
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ setup.py | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/setup.py b/setup.py
+index 932bf01..fd5a092 100755
+--- a/setup.py
++++ b/setup.py
+@@ -12,6 +12,7 @@ if __name__ == "__main__":
+         name='unattended-upgrades',
+         version='0.1',
+         scripts=['unattended-upgrade'],
++        py_modules=[],
+         data_files=[
+             ('../etc/logrotate.d/',
+                 ["data/logrotate.d/unattended-upgrades"]),
+-- 
+2.36.1
+
diff --git a/meta-oe/recipes-devtools/unattended-upgrades/unattended-upgrades_2.6.bb b/meta-oe/recipes-devtools/unattended-upgrades/unattended-upgrades_2.6.bb
index 1ec205f8b8..d4f5b8d0cb 100644
--- a/meta-oe/recipes-devtools/unattended-upgrades/unattended-upgrades_2.6.bb
+++ b/meta-oe/recipes-devtools/unattended-upgrades/unattended-upgrades_2.6.bb
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
 
 SRC_URI = "git://github.com/mvo5/unattended-upgrades.git;protocol=https;branch=master \
            file://0001-unattended-upgrade-Remove-distro_info-usage-to-check.patch \
+           file://0001-setup.py-Disable-autodection-of-modules.patch \
            "
 
 SRCREV = "c6db6fad26a2b83ba301b52ff5dee98cef7558ca"
-- 
2.25.1


