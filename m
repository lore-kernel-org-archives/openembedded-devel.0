Received: from [209.85.128.184] (helo=fk-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1M6yJZ-0005cd-SF
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 May 2009 04:47:25 +0200
Received: by fk-out-0910.google.com with SMTP id z22so354587fkz.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 May 2009 19:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:received:from:to:cc
	:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=JdCmYlIq9m6WIMTShyNOoNXyYqsWCjnYqRMFJUfJISM=;
	b=fr9N3PqLmK3/LcIQWo2CI0MAKSc6lwsyeeCygKAh9MhzrBtMu7ta57moufmcZLn5N/
	gNZcrFk+rmoSy0CRV85ShrvtqNZ6pyWobcCwiGsb7AcxYgHRNUPubgxELDcKdwFj/cji
	qan38A2rShek4MnPsW+HKFNIRRZwd/Sl86HYI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=CWwcIHdaHsBYEgbIWXPJByX5qcrXcFV6wEfzbIusiou5jcD9cGKUWh2jo808ogZBnb
	sxF0wr5Ai8Nc0AGgN0udEQ2Kxd1qh2r/Le41gpPWQmFpaY8bCdRU9xVssnyny+u5jtWh
	clCtUL32wqX4YlhiLXEyGhhl2gVko8uabv7jc=
Received: by 10.103.226.10 with SMTP id d10mr1069465mur.105.1242873594646;
	Wed, 20 May 2009 19:39:54 -0700 (PDT)
Received: from ossystems.com.br (201-40-162-47.cable.viacabocom.com.br
	[201.40.162.47])
	by mx.google.com with ESMTPS id e10sm5481524muf.44.2009.05.20.19.39.49
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 20 May 2009 19:39:50 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by ossystems.com.br (Postfix, from userid 1000)
	id 0C3236103C2; Wed, 20 May 2009 23:39:42 -0300 (BRT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 20 May 2009 23:39:34 -0300
Message-Id: <1242873578-17444-20-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.6.3.1.54.g99dd
In-Reply-To: <1242873578-17444-19-git-send-email-otavio@ossystems.com.br>
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
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 19/23] libgnomeprintui: drop gnome-common dependency since it is added by gnome class
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
X-List-Received-Date: Thu, 21 May 2009 02:47:26 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 recipes/gnome/libgnomeprintui_2.18.3.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/recipes/gnome/libgnomeprintui_2.18.3.bb b/recipes/gnome/libgnomeprintui_2.18.3.bb
index 7c6d289..021b9ad 100644
--- a/recipes/gnome/libgnomeprintui_2.18.3.bb
+++ b/recipes/gnome/libgnomeprintui_2.18.3.bb
@@ -1,6 +1,7 @@
 LICENSE = "GPL"
 SECTION = "x11/gnome/libs"
-DEPENDS = "libgnomeprint gtk+ libgnomecanvas gnome-icon-theme gnome-common"
+DEPENDS = "libgnomeprint gtk+ libgnomecanvas gnome-icon-theme"
+PR = "r1"
 
 inherit gnome pkgconfig
 
-- 
1.6.3.1.54.g99dd



