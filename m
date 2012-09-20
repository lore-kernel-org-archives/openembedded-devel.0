Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TEbiS-00040R-LA
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 Sep 2012 10:02:33 +0200
Received: by bkvi18 with SMTP id i18so613270bkv.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Sep 2012 00:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:mime-version:content-type
	:content-transfer-encoding;
	bh=W0D3jmA3WVSFyEnt4bOcXnUe2X5yRRSHXiGoNObTx2E=;
	b=bd6+Z5jaxxMmgzSVA0lOauIGUJy1kFS0XXgftKz4JDtxpLA53ZKg+9btBfcZOKpf40
	kbD3Yp4o4N/wGqRAo1/BEDriUfYszELNcLbl36vV6bXWyQw4iI/bpFbz1whq3Hs5jfon
	rYIKWNmFSKPh4jCB3gkaC+KD+KfMlWYhM1LQPGTBmWgQvfVIP/oeHVfHpU5tH3Oi5tbI
	M5QlWXzvgYVEAg//16u7Rz+TMw/1TgVyUWiV9vbNpGPFeDk+w/8eTr9aZjNdfMWbJaQW
	hd0G4ETzHMyYNsb1BedpKtadAttM39gn3SoOUtAYWRvAzPjel8HdKuqGR95UBvRtC5Ex
	BgOQ==
Received: by 10.204.152.220 with SMTP id h28mr254341bkw.30.1348127390243;
	Thu, 20 Sep 2012 00:49:50 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-156-96.unitymediagroup.de.
	[95.222.156.96])
	by mx.google.com with ESMTPS id f7sm3345590bkv.1.2012.09.20.00.49.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 20 Sep 2012 00:49:48 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 20 Sep 2012 09:48:59 +0200
Message-Id: <1348127339-28378-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
MIME-Version: 1.0
Subject: [PATCH] lighttpd: move systemd appends since recipe is in oe-core
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
X-List-Received-Date: Thu, 20 Sep 2012 08:02:33 -0000
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



