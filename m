Received: from mail-fx0-f212.google.com ([209.85.220.212])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael.lippautz@gmail.com>) id 1NYGPQ-0000Lq-97
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Jan 2010 11:06:35 +0100
Received: by fxm4 with SMTP id 4so992882fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jan 2010 02:04:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=o/nURN4svFzpO3tBvmAudkYT8Z3EjaC+TcvHSbIwido=;
	b=p8hpLJcd3Yce0q3tk8oK8OmKxeHIaguTWR4v84koIzJPqAtmNC1ExfHStJmJz7Ds0d
	aJnxXaZPV+e4h1MjHJDioJ6HcsZ4jRQsvqveo3YdBl6z7NrM2+p6CVx752fvCzCjGErT
	NXQQYYCW+dgpnC9LXET8TIw/EhupuPpo52EfY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=NWV3me4SsE/TYd5Si8KfdjqgMfXlqJalgu/KUkkmV2IZtAXa+f+BiPEFwoBwOHCcO2
	bp2TsLo2mE3oT6qSU/wToererUyrtxaosExiSKEkuRRU3dcBK9xbZC9Fs/zlJHKyP2yD
	xVn+w4C4MDb1TsmEP+PknHRFA+Wc2EX4lR/m0=
Received: by 10.223.19.200 with SMTP id c8mr2696030fab.55.1264154653862;
	Fri, 22 Jan 2010 02:04:13 -0800 (PST)
Received: from localhost.localdomain (mk090152164068.a1.net [90.152.164.68])
	by mx.google.com with ESMTPS id 22sm2620995fkq.54.2010.01.22.02.04.11
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 22 Jan 2010 02:04:13 -0800 (PST)
From: Michael Lippautz <michael.lippautz@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 22 Jan 2010 11:04:31 +0100
Message-Id: <1264154671-29704-1-git-send-email-michael.lippautz@gmail.com>
X-Mailer: git-send-email 1.6.4.4
In-Reply-To: <n>
References: <n>
X-SA-Exim-Connect-IP: 209.85.220.212
X-SA-Exim-Mail-From: michael.lippautz@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH 2/2] libxml2: Add catalog and docbook support
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
X-List-Received-Date: Fri, 22 Jan 2010 10:06:35 -0000

* Adds catalog and docbook support, which is needed for
  libxml-libxml-perl recipe.
---
 recipes/libxml/libxml2.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/libxml/libxml2.inc b/recipes/libxml/libxml2.inc
index bc31123..44e6f82 100644
--- a/recipes/libxml/libxml2.inc
+++ b/recipes/libxml/libxml2.inc
@@ -9,7 +9,7 @@ PR = "r1"
 
 inherit autotools pkgconfig binconfig
 
-EXTRA_OECONF = "--without-python --without-debug --without-legacy --without-catalog --without-docbook --with-c14n"
+EXTRA_OECONF = "--without-python --without-debug --without-legacy --with-catalog --with-docbook --with-c14n"
 
 export LDFLAGS += "-ldl"
 
-- 
1.6.4.4



