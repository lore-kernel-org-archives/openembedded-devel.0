Received: from [209.85.220.172] (helo=mail-fx0-f172.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1M6yJb-0005cc-0Z
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 May 2009 04:47:27 +0200
Received: by mail-fx0-f172.google.com with SMTP id 20so805180fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 May 2009 19:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:received:from:to:cc
	:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=1I6sJXpr8mNaPt5zfjw9SBff/ouH6IvQa5Pvo/nRiuU=;
	b=mLj5Fqic0HSyKR9MX7qU6Hxo9PdTJxIxNZDZ2dn8A0vPpIFrjquZ6PmvigQvC09Avs
	mreO2WqD8Sx8K9jSYOOSnit7tGdBfwHw2SWgU36NlqaOBlw/yrh1Xe6M2DozTqTuBEuh
	fXQXE3PJlXgpcAeHsG6AvRmPX4A3wIm4JOd8s=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=vebQVysgoH+3gTYp+Oma8vAD4C9l5TSNbCMkrhqfl9AaORF+qmUP9lm5uxUNrW4fEt
	p8c1Mwo1viHESduWqCIhCapZzPr7jmfvI4RxkkfMmmFI1mRXhLp7X3CrZ1IpJlS59/w9
	tiJKrZzlMWYwq2CV0/ZY1SiG4HfrkJzRGG/0w=
Received: by 10.103.240.5 with SMTP id s5mr1073022mur.66.1242873595508;
	Wed, 20 May 2009 19:39:55 -0700 (PDT)
Received: from ossystems.com.br (201-40-162-47.cable.viacabocom.com.br
	[201.40.162.47])
	by mx.google.com with ESMTPS id j2sm3431380mue.42.2009.05.20.19.39.49
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 20 May 2009 19:39:51 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by ossystems.com.br (Postfix, from userid 1000)
	id 0B0526103BE; Wed, 20 May 2009 23:39:42 -0300 (BRT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 20 May 2009 23:39:35 -0300
Message-Id: <1242873578-17444-21-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.6.3.1.54.g99dd
In-Reply-To: <1242873578-17444-20-git-send-email-otavio@ossystems.com.br>
References: <1242873578-17444-1-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-2-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-3-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-4-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-5-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-6-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-7-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-8-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-9-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-10-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-11-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-12-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-13-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-14-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-15-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-16-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-17-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-18-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-19-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-20-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 20/23] ppp: add peers dir
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
X-List-Received-Date: Thu, 21 May 2009 02:47:27 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 recipes/ppp/ppp_2.4.3.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/recipes/ppp/ppp_2.4.3.bb b/recipes/ppp/ppp_2.4.3.bb
index 295a3fb..3b1f8ad 100644
--- a/recipes/ppp/ppp_2.4.3.bb
+++ b/recipes/ppp/ppp_2.4.3.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Point-to-Point Protocol (PPP) daemon"
 HOMEPAGE = "http://samba.org/ppp/"
 DEPENDS = "libpcap"
 LICENSE = "BSD GPLv2"
-PR = "r5"
+PR = "r6"
 
 SRC_URI = "http://ppp.samba.org/ftp/ppp/ppp-${PV}.tar.gz \
         file://ppp-2.4.3-mppe-mppc-1.1.patch;patch=1 \
@@ -39,6 +39,7 @@ do_install_append () {
 	mkdir -p ${D}${bindir}/ ${D}${sysconfdir}/init.d
 	mkdir -p ${D}${sysconfdir}/ppp/ip-up.d/
 	mkdir -p ${D}${sysconfdir}/ppp/ip-down.d/
+	mkdir -p ${D}${sysconfdir}/ppp/peers/
  	install -m 0755 ${WORKDIR}/pon ${D}${bindir}/pon
 	install -m 0755 ${WORKDIR}/poff ${D}${bindir}/poff
 	install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/ppp
-- 
1.6.3.1.54.g99dd



