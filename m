Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3827.1794729040838648018
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Nov 2026 23:50:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=GbOWGunm;
 spf=pass (domain: gmail.com, ip: 74.125.82.169, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-37000e7234bso1045946eec.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2026 23:50:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794729040; x=1795333840; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2BNIVfdCAEtaX75NQetnEfzlaQ4Okar7BETy43I5LEY=;
        b=GbOWGunm089jUO62Vpxx6PdjSeNGRNi/4rthmBhCzPq2FQ2v28sqI5A4zNEj5wUNw1
         HWiRdjeMJ2O+79KtXJS1VHkbsD52ukGEuSex0/O5/oYWCEKY9NvTcKGs7pxzFUIQLaT8
         mIjWiX8c9lcavnmynujEUzgQNvLeqP3QsAIeJmmgrQDPV9ZjFytuh9nWqltFcXI3/jQN
         OccNt6Wwt0ttQD7mOMXMOYsHNLL6NkzIgZjSvYXkEbKMCSYIXaubTekpsno6g5fHqAaw
         GkfXhPze5rvW4hAN+bbW2r4pBhjwKvg41OA3605Mo+tjQQtSFqcOpG+aUU7fx+ccUs83
         tihA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794729040; x=1795333840;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2BNIVfdCAEtaX75NQetnEfzlaQ4Okar7BETy43I5LEY=;
        b=ZCYu2o3a4jd6eYT2DuujBSn2ULs3QcA9tL9jnr7yUz5BPxAf+A9CES97I5wBzhbLPi
         wKB4iERM2BE/zArPycNccOB3JxoXdsNrojRTxx6bOdYbRkteM5g1mBTjcw/zkbquxv1t
         7MDN5+INgonwXJLqOtBxUuJVUIOegVj46wjILVKI6kG/ySsGGJEXSTWUuji4OQQXOzXp
         9k4QiDGYCaTuUQ2hySHw+nsI2o/0IT9aNep5fFW2hLMnSfAg6AUXMH9tKH4LaGCVnvCZ
         YgJD1cLNDihkmL020iR1DrxerS2sjwPyUeUzQASNE7XGwudQaIwuBzeoLmuh+H5Qw5md
         5oow==
X-Gm-Message-State: APuU4Z/bffEhv/bWdlvK3ev1vr9QaOnPhlyxZ4yoxqcyOicxt3tMHGK/
	WRcz9TKjNFa/N8NhLh3kNallEFpHTpvOSZslTgQSVr8uvZjGRWC7rTHR3nL4olyx
X-Gm-Gg: AYBFou3XA7o7l8c9HB3F7SOSS9nh/KqmxNiDfml8iYKAbqmHNbK+sX15rhWW62zYQs+
	c4zw8TmIyIh6Mt7HdiMKLjWITySV8pQYP8CVAfAk8E0es0diJ7/JuHjMR1A92cwgdMnnMyocK/R
	O2ddFBp9XvEpb2/We9L0GnuLQ8yhdNYgvl77+cDfm96jUzOtkjsP4Wwi7y+loKbEDj0LnYxfl/4
	zmtFtvDMBLTngEjLdUIwZl2yqHsTLRzgzVgtU8oSGjVXgYN1NrbmEK/aGUFT+Aacy2q+LxFrkhW
	Bdx2cjmbVY0VLKtP5JgF4clP7RY/i8qxTUqQAsoCGc6fTbdtqI4ysG83Wsw1VX/Amrp3rk74Fav
	e4WY5absPoktjLEtZz1n6sEqp1e7p7V/UEGgKfwOnqYh9pNY9UUpAq7Be7wLd4EUEXRvwxj8MBd
	Dpcz+AajJLoulmr/lJ7FVvuTowNxXTtOP59xwIePyMeOBVypO2Vn/TPQAA433VmaIUWoews0rU/
	dZMJQxZh2VhD84Qco7qfQbhQ50/L9ol+8+cYKL6h5Ag40ruxesfwGaBT1vtqmkMrWG/utj9wSx1
	Rz1CKsg5OuHLzwKeMzjNr8p5p9SeyBGI/miXxNtP7oDXPK6FwVh7b7dX7eKtsxAExQ//yz2ycep
	F2Sx1ZkPF4ppLHQzGhzHCvBIllIuYtUcu53ZF2e3owb/sjBv9HfmKT8iNiGx/xmS16MnPe23bJU
	11CB1Q7V2fcmCqycTjgyRn+mjjjfAuOoGow0GszZ30eXrTeAVsD+RgPW5szFu3B7VzunwFoyeAN
	ZSMIjqkyI1D8GPJ4sshV1o8aRGDNqOzpJf17DHR5EA7Ybj+F/XkKdIfBoG1Cnt91aDx3u3TbQEo
	LWwl
X-Received: by 2002:a05:7301:6185:20b0:372:601a:6278 with SMTP id 5a478bee46e88-37967027be8mr7495697eec.33.1794729040195;
        Sat, 14 Nov 2026 23:50:40 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795591f4f8sm23112817eec.13.2026.11.14.23.50.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 23:50:39 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 50/96] spectre-meltdown-checker: upgrade 26.36.0602723 -> 26.36.0913490
Date: Sat, 14 Nov 2026 23:48:28 -0800
Message-ID: <20261115074918.2932593-50-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
References: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 07:50:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132320
Content-Type: text/plain; charset="utf-8"

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ....36.0602723.bb => spectre-meltdown-checker_26.36.0913490.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-security/spectre-meltdown-checker/{spectre-meltdown-checker_26.36.0602723.bb => spectre-meltdown-checker_26.36.0913490.bb} (95%)

diff --git a/meta-oe/recipes-security/spectre-meltdown-checker/spectre-meltdown-checker_26.36.0602723.bb b/meta-oe/recipes-security/spectre-meltdown-checker/spectre-meltdown-checker_26.36.0913490.bb
similarity index 95%
rename from meta-oe/recipes-security/spectre-meltdown-checker/spectre-meltdown-checker_26.36.0602723.bb
rename to meta-oe/recipes-security/spectre-meltdown-checker/spectre-meltdown-checker_26.36.0913490.bb
index 2472c5b5cb..2db62cce20 100644
--- a/meta-oe/recipes-security/spectre-meltdown-checker/spectre-meltdown-checker_26.36.0602723.bb
+++ b/meta-oe/recipes-security/spectre-meltdown-checker/spectre-meltdown-checker_26.36.0913490.bb
@@ -9,7 +9,7 @@ LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://spectre-meltdown-checker.sh;beginline=2;endline=2;md5=3ae5399e70af7be9b93f72568069e2f4"
 
 SRC_URI = "git://github.com/speed47/spectre-meltdown-checker;protocol=https;branch=master;tag=v${PV}"
-SRCREV = "d6624c30aff42f96f8b53570c583f472b19f680e"
+SRCREV = "ff8e6ff8619be75e539229d5310dbcabaa4350fc"
 
 # binutils: readelf,objdump might be used for deeper analysis
 # coreutils: dd with iflag=skip_bytes oflag=seek_bytes in some cases
