Received: from [209.85.220.172] (helo=mail-fx0-f172.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1M6yJU-0005cc-Aq
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 May 2009 04:47:20 +0200
Received: by mail-fx0-f172.google.com with SMTP id 20so805180fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 May 2009 19:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:received:from:to:cc
	:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=+gsyg4Y0QPDWezDge4vjge1hTgrAzEj9DBrNp129LDE=;
	b=FwzL/zy71A30upuQM7JckFEcnKl1jSRSrOuZvTcizjefkK64C6MbGeloAAI+kr2gir
	mkgR4Ynx55Pz25ff/tjpmw9xWWygU7+iamBhtCmLovkiUl9Czi4Cy1D3HE0JyId6MSl+
	pB6+AyEQEuOki/qLjrtx9xwTsrPJSVbabBN2o=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=P/2hzOU56rr9tpwmXxsXaWA4pMUaUC2DVQpLUXV+3CiLy+g6EPbTUmzfXy5f6ub2uN
	O+DizlU3BKdEA5tmzjY2BVbVKnUxwUtEY4UXNR1qOVCaqOe80jyJenErRp1qie5+H5j0
	KgBgl3lXfN/JWuho/bLq5e2vQ9G3LoHLVVrnI=
Received: by 10.103.244.10 with SMTP id w10mr1079853mur.71.1242873589075;
	Wed, 20 May 2009 19:39:49 -0700 (PDT)
Received: from ossystems.com.br (201-40-162-47.cable.viacabocom.com.br
	[201.40.162.47])
	by mx.google.com with ESMTPS id b9sm5625461mug.9.2009.05.20.19.39.45
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 20 May 2009 19:39:46 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by ossystems.com.br (Postfix, from userid 1000)
	id E4F646103BB; Wed, 20 May 2009 23:39:42 -0300 (BRT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 20 May 2009 23:39:30 -0300
Message-Id: <1242873578-17444-16-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.6.3.1.54.g99dd
In-Reply-To: <1242873578-17444-15-git-send-email-otavio@ossystems.com.br>
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
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 15/23] Documentation for PACKAGE_ARCH is actually for PACKAGE_ARCHS
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
X-List-Received-Date: Thu, 21 May 2009 02:47:20 -0000

From: Mario Domenech Goulart <mario@ossystems.com.br>

Signed-off-by: Mario Domenech Goulart <mario@ossystems.com.br>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 docs/usermanual/reference/class_rootfs_ipkg.xml |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/docs/usermanual/reference/class_rootfs_ipkg.xml b/docs/usermanual/reference/class_rootfs_ipkg.xml
index 98e6e25..fde8a38 100644
--- a/docs/usermanual/reference/class_rootfs_ipkg.xml
+++ b/docs/usermanual/reference/class_rootfs_ipkg.xml
@@ -114,7 +114,7 @@
     </varlistentry>
 
     <varlistentry>
-      <term>PACKAGE_ARCH</term>
+      <term>PACKAGE_ARCHS</term>
 
       <listitem>
         <para>Defines the list of architectures that are support by the target
-- 
1.6.3.1.54.g99dd



