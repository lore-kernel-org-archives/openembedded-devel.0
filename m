Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37954.1795594126228326315
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Nov 2026 00:08:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=eHbeErqC;
 spf=pass (domain: gmail.com, ip: 74.125.82.180, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-385c497bf94so2110836eec.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 00:08:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795594126; x=1796198926; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vMDyZVvE92vGbwbczpn4Qsj+mTk1YNjANr/03+UhAlY=;
        b=eHbeErqC/zixLhE5KGmNrnozwAk6Ww6EKxpcLIuFsKPmzqu7WQ+kU0pM6Klb8KovKZ
         csppcL9OGsOb7Xh6HxlftzjXh5DTMTQgCxQ+3qhDgup0WAnGJhhIVuDoKlUgU2Be57L0
         oq5U4TzB5seroYfDBwMKOoOsojeadRNEj8RA7yyr+dXYRE2h/8WkeQZ+KTkyK89nVPhj
         hrH6WzoP/Z6BzJ22l/J8Qx6vSQAUPtCvy/87RwspVI2MLmWVF+5niPg67v1yR6nuMltd
         g5d8GH4X3BgH1bMj47I4BlfG2EZ10dJd9kp4vAvyTKLq+BIuDpAgJNr4aV5+c+3y10/b
         p1Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795594126; x=1796198926;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vMDyZVvE92vGbwbczpn4Qsj+mTk1YNjANr/03+UhAlY=;
        b=WcR5CIWNn+CDNxwRlLKdYsR2tVPjnQc1IQDI3cb42t4UcfcMa+RgN/AteHX4J2evQT
         oy5PvdFleJ41oFwDAlaVDv2yA6VwQY4Jtokl6rv/8d3kAHbO3qFFwGMI19JcaObLCzcG
         mDs0eL4pVOOtpPvh5RYzVE67vT/BH0S/4SKMvdEhD+fboqiloO9GIBqT8uYFDZlLjmi2
         vIw5fDW7RbfyUBJvEvYbqRO/HzpATrLRlD/dnBkhXECZrE9UuNsiArNeEybZcymbvGng
         c9+8CT9KkzWcfCuow1lUCk7m0XZMOivLOS/dmzZfL2zBggAOG5gqp2MxwJC/YLsT/K1c
         PNuw==
X-Gm-Message-State: APuU4Z9lAKOTdNCSo8f9QE3PX+rSWjoMIgWCuQnsT3eG9T8Uxmo2DGYd
	Qw2A5BteB4S6aPt9P9PxmzkvQDLDOjzRcvcvN2vGnwJ3HtRWBZDp0Rf1N5waAlDC
X-Gm-Gg: AZFdTZfMEZFX7TV5W39i2N5wSxY88MkCngLGth5BUQFEGS6kXXnohB+FN4dNeVcu0rq
	jiYjBtVbBEyyLRSH2RFS5S7aDA6yIDKQ8+zV51P/8LetZSftgaj8794TlgCb72YY6rWRl/jY8Wn
	1Hfk5NlChUDvSfS+BSjuikBFDZDK1Dq7X6pw/NGTc7gcEYS3M45xvzvORyJUP+iA5b5Qy3BL6za
	I9aTbtSe4TLdyzJeOXfUSfeeDHhhbVl1w5QAVfQUV3uVLJ0gNHrPs7jCaQxUzfKML95DMobdQeV
	w2xfN7t5a6meO184EM3kbCWIFpxTEv2OOWem0KbXh4rAIcEvp0ZGVUPQo7GNuv8AHZTQznbzuaO
	bsxBl4skdlOlUdmVP2zK7KBHUyrwCwFSrzpAFpqIDFBH3Bc9RcOPboJRu4iH7N+xsleRQQk6ADt
	enub5OK9LUTtxyldgXKN+T/dNGPrTy4um/edWZb6ely5fPqIZMJJFO2ckKYC0phDCdPngNe4Ozr
	QY+HJSeeMpH/LDOQ6jTwNEkq4jIrBLmw63If81/4K4Xz//AtRk1cHibpDLCQ9iqSzruNaj3Uw5Z
	rg11AO4YkK4eHVa+ug8Qp7pHfRT3+JYgAfbKuHWfhIqcLXqM+rxwTZVj+f2RVJwwHTy77UvCW9F
	of4r7jYfYcNiIHmNaDmx63rSMSDA4j1tZ6HaC1/EQPmjzZ+3gqAwVPgj8kFg3uDfhLXwEjrCLxV
	qJthtI42youUn92vWhIQ5RL5o47DjY5iFXBXE25fQgq2EBPBGkLP1IUKsCxBIYph/q/mf90IBYJ
	K1dMDr2mXTSKcdv4cCalFiJcKiODPWOhoM/FkW5W9xt019GdsPEclVHf6PoZqqogifG2VCyk+8W
	LQ6V
X-Received: by 2002:a05:7301:3a82:b0:374:ea35:9069 with SMTP id 5a478bee46e88-3856fb67380mr16264219eec.39.1795594125541;
        Wed, 25 Nov 2026 00:08:45 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm90997971eec.3.2026.11.25.00.08.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:08:44 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 51/55] czmq: Fix upstream version check
Date: Wed, 25 Nov 2026 00:07:07 -0800
Message-ID: <20261125080732.2419614-57-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125080732.2419614-1-khem.raj@oss.qualcomm.com>
References: <20261125080732.2419614-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 08:08:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133054
Content-Type: text/plain; charset="utf-8"

The unanchored UPSTREAM_CHECK_REGEX matches any dotted number on the
GitHub releases page, including ones from GitHub's own page markup, and
the check reports 11.28. Match only release tag links (v<version>).

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-connectivity/zeromq/czmq_4.2.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/zeromq/czmq_4.2.1.bb b/meta-oe/recipes-connectivity/zeromq/czmq_4.2.1.bb
index 9a71c2e0eb..1327f71ece 100644
--- a/meta-oe/recipes-connectivity/zeromq/czmq_4.2.1.bb
+++ b/meta-oe/recipes-connectivity/zeromq/czmq_4.2.1.bb
@@ -9,7 +9,7 @@ SRC_URI = "https://github.com/zeromq/czmq/releases/download/v${PV}/czmq-${PV}.ta
 SRC_URI[sha256sum] = "5d720a204c2a58645d6f7643af15d563a712dad98c9d32c1ed913377daa6ac39"
 
 UPSTREAM_CHECK_URI = "https://github.com/zeromq/${BPN}/releases"
-UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
+UPSTREAM_CHECK_REGEX = "releases/tag/v(?P<pver>\d+(\.\d+)+)$"
 
 inherit cmake pkgconfig
 
