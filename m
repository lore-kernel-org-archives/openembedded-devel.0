Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7985.1794465751144551404
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Nov 2026 22:42:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=ZzlrRBdN;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3b08a162d4bso2235602a91.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 11 Nov 2026 22:42:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794465750; x=1795070550; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/QzChJMlREStPUuUjPFRgSEUMXo2g2NJDKW8EPKWQuw=;
        b=ZzlrRBdNbXqHswoOQUI0f0YnmMPrDex3Pg83QnAYrs1690Lns2CwVIPZ+pMX7V5fjx
         +DzDSYKR1LPUzS3CmdtE/4bLOuyq92Po0KaETpwMcD+aypKahM6pfSgZw0/+BoTa9tgC
         CE7WqOaW/w/lmzHvI0jCwXdpq2BTHWvApFLVEjY4oZaz/9uFkWcdffOxGAi06qF5vvcb
         zEGXwDL3da7Vei2YWA/v3STGALlOBfIpI3L1LTjN6vsSYw1OIRSHn0p/widQrD/OFHD/
         ke9J1mgnbz37+HmhJG4Y00J+nwutFzY5Gc8dqbnrcATbCkwzbMHyqpMCj7XVfT/YUylV
         OtDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794465750; x=1795070550;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/QzChJMlREStPUuUjPFRgSEUMXo2g2NJDKW8EPKWQuw=;
        b=TsS5yHIHkYMb+99SfDjoNCbcXjH8Wd7P4jwRWQFYE7oJHDVHTACz2OEDP6KIq6zDtv
         NNr1SB7TrDU4NjlI5HBkeUsBhP3qYAPpkBxcdQ4erRvV496SpIsM7F/OKyyxYtG5gSxh
         EOU+iNAqGOnuLt2yHBJEAMD05Lv5m0e9WQi47q+/srNgpHzYMLDThAlWCg8GapCxGOh1
         A6+MsRcWqTxXPe60sW5eE7otcccwykgDpAfBuI/g7KWs9LKSwiQAkmXMaOt0seQ+DKaz
         +KU+1agrj4dIbPwrr4ddYik/CiFW/fxYEY+iu/ccZaNi2JbCmQBXjl48wWYu8k9LqBIE
         HlEg==
X-Gm-Message-State: APuU4Z8KiK7jKYP3+3calBe+iiH9WhO9Gnwx/Y90bwooP4mKLN2/Ruk8
	erFlm9UIyOU1qVTxeKwgk7+hoSUPQUHouRgPbIIagKV4biy6zYfuTnMW5lnLrg==
X-Gm-Gg: AYBFou3H4mUi6sC+hV5sfSfSrhwqSny9ic35p1LabkNVi7B9uRqvajEwp34DYMB98cw
	BMpSIWiMa1R7C6Wvc8JWhhqeLU82mCjTbxAmIJ4ZVV7clTIpz5hiiSAyXJ193J5scDn7kcYdNZK
	qjLtTgipGenbmbxwtYR3YrgzIpHHuNLbxQTo0KrVRDlf+bjSz52I5EH33KPjbmc3OE+PYdy4HBo
	q4Pjt15n0KvFKZia1EACMwQyMdJV4cg5Pk7FMOMGIdLh51XY2pJbNV62eBnv6Vo0BOdlRD2Jrcn
	4DZr8eC5Z09n/9E0UDIHe0koRCPf0VIXADVE6NuymGhB4o2CEs1sstr9FylsIcUcg5IIvznOTmB
	bp3nCa0sFg4bp/mNfxlFueqxtJadRe6NxtWbpbMXivq+92Fo71qrm3bQVu/dibhkX900EQ4chMz
	GIk8gaaJNXHJJHDmC/a+Bs8wUcx+UpatWWK63pg7ezPhqARPzUKJstCcmKiO0LIJC9PAWee8O3I
	xRg1vt2wUUwLnObZ4ERo1RmFGwOoEQ7HOZHTtDohcK0Fxcmaygo59nLhS3WfTHQwDdv0eVKTs2M
	a+ygG2j9+Eo3vuyQwIIgWe5ULanE/lWkDRcmC0oldOOFYwcRVoHWLN6m5ObLvGlCGJArwnDwWBO
	F5poDENFI9QvsExFrxgS9vEICJAwvv3UPKLpa0+xytjTJhS1KevGLMjxDlkbKF85HYMNZ9DSiQ6
	Uwu5R7SxBDnaFVmc/IE+Vpi1NJKMdYYihj+f8i9cHe7wlda1bxvuRQv2G4jAOUFH45clEylXMAp
	SFiGY/azkTzg1Aw8KJ/VmTLSO2uRrsgT0SciezP8tJUNkW6e0JDnaF0QQOwF6oTqsChvrdryYPJ
	lb5Z
X-Received: by 2002:a17:90b:4e8e:b0:3ad:1b0b:1246 with SMTP id 98e67ed59e1d1-3b182f296bfmr4266424a91.32.1794465750430;
        Wed, 11 Nov 2026 22:42:30 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197c768e8sm2984715a91.11.2026.11.11.22.42.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 22:42:29 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 02/24] htpdate: upgrade 2.0.2 -> 2.1.0
Date: Wed, 11 Nov 2026 22:42:02 -0800
Message-ID: <20261112064225.2410019-2-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261112064225.2410019-1-khem.raj@oss.qualcomm.com>
References: <20261112064225.2410019-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 12 Nov 2026 06:42:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132171
Content-Type: text/plain; charset="utf-8"

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../htpdate/{htpdate_2.0.2.bb => htpdate_2.1.0.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/htpdate/{htpdate_2.0.2.bb => htpdate_2.1.0.bb} (95%)

diff --git a/meta-networking/recipes-support/htpdate/htpdate_2.0.2.bb b/meta-networking/recipes-support/htpdate/htpdate_2.1.0.bb
similarity index 95%
rename from meta-networking/recipes-support/htpdate/htpdate_2.0.2.bb
rename to meta-networking/recipes-support/htpdate/htpdate_2.1.0.bb
index fe10362dd2..d19c2bd7d9 100644
--- a/meta-networking/recipes-support/htpdate/htpdate_2.0.2.bb
+++ b/meta-networking/recipes-support/htpdate/htpdate_2.1.0.bb
@@ -14,7 +14,7 @@ LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://htpdate.c;beginline=25;endline=29;md5=2b6cdb94bd5349646d7e33f9f501eef7"
 
 SRC_URI = "git://github.com/twekkel/htpdate.git;branch=master;protocol=https"
-SRCREV = "c3666d6d107662081339a1a24cab092810d7cd00"
+SRCREV = "b5be47f4ddefc9001a0a6ad9ee6734cbd869f311"
 
 TARGET_CC_ARCH += "${LDFLAGS}"
 
