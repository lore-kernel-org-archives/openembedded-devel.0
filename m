Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10364.1795753072439437826
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 20:17:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=sj/NzM3P;
 spf=pass (domain: gmail.com, ip: 74.125.82.43, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1aefd1bf74aso4168102c88.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 20:17:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795753072; x=1796357872; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LOaYJXol/ZQ6i4zTBQa3Fey9yWEf06Nru1KMJ4JFdOk=;
        b=sj/NzM3PtT/XOyozPL/nIr2581yBz+kfANx0jGhs9UTdNJlHSBT1QuF9i+Al5yH2g8
         IQER+8hHHrwuwbUZaO0gYD+KoAHceYCLmswwZHnneUxv4ji8vlvQWw07oMU/evjKnSgl
         KGph7tZ3oEQp5wutLy1NERx27sv43N3CXw5eDh8AEq1mC4AbVZx6cq/uSP+i00mLaIOa
         31Qj0uPDiMF0rBrccFrjMa/ClFiqf64hZl0t7p8SoimCWchp85OtKMnoNxvLtox+Gxkp
         SwoTm/2Ea225eqLphB52jDk2/9djmgufw5ea5aqFGlPbYIznEqwhf9+zH9TeVcSC5msZ
         20dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795753072; x=1796357872;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LOaYJXol/ZQ6i4zTBQa3Fey9yWEf06Nru1KMJ4JFdOk=;
        b=c6kC09gJtZAjEGgFFnQRLlG0vwIVsJ8DQzukJVLylLnKCYa+tNFxo8s5YZ9XV49C3M
         23zGUPd2wMFGyIPJnwBBAxzo8na+7yhPkfU4FcIZWVXzsQbeS7FUmpeI5OG/H73hIpDM
         +lhRiZjm5ZK1uH6HoSRNSThtKD1N/C0Mw3iWQEM5sHrhdT86bzQNkAscmhlTXwA2XfHE
         XlZ3wg9Rpw5HyEyIG3Z7c73VUWBLI4331dLmTOtBHCz5Sd6j32H/IBivx3PqGaxhcctL
         SBk9JCEexhv32ogjsF2KM2oiiIHXpVH7lfctLQFoI5lt1oPVXTlaVrYVNu1Jq1XumxZe
         iokA==
X-Gm-Message-State: APuU4Z8f3BuG/sFqqlbi9Wb+1UUV3scumnj87oD1yH2ehK1rZZyjBRF8
	4AV4CfI+KSk5OURUlq16Jz4OQgE/amh90Q7V5Vt5/bsyR3ZL0gMjryYh0Lq9NhgT
X-Gm-Gg: AZFdTZdn/6wYGAFBhEUcteTCrZ0kJ4dUDNcEHBemNvZWVo3ocOqmkf4WAguzBT8sdp9
	nLRsE0x/oI35zQ28iFBNmUc/EW3OZP6ZIzUzIH/y0B2/w3znKupQA4uG4QkQLwm+YU/I39o9i4D
	JFOzws6O5S66Ue8iguxIxvZEIB0IJgs+TKRIWXCxxRl5wqpQxemgjAIibJ8Y1ftJGqz2k3aL6MS
	8jErX7Xe1C77sZurW0JARCjkamDIJap0/oTU4s/nlA+n7AL1q80PsrnZG3ap8WfnmqqaIQN14lB
	ZJCIZTNWn7laExZ4JVknCwHDXzzcxK7ZRR4VpaR/PQPsRAwKgh7O+fptxBOiQ7RPDye+MBQxvDL
	jkUzvoH6BqnRF+TFGLYTkzrYollSqS3yqyLJg9/+8sWI4UuvQLNW4dyqpOrp17hWDP7DeumDQdK
	HiMIDJ8SSWNf4J1IRPpDpkOK0DQUjDHvtGOdzqng0ISLMP9nJ5Jm9de0sdCzUDmj1tVaiKwT69W
	Kle2UPKnuPQA+L8RpkTy5yEIN/ahU7ESly64P5j03Z0xpHkgv87ydrZ00pZ1YFdFQzgjHavMW5A
	e2OoAzj3nBJoitafg2f+9t0WaNHM3608O/6b/npidj8MwnnvmDDwY9lrPNFIvU9Z0SoPSbG7b2w
	CO9FspXAWx4dblOz4jnMfscKCJdjm1Xlj5IVxMNASFp19xWPG59KJAcBfxBAM7AOnMKBV7Mm1PV
	VXTfmAxwBnbaktcT+G90OWHWLBYL3P+WMbxHFcyipxUc/V+MM10TgIzHea692gCEskStz+2aETS
	9gKVkcCaxs/JF5aMsRkM9SplI9XjU4ubAJFz8vAjjKMNxRLhpruR9P4a3sxc+KQWM8Jc4srfuhB
	42G+
X-Received: by 2002:a05:701a:ca09:b0:1b3:b322:a42c with SMTP id a92af1059eb24-1b5568f8e64mr24390357c88.13.1795753071788;
        Thu, 26 Nov 2026 20:17:51 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556840494sm53880225c88.12.2026.11.26.20.17.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 20:17:51 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 30/35] ntimed: Fix upstream version check
Date: Thu, 26 Nov 2026 20:17:10 -0800
Message-ID: <20261127041715.1776485-31-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127041715.1776485-1-khem.raj@oss.qualcomm.com>
References: <20261127041715.1776485-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 04:17:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133282
Content-Type: text/plain; charset="utf-8"

Upstream has no tags, so the tag-based check found nothing. The recipe
tracks master; check for new commits instead.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-networking/recipes-support/ntimed/ntimed_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-support/ntimed/ntimed_git.bb b/meta-networking/recipes-support/ntimed/ntimed_git.bb
index 36fba5f57b..bcec693598 100644
--- a/meta-networking/recipes-support/ntimed/ntimed_git.bb
+++ b/meta-networking/recipes-support/ntimed/ntimed_git.bb
@@ -14,6 +14,7 @@ SRC_URI = "git://github.com/bsdphk/Ntimed;branch=master;protocol=https \
 PV = "0.0+git"
 SRCREV = "db0abbb4c80f2ecef6bc5d9639bca5bea28532a2"
 
+UPSTREAM_CHECK_COMMITS = "1"
 
 # use adjtimex on musl
 CFLAGS:append:libc-musl = " -Dntp_adjtime=adjtimex"
