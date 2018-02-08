Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id AD90F71C69
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Feb 2018 14:01:41 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id s39so6261374qth.7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Feb 2018 06:01:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=JHYpb2oX2ndifIWmPIBzA3QORP/ZHjwiNtAWjrp8Bt8=;
	b=f2P1MGMglmyk/W489K7bRWLFsK2Vq3wt9rUugeiiLsAtalN4nz21WtKBdcWwebjNzi
	8IV5OjhEeyRL8y9rE/f/x0UImCiOZdGwU+nl2TwpBIJy0/Yzyx9y2/ef+4MuqEI/VOqa
	Z0n4BLpRoWTn8DlwH8vT2nGNqWn9hKgh6vyAsFIIsZEikOT+fL1tacsYo1FhpyNrzsOB
	z8ZZQugemZHvuVuVlikkir4uQnj+CLetrq8r/GSo3ETlvUOT6pOPbwvh257FgsG8YTaK
	FnvbqqsNpT5GHQi6LQNc0vDLbR9uhOL7eWq9rn2e25z1QPLwWjQiKu/ALPYdHF/w/fnA
	6zkw==
X-Gm-Message-State: APf1xPACJyTYIz4VzXe455t2Gd3/TgNRpnmwysVcswLF/L7m7d99vsFr
	K1yL3u3n9L9xOVGIQGuAgwG/rg==
X-Google-Smtp-Source: AH8x225HFGPJePxzt0PDUIQfXyvREwvHC4atlid3G37PN4jQ00ecocXI21GJaKwN6OskVZLZMcLw+w==
X-Received: by 10.237.57.165 with SMTP id m34mr1234143qte.258.1518098502443;
	Thu, 08 Feb 2018 06:01:42 -0800 (PST)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id q2sm32186qta.47.2018.02.08.06.01.39
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 08 Feb 2018 06:01:41 -0800 (PST)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Thu, 08 Feb 2018 12:01:35 -0200
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Thu,  8 Feb 2018 12:01:26 -0200
Message-Id: <20180208140126.20887-2-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180208140126.20887-1-otavio@ossystems.com.br>
References: <20180208140126.20887-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-python PATCH 2/2] python3-requests: Remove RDEPENDS on python3-misc
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 08 Feb 2018 14:01:41 -0000

The misc package has been removed when the python3 was reworked.

Tested using updatehub's uhu utility.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 meta-python/recipes-devtools/python/python3-requests_2.18.4.bb | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-requests_2.18.4.bb b/meta-python/recipes-devtools/python/python3-requests_2.18.4.bb
index d91d993bf..0a2410f85 100644
--- a/meta-python/recipes-devtools/python/python3-requests_2.18.4.bb
+++ b/meta-python/recipes-devtools/python/python3-requests_2.18.4.bb
@@ -1,5 +1,2 @@
 inherit setuptools3
 require python-requests.inc
-
-# Add the runtime depends for selectors.py
-RDEPENDS_${PN} += "${PYTHON_PN}-misc"
-- 
2.16.1


