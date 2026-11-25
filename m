Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33204.1795569225482510695
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Nov 2026 17:13:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=fsAUmVxV;
 spf=pass (domain: gmail.com, ip: 209.85.219.41, mailfrom: schonm@gmail.com)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-9214b9e4d74so23333016d6.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 24 Nov 2026 17:13:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795569224; x=1796174024; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4kCvXjqdKYy980M+f2LM/7MBPQWaGB3DhOXJf4aq6WM=;
        b=fsAUmVxVTagPbZn7UVm8b1glmBiS7+/KhrltHgRKWt5vAIWIRcm4+vldXXlXFGSV82
         A2qoGzkEBlBFk3UZxNg6lYnHUHnd6dP45Q31UuOWPPm/DZoNWje0o17uOxErGKGMiX+k
         nEkwhLPIuV+KjGD9CYWocRYZJPRMCc0eU9dMrAy/9Otk7C35Hfe9vXAZbignNVnwGWEQ
         mW5WB4d2DkQRMysr+yLQ1a/iSQ+B0K/TvUgfq3gh+XKcgFph9sNQMdS1RD05RUdux87U
         9BgqcFTQvEZDTNIPR3ffunE5ur+31J8IVB3kMcEUEcXq6L+xdKxeRHTUViTdVcZuTAkX
         FF7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795569224; x=1796174024;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4kCvXjqdKYy980M+f2LM/7MBPQWaGB3DhOXJf4aq6WM=;
        b=tza9cmq+CWfHj2DfXe2B0Wglgd2TKLYY7BuTve2JHKH8rFBLUsgg4LxYFHMwKTxx4d
         oFcWgu1VjvuoRtKoCtMWGW7S8tPcPNIdCxRqfvV8rD45biyCT4TsvAkA9s/NiNSExjAs
         wJZbUaT8ctyCRTdYdkZucdge7uuNWMPaIBJYAU0/4UgD7is/5ND34up/C+HR7plPP58G
         Ge2+2FBeEqqhbO+Lc8c4vrLmk4ElXqbxEsxbpHZlcBfrlEEDe7K2DHu5elStXTmoIDsF
         j/RgnYeVc/e0/Idu/KOzegsa00duW/3iNMGWrgqOAn57EIlemfS0ZIVVV9slD6cvUCvb
         dOSg==
X-Gm-Message-State: APuU4Z+XDpGbqDuAxIu4dm8LDhN8gfEodk8jiaPSkZJZu/j51sVo86lN
	mSx3YR6LI7oxUN5ebpbRq74TQQpBjT86Ct+0Vr6+4jRy3kDHRyewqcNUD6IrhOnZ
X-Gm-Gg: AZFdTZddObtsOi0qaMFnq4veyQeN6yPGyQAD0myaq+AVLdCQqE8/JvW22vFFvFsH8tp
	mkeM/rueGbl7bPG9Q+s4rZ1w3ajstSO6rPwmeISRJHLRMHN0lwdFS7fLUh9MCo+JWQ/sfvU0LEw
	KugnC+5S2BDyKASgDoqIjQgB0Vgo1algKjP2JWG3LOwin69KolOq3Y/o/zpnp61Fwh22cdmJ9NE
	3jlxlz+nEugqwyPs3uCpXaja198cUKcuUWk3FdKAucbEXyD9+cMcBROqGmHNuY/wMTYF4oN/8Zi
	HNeTpoFu98+FpidQdaVNrKFm9E0Pi+w7nWq3ukokleoZdTceqVIQnUvM41P6O/qMUi6dLxS3BVx
	tqagpEz5hhOsK4MGeAizV9aDvnXL7KmpNbcZftauhw1gUacjiBagSf0/PYQWvNwwwbKWSdoV5y7
	edQuoHWbi/OIezOaO/EtyW2jVPNd8XCtRJF66EPnvaErjrd/3M5VztT8ZtIMVgZatRwHKjsnfF+
	xwJbXhRXIn/SUQGyNp/jG3ENVtMD2ruAZLPeIDFowpHzZw77AFqyMaKYkgVBgQqNgjP5kMNjmgR
	rGS4wuhvfzwLDcw+r2521XKjmVHA8RppAcg9iG5fZXZ35J9wV0lF1eVqZVl7xJtdLxt8FilL3fX
	9aHr3Kew3gZtFxe2SB/coLcuOtSklWPfnMSuy
X-Received: by 2002:a05:6214:234d:b0:91b:5d39:e134 with SMTP id 6a1803df08f44-9212e115993mr308361596d6.31.1795569224335;
        Tue, 24 Nov 2026 17:13:44 -0800 (PST)
Return-Path: <schonm@gmail.com>
Received: from testing.lan ([8.40.85.38])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921349cd592sm153110116d6.16.2026.11.24.17.13.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 17:13:44 -0800 (PST)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-perl][PATCH] libmine-types-perl: fix HOMEPAGE
Date: Tue, 24 Nov 2026 20:13:38 -0500
Message-ID: <20261125011338.871556-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 01:13:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132962
Content-Type: text/plain; charset="utf-8"

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-perl/recipes-perl/libmime/libmime-types-perl_2.30.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libmime/libmime-types-perl_2.30.bb b/meta-perl/recipes-perl/libmime/libmime-types-perl_2.30.bb
index e6a72577ba..1fd9b71521 100644
--- a/meta-perl/recipes-perl/libmime/libmime-types-perl_2.30.bb
+++ b/meta-perl/recipes-perl/libmime/libmime-types-perl_2.30.bb
@@ -5,7 +5,7 @@ is transmitted. Sometimes real knowledge about a mime-type is need.\
 \n\
 This module maintains a set of MIME::Type objects, which each describe \
 one known mime type."
-HOMEPAGE = "https://metacpan.org/release/MARKOV/MIME-Types-2.27"
+HOMEPAGE = "https://metacpan.org/release/MARKOV/MIME-Types-2.30"
 SECTION = "libraries"
 
 LICENSE = "Artistic-1.0 OR GPL-1.0-or-later"
-- 
2.43.0

