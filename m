Received: from mail-fx0-f65.google.com ([209.85.161.65])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1P87eF-0001Wk-9B
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Oct 2010 10:34:19 +0200
Received: by mail-fx0-f65.google.com with SMTP id 20so290398fxm.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Oct 2010 01:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=KRs5KwOtKIYSmD4r8V+8HSFGh6SwCkz8WAw2TAio6gw=;
	b=nDdl8MHfADxQuOtgNd66CzN+40yWmS5948NJGpq4ssq0BEf/tdkb06oO2Env/wIdwd
	UkGATMcUHZWh7MgOHVlMk6mxyX9PVoJZvJo6b+QNE4yoHH/3yeabXtjnzWwEApSkdnqu
	d8y7i4VJTHJTQDmffazLufkZ2WGmD/IpQU2sA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=xbcYBKcJKgb2/wEsWgqxKgBZLSlX77PfrxX5QyiKEiOXacH2y8M98Gy9W/v0yhESpY
	uagob8etvdRTcHOT0eb4uCi8CVhTLssFw2X1/NVXVFtTCUpUQx8cJADvZnN1P7P1IIGg
	VmOe9oQSqgC6LA79QpM+3GhAnvj1EX/LES0ig=
Received: by 10.103.199.6 with SMTP id b6mr3871259muq.55.1287477227365;
	Tue, 19 Oct 2010 01:33:47 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id z19sm4005584fam.16.2010.10.19.01.33.46
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 19 Oct 2010 01:33:47 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Oct 2010 10:33:16 +0200
Message-Id: <1287477207-27752-3-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.3.1
In-Reply-To: <1287477207-27752-1-git-send-email-Martin.Jansa@gmail.com>
References: <1287477207-27752-1-git-send-email-Martin.Jansa@gmail.com>
X-SA-Exim-Connect-IP: 209.85.161.65
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 02/13] meta-angstrom-2007: remove openmoko-browser2 which was moved to obsoleted
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
X-List-Received-Date: Tue, 19 Oct 2010 08:34:20 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes/meta/meta-angstrom-2007.bb |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/recipes/meta/meta-angstrom-2007.bb b/recipes/meta/meta-angstrom-2007.bb
index fbd7f0b..32683d0 100644
--- a/recipes/meta/meta-angstrom-2007.bb
+++ b/recipes/meta/meta-angstrom-2007.bb
@@ -17,7 +17,6 @@ RDEPENDS_${PN} += " \
 RDEPENDS_${PN} += " \
          midori \
 	 minimo \
-         openmoko-browser2 \
 	 webkit-gtklauncher \
          "
 
-- 
1.7.3.1



