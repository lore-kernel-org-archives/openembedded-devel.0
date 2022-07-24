Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AF3BC43334
	for <webhook@archiver.kernel.org>; Sun, 24 Jul 2022 17:11:02 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web08.18643.1658682659638766526
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 24 Jul 2022 10:10:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JxICvshp;
 spf=pass (domain: gmail.com, ip: 209.85.215.169,
 mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id 23so8358336pgc.8
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 24 Jul 2022 10:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MDHjAkFuVlxwCSwdA2Jlq8xLjWcvZkYWDiAUCd+RQIw=;
        b=JxICvshpI9Vdlbfb5Zn5qMV1HC5J5WZ7AqkrdJ6FzfZ0o/5CZZ/qcKokl5q1p/YU8o
         SjZOVli6UshXXaqqueLuaEqWLIbHs99Y/u4OovRioXdY4VTlUcIqKjv4uLi+ovwh002O
         xENTFk0NIpkMQDun5eoLYokEZuwI/ycXJirqpfXp8C1kVsTnsXJSq9suevdsOl+wmZI2
         g2yuiVR0qTKCT4kyTzJJcxSQknV1THQxqd3npHo3Bnlq52iL9t5mIuhrA9IIOeWv7v1I
         36hmcQ2NK2JnEmvCtel4K/WqOJEyaw7O17wi2E9fz8QtHkiIu/D6bUfLUllwrz9FTn79
         pTsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MDHjAkFuVlxwCSwdA2Jlq8xLjWcvZkYWDiAUCd+RQIw=;
        b=MZqPsXeQwcb93kuuZDYfdF6kW7+CL8bvGtuFIhwqyorlQaFzUr4fVpvMYT4drv65YY
         kwqbvWdw75IOLfy9LrvSd2wUFdkIDIxiks1r4mCQg89iTlpgLDOJFLizxn42oPcvRMY4
         oNahuqt4ZE2UD2JJTbSITBZvH/gAZtOvG2oNUxaudBO9gKIuhBXbR6klhwzDTCfbTUrG
         hbZXWEVYCdVPQlyK4K/kT8ebwnGwt+YF4ugVvz3TfRvbU9aF9XxFlb114D03g+fJz2G4
         LIPwdqVk+HFZFVBzIEO9nSwsunn1bOo5i+X+3Y/S+odA/WXwXGwcbw3UqhEDxkEcjCUN
         xR6A==
X-Gm-Message-State: AJIora9OH/pg/BxEzNlVVDqlqDWI4BABAC75okN6Psu6z0SzppbMcl07
	qH/g7V/5Ka+O0kIi1vnppuQs9BZEpe4=
X-Google-Smtp-Source: 
 AGRyM1sXpg0ifj+NopujdhXwHy6OUYk67iK+6U/mFSMn8vbA4mdMPkUIn96SfXUbuABkfacYM2HY0Q==
X-Received: by 2002:a63:4b08:0:b0:41a:e145:ca87 with SMTP id
 y8-20020a634b08000000b0041ae145ca87mr3859052pga.21.1658682658422;
        Sun, 24 Jul 2022 10:10:58 -0700 (PDT)
Received: from keaua.hsd1.ca.comcast.net
 ([2601:202:4180:a5c0:53e0:7d8e:f0d5:f69e])
        by smtp.gmail.com with ESMTPSA id
 c6-20020a170902b68600b001637529493esm7438425pls.66.2022.07.24.10.10.56
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Jul 2022 10:10:57 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][master][kirkstone][dunfell][PATCH]
  bigbuckbunny-1080p: update SRC_URI
Date: Sun, 24 Jul 2022 10:10:55 -0700
Message-Id: <20220724171055.1927039-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 24 Jul 2022 17:11:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97960

fixes:
ERROR: bigbuckbunny-1080p-1.0-r0 do_fetch: Bitbake Fetcher Error: FetchError('Unable to fetch URL from any source.', 'https://www.mediaspip.net/IMG/avi/big_buck_bunny_1080p_surround.avi')

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-multimedia/sample-content/bigbuckbunny-1080p.bb     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-1080p.bb b/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-1080p.bb
index b848b820c3..cb919d79e3 100644
--- a/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-1080p.bb
+++ b/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-1080p.bb
@@ -3,7 +3,7 @@ LICENSE = "CC-BY-3.0"
 # http://www.bigbuckbunny.org/index.php/about/
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/CC-BY-3.0;md5=dfa02b5755629022e267f10b9c0a2ab7"
 
-SRC_URI = "https://www.mediaspip.net/IMG/avi/big_buck_bunny_1080p_surround.avi"
+SRC_URI = "http://www.peach.themazzone.com/big_buck_bunny_1080p_surround.avi"
 SRC_URI[md5sum] = "223991c8b33564eb77988a4c13c1c76a"
 SRC_URI[sha256sum] = "69fe2cfe7154a6e752688e3a0d7d6b07b1605bbaf75b56f6470dc7b4c20c06ea"
 
-- 
2.25.1


