Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.48523.1795411848097484310
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Nov 2026 21:30:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=ENuF5hUv;
 spf=pass (domain: gmail.com, ip: 74.125.82.169, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-33fb4680717so8133469eec.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 22 Nov 2026 21:30:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795411847; x=1796016647; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+klc6kHH/oSRwHs7NMhe9BpY0A/JCsuN6D7yxkokiDU=;
        b=ENuF5hUv7/d9v2WQmeCkz7IyrwRQT+NmUpgqc8a855VJ0Tg97hkaurpKeuELzfowv+
         RTgT71MY4ZqJOzoYYmj1Zk+exeSULzhkg6yi5RcpS/TiOLKo4cPR3WI7AKBhbDbuYiiW
         7w+gxMVUrAY30Hk66o6gW29IzQU68D/ZI/br3z6I9DL//4n6vB7R2/ZDUyIFQgIIpzjx
         3MNS7cDgsw00L8bTB7nYwtvOzowWRguQf5N4HV6sQaXrUviFzFtmGh6Q5N0lG1AhAn6W
         YmpzkhKXDG9PuOut8BbqHeRYlAyKbFv26+Pw41CUxT7bggFhP9Vs+iHMEYNfxgoQQYw1
         9XRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795411847; x=1796016647;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+klc6kHH/oSRwHs7NMhe9BpY0A/JCsuN6D7yxkokiDU=;
        b=FyZ7j1L7HzadAGh2vmvAMww7VoYRE+E3KDja1MJ2fdRstgsBvQhCp7Rbfo4vnRFC7a
         V1fuIbZoFztwcw37Q0628wqteXlyY4bLx3vAY5VMvf9o37c4SbxNFkW/U7aQthId+Ie3
         KmpEImUmXHHlUNDzCWqaEoX2nPMyAucx1t5aRs9sikwcJoJbijX1Lfh2EPC2e6/BVzE8
         LQ8va89eEr7THWBq9Xbobnf5kHshyuysgKabCJVnkU/pAsKPGA3cQy+/sbrYXm7vXFvJ
         hinteyPyc+Wahx79Gl/06bQrQTepl1k1k/YDtHn5b1TCNjhNO/MHAaybTHIH79MfqEUM
         a5iw==
X-Gm-Message-State: APuU4Z9eHXqpIvVEyuspVhdYVvok1tazdQrLHz279kU1t1ejPZMtlFdN
	REGqMxd3/DBTp5o88UAyhL1SaKqaVE/UBqgYdCo1orKis5fODV37FeWTXkQJXMs3pLk=
X-Gm-Gg: AZFdTZeEeBcEv+pWeRCUZjRNX0MBxdgqFlmp3U2/NMqN8O8A6ntFYbYbo4S1SWEXM7B
	HZhgZrwko9OKTxBZsk2CPjp4kysA78xqu4440lhVbXjETdN7jX/8HQUWKPsQC8vpF0zxGqKAnXL
	zfRwTkknBR4i3+RD6eLog0rQ19jZMDgkY0wO/pojj271aCAomTBhnpYFJzIQyAVtUmqfX2XX+Xd
	B0Fky8gzChNofnJ58x6VqpWvnia0NFkKjOTTOieYMCTvQcOo3TWnHf0hVilCmVUDausyykEEs4S
	fcaOOOWNbxqbu2xp4Mh9TtqsfdfI8rN+33hQ7MMIEqyKa3rd6KZBKQEb1VKyToEAuOE9Zm/+61C
	/PnjK5SO4m4cmn+NFIp39+LsbQVQf3R6BS8NHBJ/fFh/LWIWMYKaCZ9uOcSwzRjtlwidkLVfZln
	e7yYpW9vsly3clE0BM/mxFOmbRxbx21rf2jB5JJ9t4c4zgSq4WaeIEXLfxkWeai76JIvcyfbJDB
	jZSThKXgyDkubJYPOsew6dulBNn6DYtPXkjmYsrPKNdtfu7WN/FetGiIDT4xUWk7ZEtSLjjiLPJ
	3TcVculnSsodA9lraCJFBII7E8k+jdZaxFsZUIhUQmtkRB0ZWGCh7xE6SDxTu/PuHIAguUZQQ4/
	7zkkHY2crtRHqt6OWTSXUl5vO53hl8kWWHh67G9uFCY/xW3HSbNnX3VNQPXMHwZE9beEMkM034G
	OibEs+EKuJP+9QyZ2yiOR7Dv0gX/gcJNd3pAhxYRYhgskHKunDc1/tYevdNujkPHgYLmmLA+Ixv
	i9D0D3BjTpVLgsA85D2JaCvwaSY7tJ/Ykpq25SXYE/TScizDW5GtFIcXhebRx69C0uEYeLnJ53E
	Wapl
X-Received: by 2002:a05:7301:150b:b0:36d:a466:9d0b with SMTP id 5a478bee46e88-3856ef47c9dmr10884079eec.19.1795411847456;
        Sun, 22 Nov 2026 21:30:47 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm36573136eec.26.2026.11.22.21.30.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:30:46 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 14/42] hiredis: upgrade 1.5.0 -> 1.5.1
Date: Sun, 22 Nov 2026 21:28:58 -0800
Message-ID: <20261123052953.3658549-42-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
References: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 05:30:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132829
Content-Type: text/plain; charset="utf-8"

Bug fix release: the libuv adapter installs its hooks only once attach
can no longer fail, and a connect() retry answering EISCONN on macOS
now checks SO_ERROR.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../hiredis/{hiredis_1.5.0.bb => hiredis_1.5.1.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/hiredis/{hiredis_1.5.0.bb => hiredis_1.5.1.bb} (96%)

diff --git a/meta-oe/recipes-extended/hiredis/hiredis_1.5.0.bb b/meta-oe/recipes-extended/hiredis/hiredis_1.5.1.bb
similarity index 96%
rename from meta-oe/recipes-extended/hiredis/hiredis_1.5.0.bb
rename to meta-oe/recipes-extended/hiredis/hiredis_1.5.1.bb
index aa5e8f5d60..aef2a89431 100644
--- a/meta-oe/recipes-extended/hiredis/hiredis_1.5.0.bb
+++ b/meta-oe/recipes-extended/hiredis/hiredis_1.5.1.bb
@@ -8,7 +8,7 @@ SRC_URI = " \
     git://github.com/redis/hiredis;protocol=https;branch=release/v1.5.X;tag=v${PV} \
     file://run-ptest \
     "
-SRCREV = "5bb7f030f6631b243438cf0fdd3be84352b905bb"
+SRCREV = "644e39907c7722a992a51e54f892f4d416a910bd"
 
 inherit cmake ptest
 
