Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10967.1795003164476638084
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Nov 2026 03:59:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=CmfO7t+y;
 spf=pass (domain: konsulko.com, ip: 209.85.128.52, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4bb666304fdso15336405e9.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 18 Nov 2026 03:59:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1795003163; x=1795607963; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MTcL3u3Yw8ZJAvpAU7sUj4owevrDTm9FraXQgziaQyY=;
        b=CmfO7t+y7KAujyJ14tMFKQEUtN0fnI+r3wHlh9+07EJ+Oe5WKvvNXaUFzvJ+n0OG3x
         leWgpMp4KX4hhn6Z+cE/drNE+CZDvhs1rLB8a3eiuvvWgwSk1W9RGW91ao8H/MMwbqvJ
         95gKDVfsmCL5GUnpRSwnLLQD8hWqD0jzXLY2I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795003163; x=1795607963;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MTcL3u3Yw8ZJAvpAU7sUj4owevrDTm9FraXQgziaQyY=;
        b=xcCe2yNRV1aUTBCd9UOBBQPiYCXeoi2FGaiH2ezjmGDFHUlcquFPb8npQKLiQsgWeH
         WRd0M2mYQFCvv/qhjh1iz6RAnsjbmSjh2DogZV1F3D+iJlm7nf2sabsz/0iwLp2LN2d3
         Ohbqz5yE2Y26fIp1FtJ7/ZHu9vAixdxmHsjiIze6RlCPz+vC34gwgxRIcFuZltRIfC9M
         ipEOobLxcfNVyH6xWV+1y5DifMEuap+w8FAjwLYOH5/eLmfC7zhiBBoTu3GmO4eIebiJ
         hFRiXNMg+LsAtsFf2ru+RmFgIw1DKKAXEGvylxOju+mbc6Fa/SFWvaRJz81hGysX1UVZ
         pIBQ==
X-Gm-Message-State: APuU4Z/z/YvcDzc+6v3fuNiSzS5I5R3ZsSYDLlfsQuZajsouI9ZRCFaL
	FNeYsQVcrw4BB6NThms0+Mlk8e8qBa3bS0G6PHzdHOJVY5YlCXgk8H7XvBl9CzaNy50U/zxsiyj
	yj98u
X-Gm-Gg: AYBFou2+DbvRVAOj+z/9aSZcnce6a9GGX5i+GcnFbVsteXjkCbC+16TCf74frgg2qav
	AyFg0KXVhS2OeHk/FNFhstSZoM6FuWzCLD3xCNN+2ge/FWhu8FvzOBWU5GQH1/xtU+9/Zu3cXxj
	49YSa9j0ONjW3X7mRKe4rWDEj9qBesWt5WXX4LoTHk5aa7GrrE/NjgaNzhVrcpB3zYqV3wgWzqt
	e5889qdy2KsIRRRcYLSSe1jA4146i1Jwi/zRxH8B2heH5uAu09k/vrG0awDAIebCYqyBDqgiVEC
	hYlEp7Ir/pvPri11UO+8ru+Z/KQFahAA83TkTjzjbOlulhYnB/XoB5jhLGcHgNOkSuV2ay3aJaT
	q8BTfcduJQcD0ZhRQrTdbL2wZ5O9/KaeYb4rqvFqawB1woO61RbVixOU6W8/2qCbzIP73zLz9OT
	uaRiWStBZNOu5MTjEcErP6pb23bKdZyUYMhnnambghSpAcak8xkJypwzWSbaoE4Oob8eKG3bvx3
	FdZFPjBqafUSe/cWWejmAlAeF439FcHoquwxZrtDhZB+U1TZMkufD7YJMHfoFK1SM6Fhdn/O3aK
	FiHNA+vJjRR7KqhhWUygeQ9qX6FHwVKqFcXR8uMtiNI6zAlqOKRNXyJY9U72+KnZjNIRPYIW80O
	9Z9c2g62wNLVuMhGup1Lh7dSHw+Aq/OlfVVfvD9RafkgxBtpIysBa8g==
X-Received: by 2002:a05:600c:3154:b0:4a1:c6f5:2450 with SMTP id 5b1f17b1804b1-4bb7da43c9emr38716195e9.17.1795003162700;
        Wed, 18 Nov 2026 03:59:22 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7d2b979bsm61328365e9.11.2026.11.18.03.59.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 03:59:22 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-multimedia][PATCH 3/3] meta-multimedia: README.md: Improve send-email
Date: Wed, 18 Nov 2026 13:59:13 +0200
Message-ID: <20261118115918.905269-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261118115918.905269-1-leon.anavi@konsulko.com>
References: <20261118115918.905269-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 18 Nov 2026 11:59:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132650
Content-Type: text/plain; charset="utf-8"

Add -M30% -C --find-copies-harder to the git send-email example in
README.md so that git format-patch detects renames and copies more
aggressively.

Patches that move or copy files then show only the changed lines
instead of full file deletions and additions, which makes them
smaller and easier to review.

Suggested-by: Khem Raj <khem.raj@oss.qualcomm.com>
Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 meta-multimedia/README.md | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/README.md b/meta-multimedia/README.md
index bda470a6f6..1fe002a36e 100644
--- a/meta-multimedia/README.md
+++ b/meta-multimedia/README.md
@@ -10,7 +10,7 @@
 Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-multimedia]' in the subject
 
 When sending single patches, please use something like:
-git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix='meta-multimedia][PATCH'
+git send-email -M30% -C --find-copies-harder -1 --to openembedded-devel@lists.openembedded.org --subject-prefix='meta-multimedia][PATCH'
 
 You are encouraged to fork the mirror on github https://github.com/openembedded/meta-openembedded to share your patches, this is preferred for patch sets consisting of more than one patch. Other services like GitLab, repo.or.cz or self hosted setups are of course accepted as well, 'git fetch <remote>' works the same on all of them. We recommend github because it is free, easy to use, has been proven to be reliable and has a really good web GUI.
 
-- 
2.47.3

