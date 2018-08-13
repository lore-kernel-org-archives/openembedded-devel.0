Return-Path: <andre.draszik@gmail.com>
Received: from mail-yw1-f68.google.com (mail-yw1-f68.google.com
	[209.85.161.68])
	by mail.openembedded.org (Postfix) with ESMTP id 9F2B678DD2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Aug 2018 10:09:42 +0000 (UTC)
Received: by mail-yw1-f68.google.com with SMTP id z143-v6so13130357ywa.7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Aug 2018 03:09:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=3jHCx+SSVndpJJjPzjtjD7CP/UQDCEcWcr6ksJHYiOc=;
	b=lRRoLTUJSGguOXdGbL2u3qj+IubmFE4vbRM1iGEkNeMvy0BN5lu83BVhXeod1n7jvJ
	lZmjWiNX0F3lxtux0kyqMES0MmL8+GDPyZ4ZndDL5505mVS/I6XSibc5EDCh85+o/pld
	hpPAz6RQwtpkGNo0ePGnBPSUlcNfPEZ3L8PNPexDXUocQzB0NLZhRh8L18r1FYJtHTd1
	98tFke32xxrUdvYEMV/OyFTuRo3IL2j0ronOua6JCPxK2H4TDt7+7KHNfNCHT9Of2iAm
	4vxyI7K5kS4em7O1tsNIESg5EmiW6Z0cVx/YkaZCHn7Xv8QFpyRSoOwMRxLxkzK9msBK
	TWLg==
X-Gm-Message-State: AOUpUlFJjJ6bfCisNdKsngGH2/eZo2mTB9KAvpa6kheyKBPD5YX+v3Oc
	2WJ/JNgiqt/iFA9uT6F7eoqTyi0p
X-Google-Smtp-Source: AA+uWPyTVGwYXgz4e6h+6BMnNDrL2O9jmaTjiPU8Rdn10X8Ow7VzS3Wp9nP8vTijWXQMHOgRuoGP7A==
X-Received: by 2002:a25:ac46:: with SMTP id
	r6-v6mr8308730ybd.450.1534154983296; 
	Mon, 13 Aug 2018 03:09:43 -0700 (PDT)
Received: from tfsielt31850.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	i62-v6sm6918738ywb.54.2018.08.13.03.09.42
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 Aug 2018 03:09:42 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 Aug 2018 11:09:28 +0100
Message-Id: <20180813100936.23663-2-git@andred.net>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180813100936.23663-1-git@andred.net>
References: <20180813100936.23663-1-git@andred.net>
MIME-Version: 1.0
Subject: [meta-java][PATCH 1/9] gitignore: ignore new python byte-code files
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
X-List-Received-Date: Mon, 13 Aug 2018 10:09:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <andre.draszik@jci.com>

Since we run oeqa tests, we get python byte-code in
the source tree here.

Ignore them to clean-up the git status

Signed-off-by: André Draszik <andre.draszik@jci.com>
---
 .gitignore | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.gitignore b/.gitignore
index 51a512c..8e5c599 100644
--- a/.gitignore
+++ b/.gitignore
@@ -1,4 +1,5 @@
 *.bak
 *.orig
+*.pyc
 *.rej
 *.swp
-- 
2.18.0


