Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.10766.1611331017609736314
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Jan 2021 07:56:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ONos3yPp;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id t6so3452483plq.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 22 Jan 2021 07:56:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id;
        bh=TTMX68Sr777yEV51UScZwJNqj98QB570C8TrMs7B3sA=;
        b=ONos3yPpB6kG5en8DFtxYi6SlmzxW+wxF5eVN2lX2b5sOrGZ+suKXAzZ1q0VzG6aMZ
         3TA6bW04MQjxoXTapXZd6Qq7cqjLGHsOJFkiDBqBpG6ikj7hLNJjgqaAfB75wFOUB30Z
         PLnPdNwYgbiyz/3Ci74wVm46H1hdU6qbI7nVz/jq7o+UHtDzVXcAl7LPZvq/PQIVgkQZ
         X9Zxg62nWfvyNyacXQ5igQJ7rxXOnDtSbPM8wea1BJInborEfBAQWuDhIB703VTpSvaE
         v2IjW1+XHMS/3SH+7OwX2lJLzkk6Y0AR4cexmj7YjG5zpfNmncJCqc/y0ohsdECpIR1o
         2TUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=TTMX68Sr777yEV51UScZwJNqj98QB570C8TrMs7B3sA=;
        b=KUVeXiuWYstRiWl50REh9hzxH8vNqOOCWIB9Zpckjqk66YumcWpHsGroM5YCpe2f7b
         6VfdA/dWgfYZ8fxzqmnNhnk5C2IgTFTn4rx5yQ1B7Wx5UHBWqFO/q+/DkY8XlCIU5zaN
         Aywz/5wZkvl66M1KJb8V4zK8IHkH0HmC8Ba25wY7r3YzQYZQ71eZPje21AhUMB1tC8XP
         FY4wn1AxCmbBL5Jf1SFXwubUdBxXKFP5WbQYPl29GcsMcKz54YxfsRZi5qvWFoNRSep/
         e0g/t8NgNr9fvEbfwknf4/eICV91wW6iK1OmU/Ktwbh+2jlkv4fQVO30eFLOiCgBTap4
         OxgA==
X-Gm-Message-State: AOAM530ijfK+yHt1ib4JQDqRR8/MwF9iB+envZRiRwe9aHRWGCqtGtZR
	mVUNaV3NOVZQYPMKblS1xCbhfQxov1N+vA==
X-Google-Smtp-Source: ABdhPJzOdsWZnK4oitk5bG01Hy7bG9iAsOAoW4UFats/DeRhO86yL6bH7Tol3HmHQkC9bu2wv/HVNg==
X-Received: by 2002:a17:90a:d09:: with SMTP id t9mr6343296pja.139.1611331016593;
        Fri, 22 Jan 2021 07:56:56 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:558f:b0e2:ccf8:d652])
        by smtp.gmail.com with ESMTPSA id c23sm9609181pgc.72.2021.01.22.07.56.54
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Jan 2021 07:56:55 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 0/1] Update lua
Date: Fri, 22 Jan 2021 07:56:53 -0800
Message-Id: <20210122155654.18920-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1

Oldly the community allowed me to update the stable branches to this version and I missed master.
I thought master had a later version.

Armin Kuster (1):
  lua: update to 5.3.6

 meta-oe/recipes-devtools/lua/{lua_5.3.5.bb => lua_5.3.6.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-devtools/lua/{lua_5.3.5.bb => lua_5.3.6.bb} (92%)

-- 
2.17.1

