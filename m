Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.web11.965.1586895476877584881
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Apr 2020 13:17:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=JYfwnUOI;
 spf=pass (domain: gmail.com, ip: 209.85.128.66, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wm1-f66.google.com with SMTP id o81so8963591wmo.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2020 13:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1q4UP7GrWrNELj2oR9zPWaH5B0sMkfNZSefFcUZpyUI=;
        b=JYfwnUOIo3zJBfGFDHWTT8LwiUQAVCWPExiU0DxkhQfs0kI6+G5lOpR6TJneim+Mcl
         QBJGPe1FiY2NMC99RCi4nX+N+E2ZrudLUicVmQwcK0mkvh1ziNvPE0o1jyXMFbHtVjS3
         c/478TkF6vGhcgdeJAXkl9lDMN3DZrXg2EW7phtWFbfo081I8yZ+cUocxEovtvd4mAtI
         HoY+uuVqhjD3UJNq+tZxRJqem97vKbDfIOrEHJ1CbDWeorlRMWezQrocpX+Ajcg7d2cs
         OT4hZX/2JlIMFJdgtGbqAEBzSmUQMi4XbDP6j1+45GLdG3w54snVpoCOS2LbWwqBFb7y
         I7xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1q4UP7GrWrNELj2oR9zPWaH5B0sMkfNZSefFcUZpyUI=;
        b=Kwq0bvZiVdmeWVGUbUxJLCrRgloM85UT5fpBIr02M4yKlCKiQ6VKGRVl5KBtkZURPZ
         F75DmUKfOj6cwroTOs8uBzWbBDYiZrFSveFSywL697PwWQaJ40jE+6EQ/fo2Px2Ol2fi
         sN/i3PC4rXg+CVIUTZx1/sQBwm4Bbs7yBu0P831E8AhjSKudY1156+MTEN5S4M/jW1uG
         D+yc2apm9NjR+JO0x0b5bbnjB9YlFLJsFup+ddOEwWyNEITW4264Kju+zJUBfUWfRuiZ
         UcGf85N7e8Mg+/ga/p5W9vb2sKC7YtKoXcC1TBHFULURmFXdTWc41owT30pzWAK1XTe+
         A6Iw==
X-Gm-Message-State: AGi0PuajXmKd42vMIeBzuINicsaewNjMAj/Mm+jcIWE1VhqPJJ/qwsgu
	XOYMSE2i9GebFTEK/cBDtHdeDx2nV2I=
X-Google-Smtp-Source: APiQypKdtbDg44DbVTRvfuzToKnG+6QI4/UGfPxf5HM1kNPB1doDzB+VVRpQlOS8+T2l41nLElb1uw==
X-Received: by 2002:a1c:4304:: with SMTP id q4mr1681255wma.152.1586895474915;
        Tue, 14 Apr 2020 13:17:54 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300F07F0C2E51E8849BADA5B2D5E3.dip0.t-ipconnect.de. [2003:f0:7f0c:2e51:e884:9bad:a5b2:d5e3])
        by smtp.gmail.com with ESMTPSA id 145sm21115425wma.1.2020.04.14.13.17.54
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 13:17:54 -0700 (PDT)
From: "Andreas M?ller" <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 1/4] meta-gnome / meta-multimedia: Set correct email address
Date: Tue, 14 Apr 2020 22:17:42 +0200
Message-Id: <20200414201745.19390-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Times 'gmail' was not available in Germany for license reasons are long gone

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-gnome/README      | 2 +-
 meta-multimedia/README | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-gnome/README b/meta-gnome/README
index 3c5b4c5f9..a11815fb1 100644
--- a/meta-gnome/README
+++ b/meta-gnome/README
@@ -15,4 +15,4 @@ Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-gnom
 When sending single patches, please using something like:
 'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-gnome][PATCH'
 
-Layer maintainer: Andreas Müller <schnitzeltony@googlemail.com>
+Layer maintainer: Andreas Müller <schnitzeltony@gmail.com>
diff --git a/meta-multimedia/README b/meta-multimedia/README
index 20f4fb863..3c4b1af7f 100644
--- a/meta-multimedia/README
+++ b/meta-multimedia/README
@@ -16,4 +16,4 @@ When sending single patches, please use something like:
 
 You are encouraged to fork the mirror on github https://github.com/openembedded/meta-oe/ to share your patches, this is preferred for patch sets consisting of more than one patch. Other services like gitorious, repo.or.cz or self hosted setups are of course accepted as well, 'git fetch <remote>' works the same on all of them. We recommend github because it is free, easy to use, has been proven to be reliable and has a really good web GUI.
 
-Layer maintainer: Andreas Müller <schnitzeltony@googlemail.com>
+Layer maintainer: Andreas Müller <schnitzeltony@gmail.com>
-- 
2.21.1

