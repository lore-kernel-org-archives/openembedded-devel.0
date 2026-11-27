Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10285.1795752835980551742
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 20:13:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=hDGTNcpO;
 spf=pass (domain: gmail.com, ip: 74.125.82.174, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-3863db981d4so10744468eec.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 20:13:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795752835; x=1796357635; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YaPUw10PW7KEbs0oUVK5NQfLZnNnSL6nbAObNwFIEfM=;
        b=hDGTNcpOlDUW0/P8fkhXYuKj4A6kDknWWFmsL4940QYkQOQyuRzL6B9VOA38AqKnNr
         iWelcQAzaJ5bMGSe/cvI2i96kso9xA7hg5u3YUCCFwKfsZuglPozzS/Bf5tSwmu3mSdK
         eR13iEpS2N0y7qwPlKg20N/LRBwQPhzlGhZOiqGxZSVwm3VF0gQmlV46T+A0HU57BSrE
         Itq2H8OgTva87hIsnVA8H7adts6Rgie/eBc90K+TmXPACS2GUEpvPN30v6A1dCfotd/U
         4c2HH0t6MOORq4ZWfAR241q/ScIkatmVOleWsgTA8VMX5Eil/1y5Z79P0DEiXGP0aZ++
         ZDaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795752835; x=1796357635;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YaPUw10PW7KEbs0oUVK5NQfLZnNnSL6nbAObNwFIEfM=;
        b=aT3/zKXRYk3Anl6DQHQL/cw1JK/587V5jUu+vDyViNZ7DAXm3Uco61JRmN7TTPq2k4
         U98Ff3zKWB6bf0J3PAC+O8oV8l5Q4sa537L6DCfRssRB6jjm2h/GplNhgnnhMU9nAQ5E
         4jf2WNA2RC9/Tn2kvBy5o4p8DuhuosqCYT5k3xfjtdWyTo99Sfn+kN6QMBOgSn21UsCf
         x02EAmhM60nWPr4tgpYmI7F8PijUXTfX6DrZ3hSWLfjuHrphqAmG2PHTnB2PCfiTIoM/
         ucfnw3QqXrKL4E+VN+AZeSxI6fo28tO7XXvsZGMuqBtupGXOcrZMyWX40RD2oKbX7a91
         UF0w==
X-Gm-Message-State: APuU4Z+ve9qHdI+F0hXx1Mc54FryRKuRpLj3RD1YL646+xwGB3DtSbSm
	L3uAp7iJdoLWq9Ti6/VzLmYiHRw68ZIMxlX7tGO27K9Oe2fLNrfGp83D6C7lK2W3
X-Gm-Gg: AZFdTZcnJNqRHysi4H9p53U18hnGtKnpWKoqdkEPgPAnMNk4k3fybQR0oCe8oOm5YKm
	vH3hdJWlyxA8ALYuo4aba0qeNnCKjqUD+v41UlLt9noxbsTg0viljX4p2qsDIPmL1AOyMY/9fDF
	tE/5UB1gw2/MgBZLR/Yh9cSkP5ccEnn6HxhJ+ChetYtYKf8nx0ZEPAuUgffsz9PBwOlGOqJoHXF
	EWqyu03awhj6cQ9l/06CPMJyT7BzcZXpATYLsFhRWhUDYah3DGP3ELkuB3biE9pOtFklQaDmD+o
	H+pmJuki7NIvvrbETBACrbwAX55tmPihlj3iSpEWFt/InslIF1BH3Z1FrFA/dWduh+TIWWrRFAd
	D+SEkizmv863midx61gAup6Y73EVvooway3l6zWUe29AcpUHgRx5d823/czOeWBwxixNmYeBzHF
	iViHxO34XXKjPe1lsw7SB2pEgqmmb4gz92h+HgPByHWHROyp/EprXuyNXgq45xfOiyoDSJcflu0
	4hfZUbZKFq41UgNkYy/B65dkrb/AxJtnkWVv5cC5ggnetwtsKAV/Dml80rHblir5jn2usyvqF+m
	YqbG3kUvZbEnSk5lyxgVT2axI/ouGrNB/ztnHB+bR8KcWn1uxGg82PrTBEr6PVaE/QkFTHg8wiw
	hfnpOOm7KwxgYmRISSbpFBtT8ZIrmTmFaNEc9KIBKUFWlv33x5q0udtxhZC3On+4NaTRPg0sAnf
	HpYXVPpdKqnlNx5Hv7RwwiFAajDCbYBrVjwkfyLlCcKmehcNmKQgzHT0n+qvk3Jsdsyl1qnKmu9
	IRmS2Z2SdfpE5+33XppI4AwbFjXEIQWBfH6odwRDHgprOWwu1MHPG8MAi8MI4/10D2O/0qoFMAQ
	J3C0
X-Received: by 2002:a05:693c:87d0:10b0:386:b823:d6c0 with SMTP id 5a478bee46e88-386b823dab0mr12653849eec.4.1795752835388;
        Thu, 26 Nov 2026 20:13:55 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7f59sm70674179eec.6.2026.11.26.20.13.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 20:13:54 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 33/39] valijson: upgrade 1.1.4 -> 1.1.5
Date: Thu, 26 Nov 2026 20:13:37 -0800
Message-ID: <20261127041343.1772294-5-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127041343.1772294-1-khem.raj@oss.qualcomm.com>
References: <20261127041343.1772294-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 04:14:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133203
Content-Type: text/plain; charset="utf-8"

- Fix propertyNames handling in nested subschemas.
- Support the json-pointer, relative-json-pointer and regex formats,
  require four-digit years in date and date-time formats and reject
  leading zeros in IPv4 addresses embedded in IPv6 addresses.
- Fix int64 bounds checks in the Qt adapter (Qt6 now required to use
  toInteger, Qt5 deprecated) and out-of-range doubleIsIntegral.
- valijsonConfig.cmake is now installed to the datadir rather than
  libdir, and valijson_EXCLUDE_JSON11 really excludes json11 headers.

Add an upstream version check on release tags.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../valijson/{valijson_1.1.4.bb => valijson_1.1.5.bb}          | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/valijson/{valijson_1.1.4.bb => valijson_1.1.5.bb} (87%)

diff --git a/meta-oe/recipes-devtools/valijson/valijson_1.1.4.bb b/meta-oe/recipes-devtools/valijson/valijson_1.1.5.bb
similarity index 87%
rename from meta-oe/recipes-devtools/valijson/valijson_1.1.4.bb
rename to meta-oe/recipes-devtools/valijson/valijson_1.1.5.bb
index 8777632342..44207e246c 100644
--- a/meta-oe/recipes-devtools/valijson/valijson_1.1.4.bb
+++ b/meta-oe/recipes-devtools/valijson/valijson_1.1.5.bb
@@ -4,7 +4,8 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5c4583a434195e4f3b418e17c8ca2daf"
 
 SRC_URI = "git://github.com/tristanpenman/valijson.git;branch=master;protocol=https;tag=v${PV}"
-SRCREV = "de232f2ac3798a3c8b2cc5f3b7ebf737e1c0dbd1"
+SRCREV = "c3a8fdd182da94ef6b351aeb20aa3354d765319d"
+UPSTREAM_CHECK_GITTAGREGEX = "^v(?P<pver>\d+(\.\d+)+)$"
 
 
 inherit cmake
