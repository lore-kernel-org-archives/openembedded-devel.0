Return-Path: <andre.draszik@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id A073560203
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Mar 2020 19:50:36 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id v11so16387104wrm.9
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Mar 2020 12:50:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=uV+2otkyPl3JmHJguVbCw2jsSirs73kX5itjANu5qL8=;
	b=Wb/IcGxoISxOeEKUXVNncaAuvn4zSlVn4qZBfIWjuNZe8YbZaTpsGlyWc/sRC2J1Sp
	+Zyp3e+zKDTiNPHW6yNprm53MDDbtwrs/BHUn9z36TIv2qkWT0+W2kZ0zkpMBBaBuCY6
	V5DW0EoTXUHIkoVEQhn8rXIOtrCup32PuvHfhfyLdb7rik1w2oGhqKZBZuZwtPZ8bSIz
	2vOyVjDiFnvkTO7Ico2MxMtwYqT1z7zeFjf1yQs6XtcvEHT03zzRYM7JGV7eSH9HvLRF
	kAFbYpJ+Zv+naBMJlX19d547UmnvsOnE2iiHsb/9GCD1W0BLFS6STu+sCDr2RgEDv5vR
	Qhzw==
X-Gm-Message-State: ANhLgQ3wsLphv/fOZIlSxqxqvMkY8RoEnZp7cu/sB/RPhAVCfJymzrJU
	7RlhXujULNItxCD8LUTDLd7T5OIo
X-Google-Smtp-Source: ADFU+vuoGGYP9Tu8+5S44VDXBTJwfgK7zR2ecz8CtkC4kVYXALgfumDiKyVF7m/NLqY9Du4GjDlTJA==
X-Received: by 2002:adf:de0d:: with SMTP id b13mr25470193wrm.297.1584215436793;
	Sat, 14 Mar 2020 12:50:36 -0700 (PDT)
Received: from 1aq-andre.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	f15sm22360779wmj.25.2020.03.14.12.50.35
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 14 Mar 2020 12:50:36 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 14 Mar 2020 19:50:35 +0000
Message-Id: <20200314195035.28224-1-git@andred.net>
X-Mailer: git-send-email 2.23.0.rc1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] smem: remove numpy dependency on armv4 and armv5
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
X-List-Received-Date: Sat, 14 Mar 2020 19:50:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

numpy doesn't build on those.

Signed-off-by: André Draszik <git@andred.net>
---
 meta-oe/recipes-support/smem/smem_1.5.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-support/smem/smem_1.5.bb b/meta-oe/recipes-support/smem/smem_1.5.bb
index 90db9c3f3..77179906e 100644
--- a/meta-oe/recipes-support/smem/smem_1.5.bb
+++ b/meta-oe/recipes-support/smem/smem_1.5.bb
@@ -35,6 +35,9 @@ do_install() {
 
 RDEPENDS_${PN} = "python3-core python3-compression"
 RRECOMMENDS_${PN} = "python3-matplotlib python3-numpy"
+# numpy doesn't work on those.
+RRECOMMENDS_${PN}_remove_armv4 = "python3-matplotlib python3-numpy"
+RRECOMMENDS_${PN}_remove_armv5 = "python3-matplotlib python3-numpy"
 
 PACKAGE_BEFORE_PN = "smemcap"
 
-- 
2.23.0.rc1


