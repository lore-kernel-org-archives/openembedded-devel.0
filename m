Return-Path: <twoerner@gmail.com>
Received: from mail-io0-f196.google.com (mail-io0-f196.google.com
	[209.85.223.196])
	by mail.openembedded.org (Postfix) with ESMTP id D11FD745D8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 May 2018 13:43:56 +0000 (UTC)
Received: by mail-io0-f196.google.com with SMTP id e12-v6so2326795iob.8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 May 2018 06:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=q47hVIZp5IACnzLCTZtXigerK875DLkSvoI4DIfiKMM=;
	b=f+/EZrXJHHRZoxRU9IK44HCqS2C+i73grFjrT812gZLgpn0TQiQnsraOd0ggd2qHCw
	A6CNg4MmEI1PDRdV1Xr8dXmwQbwBcx2S9jh0zeyU2d9jY/JaqsatHQ1hFpS7ZcopoJjO
	Lx9orun9xWza5a6yrndAPW5ggc3u5gt3lbkc4eJogo9OO1GW3TOK0C9Tx1DAsgBngCFs
	PHhDnSciDFEDGOz4AEfQUsomDScqwvK+ZjuBNNdtMCU0rU5OeWmH0Ux3i0cHMxCON1Ve
	yNp0FzO5Y5aUXM+6W0+dx4ZHaxTLQvm6pUBS8Gi5LyKNbkiAnUZWoKRYstMtc5MuDG7U
	nXxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=q47hVIZp5IACnzLCTZtXigerK875DLkSvoI4DIfiKMM=;
	b=EGIVj1HtcgB8Qpcqw2Dzmmc9hR2LbAhY3CXbumcvS6i3Dce6nDg/GzGclRcWoq9NsX
	2UQ1AWQwwjVMz49F/pzrDTxht1msvZbYZ+Xzc2BhILQLCPl5niWngoryfsXQFO/CzuWQ
	xK26mh30/Rh6nJC83nse8MihEMVVSEoDYJkwCfcxseUysmm4wBJfPP5d8vcXvmN1dKIS
	S1cMX4JYWPFZmKw8bFcC2VF6r1t/I+KoY/m1TGhzX2FG27vZACTgz1Jo2dPjj4xU8Ram
	sZXXRWzrBsUxe6gokV8aOdQtNRejnH3P22/iYS9VHitO7JdwTg6g/o+Lf834FxrXhGdX
	ksgw==
X-Gm-Message-State: ALKqPwdri/88PvHfw5JzZ4pFEPlkrYoMTVyWfIq2wlCroJPyd1CIqxwy
	Cc4tMXuQqkl430DBdDUe9knYikNG
X-Google-Smtp-Source: AB8JxZo0ptLnISt50Gwagfl/vqlRaE0BZDEah8LH8rVJBMIiSgnSuwPrBqOWWFkq7ydwG2yOKygn7Q==
X-Received: by 2002:a6b:9403:: with SMTP id
	w3-v6mr6424408iod.189.1527169437062; 
	Thu, 24 May 2018 06:43:57 -0700 (PDT)
Received: from linux-uys3.suse ([206.248.190.95])
	by smtp.gmail.com with ESMTPSA id
	r9-v6sm10999984ioa.49.2018.05.24.06.43.55
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 24 May 2018 06:43:55 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 24 May 2018 09:43:37 -0400
Message-Id: <20180524134337.31572-3-twoerner@gmail.com>
X-Mailer: git-send-email 2.17.0.582.gccdcbd54c
In-Reply-To: <20180524134337.31572-1-twoerner@gmail.com>
References: <20180524134337.31572-1-twoerner@gmail.com>
Subject: [meta-networking][master-next][PATCH v3 2/2] c-ares: rely on cmake.bbclass to put cmake package files in dev package
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
X-List-Received-Date: Thu, 24 May 2018 13:43:56 -0000

The cmake.bbclass in oe-core now ensures that ${libdir}/cmake and
${datadir}/cmake end up in the dev package, so recipes no longer need to
provide custom packaging rules to handles these files.

	http://git.openembedded.org/openembedded-core/commit/?id=d91dc4666683a96e9d03cbbd21b8a546f9069c93

Originally-conceived-by: Andre McCurdy <armccurdy@gmail.com>
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta-networking/recipes-support/c-ares/c-ares_1.13.0.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-networking/recipes-support/c-ares/c-ares_1.13.0.bb b/meta-networking/recipes-support/c-ares/c-ares_1.13.0.bb
index 70e497f5f0..defbeaa623 100644
--- a/meta-networking/recipes-support/c-ares/c-ares_1.13.0.bb
+++ b/meta-networking/recipes-support/c-ares/c-ares_1.13.0.bb
@@ -18,7 +18,6 @@ inherit cmake pkgconfig
 
 PACKAGES =+ "${PN}-utils"
 
-FILES_${PN}-dev += "${libdir}/cmake"
 FILES_${PN}-utils = "${bindir}"
 
 BBCLASSEXTEND = "native"
-- 
2.17.0.582.gccdcbd54c


