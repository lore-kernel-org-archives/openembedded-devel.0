Received: from mail-pw0-f53.google.com ([209.85.160.53])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <camelguo@gmail.com>) id 1NNmsx-0001Se-7y
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Dec 2009 13:33:46 +0100
Received: by pwi18 with SMTP id 18so4913846pwi.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Dec 2009 04:31:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=nQOogrz7OxvptyREne/O7iaagip+GZZbJymR1hOOx3s=;
	b=CjaUe33ewF9sQrmd9qNpcRFPrdxRdXiY3YnWdE8XPaSGW1r3V6E4hAKrpYJoWqF6Dh
	hTs7Dgc0JghTaunCviszWb4u4FsFKfRtuB+dOiIwIL4hpS4LHrSRSs+ShoTVhfDQxaCQ
	1NZa5vFhBgH0oo8y5Kye2r5diEFaZDdSzXNCY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=u3u5H/M6cCcxIUzzgB839HR4/Mp6axZEUWTy167kCaoTbX8QOIceDYj0MLo04n3wY4
	nXpYJqRFvvSKSQIoVXBa1sfVUbxMNoBHf5d24DXoTG5FZTspK9wwRG+Indq7SVSUfvdJ
	Y4I1XHB7csWJj/iDaJC2xyQWzHok96eaJ5gc0=
Received: by 10.115.87.7 with SMTP id p7mr7716563wal.161.1261657908094;
	Thu, 24 Dec 2009 04:31:48 -0800 (PST)
Received: from localhost ([123.162.69.101])
	by mx.google.com with ESMTPS id 21sm7764572pzk.3.2009.12.24.04.31.45
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 24 Dec 2009 04:31:47 -0800 (PST)
From: Guo Hongruan <camelguo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 24 Dec 2009 20:31:38 +0800
Message-Id: <1261657898-18357-1-git-send-email-camelguo@gmail.com>
X-Mailer: git-send-email 1.5.4.3
In-Reply-To: <>
References: <>
X-SA-Exim-Connect-IP: 209.85.160.53
X-SA-Exim-Mail-From: camelguo@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] Update preferred version util-macros from 1.1.6 to 1.4.1
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
X-List-Received-Date: Thu, 24 Dec 2009 12:33:46 -0000

xcmiscproto and xf86bigfontproto requires util-macros 1.2 or later, this patch fix the dependence failure.
---
 .../include/preferred-xorg-versions-X11R7.4.inc    |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/conf/distro/include/preferred-xorg-versions-X11R7.4.inc b/conf/distro/include/preferred-xorg-versions-X11R7.4.inc
index 156653f..eb0820e 100644
--- a/conf/distro/include/preferred-xorg-versions-X11R7.4.inc
+++ b/conf/distro/include/preferred-xorg-versions-X11R7.4.inc
@@ -233,8 +233,8 @@ PREFERRED_VERSION_xproto ?= "7.0.13"
 PREFERRED_VERSION_gccmakedep ?= "1.0.2"
 PREFERRED_VERSION_imake ?= "1.0.2"
 PREFERRED_VERSION_makedepend ?= "1.0.1"
-PREFERRED_VERSION_util-macros-native ?= "1.1.6"
-PREFERRED_VERSION_util-macros ?= "1.1.6"
+PREFERRED_VERSION_util-macros-native ?= "1.4.1"
+PREFERRED_VERSION_util-macros ?= "1.4.1"
 PREFERRED_VERSION_xorg-cf-files ?= "1.0.2"
 
 # xserver
-- 
1.5.4.3



