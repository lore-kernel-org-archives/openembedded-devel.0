Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P3bF6-00026Z-5q
	for openembedded-devel@lists.openembedded.org;
	Wed, 06 Oct 2010 23:09:40 +0200
Received: by ewy7 with SMTP id 7so4213ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Oct 2010 14:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=NjqWmmBMMLpd9x4WygfEBF7P13xBT+ne3oDdnlgLYKs=;
	b=PqipCORihyTv77Ath2RDe0RW9QvHVjp9yeHhFP8VRY1BbIuOOzvaYLkgYl1W8HthP6
	J63dnGwI785ICTo3b5mKXoSwLlYElBJ9WyuocfnBrX4Gftv2NB7zI9SImAjPl5xj8/nE
	n2ubN+TVmmM41Y8Q0PguDxRC/+GTvLGojxiz0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=lely/zBmXO9AUzBzQx8NANpzdkllV8kRt5tTnU1SANseYcW4yKXlB8MAXrZ0ek5shZ
	So2/QLoKg33mKzXG5xYKTb25BkEQOFoP+fpm42/AUlGPjgW5p6swugUlM46ALiCkWUYs
	FCU72uhBQPoXcmIVsoxcWk1YtkRIPIddBZzek=
Received: by 10.213.15.143 with SMTP id k15mr8894249eba.94.1286399362027;
	Wed, 06 Oct 2010 14:09:22 -0700 (PDT)
Received: from localhost.localdomain (j200125.upc-j.chello.nl [24.132.200.125])
	by mx.google.com with ESMTPS id a48sm2171654eei.1.2010.10.06.14.09.20
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 06 Oct 2010 14:09:21 -0700 (PDT)
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  6 Oct 2010 23:09:00 +0200
Message-Id: <1286399340-15927-5-git-send-email-fransmeulenbroeks@gmail.com>
X-Mailer: git-send-email 1.6.4.2
In-Reply-To: <1286399340-15927-4-git-send-email-fransmeulenbroeks@gmail.com>
References: <1286399340-15927-1-git-send-email-fransmeulenbroeks@gmail.com>
	<1286399340-15927-2-git-send-email-fransmeulenbroeks@gmail.com>
	<1286399340-15927-3-git-send-email-fransmeulenbroeks@gmail.com>
	<1286399340-15927-4-git-send-email-fransmeulenbroeks@gmail.com>
X-SA-Exim-Connect-IP: 209.85.215.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS,
	SUBJ_ALL_CAPS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 4/4] RDEPENDS -> RDEPENDS_${PN}
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
X-List-Received-Date: Wed, 06 Oct 2010 21:09:41 -0000

Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
---
 classes/rubyextension.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/classes/rubyextension.bbclass b/classes/rubyextension.bbclass
index 628ebdb..de8eb9c 100644
--- a/classes/rubyextension.bbclass
+++ b/classes/rubyextension.bbclass
@@ -1,5 +1,5 @@
 DEPENDS  += "ruby-native"
-RDEPENDS += "ruby"
+RDEPENDS_${PN} += "ruby"
 
 rubyextension_do_configure() {
 	${STAGING_BINDIR_NATIVE}/ruby setup.rb config || \
-- 
1.6.4.2



