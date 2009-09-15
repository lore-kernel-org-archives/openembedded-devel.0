Received: from [209.85.132.247] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1MnRjd-0006Ir-Pi
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Sep 2009 08:41:56 +0200
Received: by an-out-0708.google.com with SMTP id c5so1372318anc.42
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Sep 2009 23:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=cI9P6vDNrV3pQepBuHGacV8krjxfjhBuXe4BWNQqZWg=;
	b=Q+yb8k0zGuw93m0fJeJXfDV9oj21P6zmOQGYtvplCcUjmL4AyDkYIY0jDfAScQ/O/Y
	KNg0DWIo8v0pDmQC0GDnKLqcEpHPLPT0Spm/y0LiZsDfnu2lWSi5OXEVQvadlOlJQClY
	j6y3lnyvqntCiFtFo2wROshImzgljFMF5qtts=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=d0oUherJTyIO5quXExQg1qVUaHvOujZ9LkcLZxs21M8P11E/3Rz+Kw1K5IjOivd9DS
	UkmALHyjhqNOoOPSsbcxgBBM+o+9i2Lh1dDq+XzK5mmVWUsDAiyY+n2GRLVjF0Hx0oP/
	gk53Vq1JmZEzT7qnlCfbFmECyZIr39QvPj3Ik=
Received: by 10.101.10.13 with SMTP id n13mr7089760ani.88.1252996884033;
	Mon, 14 Sep 2009 23:41:24 -0700 (PDT)
Received: from localhost (adsl-71-146-28-171.dsl.pltn13.sbcglobal.net
	[71.146.28.171])
	by mx.google.com with ESMTPS id b32sm500681ana.0.2009.09.14.23.41.23
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 14 Sep 2009 23:41:23 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 14 Sep 2009 23:41:14 -0700
Message-Id: <1252996876-782-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.6.3.3
X-SA-Exim-Connect-IP: 209.85.132.247
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH 1/3] preferred-xorg-versions-X11R7.4.inc: Lock PREFERRED_VERSION_dri2proto ?= "1.1"
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
X-List-Received-Date: Tue, 15 Sep 2009 06:41:57 -0000

* With dri2proto 2.0 recipe being added now it gets picked up
  this recipes needs newer version of xorg-utils so we tie down
  the version of dri2proto to 1.1

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../include/preferred-xorg-versions-X11R7.4.inc    |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/conf/distro/include/preferred-xorg-versions-X11R7.4.inc b/conf/distro/include/preferred-xorg-versions-X11R7.4.inc
index 21f9758..156653f 100644
--- a/conf/distro/include/preferred-xorg-versions-X11R7.4.inc
+++ b/conf/distro/include/preferred-xorg-versions-X11R7.4.inc
@@ -203,6 +203,7 @@ PREFERRED_VERSION_bigreqsproto ?= "1.0.2"
 PREFERRED_VERSION_compositeproto ?= "0.4"
 PREFERRED_VERSION_damageproto ?= "1.1.0"
 PREFERRED_VERSION_dmxproto ?= "2.2.2"
+PREFERRED_VERSION_dri2proto ?= "1.1"
 PREFERRED_VERSION_fixesproto ?= "4.0"
 PREFERRED_VERSION_fontcacheproto ?= "0.1.2"
 PREFERRED_VERSION_fontsproto ?= "2.0.2"
-- 
1.6.3.3



