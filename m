Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10275.1795753050982298814
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 20:17:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=DCVVjCZ/;
 spf=pass (domain: gmail.com, ip: 74.125.82.53, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1b546061d58so17752020c88.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 20:17:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795753050; x=1796357850; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W4kVbkl6WJG4I2UMwKvTNbRiFDt5ZUuPu0XrN+xEV2M=;
        b=DCVVjCZ/JqWU21ds4U7CfHVPmVNqmigoGOIdk68c9uvV/OK18a3AugjWDn9lVXR0xH
         5QUVX68C9YwT3alHb/n/4fhbjZ1PsF5sDnQ8fRVP8awhCzicaWRgKVKhDM2odaGvnD8D
         1kQ4ITf2EoIsPGop/IH06yVK3vg3acs51+X70ILa/qi/nRAXPu3N4q5B6tVidv3sAm5y
         BoCxgRLzoZUSnjA0Y6isO27qEBJsCz/sfTGAD7i7F3GcTb4mAEi6V+0i/sHsFv8iCE5E
         oGzJq4odnVm02zgf79hSi9zvlT4AbJAuN14f8eLXq74SjCYvN9J96/pShV20TofQv/yt
         FHMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795753050; x=1796357850;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=W4kVbkl6WJG4I2UMwKvTNbRiFDt5ZUuPu0XrN+xEV2M=;
        b=0DuzgW+MhupiWB/1J0Ub/bHsQbn9u+gGiny4FF2J8YTUZ+J2sbyVICpnVcyboLQjAl
         INUuuMXDkmYfnRJwK3+mZ++F73VTRfO/eZixgsgl1rNOpa61HN/g6uTJg9uZBbvnrtXw
         au6S1K3NKsEClYZ2wc9DMqR0egKy/gfS+oEHC8FdF34b9SPbNWP/fyT3iKK0Z09QBxO1
         DZ/KQsoN5P/ZOC4k3aCY3qHfZXwBAa3VnK70o8xARR1B+lVTsuN0qoiVVB043Z74rL6F
         aMwqEgy8WTc46prLVNyQSN+JUPNDJpJMmBgvcEfX4CdwwyjYDJSDgGMl5/1edqEnlP8I
         0esA==
X-Gm-Message-State: APuU4Z+ce3Vck+lweCz+2vSuSIeELOwtmsT4w8xSapAN0QJ9uyepPHJQ
	mkEV2ynvAEIJYvTVKuT3aL4q1wm8QZ6cO85shmOJAhcz03ZphNdsQaHA/qdnR3mx
X-Gm-Gg: AZFdTZf4HVLqsKAoDcbe6W6BbN4b2UY2Os6jAe/jntWVHMRE90j/0qdipFolcjToxzk
	cH/iBCZMWa3q00481Gys07oPr6y0+8hMR/hy85hX4S1O5yJosH5R2PPzIsH1DewwlbU6Aw04aKp
	2NMpV28OyCeLBNGQUu3nOn8yHdA3DMGMU6fh9wHhHmDJ65AfNLlrFBRwvj4kC/Fd/vVNSN6ZNh8
	+JBItfki5F4CRRncltWKT09g2N2mSduOrBAx0o5a6ivrSy9xwMs76f9WGP8Qu7kVgD4zJ7zPmy1
	896DZ151NEFWwo4cHMuSgb+IeV5oddrrc/3h986Jppn+dqWlEVRVAakaNTmWpU/xx9+OTLO8pwN
	bqQ5n2/Ep/3jaHnUuWG4TwpUENdvetHeD/nDG/tzm62hFqyhPXY+lzCV4quPwUhWgDLj8iXEp1k
	H+ymcaIicirkhKuGaG2sgPSRJPVIaLWLbGKw9O6QnrbnDrT9aY+Hg+/aihoX5gQV82W5imIY4bY
	0qwd2e55B41J2m1+9KBvaaIEfNiNRjgK3ZQIGaMQOmEvHiHYvNC9Q+Ur+1uMGWRhUObqpY7ah9y
	ddNyhAcSMjHmJLjxhvV/VxWPrvL2C0MkvisLZrNuCOySeayXVrzS+33aTrstSPh7FzCIj+GCP1t
	ArGpvqJTrnClrQoeaAdMiVTHrlgfmADvJl7Y4oJxkabkY/RT2CPfnZhd8BTosGqyNYGlAvVU8+8
	vQzTwSgi7ovVofFqDGs1IcuGp9Q9GDrbsnhvxhwTKmVjp3f1A7gSNSyV4mJCxCj76e3YLRbE6Vv
	F2oPinBNIBww/VBZVzmd0CZeyVzjWgNCNWyH3E0kucSl5kv+JlNf4Hkj6nxxa4SHWA+vCdfeCD+
	4bnn
X-Received: by 2002:a05:7022:4181:b0:1b0:4272:4282 with SMTP id a92af1059eb24-1b5568ba440mr35702714c88.17.1795753050346;
        Thu, 26 Nov 2026 20:17:30 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556840494sm53880225c88.12.2026.11.26.20.17.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 20:17:29 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 11/35] sshpass: Fix upstream version check
Date: Thu, 26 Nov 2026 20:16:51 -0800
Message-ID: <20261127041715.1776485-12-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127041715.1776485-1-khem.raj@oss.qualcomm.com>
References: <20261127041715.1776485-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 04:17:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133263
Content-Type: text/plain; charset="utf-8"

The downloads.sourceforge.net directory is not a listing, so nothing was
found. Check the SourceForge files page for version directories.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-networking/recipes-connectivity/sshpass/sshpass_1.10.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/recipes-connectivity/sshpass/sshpass_1.10.bb b/meta-networking/recipes-connectivity/sshpass/sshpass_1.10.bb
index 81c5e48008..4afd956e27 100644
--- a/meta-networking/recipes-connectivity/sshpass/sshpass_1.10.bb
+++ b/meta-networking/recipes-connectivity/sshpass/sshpass_1.10.bb
@@ -8,4 +8,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.gz"
 
 SRC_URI[sha256sum] = "ad1106c203cbb56185ca3bad8c6ccafca3b4064696194da879f81c8d7bdfeeda"
 
+UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/sshpass/files/sshpass/"
+UPSTREAM_CHECK_REGEX = "/sshpass/(?P<pver>\d+(\.\d+)+)/"
+
 inherit autotools
