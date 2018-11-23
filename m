Return-Path: <nick83ola@gmail.com>
Received: from mail-yw1-f68.google.com (mail-yw1-f68.google.com
	[209.85.161.68])
	by mail.openembedded.org (Postfix) with ESMTP id C3FB76CEDC
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Nov 2018 14:38:10 +0000 (UTC)
Received: by mail-yw1-f68.google.com with SMTP id i20so4863022ywc.5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Nov 2018 06:38:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=uvreXKwUqaRLebwa4+H1Vy6K5YdE/1gXVaHvomovgQA=;
	b=pxLglftRVrBPsWMIaujRcbct16f9/r+dcRVYmlGmymLdBZfD8U2y2iQjv8tU239fyL
	bDRScjy+bhl/JQHzUlIrqKtGrMKlXxCpTIGzwnwHJmAz3bveXJ1b3UtLhCyXA/Nsf3eD
	rT/gq+JltA5iy0FME9TaO1JQDHywiaP3ZaQiAgzHsQCuQsBWrhRbRhOr21SaecgxRCI5
	bKOIkYq5Xa0bOVyENxUJezaEPU80N7saR6XI+x3CZa0xHvJda9eYrGJjugQDibsF90Ck
	Hi80btOiZe5Km/5XduXNJItC3kHsW4dKhF+eDaPEcbai7hVuJtyjDwODKY2f1K3Kpgr3
	dC0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=uvreXKwUqaRLebwa4+H1Vy6K5YdE/1gXVaHvomovgQA=;
	b=hZebFQ0QAjYd7k0eVStxzHkqGnqGrieN05S4JUnIT3UZjWICQf1TTX6CG4Lia5aIIa
	MHYeNRE3wftWzI5JBtRKxxXhsSyoLO+j9eFIso7hp8O/iIWNA/ZLAtj1WYwxYp/fAvR8
	Hxtq7iUxz9xh0A5LvrMEEuIySWeEjobYT6eOpg2XYuUHByUvZVsuWBgLAi3dr/Qg6TjD
	YBANdkJUufd1/SaUjNP2NHmPn26sBiOmWnzJrXYFnHA3gXEldYkZhrs1jmzrcHUoI3w0
	ER76+FrBtM4Xhn3HypRw04NcqXWLcyTC3YnpQtTRfoL165lLyXO5Yg/Yy8iHQxuHg+ts
	2nXQ==
X-Gm-Message-State: AA+aEWbulrcJ8wB6ETo0UKH3KHSAVmERvc+I4esQl32Heql6K16EpcJa
	VU5vmBbrQbe4XeVUK4REKKfyU6le
X-Google-Smtp-Source: AFSGD/UWv+RQ7e4QEKIDUfRcdtbdBA0XEO6PTBh5FW8XCjK2NBIisOAB1mAHwWSPSu2sjAOU5kgqMQ==
X-Received: by 2002:a81:78cc:: with SMTP id t195mr1931499ywc.387.1542983891329;
	Fri, 23 Nov 2018 06:38:11 -0800 (PST)
Received: from nick-laptop.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id u4sm583746ywl.29.2018.11.23.06.38.10
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 23 Nov 2018 06:38:10 -0800 (PST)
From: Nicola Lunghi <nick83ola@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 23 Nov 2018 14:38:07 +0000
Message-Id: <20181123143807.9522-1-nick83ola@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Subject: [meta-java][PATCH] java-library: make easy to override jar package name
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
X-List-Received-Date: Fri, 23 Nov 2018 14:38:10 -0000
Content-Transfer-Encoding: 8bit

define JARFILENAME and ALTJARFILENAMES with ?= to make simple
to override them

Signed-off-by: Nicola Lunghi <nick83ola@gmail.com>
---
 classes/java-library.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/classes/java-library.bbclass b/classes/java-library.bbclass
index ce1cd28..c69cf6b 100644
--- a/classes/java-library.bbclass
+++ b/classes/java-library.bbclass
@@ -42,10 +42,10 @@ PACKAGES += "${JPN}"
 FILES_${JPN} = "${datadir_java}"
 
 # File name of the libraries' main Jar file
-JARFILENAME = "${BP}.jar"
+JARFILENAME ?= "${BP}.jar"
 
 # Space-separated list of alternative file names.
-ALTJARFILENAMES = "${BPN}.jar"
+ALTJARFILENAMES ?= "${BPN}.jar"
 
 # Java "source" distributions often contain precompiled things
 # we want to delete first.
-- 
2.19.1


