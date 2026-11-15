Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3794.1794728963038257136
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Nov 2026 23:49:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=FSmMDQJm;
 spf=pass (domain: gmail.com, ip: 74.125.82.170, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-3791619605cso4878596eec.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2026 23:49:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794728962; x=1795333762; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gSF9fKz54DnykEegLu5n6GdtmRm2Z3O6+W8ZblrYe18=;
        b=FSmMDQJmM6Sgdm55p6a9WZX+xPXbjGoWT3SbTjYYv0a/wqafE8u3jFMkqx/p6AyOVR
         ge/QPKcx16+pSwsMVmh6/qicIxvhTb4dpXj198aWpC5Xp86cMrkEdOC6fZFd6nWxWQ5L
         eEQVlKvqxbufFLfGKBFKB9qjSuVx5SOZot9PyAMoz5L7bAG4Df/NjgU6R2bYFmU4Tkox
         iwSktI7aFo2moDL1k+rcmAo9zYkxztHL8G3LzwSW5zOoV4P64jA/YbTXSUiFh3bnjsya
         cKBlm1PZONTEyYHQXzXR2EAyOisvgjTbsclc9TE1EyVigyDerQ1+45ufP+JyqkM4iIFZ
         OJyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794728962; x=1795333762;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gSF9fKz54DnykEegLu5n6GdtmRm2Z3O6+W8ZblrYe18=;
        b=qVbQ0bwc7DwrkGrOgP8HG5D+IWv1Ysfwgp+Kt7iPH+sH2kzqanEzOfnK+Te4PpP2Ps
         6rvW3vF9eLVpP3Rb38IqKiL9jSQKzdwAahX28M8p2htWRFfSilJ4L/dr4qxnUP93xl72
         1Q8lqRqvPg6jO1KPaw2QAHknm/CdFbWkXnbO7I7H2qa1/09pUw5DoDOTppS5uv1O+ye9
         AxkEK2ipGPQBBjpnN6d4KPOkCuyFkdG2z1crXgfDIhaFsC4dBkQOZusp8CQ8TZJvNjLi
         YvQBpCJeShUEhjuITPTgoP7SeHW1WOxcrqSlYbbuZ+4eJPaIbK3MYHG4JAVktQ27socR
         N9+w==
X-Gm-Message-State: APuU4Z+10lpB3U2pQ3CqiPo49SHaWqowpzT+eoMKKJKfIRG8vGKMYatp
	e7af9pKqQ3xvFtVASJ4SAs5lnu9xRrrAO+A6aPw5/zaKKHMsA1QyET6aHcUPg31z
X-Gm-Gg: AYBFou3zjFxA7Gt4uyWylaNZsbG06g2omC55kBu5MORBpAuUqXG+6Zp59lKA6bwDjWK
	0DavNs8+pi2BHWVx03ajtmsQJjARRvhfT2VIhJb+ycfQJNOJEkz1Aa0NluZpd1TUpdaVXC6KWN9
	318EG793ru0jXLxqTP2LykQbBJgl+jij5hQ1kdWoFIvMAiH8linb5JkmGHGlYvb9ZbmI6DbuMDr
	3XyY1pdWFmeYpfonLUFB/9aezAd9+q34E8X2TToRUWOiCcQIn13wHlU+J3MuVtAzwMHbrO1Rjlv
	D/ESzmv9SFcJ7+omQ12zv4NSKWr5GCarFzMmpj37iC55yk51VslfKQFGrQw39+iWFRJ8KUbgel0
	jvy6CrAfmvzpbG+SbHhzIECJNi1Em062Q1s5XW+IWoxOdlc87d1mQqCNCYkOVoM2J5KdolH8NSG
	yUgI1omFeQW2VWGEjWZn0jyWMOn83EBGxTJAFQ+/Vk8YsCayaJXOYjM1kxjmp+3x43nC2cRQZ7n
	J0l3Nsq7hK/e7uRzMj/pONWKY1/yGAmUAmwqGznTNG1rC1jHisDOzkNyqTdVNgZDnx8Z7bc6nET
	Be+VRUai/sl8ejRe7jSQ2KBW4zJPRxgr5LDL4kBuEoylUKP16hax0/5kkbwoDccHtKFrF2L4WIQ
	k7831niQjdP2P82Tgtt4NYKjGLlu1HRcsH2cQaHORqKFpFQ26+uOtuiq0W+055s4Ddt1oJ7Z1lk
	OlcTyD8eek2Y7eZKhPCPGXD0IaW/U+he/8OXL+yzMfYlwBjBjlvxPkZOfOio0e6mMKjiCZJB3YP
	lElOGbSMFxVSS4cv+3CGMwTFyhSPWLDp/p0JOcmLnxQ8UvYAbZcVu+6O8w6JoRUCq/1m9x2fOpB
	mcGBH9KvS6oKPRoRh7rCIYPTiw==
X-Received: by 2002:a05:693c:600a:b0:36a:180f:3154 with SMTP id 5a478bee46e88-3796628e9afmr7198549eec.18.1794728962108;
        Sat, 14 Nov 2026 23:49:22 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795591f4f8sm23112817eec.13.2026.11.14.23.49.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 23:49:21 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 01/96] crow: upgrade 1.3.4 -> 1.3.5
Date: Sat, 14 Nov 2026 23:47:39 -0800
Message-ID: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 07:49:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132271
Content-Type: text/plain; charset="utf-8"

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-support/crow/{crow_1.3.4.bb => crow_1.3.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/crow/{crow_1.3.4.bb => crow_1.3.5.bb} (93%)

diff --git a/meta-oe/recipes-support/crow/crow_1.3.4.bb b/meta-oe/recipes-support/crow/crow_1.3.5.bb
similarity index 93%
rename from meta-oe/recipes-support/crow/crow_1.3.4.bb
rename to meta-oe/recipes-support/crow/crow_1.3.5.bb
index 22642efc70..7e3af10a2a 100644
--- a/meta-oe/recipes-support/crow/crow_1.3.4.bb
+++ b/meta-oe/recipes-support/crow/crow_1.3.5.bb
@@ -8,7 +8,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e08502e395a6f7c037ddfe7d2915f58e"
 
 SRC_URI = "git://github.com/CrowCpp/Crow.git;protocol=https;branch=v1.3;tag=v${PV}"
-SRCREV = "ae0fef0ee67eec897e401321b99b6dd7cfbdc155"
+SRCREV = "fcf0c360b15fc245d884c71340b08ac20403ba36"
 
 inherit cmake
 
