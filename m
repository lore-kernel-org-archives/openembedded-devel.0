Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1THUFX-0001Mi-Dm
	for openembedded-devel@lists.openembedded.org;
	Fri, 28 Sep 2012 08:40:35 +0200
Received: by wibhj13 with SMTP id hj13so1029124wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Sep 2012 23:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=DxfruVfjPOl9sHQHHr3S7nPbXEk1SlbZ+mspe7cWGN0=;
	b=aHyneDGul8NhqZ8A+oNQwD7voRJ5tjXFx4EqbnMPR0MI1I13dnRm3Bxbd8VOR3cwPr
	LMQU1jpMjq6dsmzT09X9bmW3BLFIb5rE/TUOdOxTEphWEPV1o/nhgMXbX4asmBdbNVd7
	cV0tn8zG/3T5AbT81saFa9qxJrFsFt4Kgmjnq0ergXux2vfbt5+NBo/zzHvJchltduF0
	BrIVJ2Ux5iWgaSAbEE7Uq6FzMeioJnDq3wyRBUVgk/gUiK5ybmzBrbfHkt0jWJuxtOj8
	txOh89Q6FRQZ4bFmfcpYqsJP5lh3zPxoDc8Hfd8Ot8My4xPzLmqHyeHiSTSeCvV2ec+5
	D8JQ==
Received: by 10.180.87.34 with SMTP id u2mr1602528wiz.3.1348813662833;
	Thu, 27 Sep 2012 23:27:42 -0700 (PDT)
Received: from localhost.localdomain (p5B0A31AA.dip.t-dialin.net.
	[91.10.49.170])
	by mx.google.com with ESMTPS id cu1sm35004550wib.6.2012.09.27.23.27.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 27 Sep 2012 23:27:41 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 28 Sep 2012 08:35:51 +0200
Message-Id: <1348814151-31167-3-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1348814151-31167-1-git-send-email-schnitzeltony@googlemail.com>
References: <1348814151-31167-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe, meta-xfce 3/3] lighttpd: move systemd appends since recipe is in oe-core
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
X-List-Received-Date: Fri, 28 Sep 2012 06:40:35 -0000
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
1.7.4.4



