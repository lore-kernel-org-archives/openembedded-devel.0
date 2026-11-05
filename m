Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32586.1793879748159301727
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Nov 2026 03:55:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=kSOb1wlX;
 spf=pass (domain: konsulko.com, ip: 209.85.128.42, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so19427925e9.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 05 Nov 2026 03:55:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793879746; x=1794484546; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=11effdexOJxHjSSU2AzAPhKdvFuErT//Ub+TO5C246M=;
        b=kSOb1wlXZP3uNXqO7pkmnUyXiDCrIU0N5fB5Kj42Yo5zxM+amtKiDSdzn9tstdUgvB
         5T39maIPXmc64B8ya00eum9ps6R9swLla3iaX+LnyzMQEGiSJjxC0wB8EwuUlSI89KYR
         GEkAs2KOYrXcpu/gAoDoL13jf941bbpYZ2C88=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793879746; x=1794484546;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=11effdexOJxHjSSU2AzAPhKdvFuErT//Ub+TO5C246M=;
        b=Em2nvlIYCBwVaiH6GVB7u0to5oHSkjT/AgEr7wZyZliqhWuhS6EOuamnpv0uQA4dHA
         2ZUw8bRc69Blc8HNrK8EF6PcjtrfL/Jh4iXpvbxhH5OIYaJgB1u+fMus2Ow8/LWrGS/k
         ICM/poksHTQfaABvE1vSr6+7ODN45jM0NPXpl38yTMSFYsHW52ma35qr+76EbP+Suag2
         rFhERpecWxtGlBIO/s/YDpV/XwEZSLgdGYk8hi5UYV9Lp2Q7UmPf7iiAj1RgmCVotpDv
         5anEq2VeKItGxXH/7IVsc3Wazip2M3bcQrkHfTVYwu6KVcrp90izqX4YQtgSdF+Dd4l7
         CeAg==
X-Gm-Message-State: APuU4Z/+VLVE1GdN0W6gG2muPopXwA3g9hoZqVticydvcw2sW+O+Ndue
	VrVuLm10z/3CMuEN7gJ63p90hIs488gZAM2TGnc+SJw3Hr6d8ko1O6cum3aiaJsEs45ATjoMFGs
	URB4e
X-Gm-Gg: AYBFou2svbvp9fBeFzgmmBdBuiH5vbOCZbs2N67g5VZyAuCBVJqNrIw1jUbJFeMAlOu
	JFcQDzW75ZHR+ojyqsmtmBkRY5P93D6GSlZ9KVuImQ3nJpCGzvS/ZK3ljMFKI5JIBdLOzpNo76+
	vgeMhFVV9aLuoSXrmCyg6vRFSRiKZ5zmmhakrcHDZK2Q+Hn6/gwGycW46ZPR6arEs9vUL5LyIC6
	xRgK1CBfcinan1QcsZ04/m2O+JU25YPzgqIc9416HVW5c0x5tctTVWe5A1uKf5kbI0JI53DgEei
	4oV0pTWDT2qb5pyLHhECk4scx+tmb25wcZsllfw4IhEXAml+fQx4gwdcm/auNg4+jR5ohec2v3A
	vD250jsGINJtjzfsZpF02tvRBS09uxFYL40gBIrCmMfVrDJ3FcGGxYEYjThuZ4fiPI8ZZLXqLnf
	i9GX5rgdwQ6/MvCt1flB7oHdteZNn5eAMs+1YjYWMnLzzhXnjAm+iL0/B1zw97knhMgJvH8jpjM
	4Cn4vDXh8wZPA/1b5NJOvQeBz3vSsaCPBZZfwAC8CHMldrJqoDrDigI+VE0F/pqEwZrDq6PQ2gy
	Tv4UHlt67T/7CPqzuYiFvXW/tt0Zq6BxBsHzsLHg0QCsvpQJhFRbvrM7vv32SdVsj3OJiH2CSFZ
	dbfTicIWCYCcpvxpPE9uQgZGt3xl3Pj4TrD1DWpiW3woeVnv+L2A+Ow==
X-Received: by 2002:a05:600c:3b09:b0:4b1:4017:c4f4 with SMTP id 5b1f17b1804b1-4b14017c507mr231493825e9.20.1793879746444;
        Thu, 05 Nov 2026 03:55:46 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b4527fed5bsm173720995e9.3.2026.11.05.03.55.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 03:55:46 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 19/19] meta-python: README.md: Improve send-email command
Date: Thu,  5 Nov 2026 13:55:26 +0200
Message-ID: <20261105115526.634289-19-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261105115526.634289-1-leon.anavi@konsulko.com>
References: <20261105115526.634289-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 05 Nov 2026 11:55:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131919
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
 meta-python/README.md | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/README.md b/meta-python/README.md
index 36c193957c..a076705c75 100644
--- a/meta-python/README.md
+++ b/meta-python/README.md
@@ -31,7 +31,7 @@
 '[meta-python]' in the subject.
 
 When sending single patches, please use something like:
-git send-email -M -1 --to=openembedded-devel@lists.openembedded.org --subject-prefix='meta-python][PATCH'
+git send-email -M30% -C --find-copies-harder -1 --to=openembedded-devel@lists.openembedded.org --subject-prefix='meta-python][PATCH'
 
 Maintenance
 -------------------------
-- 
2.47.3

