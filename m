Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
	[209.85.210.171])
	by mail.openembedded.org (Postfix) with ESMTP id A68ED794AA
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Aug 2018 22:07:16 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id x17-v6so3511576pfh.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Aug 2018 15:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=7PpQk3OajuMJFxy9jmKS51BVPLEmCYHq+g+ojJ1VoDU=;
	b=ocDVXEKzchcpBuoe855hi72I00loYAGipSoBVNqU1ETggoJVLlqtI9aqb7tB/n4nz1
	VE1rDB3m63IOmxKiseiM3H8S3u/JeepcGz1Fp657qkxmbTcjXbfsZaf76T6ooMQihH3U
	9ZSjiQC2b3ucxqbcsW040Q70mDLQK0TuDe1kgd20AOAKija/Q0Bb4oiWyTwWQt3yKR1B
	lQBmcAnQiaVKBQuFkXc6B75pSuTUIuRgk6QyHzqU4Q0fGkSd7mfPtpOExbuqReN9RaYi
	uPjOAxy4HmbwCtyeWa6oVZNKjNuAgMkS3E04GaJE40TejlTYwB0kC7ARulVpZFHsK88X
	I0pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=7PpQk3OajuMJFxy9jmKS51BVPLEmCYHq+g+ojJ1VoDU=;
	b=QnZD8xu8lJfLF7Zc0KP+98+hGZimStoqEQewoDpivZ8bVMszvcFG9icjncyX+3Pk+a
	FNDc7/G3eW8Ou/qGtKlukNsL/Peie48+77YFkVUgNeR06hi/FQJ8Ya94Pw3Nw/wwVuf2
	s9GXNXhP+uCh1bznFONMPBQMCrQ0bZ0/ZURhTA62wd8dAhqGVGiCBcW1xsBb9pui77eU
	txC4hoJWbpKNpEh03gPZ9xRlNaNe8eSfjCRnBkB4Adapbc05vWp0el/i6fYrBmmHPsd2
	DyhfUkCUuJuUEkf9BpqZrrzc6P5N77fWDlM0hbcIq0Tzt0P0EiVzQG1ahgz8QcBqGB3j
	2clA==
X-Gm-Message-State: APzg51AZObVbCtg5XNEVTuzfC1WTVTiPWf70+FcOWNo4L3fHjDZpHLsg
	rjFEm9jr978nrUE1VObPsNEbEseQ
X-Google-Smtp-Source: ANB0VdZWayOxQIib4j3JIVC3aPsnH4shDxRAJLygaEzatlsatYcdoJkiP7wcRhQih/b1lOhc+k9lig==
X-Received: by 2002:a62:9894:: with SMTP id
	d20-v6mr11754202pfk.186.1535062037419; 
	Thu, 23 Aug 2018 15:07:17 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::4add])
	by smtp.gmail.com with ESMTPSA id
	j195-v6sm8862346pgc.25.2018.08.23.15.07.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 Aug 2018 15:07:17 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Aug 2018 15:07:07 -0700
Message-Id: <20180823220708.44582-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180823220708.44582-1-raj.khem@gmail.com>
References: <20180823220708.44582-1-raj.khem@gmail.com>
Subject: [PATCH 2/3] espeak: Fix cp command to preserve mode
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
X-List-Received-Date: Thu, 23 Aug 2018 22:07:16 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/espeak/espeak_1.48.04.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/espeak/espeak_1.48.04.bb b/meta-oe/recipes-support/espeak/espeak_1.48.04.bb
index 552f40413b..57e30f0710 100644
--- a/meta-oe/recipes-support/espeak/espeak_1.48.04.bb
+++ b/meta-oe/recipes-support/espeak/espeak_1.48.04.bb
@@ -36,6 +36,5 @@ do_install() {
         rm -f ${S}/espeak-data/phon*
     fi
 
-    cp -prf ${S}/espeak-data/* ${D}${datadir}/espeak-data
-    chown -R root:root ${D}${datadir}/espeak-data
+    cp -R --no-dereference --preserve=mode,links ${S}/espeak-data/* ${D}${datadir}/espeak-data
 }
-- 
2.18.0


