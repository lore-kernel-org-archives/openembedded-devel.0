Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
	[209.85.214.193])
	by mail.openembedded.org (Postfix) with ESMTP id 8C08761415
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Feb 2020 05:42:56 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id y1so5019170plp.7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Feb 2020 21:42:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Sb/grWhNI7rHg02oRofZnrwbt0NpDpByGPgmYcCqWfY=;
	b=ocmw7p1iml1E7y+BOguzA2eG7UFAKthAYv09tpNyC/iJ1cGL60sanquE2dauHaY7/J
	vykiJiFDoefrvKx/OU/57O5Yw1ktFncrYi8VDBiH7Uz1Ry/wdpkAEeTy6p0X/+swME6U
	xdk5wSUngbuzAEGn1iR4oixlUyTIVx5MG2NJ2EcbJ8Z7wXdXQ05MVvXSVTj3nvn7mJVG
	JDyH1CXNHp5f+wfTJnkcSJjGjIcGddgM7yQDbfT/StjRVeP3ktQiEqZXd2Q5Nj6BO+YL
	rLr8lHo1dSONL00jnJSLzgL/rHtaSJimR3Q1MCIybZfiYeDpMz71cAT/h41KqjuoV2zX
	P4rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Sb/grWhNI7rHg02oRofZnrwbt0NpDpByGPgmYcCqWfY=;
	b=ZEng9pIK+2rDAeG590h3wyV6n+drmxIaTgSdF6IO/DlSko7zacqxlRJvAPXV33lzPC
	XhoE5pKr43juFRv4nWxWP/4z5Q84JGFN21T97IHqOaW/sRTNDon1uZKOkffWilDK44q8
	Z2+zEmkQMWlu8m8Cv2i02KtvcGdS4vjo6MmKbDDDrmK3Fs6rcsVET4x0cB2viH+fyRH+
	ZrarlUCp7mxt8MfvvKlM8fSHEpFmrXw+ODeUtfAkG+a4ynuXriOZhWwt6gLZNdvn/Kel
	DACMo0KUYjYt1l3BSyh3TLP4cC5PHJ48qKgcysozQsgEgVKxTc8h4KlKsUx4GpcvDkzE
	sdWA==
X-Gm-Message-State: APjAAAUkP+BHalVI1OYdfbG2NWyGWzUDGyO8zpEAbSH0j/XNFP+GqcX4
	do7zvhVjJW+doGvjzTczHHhyUprhIs0=
X-Google-Smtp-Source: APXvYqx44+EY4Pp9vFmRUMEkVvlnnhdk2IklZME+3Kjw0ZF5wCfyVDdoxhLquYQvi9SSfb1TSVnzxA==
X-Received: by 2002:a17:902:8343:: with SMTP id
	z3mr55080305pln.105.1582609377588; 
	Mon, 24 Feb 2020 21:42:57 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::396c])
	by smtp.gmail.com with ESMTPSA id
	v4sm14454953pff.174.2020.02.24.21.42.56
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 24 Feb 2020 21:42:57 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 24 Feb 2020 21:43:06 -0800
Message-Id: <20200225054306.865780-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] phoronix-test-suite: Do not mark it allarch
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
X-List-Received-Date: Tue, 25 Feb 2020 05:42:58 -0000
Content-Transfer-Encoding: 8bit

This package depends on target packages due to mime/mime-xdg
therefore it can no longer be marked as allarch

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../phoronix-test-suite/phoronix-test-suite_9.2.1.bb            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_9.2.1.bb b/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_9.2.1.bb
index 4a8e5b5b2a..31b30bb878 100644
--- a/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_9.2.1.bb
+++ b/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_9.2.1.bb
@@ -11,7 +11,7 @@ SRC_URI[sha256sum] = "675e7ca96719e2f3b42a6c13421213a398f04da0f8e78f4691fa9261fd
 
 S = "${WORKDIR}/phoronix-test-suite"
 
-inherit systemd allarch mime mime-xdg
+inherit systemd mime mime-xdg
 
 do_install() {
     DESTDIR=${D} ./install-sh ${exec_prefix}
-- 
2.25.1


