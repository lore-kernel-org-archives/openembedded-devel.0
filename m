Received: from [209.85.220.172] (helo=mail-fx0-f172.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1M6yJc-0005ca-5N
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 May 2009 04:47:28 +0200
Received: by mail-fx0-f172.google.com with SMTP id 20so805174fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 May 2009 19:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:received:from:to:cc
	:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=pI4tO6Z4ZRMpLLtC536tPy++GoambOac6TjXOuOZtW8=;
	b=Aft5Vg+nQDQxAzE/oU59wvOne+JJRpfg1tkOIr6W7/KWSFrPiCjE9hkTxQc7hIe3vy
	OPqy5UQ1JxiGF8iv/2WBuvJSQTj2pQphVmp+7baAFt0ILX+Ya5xL+1yBDjYQmdQicghq
	5Byr3acZDlmWBePP6mm+/BgEOSutXm5AyLL8s=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=xCQTMGUxYd+MgjNsHZvIVTdkuTe8AHvViIQuUuPrR2a//MmygJhBBa2CDmGyA1bJng
	Voke+Ks9GTBwFzQbDkJ+tOYo7EwGFhLDcQpXJGqVudrseJQnMTKDsQ23n4jndOT6epU6
	05P67NnZz5CZsSq5hWhCRg7AZ7sUwmnX4ddJ8=
Received: by 10.103.49.12 with SMTP id b12mr1075686muk.51.1242873595971;
	Wed, 20 May 2009 19:39:55 -0700 (PDT)
Received: from ossystems.com.br (201-40-162-47.cable.viacabocom.com.br
	[201.40.162.47])
	by mx.google.com with ESMTPS id i7sm1299063mue.48.2009.05.20.19.39.49
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 20 May 2009 19:39:52 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by ossystems.com.br (Postfix, from userid 1000)
	id 0D3026103BF; Wed, 20 May 2009 23:39:42 -0300 (BRT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 20 May 2009 23:39:33 -0300
Message-Id: <1242873578-17444-19-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.6.3.1.54.g99dd
In-Reply-To: <1242873578-17444-18-git-send-email-otavio@ossystems.com.br>
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
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 18/23] cups: undo mangle of cups_{datadir, serverbin} in cups-config
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
X-List-Received-Date: Thu, 21 May 2009 02:47:28 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 recipes/cups/cups.inc |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/recipes/cups/cups.inc b/recipes/cups/cups.inc
index 8e2a7a8..56450f7 100644
--- a/recipes/cups/cups.inc
+++ b/recipes/cups/cups.inc
@@ -62,6 +62,13 @@ python do_package_append() {
 	os.system('chmod 0511 %s/install/cups/var/run/cups/certs' % workdir)
 }
 
+do_stage_append() {
+	# Undo mangle of cups_datadir and cups_serverbin
+	sed -e 's:cups_datadir=.*:cups_datadir=${datadir}/cups:g' \
+	    -e 's:cups_serverbin=.*:cups_serverbin=${libdir}/cups:g' \
+	    -i ${STAGING_BINDIR_CROSS}/cups-config
+}
+
 PACKAGES =+ "${PN}-lib ${PN}-libimage"
 
 FILES_${PN}-lib = "${libdir}/libcups.so.*"
-- 
1.6.3.1.54.g99dd



