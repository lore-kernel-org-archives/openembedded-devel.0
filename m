Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.48544.1795411883716827201
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Nov 2026 21:31:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=QzU+IvmT;
 spf=pass (domain: gmail.com, ip: 74.125.82.174, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-3869b68caecso3587197eec.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 22 Nov 2026 21:31:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795411883; x=1796016683; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mRTWS0XAglhSdto6XRG88cs0l8pBd/RXUoBfTHCGlTo=;
        b=QzU+IvmTz2YDJ4ati9Td8UFLglHTXVTFOVc8rJokRkXNNR+cXExvjTlnxjPuEiIF2Z
         ijutrZQfnopCmtaYUPxzEpgDbm1adbryrsaBAe+uDYCl8m9WFAtpQ0cfQYEgwvXrUynu
         afIe9MA0HCW02CJGXn1xbqqm5DwATJeifDZQSg53q5zTA0LPeOR3yRBTvwb+u2t+RBG5
         3UBkiKQaxfZk3pznQNoXc1aLgyIShHHWdQZR1nGOG6964qZz6vPC0z4cXxvhErjlY4kZ
         FTUdS1PdO1T1mmKH6NUH/nix1+nzkht/AE4Q4BUlN+q23dUJ/Fu9QBzx+A5LcJHacWHR
         ll+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795411883; x=1796016683;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mRTWS0XAglhSdto6XRG88cs0l8pBd/RXUoBfTHCGlTo=;
        b=E8vDv+ozOftB5Fn6bsbvWG1mjSlPhRSsyIc8zxLqjHC591/xX6xL4ZFbQ+bGW68dZd
         LZmMCNMT6SWHdRqzIYfS6ytjn7FaeWLFKWMf6GCr9z/ixcvMoegeOScEDFIAsw+6vIE0
         laV62uo2YvQpUrirb14hgSuZEZmT8aS8UHIJJ8JpevItYWeap2HuOI5uwUa0DYib+8pK
         FQ+awxohmLNRUxi2mC2J3dZbet3Be8x59kZjZ45sC+rMUPDBU3VcFEQD6fDDX4l6kcfd
         IJmonNK42LZUBaBfTusS4Oo6tyJ9ZJPQ37bnsDhZ1pE8bxWl61lDbXoEIiERGnLhnpLJ
         qkJA==
X-Gm-Message-State: APuU4Z9Jmh7an5aeThQCDukZc4pQLhgZfULxGBN/2viL0EZwbl3mtt9j
	Dt/wkanqspFui3QQGx4Xo6MX25ikSYj3QQsvJTe3g2jd06Is7SJhWm1ndzyKHivMeNw=
X-Gm-Gg: AZFdTZcpcxD/iPl12bXGf07PWdb2sPw086Mnlx5e6XRMFjd1b8RWywHVSTAn4Dsg0yf
	9bSA39upUrf5CAFVDdYaa9mNGv7D5E6NaUYFTEqLTWTR0hnpUy0cVbn4/WJ6rvGIoJFWK34M8jn
	Rlixxhgj8tHPjFi9Jm1tBbPvj5ZOPxitmaMse/WFM5ahGqB9+tS6nDl0FRivAluny1rmYVWy7D3
	Av3azXMgjaes27hXUT0uwcbqJvkIhErYFCK4fvXt1DGI3/3qT5hI+uSp0fBL8fgcifAWYDbbvMt
	TqnjMkF9m4OrwF+vsOsYcf1wWPGxgmZH5ilaM3uueb7IjQ+YUsoWBx5//jxcQbKLoWftNjPTYSG
	tuVyNtbPW4qA7oCce9YRp8z6ClQUcpdkkMBbSbOiL6uRKvcvr5wi93eC3dgEAPX6Q0i7uoyIVKG
	L8kjS9BSgBH8kKo6712LNGWTo/5U9WpOSbkJALuHyAfCxtCjrHBAcOwo8pnXlbQNmADL0W1zcES
	kkNMKupoLA5+vLjfQlgtI/K2kt8LFEPvWY6tDqk8c1YgY01A49/Dt7QlUAGS/LjfU/HcYTfcDeg
	t91HNGUe9CxDUO/qb0NfgdIRr9xLlYEX8unBsMay326lAsW76u9zsCkvOEfiCTlEm7vc8l+Go1v
	CBJS+R9aXSdQ13rCuskcJrU780TnjOxu2aSvSs4HZUrfuOmjHlire+KMCrmMMEuWRqDlOuZW+x1
	NbNwej7jGZ80zzu8E/S0M833qF92bNabBZx0PTPZaOamT2lTwiqDS5hFbfFp1Tn5fgM38UCWxkn
	rVN9WLvRgNqzXz0f31VuZ96ibIGKq303LiwXA67cYgpdp7f8VyEtKOQSQGpdH6Z/fRV8bVRiGzR
	Bo7BA2Jj9dZCy3lIWcS2amuwVg==
X-Received: by 2002:a05:693c:8850:b0:386:b351:d5eb with SMTP id 5a478bee46e88-386b351dcddmr1414160eec.7.1795411882923;
        Sun, 22 Nov 2026 21:31:22 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm36573136eec.26.2026.11.22.21.31.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:31:22 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-perl][PATCH 0/2] Recipe upgrades
Date: Sun, 22 Nov 2026 21:29:27 -0800
Message-ID: <20261123052953.3658549-71-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
References: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 05:31:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132858
Content-Type: text/plain; charset="utf-8"

Upgrade libhtml-parser-perl and libnet-dns-perl.

Tested in Yoe CI with world builds for qemuarm64, qemuriscv64 and qemux86-64 and
ptest images for qemuarm64 and qemux86-64, each with glibc/systemd and musl/sysvinit.

Khem Raj (2):
  libhtml-parser-perl: upgrade 3.86 -> 3.87
  libnet-dns-perl: upgrade 1.57 -> 1.58

 ...{libhtml-parser-perl_3.86.bb => libhtml-parser-perl_3.87.bb} | 2 +-
 .../libnet/{libnet-dns-perl_1.57.bb => libnet-dns-perl_1.58.bb} | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-perl/recipes-perl/libhtml/{libhtml-parser-perl_3.86.bb => libhtml-parser-perl_3.87.bb} (93%)
 rename meta-perl/recipes-perl/libnet/{libnet-dns-perl_1.57.bb => libnet-dns-perl_1.58.bb} (96%)

