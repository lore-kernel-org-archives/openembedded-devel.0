Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TEbkN-00046J-57
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 Sep 2012 10:04:31 +0200
Received: by bkvi18 with SMTP id i18so614216bkv.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Sep 2012 00:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:mime-version:content-type
	:content-transfer-encoding;
	bh=W0D3jmA3WVSFyEnt4bOcXnUe2X5yRRSHXiGoNObTx2E=;
	b=tSYE4qwfsv+gwGnLctUt0ZJwbK/y+5q9ybyaGASmCFH5h0mEfN5vQxY/e8oIKd9pe/
	FhFrQalVs3cpid+CsD3anGoJruzAIAfjUIRo24ZeVFua0KWEOGouSOvIVmbOFN8bmvBS
	DmtrtxAoRLhKbB+lGST6Kk/L0vI/wa3dnqFkFuw6H9ybcqC5U37qSJZ0VvbvVH1jVm5v
	6j1oMx7SHzzL8tm+z6/N0tWVeJBxYKwxr51eHcm3lYxgThgRiT9uEkAKi/a3wZespwmO
	+MllWqwWsbDpZ4LIEO3GXkYo9TcFlmkK4uhGu19VAnMU6nTWF/eiyt41X3zJvsywbl5s
	a2Hg==
Received: by 10.204.156.208 with SMTP id y16mr251467bkw.76.1348127509074;
	Thu, 20 Sep 2012 00:51:49 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-156-96.unitymediagroup.de.
	[95.222.156.96])
	by mx.google.com with ESMTPS id x13sm2544686bkv.16.2012.09.20.00.51.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 20 Sep 2012 00:51:48 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 20 Sep 2012 09:50:59 +0200
Message-Id: <1348127459-8538-1-git-send-email-schnitzeltony@googlemail.com>
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
X-List-Received-Date: Thu, 20 Sep 2012 08:04:31 -0000
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



