Return-Path: <nick83ola@gmail.com>
Received: from mail-yw1-f68.google.com (mail-yw1-f68.google.com
	[209.85.161.68])
	by mail.openembedded.org (Postfix) with ESMTP id 4196B6C649
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Nov 2018 14:57:57 +0000 (UTC)
Received: by mail-yw1-f68.google.com with SMTP id v8-v6so4889451ywh.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Nov 2018 06:57:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=uvreXKwUqaRLebwa4+H1Vy6K5YdE/1gXVaHvomovgQA=;
	b=eriYbSKISacsin+HpbgPcKHgXjw1sp0azT1K0Or1muoxc1NKGAk3nw/y9RecuvPOwp
	1nlPD/dRNIz67XiPrWaQwckk8KpRFnYPwakSNoMDeg0TX5xO27ccHoRouAP59nkaId6x
	N3zmyIZ3pEQ5VeXWGbHjNEHuT3OmJ5AB5tbCkmceW/LuCTTjaYSKI0uOQQorfGlSlqZx
	/tOXAVoAQuDuIbeec5kEZgP5eYz5JqgII9lkP5dDgQQRe+ToAc6bIXR4bo0bUSENeAPE
	l8KUrOvt5p3hYLE+rclPeNWjau1YRyS9gbzHCu2c7ns6FLdPDLieIpekP40kKij1jZDf
	6g7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=uvreXKwUqaRLebwa4+H1Vy6K5YdE/1gXVaHvomovgQA=;
	b=kUhd/euMIgyAqwI7O/ZV5C/IjfH68LIGSujkUc0NkY5ldYCPXJ9wGkvJiPzanOvGG0
	2aL86xhTVYyXHbUmfKLMJtDwM4AYN8pUESGtflz8PoVGWGodSb5sIi28KXkepNGga97+
	2BwpSoPW2qQsLIfsRURrtWCQ1SHISiRdtZG+mco3zChUbLMWfpo0e72fuh4Gan2r5W/+
	q/RM0to/KhWJ92YJd4iJd8LCbRTbeQZ/02igatqaGvrKxZ07XO9kadRk1eH2LDq6NKgD
	0AuwgGYgLu5uRkyZf5NoFu/E4gU7vqvK3XJnmkR1NEaPOewHL7j/itZfvElJkNbzACSC
	Uumw==
X-Gm-Message-State: AA+aEWbwb1VBDrSuX/dwuX+vBehxIrfiQW+34UJeblz/p4Fs+PJBgyEX
	GzP5HEEPJr+1U1hyxqlWLlD3oOEH
X-Google-Smtp-Source: AFSGD/XqPuvKIV595yfL1h5L3eeTxeiqUlrQogYPG0Hf0sFH4/N8mHOKN9pLTDPaH5/CrVEs0WRcIw==
X-Received: by 2002:a81:78cc:: with SMTP id t195mr2023019ywc.387.1542985078085;
	Fri, 23 Nov 2018 06:57:58 -0800 (PST)
Received: from nick-laptop.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id z37sm4531842ywj.3.2018.11.23.06.57.57
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 23 Nov 2018 06:57:57 -0800 (PST)
From: Nicola Lunghi <nick83ola@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 23 Nov 2018 14:57:54 +0000
Message-Id: <20181123145754.10590-1-nick83ola@gmail.com>
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
X-List-Received-Date: Fri, 23 Nov 2018 14:57:57 -0000
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


