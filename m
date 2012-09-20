Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TEdY8-00063X-2v
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 Sep 2012 12:00:00 +0200
Received: by bkvi18 with SMTP id i18so674601bkv.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Sep 2012 02:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:mime-version:content-type
	:content-transfer-encoding;
	bh=W0D3jmA3WVSFyEnt4bOcXnUe2X5yRRSHXiGoNObTx2E=;
	b=b8SFs8DhZY0J9/qh+5b4bdXHhFRcA7ryeWT6cCIO47ce3NQb+kFFCeN9w57CVPt/9C
	FYxRZ808t9D+DupF0tVuzdKzEhjAB2kwgggLP8jEUEEHX6zeO+L4D3XJliJKSFpgPbrF
	DtPysRBJWNWKdM9JrS+CGqyko1eEDeClYaU+96WHShPzfcCUQpY5Jdkb/JVl+Kweb/U8
	pTmD2aGXNGtH6vIf1dnbcgB+Kx4xqUAvJVRFD1xoc41nYhb+MhIkr6stKTn7Tt5lyFZA
	wYUZzGn1x7J/mqR5LMFamNHrBxsI3jxUlwGazxQh9Iu7Q8RgBSbi358Qkyy+16/gjhhk
	2eFA==
Received: by 10.204.133.196 with SMTP id g4mr337939bkt.89.1348134437742;
	Thu, 20 Sep 2012 02:47:17 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-156-96.unitymediagroup.de.
	[95.222.156.96])
	by mx.google.com with ESMTPS id g6sm3676825bkg.2.2012.09.20.02.47.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 20 Sep 2012 02:47:16 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 20 Sep 2012 11:46:27 +0200
Message-Id: <1348134387-20420-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
MIME-Version: 1.0
Subject: [meta-systemd, V2] lighttpd: move systemd appends since recipe is in oe-core
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 20 Sep 2012 10:00:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../lighttpd/lighttpd/lighttpd.service             |    0
 .../lighttpd/lighttpd_1.4.31.bbappend              |    0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename meta-systemd/{meta-oe => oe-core}/recipes-extended/lighttpd/lighttpd/lighttpd.service (100%)
 rename meta-systemd/{meta-oe => oe-core}/recipes-extended/lighttpd/lighttpd_1.4.31.bbappend (100%)

diff --git a/meta-systemd/meta-oe/recipes-extended/lighttpd/lighttpd/lighttpd.service b/meta-systemd/oe-core/recipes-extended/lighttpd/lighttpd/lighttpd.service
similarity index 100%
rename from meta-systemd/meta-oe/recipes-extended/lighttpd/lighttpd/lighttpd.service
rename to meta-systemd/oe-core/recipes-extended/lighttpd/lighttpd/lighttpd.service
diff --git a/meta-systemd/meta-oe/recipes-extended/lighttpd/lighttpd_1.4.31.bbappend b/meta-systemd/oe-core/recipes-extended/lighttpd/lighttpd_1.4.31.bbappend
similarity index 100%
rename from meta-systemd/meta-oe/recipes-extended/lighttpd/lighttpd_1.4.31.bbappend
rename to meta-systemd/oe-core/recipes-extended/lighttpd/lighttpd_1.4.31.bbappend
-- 
1.7.6.5



