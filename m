Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11825.1795763030127605184
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 23:03:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=WlnFqfq+;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2f0414c1062so46588895ad.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 23:03:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795763029; x=1796367829; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YzvQyW0CcWVXqGKo3ZoAupX5YRBwo1XoUHmoDasTbv4=;
        b=WlnFqfq+j787de6TuVhN8na1zWF0/Yi2tSpnj/YJDNknIZB5QiT8JXq6BkCUVUqACP
         vB/aDNu1IyjS1T3xvrrdyqtiReIIia+BVHTGfh4IQa58WvG59L7/cdPUX+RV2t6iNVNz
         MhXb4iZVzIa0EPr1SJBAUl68oYx9Fu2mCCIcP3InMfqpYYp3jyT3hz7/JeZ4h6WTmUcS
         ySEqNZ4r5aW4PVKh5LJSMzzrNaxYEu4SCoG5rkMtCJ9nnFl5Pevgnw1AS/sX9v9foDFs
         HdZq3CLdXTnDhE0lPsboDtUqRfR21nxLoiuncFrdEF3VHYIknngfO6mW/kzhAqIYFj9N
         KFXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795763029; x=1796367829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YzvQyW0CcWVXqGKo3ZoAupX5YRBwo1XoUHmoDasTbv4=;
        b=Y2oD5GXEiFMH0SVw6ZByQwtHXuJDKb4RJ1jyXSo8iJEOhuEw2JSlTrknLxZNIHG3Pl
         vVa3lRdQ+D5YXnO10enO2QMffUpYcV7OjxGBeiulpRf0KSvrFALP5dznA0uiGIolNXq+
         fk5g6/zcpiPm3JUwep8MFes0HssTYX+bZEeQJXucnj++Cvyrru1H6FCImUFzYMCwAnbs
         +IIymBXmjbdgZ2a2n0RrZ7rfwUCS1DUuCiHVlV+csIxFYBh8sJXTo3F6pBo03iQh3nMj
         kxxPwvMj/tShI/yWd/IxjERw2xgCjbqU44lRZZmnrcknsZTzmSs2jPyt0rkzAU+gEM6N
         OhRg==
X-Gm-Message-State: APuU4Z9PHhX3Ttv+vHb0HhfIEGlN3xdoAaS5v3aWh/QI3BJFOv+4+rPs
	LeZgD3383LOBDuYv8M/8DqRvQa7y+crR74+aXLhLYklk+hDBOhwJ2tChHlyEjnWU
X-Gm-Gg: AZFdTZeFV0Me5WuCbRDluBAnUndKYqFi2IDM8Bj3xsoncQeyPqucxVkcFD/0AzO8K4A
	t9UvEFEFSOEmhE42knoujxfNJVyqxdkAYCv1B1Jd3y/pdSlcJqC7//XOflbvOrugmcIDmt55aA8
	jfHF2qzl8YghMjTvQJfJJiepkeaOJgXNRZVb0BAQZtNoR9bfGVsRZzNJSRnlem5sJ4KUeT7NBah
	fJE3QUruqcJtB+5JfyQSXHOm9YwKr7v+5RmFOktev4UxiOCsJw9F127LuRyIpzEIMmsNTBKmGRI
	7nzZrIgduywdvI7pBn9mtm099DqKzRDTUqMm+8o3JbxYe6KgEzfAeJjBcLzmAWi9MzhF+rL3TLx
	Mmehy5RygKS6r37ExMILaByNLxIWFq5+K6QrA/IJhKTvKMtE5i53WH3Iv4mNDf/zLLthtDh2Nj8
	z9IOEzVf2nQHrbk8yzcbNzasPeJAGNu0LdwiVQKydwROJjOp7wH79LQ0RXytFaczw2bjalJ0SfB
	4eT/jk7hdCE/7YC9M0ihT1JeIXzA4sYzPN1NGCRGqPH8K9s1ef/DfmlYI78fxijkVQa9of/nGdo
	BmHXlCEX06s04HUNnXGYiUegjE2LQ7blCoepQwzIdt7no1vRp9LLPvGXkQyHXHfpMANLGAft9Po
	IoJEmNCWVuG7rzqyTr92EEi7MKk2Zqu+/F/BfNjJCexKotKq9PIFffKKnF7pKkFO6isqeXjCNBF
	uJYnYk38ZqX0yczGzjEUUya8mKIsOcL7isxdDMkizsY/kbmG2Mf3kXavaXNGHT/Y30Szunae7IS
	AAYKGAxqrRQmfL1lglU88maNZ07i/fGs42QuSQHGgoi0TU9uoTJCV6r7QHC+qKThWjZNL3xN3gI
	m9aY
X-Received: by 2002:a17:903:94b:b0:2f0:3618:f170 with SMTP id d9443c01a7336-2f03f1acb10mr229590015ad.66.1795763029416;
        Thu, 26 Nov 2026 23:03:49 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f1482c3sm112292155ad.73.2026.11.26.23.03.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 23:03:48 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-webserver][PATCH 4/4] swagger-ui: upgrade 5.35.1 -> 5.36.0
Date: Thu, 26 Nov 2026 23:03:42 -0800
Message-ID: <20261127070342.2403582-5-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127070342.2403582-1-khem.raj@oss.qualcomm.com>
References: <20261127070342.2403582-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 07:03:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133368
Content-Type: text/plain; charset="utf-8"

- json-schema-unified: add OAS 3.0 and 2.0 dialects, and an opt-in schema
  view for OAS 3.1/3.2
- Compile an isolated Tailwind v4 stylesheet into swagger-ui.css
- Build tooling updates (node 26.13)

Recipe: add UPSTREAM_CHECK_GITTAGREGEX so alpha/beta tags are ignored.
The prebuilt dist/ installed by the recipe is part of the tagged tree.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../swagger-ui/{swagger-ui_5.35.1.bb => swagger-ui_5.36.0.bb}  | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-webserver/recipes-devtools/swagger-ui/{swagger-ui_5.35.1.bb => swagger-ui_5.36.0.bb} (90%)

diff --git a/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.35.1.bb b/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.36.0.bb
similarity index 90%
rename from meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.35.1.bb
rename to meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.36.0.bb
index 08158e0b20..b5b4e03b71 100644
--- a/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.35.1.bb
+++ b/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.36.0.bb
@@ -12,7 +12,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI = "git://github.com/swagger-api/swagger-ui;branch=main;protocol=https;tag=v${PV}"
 
-SRCREV = "8fd7a7d57514e63e3601b4c61f3cdbafe605af02"
+SRCREV = "d157bfe091710f3a21d4c3be55985293d84b6e57"
+UPSTREAM_CHECK_GITTAGREGEX = "^v(?P<pver>\d+(\.\d+)+)$"
 
 CVE_STATUS[CVE-2016-1000229] = "fixed-version: fixed since 2.2.1"
 
