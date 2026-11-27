Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11771.1795762891753109480
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 23:01:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=oGkdKpeI;
 spf=pass (domain: gmail.com, ip: 74.125.82.47, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1a3c08d6928so11575426c88.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 23:01:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795762891; x=1796367691; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AVVm7sNJfqJh2cS/JzJsf40FWB2hm3RMZqDdcqDA2iI=;
        b=oGkdKpeIwrS79Md3iRSq7OBhlSQsgEN5PWqA9luvspOfH19YV5mIWFKDJiYWc5XCBW
         yvtIQzr9AlmyTrmYrYTxouc6kSbZ8fuQm0WvkwahOlOjEb2TzdgmJVa8m6M6i4/6hS/b
         5fqNtCBPAMICA8uh+tpcXCxtGsmDjbeQ1xjDCaTPnwTrhFL7AB4Hw1ZqQnOenADiIZi4
         FV5w1+cI4w85Wq5gPKkgPHkBR73glT0z7OgFje/t0TijAM5n7KhaVxj7lbfDPJ19jA//
         WkAUtLpD2dKblMeb+NQqEEg5mszSeO+mMrHu9jEQMzK82vopB9Pb37is7k6hU3dwIqVh
         Sr3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795762891; x=1796367691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AVVm7sNJfqJh2cS/JzJsf40FWB2hm3RMZqDdcqDA2iI=;
        b=xGevjmK3AJAQJ8QPpp7seTv2ctGC4U54/t/fqlXpxcdiqzzE8++pZBjOmf1kxjWymM
         fKUMGuyAmHxEtapdJt53C7XJjXDvFJVbn4ISuFf0jybOKPjcWuzuiu9mLczOzaUcGQ1C
         4YrnA5BbUT3AMtjdV9QU6rdYvxKYbfuFde/yseHufdjA0Z7XfcB8nKG1Od8xdV/IR1ro
         Uc3PtwE1IE6KQQ3ZpTgSix3cwLOSls8CB4MOiicXXql3odwMSI0+0mnJJu9xwXHLbFGZ
         kXbZJF7t7xmSyd9WClEgVUJBvkagcOva+taTg7LOkdRA9RgCIjI8LkofXTYr3eHo/RxY
         vEvQ==
X-Gm-Message-State: APuU4Z8VqWwa805QejbJtQM/kiTJ7ZMIOzj7K4GgwfEYVPg/O4e/aPKA
	YZfc5yIBd1Lj/Hiq2gLfO8puwntR+nTvLWWXK1YWPRHKsJcoMtqnOHjqUa+nAIuw
X-Gm-Gg: AZFdTZdVfO6OgUxgBXMjboVmYj9sSvKVSUzSoObT/mjvyHFLZRHBsOsPzTDUpuU8o7b
	hP4wqOGzqccBH8Hawau6T1rVhfYgKxPmCch7+OkoQxPJWVTW19YY1fnSAKcTrkmZM8lipK0GKM1
	p32796QIWqXoKOjhx6vxTLu9EV206EJWeOi9izRwKgONMXL/Ix1l7iEvHW2dPOLfqxypNcvhDct
	dgdR3iJFtsT3GAyjsjr0d+FXfE/0PgadeKOJZPn06kwUcRMbhCtoR7LobslUadukIIUpHAuhwH+
	piOxfpxhwke0AGu/zBtGOc47JdG9cHmT3AsBQ6LlEb1PYFpksj6R9raasNO3Ha/Zdn+hP0zIWqh
	3qwOcpv32i/vxrD1j6huzdRPYw+38EEtAPv8KTwQa5dDUyxxyvPNVt0vN8MIz/KdfX5RDulMteW
	7S7Rz+ofhA06Z9gSCqo750u84td6DSUV+zMfRPP+3bDOHg8qt6ffum8l+kUI5k1kzJib2fWF0PO
	j6nyo8NYG66fNrui8vxYGBPms6WBc04f3wvaH5xfTVLIEZYqLPsnQe9XhZ13SoXkRNPk1rBp0vI
	ymSfQ+1pDO3JMhhP+s53UH5ZzsLwoplmWPUrRac16QwFKyoONvn6tnmXYnhWjvfhrA7DZyItJ24
	ZY8csoxB5U55jiy5pNcG5Jz5P9CVaoLvq8v5GhcDNlLwJdYcI0sTzVQ1+uqd1El2GfNoSx5Bh5t
	bUPPXSa+zB7aalF0cWdVeSTc7/tNQEm+Pl0vi+5KUzliwMv3kxCWbkaQiEoRpm75niaHW6UI7y1
	dUhMzQ+IQdikQ7Dvr/w3x3hjqniEFIxiSBN8SAcNxg8FziFp6ZDj/4JPUpW0Z26oFieFBfD/9Vo
	fi4X
X-Received: by 2002:a05:7022:7f01:b0:15e:9126:c60f with SMTP id a92af1059eb24-1b5568bb55cmr20591432c88.29.1795762890814;
        Thu, 26 Nov 2026 23:01:30 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556847fdasm61309643c88.13.2026.11.26.23.01.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 23:01:30 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-multimedia][PATCH 14/14] dvb-apps: Mark upstream version as unknown
Date: Thu, 26 Nov 2026 23:01:12 -0800
Message-ID: <20261127070112.2273685-15-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127070112.2273685-1-khem.raj@oss.qualcomm.com>
References: <20261127070112.2273685-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 07:01:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133319
Content-Type: text/plain; charset="utf-8"

linuxtv.org's hg server is gone (the archive URL returns 404) and dvb-apps
is no longer developed, so the check reported UNKNOWN_BROKEN. The tarball
is still served by the source mirrors.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../recipes-multimedia/dvb-apps/dvb-apps_1.1.1.20140321.bb     | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-multimedia/recipes-multimedia/dvb-apps/dvb-apps_1.1.1.20140321.bb b/meta-multimedia/recipes-multimedia/dvb-apps/dvb-apps_1.1.1.20140321.bb
index 232130be0f..05ac373fa3 100644
--- a/meta-multimedia/recipes-multimedia/dvb-apps/dvb-apps_1.1.1.20140321.bb
+++ b/meta-multimedia/recipes-multimedia/dvb-apps/dvb-apps_1.1.1.20140321.bb
@@ -15,6 +15,9 @@ SRC_URI = "https://www.linuxtv.org/hg/dvb-apps/archive/3d43b280298c.tar.bz2;down
 SRC_URI[sha256sum] = "f39e2f0ebed7e32bce83522062ad4d414f67fccd5df1b647618524497e15e057"
 S = "${UNPACKDIR}/${BPN}-3d43b280298c"
 
+# The linuxtv hg server is gone and dvb-apps is no longer developed
+UPSTREAM_VERSION_UNKNOWN = "1"
+
 inherit perlnative
 
 export enable_static = "no"
