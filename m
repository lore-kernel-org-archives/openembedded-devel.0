Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B361C43217
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 16:56:43 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web12.1719.1650300325212767549
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Apr 2022 09:45:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nDHNip6T;
 spf=pass (domain: gmail.com, ip: 209.85.221.52,
 mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id k22so19181442wrd.2
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Apr 2022 09:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+OS45YnBNqg7tLEz9aXekkjaC7SHLKpFZeNjombu39A=;
        b=nDHNip6T3R+dKwAf/F9vUzLoDOlq8hIYrqtqfYg8BPyoW9sfDh70QnQG6IvSP4OHUj
         wkn7HIU1eGo1WVd/UAYlgDIygO0dVR0ysntw0CO5D4xcFpbdNsD8PWO+59JL9x0vFXkl
         9ilcknCfXFjkEnoT+Uwc5XhaboIKU8nhcatM6PpRFKVCjvBBmx1YHVziyCef9HE+8VgL
         ZkJnXIddvyQJqWtX1eZAP/rFyOrLEG8eZKV8UaggiQIMriLFRG7jzdHLcsdm48RvAmq6
         C9yhj/AvTpGQUCIFHkP84TeFTUKBBXRhmghdgjmBILE+vaAdgJF0QAk+lQgWr6/jdwSh
         mSdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+OS45YnBNqg7tLEz9aXekkjaC7SHLKpFZeNjombu39A=;
        b=Kd5y10QpIZnDR5MFviSY4AnmkId8gjeVo17uC/2ajGVieqTOeH01MAWZOkvg6AwIUO
         EhqrSWaPY5DiyLP3e3ttNwcIXWmnMIiqWO62FsTebWu/68OsCeIzE3ADDXwhpzJZTsvj
         bsRtLC/HwOcLdJfLCl2/7DctwG2hOUROdOoPArjIXklJzF+pXACXN3X3K6Z0nI+e7TSN
         AsZFlCnbwX7smf1hTG/79S+UCYRdOh584PoeUP27k9rYHw4t4aP38UhyvE9B5P/PY7N7
         iW8nrp7qH98hS2eycJ6e9hezeRmD0xM1mCiK7yXjUn3swP7rqlUgWjmWSgn0mcN8y/wB
         mRDw==
X-Gm-Message-State: AOAM531+x8DLoKi/LbMaM5XhHXac34ybXdiu9oB5oR34226srped9FWj
	2aUBcRsSdP1pxVAny4q9tlmtrjZs2i4=
X-Google-Smtp-Source: 
 ABdhPJxDJ3tWOfAhmBJtXPDiT5ow7X44gaztPozkSI5rFVY7VPtvdjuZi3cnE+wjftNgfUd1OU+8jw==
X-Received: by 2002:adf:c38a:0:b0:207:9daa:d881 with SMTP id
 p10-20020adfc38a000000b002079daad881mr8621609wrf.334.1650300323458;
        Mon, 18 Apr 2022 09:45:23 -0700 (PDT)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net.
 [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id
 t18-20020a05600c199200b0039291537cfesm5616224wmq.21.2022.04.18.09.45.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Apr 2022 09:45:22 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
X-Google-Original-From: Alex Kiernan <alexk@zuma.ai>
To: openembedded-devel@lists.openembedded.org
Cc: Alex Kiernan <alexk@zuma.ai>,
	Alex Kiernan <alex.kiernan@gmail.com>
Subject: [meta-oe][PATCH] mosh: Drop perl dependencies from server
Date: Mon, 18 Apr 2022 17:44:53 +0100
Message-Id: <20220418164452.10402-1-alexk@zuma.ai>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Apr 2022 16:56:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96686

The mosh-server has no dependency on perl - upstream is explicit:

  Mosh has a Perl dependency that is only required for client use. For
  some platforms, it may make sense to have separate mosh-server and
  mosh-client packages to allow mosh-server usage without Perl.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
Signed-off-by: Alex Kiernan <alexk@zuma.ai>
---
 meta-oe/recipes-connectivity/mosh/mosh_1.3.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/mosh/mosh_1.3.2.bb b/meta-oe/recipes-connectivity/mosh/mosh_1.3.2.bb
index 0921db5e01c8..b4b5aa78a042 100644
--- a/meta-oe/recipes-connectivity/mosh/mosh_1.3.2.bb
+++ b/meta-oe/recipes-connectivity/mosh/mosh_1.3.2.bb
@@ -36,7 +36,7 @@ NEEDED_PERL_MODULES = "\
 # mosh uses SSH to authenticate and the client uses OpenSSH-specific features
 RDEPENDS:${PN} += "openssh-ssh ${NEEDED_PERL_MODULES}"
 # The server seemed not to work with dropbear either
-RDEPENDS:${PN}-server += "openssh-sshd ${NEEDED_PERL_MODULES}"
+RDEPENDS:${PN}-server += "openssh-sshd"
 
 # Fails to build with thumb-1 (qemuarm)
 #| {standard input}: Assembler messages:
-- 
2.35.1


