Return-Path: <nick83ola@gmail.com>
Received: from mail-yb1-f195.google.com (mail-yb1-f195.google.com
	[209.85.219.195])
	by mail.openembedded.org (Postfix) with ESMTP id B22C36C5C8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Nov 2018 14:54:02 +0000 (UTC)
Received: by mail-yb1-f195.google.com with SMTP id g192-v6so4843673ybf.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Nov 2018 06:54:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=uvreXKwUqaRLebwa4+H1Vy6K5YdE/1gXVaHvomovgQA=;
	b=OXL40X6v2abhxG6tICD3Oq3ywlx5SRMKdPaq17SLpKh+OXIDw04gkuV8htJBkPcfcQ
	2nvHAcv+xArJcRsjwtp5D5RUhJP7CQtey2Zi0kwF7R6wIBJmrovY4EtoBszJSVL7rQa2
	Td7ggqxR52M86umCBbR7FaPBaCCYiuuryAe2S+YS/GCoVdCUX6quzPopD3djeAN+mwXk
	drOj8i2H/03lL5tzDl9GcomJ7TAhJFDpq3YP/2j1dwAC2y8DQwgn7EU6PW0BnY0u8kWs
	0oc2ys7Kc7Qe3U1OQ9+yHwWdiBSFSF/vHnJF3sA8PTzovCQVKDI2lN0s+FHqXTRGLgYu
	zk4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=uvreXKwUqaRLebwa4+H1Vy6K5YdE/1gXVaHvomovgQA=;
	b=VA+yuBPLTZzFIr1+IACSHiyutCVFUET+6NlFffm4dZcm6MB4sHh6craCSjSaqxvVPU
	5nV8K9eESZb4PDEKHSyDvX9Q730NPkOJwGPlnWySCUR4ikX2se4uWORSIlUuOll9gtoB
	bwQY2xtuThjcZn/7oh4e+qIdRLUk/8qsDMJqPA/B8BpvSxGsxoFfyU5g3M1/ueYcb+qs
	N2pEntWbaOT1MqEWR9vLekPA+EpkLxYy3ztilo2LBiW+quBA9NVHKCuk7cN4nPIZLYi+
	s73nXrRuRhr8c8tiLxdKxvY+r144u1c+SopUwBxhPaAe4mhmQCTOzoWsLZ1ePhlOiLob
	OuAg==
X-Gm-Message-State: AA+aEWY7DWQMJtaqgwTwd1UspEcBn73CXQjJRquCnkLEjKkz/fRYn1sN
	XFMEg2oytM0dZcIe0vvCCssAK62x
X-Google-Smtp-Source: AFSGD/VJ0Kt/RIkn+EWJIA3W/pRxe9/rZNa6/UvGa/TyFtT1lMa80BiUOdOYFMmoexDYAidEAILV9Q==
X-Received: by 2002:a25:618a:: with SMTP id
	v132-v6mr16179300ybb.293.1542984843436; 
	Fri, 23 Nov 2018 06:54:03 -0800 (PST)
Received: from nick-laptop.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	b125sm5216053ywe.20.2018.11.23.06.54.02
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 23 Nov 2018 06:54:02 -0800 (PST)
From: Nicola Lunghi <nick83ola@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 23 Nov 2018 14:53:58 +0000
Message-Id: <20181123145358.10490-1-nick83ola@gmail.com>
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
X-List-Received-Date: Fri, 23 Nov 2018 14:54:03 -0000
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


