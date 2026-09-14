Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3436C88E66
	for <webhook@archiver.kernel.org>; Mon, 14 Sep 2026 03:13:22 +0000 (UTC)
Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12076.1789355595245282342
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 13 Sep 2026 20:13:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=DTOroTyS;
 spf=pass (domain: gmail.com, ip: 74.125.228.12, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-85469d249c4so1702625b3a.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 13 Sep 2026 20:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789355595; x=1789960395; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F9+yL6eYQxabiIOPWJ/pAK+WBW7vdjSQk8XOWWLAcEs=;
        b=DTOroTyS7/PLe4JNJc33RPeliXMGsZK3pGbU4umknzpAard1SkLRCOiW4nER5hQWVB
         hSM61Vh6OKxLHOYsWT7DsOl0yLKm/IrcUDNzTK80U6HpeJt9KMBsK8WhS+v4jTZb2xra
         Q8NIGGmhqppvNCTXki6JSifT0aMUr5a55yyZiVWjShPhjpR7zqNV74cK4+19NP1GI+57
         bbkdElxx5n/6cLDQvQYOdIf7M0mFPd8Z8q72O8xCYH9k6MsMNb3t+o2XGTYX3BnfwEgI
         I/ZeB0+EotyVjCpIRpVIeAAzcWtNLiNJ7TEVOVArCVrVm3YLM/KM39Kn9k/HWa16Ix0z
         +oHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789355595; x=1789960395;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=F9+yL6eYQxabiIOPWJ/pAK+WBW7vdjSQk8XOWWLAcEs=;
        b=oZD6myj+S3bVta9wEPtK2Hbxa08+VfdwD+jHqR5/S2tfMBEoqIpzxLit1yUSkd4YU6
         zLivCkpaMNtAZ+fDW2STA7QDjVP46hdqWkXq9nKFi4JNJq9t4AcKyWWfz5/WWI6muM8U
         kKVN7WSnX0dh5fIwzMw+VbK9NnkWsaOmc9ECSCGzBUPYx8MsTpYPF46mscHhjx1qAXDU
         JnRyC6LVccphHgVdWTRAdulJLl+39ApOEbfuhMTeDefA0/dFMrRMZzEIbbb5xssDs4tn
         qVE85eswz40uAnKLPI7Zne70KgwbxIayacVcY6rbtGRgjPxeGjGLFLqprkycIdhk48Ed
         h5Ng==
X-Gm-Message-State: AFuF++nv0pOpc/0DMZkRO+nBoIxIcElkC5CQvnhL8/nrtX0nwzlFeUrK
	dNnlBjOy0ZP5h0WhEslXvOG+OhA2htS79tuIbY+jVG3rpdhVyQ4etodhfzeAf0+r
X-Gm-Gg: AYBFou0QfLffPkURy02zZoyF3ns6m3DvclV8upF+S9TVwvzk3CVw40MbdOSU+/lJhCG
	ceSYWgpr74u1jyYUJbEb8EtBjMM0WQrMzbk1L3sDXodDMq1nRbSOc10zt9TsaCbrCDAX/XTBAil
	bJw4WNxcrFKHNQWzy8lRczKeI140VUDqViZVD+n8dexQ29EEQlldz0FH08RPb2pftReC+Z/VuMh
	TuKdjQMEScYja2VAG37BU470V+r5of+sgsNpi/kF4osbG3p8zuCAXpbB4QM+UbB/PSp1FoU6HnF
	jVEjanFjTq/F/h13JLe6AKWWqYgfcMzm2IbmZMxhJpcR+NHxhzmi1EFzM/CPO5tbnKZ/tx/h0yT
	gmwEKD6urMsEf8LaQg3qZyEjva4o5P+LGunkJNt6U5tOIxtYvKoenegPuO7zkWN3ME36zK1ps9N
	93psXyFKsOqFUjOg67OgmitTf6sNU/zBqKGNSEuamtfNNpeEuF6HrYnTwSYcDhFxysECsA2Uq0K
	0GT2PJ7cZByz9dbNVwzo9RnY2yVRQM=
X-Received: by 2002:a05:6a00:1916:b0:857:726d:2e9c with SMTP id d2e1a72fcca58-86f862c49b8mr1598775b3a.25.1789355594556;
        Sun, 13 Sep 2026 20:13:14 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([202.170.174.3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86b2a2b5c72sm3712425b3a.52.2026.09.13.20.13.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 20:13:14 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][wrynose][PATCH 3/10] python3-eventlet: mark CVE-2023-29483 fixed
Date: Mon, 14 Sep 2026 15:12:51 +1200
Message-ID: <20260914031300.3677365-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914031300.3677365-1-ankur.tyagi85@gmail.com>
References: <20260914031300.3677365-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Sep 2026 03:13:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130011

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Fix[1] for the CVE is part of the upstream version.

Details:
https://nvd.nist.gov/vuln/detail/cve-2023-29483

[1]https://github.com/eventlet/eventlet/commit/51e3c4928d4938beb576eff34f3bf97e6e64e6b4

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-python/recipes-devtools/python/python3-eventlet_0.41.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-eventlet_0.41.0.bb b/meta-python/recipes-devtools/python/python3-eventlet_0.41.0.bb
index 3c27caf968..0b8cd676d9 100644
--- a/meta-python/recipes-devtools/python/python3-eventlet_0.41.0.bb
+++ b/meta-python/recipes-devtools/python/python3-eventlet_0.41.0.bb
@@ -18,3 +18,5 @@ RDEPENDS:${PN} += " \
 	python3-six \
 	python3-greenlet \
 "
+
+CVE_STATUS[CVE-2023-29483] = "fixed-version: fixed since v0.35.2"

