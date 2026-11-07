Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6376.1794046328535114346
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 07 Nov 2026 02:12:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=a/9ykC7T;
 spf=pass (domain: gmail.com, ip: 74.125.82.48, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1adbf62dd31so1896763c88.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 07 Nov 2026 02:12:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794046328; x=1794651128; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jIJ+RWDJlK3g1Ufr73geo4NG9E6uFPU7ROcO/i94K3g=;
        b=a/9ykC7T2Tw54cHvIpnbQSUDPLnzHNpHwlqwT1p5r1jqWHHNGdmUFBoug0Xh7qMbeL
         TawF3a7l4s4whXG2sV+dXiOc0ZwFGg97+0mygdFjKa5Eal/iiHlBXcqmjpyaxHO98GBa
         qO2lhYMX+kzepoUN9XtOf+dX9vA2Ae/G4P19/gW1/GwjJbSNqfwF7zPCAZWlD41b9k2J
         LIfQzmLcNNiG1rT5+xDo+KI5KWPIj74Ex2YAA5pVCsWnmgtFEZLRtuhM24NklTFyxDYT
         B4amTy/jwuR6mQQuwp9sFapgdRNwfSIrlnKCOusWjMAxJQZL6Xun5qTbebXF08b4d7uu
         yR0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794046328; x=1794651128;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jIJ+RWDJlK3g1Ufr73geo4NG9E6uFPU7ROcO/i94K3g=;
        b=h95CIQOzr4qE5CMNs1zDG+ZmwYGWYtgCbmqcViK+mAJjx55+Qa65zQC66fSN68fdIf
         bFSEi/jSHXmkfHGRStVuwKZ+rUliPyUE44Xi2C+s39EohLwXZbk1rYM02DCaa8kL/Lrt
         W2qthKh55vukcQj5gUh9L2k4KWiZnWp1Yt9/eLA5PXcVtrbBJZIsYPhIZ2bphgPoEeAS
         2NLiO9quUY8nrg53YLPCBZmYkoy1Zu21Wb3z85O3heIQoHshxLKFjsF5Wmzwa2L/Mq+y
         St1lnhjfSp206rP2RBEtGuFh0ezwnH1PxSk3jaMKYGYmFJj5Gwhf1Re9RHXfaX/OFWHx
         BFlg==
X-Gm-Message-State: APuU4Z+i1Dp4gjbH2Fifjo6QM0SWewQDAoKU+dRbajq5ffhs9CbUMQhp
	lBLYtRnlb5S4AyUAD5WPBji2Eyd/1fVtzERl15KUfS8UrspR8OEdEXXhP7g7vQ==
X-Gm-Gg: AYBFou3wiKxf26Y26B9jSg/HcTm5a+PXiqxAQBTsXVkES6Oc03cCqRtJXSQSRQXSZXg
	2zCN+jqaE0RoJdbRYkaj10YazsuiZYWPSWa6deTnWNMs0vqzSBpTSbCsx9bsXyCg3WFLmCNvvBn
	kHSnsKu4/A+H3Er/wcPI38dEDLxs/FlLfo9H0P1POeylFQ7M1hiVdEji/OIqe3YXllQMEW8dBeM
	FP93CY5hbuH23cw6//KyE4TdJHs6No4GJ+XCQIKJjmx5/FvGfiUYxkbEHV41SJaHfzVWFInTRT8
	37d26t8gl4BCEP/xWv/NBNIhwM7luudnIg40WZKgsrigl938Wq5LKcW/UU9QfpHTHssq4YCblIA
	Gr3ETF7l0lv2MURrXCOVQQTdJqtcAhh/9/FMKr2ixO6YzQcXCAJHsU9velAohoOX4YccX0sNIRK
	3HQMCn+4xIlS0VjcLTa98EhHEKA8UyN/HJ+xEMhCoY+CmzkNE9ON3MQv4IsOSbKnTzSztPCOu6z
	85lIsFh5Zq0pWpnumw133MK+h96TYUgzKXjiSR6rjR1GN9ZgvIWuaZwN13xYO2WnVcJCD2qIl7O
	CvkLA51UmYF/7IzjIw0PNwu3DIbFKXHCa/Ty/1fmMdkIjIkbIRXRjNhE7tXHUA==
X-Received: by 2002:a05:701b:2706:b0:187:efba:9ba2 with SMTP id a92af1059eb24-1b25d3a839cmr5997770c88.44.1794046327738;
        Sat, 07 Nov 2026 02:12:07 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4840f3sm22856467c88.5.2026.11.07.02.12.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 02:12:07 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-gnome][PATCH 4/11] libcloudproviders: upgrade 0.4.1 -> 0.4.2
Date: Sat,  7 Nov 2026 23:11:47 +1300
Message-ID: <20261107101154.2992152-4-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261107101154.2992152-1-ankur.tyagi85@gmail.com>
References: <20261107101154.2992152-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sat, 07 Nov 2026 10:12:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131978
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://gitlab.gnome.org/GNOME/libcloudproviders/-/blob/0.4.2/CHANGELOG?ref_type=tags

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{libcloudproviders_0.4.1.bb => libcloudproviders_0.4.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-support/libcloudproviders/{libcloudproviders_0.4.1.bb => libcloudproviders_0.4.2.bb} (76%)

diff --git a/meta-gnome/recipes-support/libcloudproviders/libcloudproviders_0.4.1.bb b/meta-gnome/recipes-support/libcloudproviders/libcloudproviders_0.4.2.bb
similarity index 76%
rename from meta-gnome/recipes-support/libcloudproviders/libcloudproviders_0.4.1.bb
rename to meta-gnome/recipes-support/libcloudproviders/libcloudproviders_0.4.2.bb
index 8bf940a472..7aecdd73b9 100644
--- a/meta-gnome/recipes-support/libcloudproviders/libcloudproviders_0.4.1.bb
+++ b/meta-gnome/recipes-support/libcloudproviders/libcloudproviders_0.4.2.bb
@@ -8,4 +8,4 @@ DEPENDS = "glib-2.0"
 
 inherit gnomebase gobject-introspection vala
 
-SRC_URI[archive.sha256sum] = "3e123fa2a34f6dfd99897ebe5fec3dfa35d9cf4b192c28fe7fc90c5aafafcf5b"
+SRC_URI[archive.sha256sum] = "935e3768a7e549a40ffc8a26c0de719c6c36ad9c055a13ecefe3ea9a9bc9feab"
