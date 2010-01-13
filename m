Received: from mail-fx0-f212.google.com ([209.85.220.212])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1NUqz0-0002KL-N4
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Jan 2010 01:21:13 +0100
Received: by fxm4 with SMTP id 4so19535227fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jan 2010 16:19:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=Vz3LbvA4aThjNUAI+BqOHfWjVsSJS7ERREi5Y43G/ms=;
	b=RUDc5JGLPjXeVfCOEcZOX+RYtTJ9BT6CqiOiXW0+7d9/1LEvFILOxXJ7dHd4Rmc/on
	NUhZLdcO3lwkMQtjL63TI7BWH1G+wbjQgvnK6oUPbNfzSZoz2Tvk6M3uqHy9LjF/SCc9
	GwPuJvduW4l2DVB55p5zWvqsC9YwCyLR+VyPI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=lOJEMuKjTx5p+TvFGxl3rrc92CUsp6TefxTpRP7j4TFPwZ2gutWcJ2rIjV+tX+7hqE
	hLBx90fDt2fwrDQT4wRQFHMTfxMxo7o9eOg8rKyOqP8SZUtMCZI/gZR583zL1S969fZW
	xXe9peMGEqmQ26T62nKlEKz/KyeyG/+vFL5qQ=
Received: by 10.223.92.131 with SMTP id r3mr10263853fam.40.1263341941287;
	Tue, 12 Jan 2010 16:19:01 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 16sm10508692fxm.12.2010.01.12.16.19.00
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 12 Jan 2010 16:19:00 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 13 Jan 2010 01:17:20 +0100
Message-Id: <1263341840-19186-3-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.6.6
In-Reply-To: <1263341840-19186-2-git-send-email-Martin.Jansa@gmail.com>
References: <20100112222121.GD10781@jama>
	<1263341840-19186-1-git-send-email-Martin.Jansa@gmail.com>
	<1263341840-19186-2-git-send-email-Martin.Jansa@gmail.com>
X-SA-Exim-Connect-IP: 209.85.220.212
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH 3/3] busybox: bump INC_PR to force postinst script run on targets after u-a fixup
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
X-List-Received-Date: Wed, 13 Jan 2010 00:21:13 -0000

---
 recipes/busybox/busybox.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/busybox/busybox.inc b/recipes/busybox/busybox.inc
index 753b402..519fcd6 100644
--- a/recipes/busybox/busybox.inc
+++ b/recipes/busybox/busybox.inc
@@ -11,7 +11,7 @@ LICENSE = "GPL"
 SECTION = "base"
 PRIORITY = "required"
 
-INC_PR = "r23"
+INC_PR = "r24"
 
 SRC_URI = "\
   http://www.busybox.net/downloads/busybox-${PV}.tar.gz \
-- 
1.6.6



