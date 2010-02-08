Received: from mail-fx0-f227.google.com ([209.85.220.227])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1NeaxE-0004ML-Fk
	for openembedded-devel@lists.openembedded.org;
	Mon, 08 Feb 2010 22:15:40 +0100
Received: by mail-fx0-f227.google.com with SMTP id 27so1137666fxm.27
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Feb 2010 13:13:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:from:to:cc:subject
	:date:message-id:x-mailer:in-reply-to:references;
	bh=eVmAsjwTKG08Ykglnb7KgBImB20hqX9Z2+dX6nv1Npg=;
	b=cC2o5AYsGwDlF2G5D15NQGdIaS2bfyd7yHu3VhMPEouE5YCMmQdswyysvc8Q9hviUm
	to8aKvTz83AIopUO29zI9qGkU20lC/ZnWQ0UWoWKij+cbUZNw8XFnuF8NU7bnkPXb8Hz
	A7r6XdLWBeAU8oDM1eog638W0HqBqO1aC67MA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=rAN/Orp2sahUhZ/mptsQBsb0ea+yyfpe6HytNQgCOIO3d74zLN21wnwgtiYyxtw5WN
	vzPkZSbep5hfScyMYK90x8tktm0V+11qjMYA93pPtHdB4mx2Tq8eQ1/jQgDTsYKjSrHO
	3boNfjYZRxiZNhWe5OMDleqMS966FmxlqDlRo=
Received: by 10.223.101.143 with SMTP id c15mr6372604fao.91.1265663580860;
	Mon, 08 Feb 2010 13:13:00 -0800 (PST)
Received: from s42.loc ([84.119.103.202])
	by mx.google.com with ESMTPS id 26sm7006434fks.7.2010.02.08.13.12.56
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 08 Feb 2010 13:12:57 -0800 (PST)
Received: from cow by s42.loc with local (Exim 4.71)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1NeawH-0004GH-Fl; Mon, 08 Feb 2010 22:14:37 +0100
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  8 Feb 2010 22:14:28 +0100
Message-Id: <1265663673-16312-8-git-send-email-rep.dot.nop@gmail.com>
X-Mailer: git-send-email 1.6.5
In-Reply-To: <1265663673-16312-7-git-send-email-rep.dot.nop@gmail.com>
References: <1265663673-16312-1-git-send-email-rep.dot.nop@gmail.com>
	<1265663673-16312-2-git-send-email-rep.dot.nop@gmail.com>
	<1265663673-16312-3-git-send-email-rep.dot.nop@gmail.com>
	<1265663673-16312-4-git-send-email-rep.dot.nop@gmail.com>
	<1265663673-16312-5-git-send-email-rep.dot.nop@gmail.com>
	<1265663673-16312-6-git-send-email-rep.dot.nop@gmail.com>
	<1265663673-16312-7-git-send-email-rep.dot.nop@gmail.com>
X-SA-Exim-Connect-IP: 209.85.220.227
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH 07/12] Document proxy setup in local.conf.sample
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
X-List-Received-Date: Mon, 08 Feb 2010 21:15:40 -0000

Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
---
 conf/local.conf.sample |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/conf/local.conf.sample b/conf/local.conf.sample
index 643ae0b..e7c4559 100644
--- a/conf/local.conf.sample
+++ b/conf/local.conf.sample
@@ -30,6 +30,9 @@ BBFILES := "${@bb.fatal('Edit your conf/local.conf: BBFILES')}"
 # This is a regulary expression, so be sure to get your parenthesis balanced.
 BBMASK = ""
 
+# Proxy settings:
+# BB_ENV_EXTRAWHITE="http_proxy ftp_proxy no_proxy"
+
 # Uncomment this if you want to use a prebuilt toolchain. You will need to
 # provide packages for toolchain and additional libraries yourself. You also
 # have to set PATH in your environment to make sure BitBake finds additional binaries.
-- 
1.6.5



