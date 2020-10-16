Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com [209.85.216.66])
 by mx.groups.io with SMTP id smtpd.web11.17088.1602858848507482469
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Oct 2020 07:34:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=TAALcpjL;
 spf=pass (domain: gmail.com, ip: 209.85.216.66, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f66.google.com with SMTP id hk7so1626140pjb.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 16 Oct 2020 07:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vqkcUQJjvMQsHxQ98xWPKEmscwwxrQ+Z+Z3DiveuyR8=;
        b=TAALcpjLPQg07+fEo5AwfN5ER/5qCiRjFxN8TyQxdssVvnpQzuadv+KEtdoUTWtnfA
         y1gYVxUYr80nG3DvUuyVv6z+So1HtirdODDVhNW7eRegHWHOHdKtShuEBWEaPeXNKIMe
         pfXR1vNRcbeXCJaSFxIn+xs1v40vNZth78NCLn/lTNkuqjMOzXqnTYQzv4b7SdiD7QOW
         XpSYZi6ume0emXs6Ul/M3o63tf8udk3m4EmtXZustztQyrbQo/KkscsjpqHEFCW/lJYn
         zOktqdPN9asAMNNexCw+b1eoVCAkshVWsko58JXkqM9sN+Y58bBwEHFl0xqgmKls41kb
         LrnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vqkcUQJjvMQsHxQ98xWPKEmscwwxrQ+Z+Z3DiveuyR8=;
        b=ui4RwA76nCExDV63RvJGLWszn23HArD7nhru+G982LYkTTusHEgErqry9qeA+/xvKx
         pVlcIdD9ZI4Soo4YsFY5tpH1kVp+rs7MrrXOJ/CMwQCpIX9FIwiJEF+fnRL5yWAh4GhA
         yL5k1eL2ISyA1HG8+iZih9fVqchilj1Wx+DBuW33+YopwuiAEM3y9/6hkwfwK0gLtlLB
         dfDVIwDEruFrLi51Hj3OxczZV5saxPoPVOScrSYC7A0fyOxL8hFScr34wL9api808l1r
         RFRSiHyi0K7jNkKqXe+foKgtJ00B0A4htwO+z0j59/SPSZnvPfm2IydtR9k5gmecnqxG
         r0bA==
X-Gm-Message-State: AOAM533DEIqO/Eau1fHcKvIwrlgK8Iu60K3DgeSMCHo+o8RucR8FKZ1C
	B4CUV9L5oz5wrOigmTMQruuUIoPVsvGdvA==
X-Google-Smtp-Source: ABdhPJz/buHAtKep33CabF0YSdrbJwm1OesLX4os6y8vZmvAY6k6cQ1+nFU5uqUpilOW8r6CNK/vww==
X-Received: by 2002:a17:902:930c:b029:d3:b362:7939 with SMTP id bc12-20020a170902930cb02900d3b3627939mr4428746plb.54.1602858847648;
        Fri, 16 Oct 2020 07:34:07 -0700 (PDT)
Return-Path: <ticotimo@gmail.com>
Received: from thetis.hsd1.or.comcast.net ([2601:1c0:6000:9640:4938:26a4:cb77:8681])
        by smtp.gmail.com with ESMTPSA id x16sm3082036pff.14.2020.10.16.07.34.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2020 07:34:06 -0700 (PDT)
From: "Tim Orling" <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tim Orling <ticotimo@gmail.com>
Subject: [meta-python2][PATCH] README: added recipes must add to packagroup
Date: Fri, 16 Oct 2020 07:33:57 -0700
Message-Id: <20201016143357.20699-1-ticotimo@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When new recipes are added, they must also be
accompanied by a patch adding them to the
packagroup-meta-python2

This packagegroup is critical to the function of
the CI system behind this layer.

Signed-off-by: Tim Orling <ticotimo@gmail.com>
---
 README | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/README b/README
index e81533e2..a34cbb0c 100644
--- a/README
+++ b/README
@@ -78,6 +78,9 @@ It is expected that ANY upgrades to a recipe will have undergone run-time testin
 the upgrade. Many other developers depend upon the quality of this layer and will be quite upset with
 you when you break their builds.
 
+It is expected that any patch adding a new recipe will also add the recipe to packagegroup-meta-python2.
+This packagegroup is critical to the function of the CI system behind maintenance of this layer.
+
 Commit messages must include a "Signed-off-by:" line, including a valid email address and a legal name
 (not a nickname). The "Signed-off-by:" line means that you are either the author or have the legal right
 to submit the work. Please refer to the "Submitting a patch to OpenEmbedded" [6] and "Commit Patch
-- 
2.25.0

