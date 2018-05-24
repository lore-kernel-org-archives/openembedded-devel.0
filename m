Return-Path: <twoerner@gmail.com>
Received: from mail-it0-f51.google.com (mail-it0-f51.google.com
	[209.85.214.51])
	by mail.openembedded.org (Postfix) with ESMTP id 4CEB774B3F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 May 2018 14:39:23 +0000 (UTC)
Received: by mail-it0-f51.google.com with SMTP id z6-v6so2651952iti.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 May 2018 07:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=tTeXZ+RkeJ9WGrceqKmss5Hap86Dj0oElyK0sHKBTVk=;
	b=BoaOGYvtXtpe8osB/k09PPcz3Hg3Jz1778h89SENzHTbUYWNFzvrRAMo89bEgMxhbX
	PdjGg0B4+xh3ZIlnkca7JE7ICq+qB/YOMwIQujsc8Jg7d2eeVyr8tq5enNnE2jLd/u4k
	eCy4fvnSvvX64pCUBoyb4JtbMDLzmLK3muI34et3d3f/31YRlRaw6hB4ujGiXIj2y8I0
	J3NE0ixvU9aQVxk/4vrv/cNVn2QrX/v/usrR11LJuu5APBwKHw9NXRxj7wIIilM/0lFk
	Z9ek+jovkPXLHtFpfbt+IyS/CmZ2CbmzVnRMqB1HcX2NYHWwHW0Tx7oxU8HyEy9jKX+8
	yJXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=tTeXZ+RkeJ9WGrceqKmss5Hap86Dj0oElyK0sHKBTVk=;
	b=JXC2fG6zDNMRMIN8V/h0ySUASQgW1Jn7s4woQfc2Y7peS4pN5Ieyq+5kMAPLBtEVQ9
	eOJ5SD1oL2ecjRcICTo2+VBHlAmFhRkRfXSLQmJm4nR3XwBAJFucI8QLrflO2TKp3LsI
	smXasZfDjEAyy+0IL0AMpYyQWwlJR7bHgT3IH8khWhIClzW27gcvZb+1mJXKU+cA+6J3
	8vjKFiFSqpGnIptTJJ5bNSYkCKWFshfB5fm1BdC2sAouMIKsikulm/wHAVc7wM8Pejok
	7e/op76N2TK3D4CMEmw0LTnL2VseRxjiZvYlKptojbsBn8agtmjwW3m/FDF+F4VJUIY6
	cnAw==
X-Gm-Message-State: ALKqPwfFMMBSAmaiH0+IB+JjcuGmTjWWvSPbmUj0Q+0eVehqrGZhbpGr
	pHBwF7NItLNRWwQxB3FJa8eS89ST
X-Google-Smtp-Source: AB8JxZrJRdUxVydsNCiSTyDKBRueku1adrTR43cBhKVnUxS9wmFWev41Q2EmgsRiIbUPuKumYMIn1w==
X-Received: by 2002:a24:874a:: with SMTP id
	f71-v6mr10458984ite.69.1527172764268; 
	Thu, 24 May 2018 07:39:24 -0700 (PDT)
Received: from linux-uys3.suse ([206.248.190.95])
	by smtp.gmail.com with ESMTPSA id
	a43-v6sm2435261itj.11.2018.05.24.07.39.22
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 24 May 2018 07:39:23 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 24 May 2018 10:38:48 -0400
Message-Id: <20180524143854.24096-12-twoerner@gmail.com>
X-Mailer: git-send-email 2.17.0.582.gccdcbd54c
In-Reply-To: <20180524143854.24096-1-twoerner@gmail.com>
References: <20180524143854.24096-1-twoerner@gmail.com>
Subject: [meta-oe][master-next][PATCH v3 11/17] gflags: rely on cmake.bbclass to put cmake package files in dev package
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
X-List-Received-Date: Thu, 24 May 2018 14:39:23 -0000

The cmake.bbclass in oe-core now ensures that ${libdir}/cmake and
${datadir}/cmake end up in the dev package, so recipes no longer need to
provide custom packaging rules to handles these files.

	http://git.openembedded.org/openembedded-core/commit/?id=d91dc4666683a96e9d03cbbd21b8a546f9069c93

Originally-conceived-by: Andre McCurdy <armccurdy@gmail.com>
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta-oe/recipes-support/gflags/gflags_2.2.0.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-oe/recipes-support/gflags/gflags_2.2.0.bb b/meta-oe/recipes-support/gflags/gflags_2.2.0.bb
index 28b652a640..b186326e9b 100644
--- a/meta-oe/recipes-support/gflags/gflags_2.2.0.bb
+++ b/meta-oe/recipes-support/gflags/gflags_2.2.0.bb
@@ -10,8 +10,6 @@ SRCREV = "f8a0efe03aa69b3336d8e228b37d4ccb17324b88"
 
 S = "${WORKDIR}/git"
 
-FILES_${PN}-dev += "${libdir}/cmake"
-
 inherit cmake
 
 EXTRA_OECMAKE="-DBUILD_SHARED_LIBS=ON -DREGISTER_INSTALL_PREFIX=OFF -DLIB_INSTALL_DIR=${baselib}"
-- 
2.17.0.582.gccdcbd54c


