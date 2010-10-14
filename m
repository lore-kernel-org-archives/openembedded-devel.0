Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P6QnW-0001mU-9I
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Oct 2010 18:37:00 +0200
Received: by gwb17 with SMTP id 17so2319899gwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Oct 2010 09:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=+zvlCy1hgOINk6T3cuJJVEvX18SknPGzHn7NLPP7aN8=;
	b=bitQDM8dymEFAVS0QngOAh3XqdlF3vJneTYadaGGcsF5tpxMbeBiorRwYbGvKFW2vH
	fGwSBIw7v5kStq7XlF0ao8RdE+bs1/uxhpgfjyDVNL05HQEwuTwkQtYwUXLPNj5V0vjj
	5z6WRLQT1jo/8CumjN4FyP+UqXjLGlxllz0sU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=qzVWaJz5zUIxtehLXDehZOkksEL4tVaBqxCnm7P05RCIa5oNWUGDkjPuw1KJgouQ8E
	ul4UhpPHdyYfT30CrNpCaLGL42B9KbDrAoywd5swZHrqp6ZMUcOHog9UOmY+CCcmw2hF
	/FtgrSt16bK17rWWFP4HysT7bXZ19jIQ4fxIY=
Received: by 10.14.119.7 with SMTP id m7mr6763002eeh.42.1287074161974;
	Thu, 14 Oct 2010 09:36:01 -0700 (PDT)
Received: from localhost.localdomain (j200125.upc-j.chello.nl [24.132.200.125])
	by mx.google.com with ESMTPS id q51sm2981860eeh.10.2010.10.14.09.35.59
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 14 Oct 2010 09:36:00 -0700 (PDT)
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 14 Oct 2010 18:35:41 +0200
Message-Id: <1287074146-3705-2-git-send-email-fransmeulenbroeks@gmail.com>
X-Mailer: git-send-email 1.6.4.2
In-Reply-To: <1287074146-3705-1-git-send-email-fransmeulenbroeks@gmail.com>
References: <1287074146-3705-1-git-send-email-fransmeulenbroeks@gmail.com>
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 2/7] directfb_2.18: remove useless LDFLAGS_append = ""
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
X-List-Received-Date: Thu, 14 Oct 2010 16:37:06 -0000

Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
---
 recipes/directfb/directfb_1.2.8.bb |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/recipes/directfb/directfb_1.2.8.bb b/recipes/directfb/directfb_1.2.8.bb
index 35eb7c6..a6cf68f 100644
--- a/recipes/directfb/directfb_1.2.8.bb
+++ b/recipes/directfb/directfb_1.2.8.bb
@@ -22,8 +22,6 @@ EXTRA_OECONF = "\
   --disable-x11 \
 "
 
-LDFLAGS_append = ""
-
 LEAD_SONAME = "libdirectfb-1.2.so.0"
 
 SRC_URI[md5sum] = "ac13d21682aa368df4e177ae5b51ad2d"
-- 
1.6.4.2



