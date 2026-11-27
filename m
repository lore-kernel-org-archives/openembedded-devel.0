Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8093.1795739739288240676
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 16:35:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=T6akxx0u;
 spf=pass (domain: gmail.com, ip: 74.125.82.182, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-386cf1041cdso4192008eec.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 16:35:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795739739; x=1796344539; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IYzpIq5mnQwGl0sz8AsgJRjhodEHxiFnesMza5MMboI=;
        b=T6akxx0u78YbyVtZ6LknduU1V96IPAPhaatHn74oSqYlf+R3qaX93g3dgE3PrZihfu
         e6sDVpwTylKUieJoixSwwcw0rtymMhl0AQ1jedFtj0rtDyuSM6dJPws0jTGOjmzL9q8V
         UguAlHIMC+PX21SGRPBIo5t5a0S5BrRB8VrhOWiAGZfnYWK5jE3adJCJbyPmmG10I5Xo
         aJoF3bxTQ4u3/A44Vf8sJQwI8Z4aH+ljEzPX36r6TTuFDX0mWgsB0PeXBPJPcstgkF6X
         YVdGv71F4T7m+PSROsWRIY/CeKMB5IycT4qvpmKqBjBzC9cvgridUHKXS+norvslhnXB
         844g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795739739; x=1796344539;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IYzpIq5mnQwGl0sz8AsgJRjhodEHxiFnesMza5MMboI=;
        b=rwyLCC6X1S+pM2KMmtPzh4n0T5c78ih7MLG64s0waPdHJLhmzhY1ssmoqXRErF+RkY
         Au/2/TDMHVhbsYlQJunVzj2BJCjvii5LWvTiVawQVPwfvT8WFA8+OhiJSasV5l5wuVsn
         IeCLVQWzsDPp6LpL7TxrzOezTOSiPcPqv2sb85J3rd3yBs0wXQf+D17Uu4i+7TiKTMsf
         G8DVBb/+UXYk1jizssczVE6Itqgfxg5cF35ihyYNiEJlrmo4waWdqRwT+7l/eoyC2ch2
         wgR1+FLzkydT6P+xBreXbOMyF/nRaJxr9ZLtRMk8RqRcsNnqoMzTINNmB7kqRY9dVvmY
         4n6g==
X-Gm-Message-State: APuU4Z/HlkiqGi3yoSDG9kd/4goLi+5rE/aJ2jWWVx5Z/EcFGKbrWpEP
	ONYlCV42wIcV/GEkA5BkLjlRQq35r7vJ22cZ5SgyFOZAgkJYGuANF/lNtmUEtOgP
X-Gm-Gg: AZFdTZfvIqlu1xXi7ylJaziIj0aRTLTHc/sjRp49e0QzDe/6dzjKGuWgjQ5BsBgiPvp
	3ktH6X65OUjIG18EmJ58TGxzcvNPNZp491v1hYn1gtbWsTFqJq5dvD7dV8LVkkZpfdXa+wkQStK
	yfbcPyIJIFptfrBeczBZnLpNItKqF0uAF06i9VYg36dhSMLWCXsLl5ry1lpL3nc9am7LReaozTg
	RjE6JIOnh4g/M0d4t+rIlJehhjvVYcnVs5v5UtSCxEdZC/gB1UUmCzYoIY6DwyO9phn+z/oMWgV
	mqGQYau4+APdxXn7Xm8OuMWHKjJufJvib/jjzHuF2miw28dHcw0QGaDNdDQ0rW3tEuYWM6oEauF
	tRunxSMiM2U+fQ/Jn5QL0LuNuloR/s9J2indIXR9MWRM+QVxU1IdStNDfMzm4gCiJFDO2AUTcvh
	nvQ0HdfL6fa/EoRmI4ZjHi/aERESTKgpYIzbiXcM+PMUResTKebHMCODkvLhpHPv5Hv4BC3BC6a
	iLw+j68cSD5hFNL7xPRjS/WJqwTMXBty884Xwn+ape/ZnemGFkVTKPb8K0VbOw1mHrns1xOvUB9
	bCzbnMk7JamMrW/UCP2A8mDQoo14do5vOArMeEhII1umXKPA5R24ff1KhntQcNtN6gDP7w2OsNl
	iTX3WLUKbNZM1t9oKKoGDKK9uBh+yJ4iwYodkNvkrA8ZGNKBSQIGuXZNdGWsnVa+fd+D7eRu+wY
	rPw453z90jmCeUYnm8uHioictIWkyC8QxhvwVq5d04GbElNMcksQbrIBDCjlcdJRj/EnPgfePlB
	Wfn3wG0e1aWXwoS0VwNRKGCjbKGk+9dbS/0SiE+BDmHTcIdpmO5NWGXMSqslkxsvxnaHiaJAlMt
	avz/
X-Received: by 2002:a05:693c:88db:20b0:386:1920:ea0c with SMTP id 5a478bee46e88-3861920f023mr20027926eec.37.1795739738648;
        Thu, 26 Nov 2026 16:35:38 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672ce402sm63029314eec.16.2026.11.26.16.35.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 16:35:38 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 65/69] poco: Anchor upstream check to release tags
Date: Thu, 26 Nov 2026 16:34:21 -0800
Message-ID: <20261127003425.2166632-66-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127003425.2166632-1-khem.raj@oss.qualcomm.com>
References: <20261127003425.2166632-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 00:35:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133165
Content-Type: text/plain; charset="utf-8"

Only match the poco-X.Y.Z-release tags, not the other poco-* tags.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-support/poco/poco_1.15.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/poco/poco_1.15.4.bb b/meta-oe/recipes-support/poco/poco_1.15.4.bb
index 0751165267..7bca5fcc6a 100644
--- a/meta-oe/recipes-support/poco/poco_1.15.4.bb
+++ b/meta-oe/recipes-support/poco/poco_1.15.4.bb
@@ -17,7 +17,7 @@ SRC_URI = "git://github.com/pocoproject/poco.git;branch=poco-${PV};protocol=http
            "
 SRCREV = "6a5667f432e1c5fe5591025ab03a2f8df37116b4"
 
-UPSTREAM_CHECK_GITTAGREGEX = "poco-(?P<pver>\d+(\.\d+)+)"
+UPSTREAM_CHECK_GITTAGREGEX = "^poco-(?P<pver>\d+(\.\d+)+)-release$"
 
 
 inherit cmake ptest
