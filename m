Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OJuiz-00030i-Du
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Jun 2010 22:39:42 +0200
Received: by pxi14 with SMTP id 14so2440803pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 Jun 2010 13:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=lEEifelHyYXiQ2MKF4f09bLtG7e2jX/RbZuaFfdxunI=;
	b=bVMdDrsHoQqEkzPXJbohlAHcud9ZVS+eY2P9x8XYna8PZbfCRBmMeb6oJMveM4g1kH
	11p0TFUXAmXK55m7xSniqSF1F3Pip8gEP6+WvwESyYswr8rfGbQJ0rrVR8em1603FNqq
	FHH1IFNthB/q+Y2j+o9m3GnWUkXkUgVyrXCxQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=nGP8oT2SjO+UPq/hZeLNFpb9IR75gJB5cZ7LvlJCKk3T5IQyE3v8jqxa2gZ163Z4P6
	ltwOX4l1OBGYQqyLhgjqbFOFa0ilC51BaSliqfJiY4EFwRUqhCzSmFZuSZ5f1g7RHpYe
	FPiwr9Hhp75CZ9yZ9upACYt5HcpTaDd+RVtik=
Received: by 10.143.153.4 with SMTP id f4mr5583541wfo.253.1275510925264;
	Wed, 02 Jun 2010 13:35:25 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id 20sm5942447pzk.7.2010.06.02.13.35.23
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 02 Jun 2010 13:35:24 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  2 Jun 2010 13:34:42 -0700
Message-Id: <1275510896-30845-3-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1275510896-30845-1-git-send-email-raj.khem@gmail.com>
References: <1275510896-30845-1-git-send-email-raj.khem@gmail.com>
X-SA-Exim-Connect-IP: 209.85.212.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 02/16] classes/gettext.bbclass: Account for libiconv and libintl too.
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
X-List-Received-Date: Wed, 02 Jun 2010 20:39:42 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 classes/gettext.bbclass |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/classes/gettext.bbclass b/classes/gettext.bbclass
index a40e74f..d0578b0 100644
--- a/classes/gettext.bbclass
+++ b/classes/gettext.bbclass
@@ -4,14 +4,14 @@ def gettext_after_parse(d):
         cfg = oe_filter_out('^--(dis|en)able-nls$', bb.data.getVar('EXTRA_OECONF', d, 1) or "", d)
         cfg += " --disable-nls"
         depends = bb.data.getVar('DEPENDS', d, 1) or ""
-        bb.data.setVar('DEPENDS', oe_filter_out('^(virtual/libiconv|virtual/libintl)$', depends, d), d)
+        bb.data.setVar('DEPENDS', oe_filter_out('^(virtual/libiconv|virtual/libintl|gettext|gettext-native)$', depends, d), d)
         bb.data.setVar('EXTRA_OECONF', cfg, d)
 
 python () {
     gettext_after_parse(d)
 }
 
-DEPENDS_GETTEXT = "gettext gettext-native"
+DEPENDS_GETTEXT = "gettext gettext-native virtual/libiconv virtual/libintl"
 
 DEPENDS =+ "${DEPENDS_GETTEXT}"
 EXTRA_OECONF += "--enable-nls"
-- 
1.7.0.4



