Return-Path: <texier.pj2@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 9707B60191
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Jan 2018 17:14:28 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id p17so2133820wre.7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Jan 2018 09:14:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=qWlY8PUgiZQyM4u6PuAHcSzDHnci+Boh1TDH6JzxkVc=;
	b=VIYvJ+4+/ifhesqFkdMUMKkWkAGlvNPWYzJiFJmu+ZX7ajuAgh46jhP6xAStKsbSQ4
	0qhtal3jWQQZcA/QpLI7XOcMmxZCLdxTQ5HxlZbNZWIpgrzqGXHAWVrqxzEqWdWBTwl5
	kcnJ9pITQa/7qPwg1wmrKZMyyje2QXsAn3c6d4dhFFdiziJeaSKS/5TEnmrK2kZweoT5
	bj1oeCWU9xg6l6od/5TOWGmvFEoT9XrL7IoMgpAEvCgzQK1BpmsmNOjaNuA6VzRhQpOU
	xROas6/UL8EvJFK/czg1eMKrBy6rz1/dTNeS/PUMu1hi3chmH+tjGYsX+BP3AmPl0AC3
	nM+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=qWlY8PUgiZQyM4u6PuAHcSzDHnci+Boh1TDH6JzxkVc=;
	b=SqKf2uxcbp8+k6u9Cq9FB0bAsYO+k8F8Kqpdra14+aVyDc+uxTd0z1D2m+IYWMOY6k
	m9hgjXmbd5FuDAQXpqibr4rdp+f+TbCZidu3dBaZe+c6n7gqxZ8ty2RbFkaFG7XP1UAE
	qYcARD2+DsDfA84NJRfnUKO2Lo1rvUSLiwGMb+9MyUhul8OMzmzFIXbSeB7xQ4Knz85P
	pflxsnwfQkalotT026N4GlzCqcf9hwi/Tmdx/7fx1iOu9dNTWcQJQ0EIKGdRimLYuox+
	rhlOyHdFbyIPwKnhLQDYgbVemD3AOT9xCFcZVPsKOP1IV5PGI3q1pMbLkAAGHZDBUkmN
	66Rw==
X-Gm-Message-State: AKGB3mJsQ202/2Ixxv+MA2OGs/Ed7krhIezXyYYVfLdWqdj8ePsJagMb
	sfP//Imh5SEPjb9tR81cH5kQ4O2I
X-Google-Smtp-Source: ACJfBouyr9xSP+gMjllPqV3ZuK60h0TFMbXutPJ43SJaj5Uhs62hSgztW1xwDSHQsrxSM5fY5QTRQA==
X-Received: by 10.223.139.18 with SMTP id n18mr280858wra.0.1515086069111;
	Thu, 04 Jan 2018 09:14:29 -0800 (PST)
Received: from menoah.home ([2a01:cb19:190:c500:9568:103c:a64a:ed73])
	by smtp.googlemail.com with ESMTPSA id
	e21sm3341013wre.28.2018.01.04.09.14.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 04 Jan 2018 09:14:28 -0800 (PST)
From: Pierre-Jean TEXIER <texier.pj2@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  4 Jan 2018 18:14:16 +0100
Message-Id: <1515086056-5102-1-git-send-email-texier.pj2@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCH] spitools: bump git revision
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
X-List-Received-Date: Thu, 04 Jan 2018 17:14:28 -0000

The new revision implement the wait option to keep the file descriptor open and avoid speed reset on close.

Signed-off-by: Pierre-Jean TEXIER <texier.pj2@gmail.com>
---
 meta-oe/recipes-support/spitools/spitools_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/spitools/spitools_git.bb b/meta-oe/recipes-support/spitools/spitools_git.bb
index 2eedf8c..3f6cdc6 100644
--- a/meta-oe/recipes-support/spitools/spitools_git.bb
+++ b/meta-oe/recipes-support/spitools/spitools_git.bb
@@ -8,7 +8,7 @@ PR = "r0"
 
 BPV = "0.8.1"
 PV = "${BPV}"
-SRCREV = "03405ab45884e4264dfa0371c032b2baaeeaaa98"
+SRCREV = "318bcae5249722873bf58b27afdd20473c7047cc"
 
 S = "${WORKDIR}/git"
 
-- 
2.7.4


