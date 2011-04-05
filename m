Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chasemaupin03@gmail.com>) id 1Q78QM-0001E0-2M
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Apr 2011 17:44:10 +0200
Received: by gxk3 with SMTP id 3so188819gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Apr 2011 08:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=D7isJ2IC6GBe/GsEmZ1YTI0y7P4BOrIgVR/RsGh2O7Y=;
	b=EI5KOZlY6GklvwnVVbUZ9DLkUXtTjP6crVAIfbaO1bDnqthCbugoI/bDzZc61J72D7
	0LdTNo4NhGWOviNsB8gVCNI1si8F/2wClderzWzm1VG7lVBUNSFJErXRNbymq+i5wMq3
	OBf7bDJ+MhWnSDtFzoo3aNdyPrR+7QURvDufM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=DpUAP6bB56ljhKJHTNjsogI83IHHsQoiBzyyO+4DnjWByklsi7v3/J/xlGCwTq4hXm
	CJDmjXhQwym1tsBJQ0J5XIuWbqx8lK6YePaH2NwZSCD3rjJZnse1S/sl683BRZBuufe2
	ask0PPz209xodYjOZGGOYUsI8y8n+vld+mG5Y=
Received: by 10.150.47.34 with SMTP id u34mr643923ybu.362.1302018123649;
	Tue, 05 Apr 2011 08:42:03 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id r18sm2737519yba.11.2011.04.05.08.42.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 05 Apr 2011 08:42:03 -0700 (PDT)
From: Chase Maupin <chasemaupin03@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  5 Apr 2011 10:41:51 -0500
Message-Id: <1302018111-20799-5-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1302018111-20799-1-git-send-email-Chase.Maupin@ti.com>
References: <1302018111-20799-1-git-send-email-Chase.Maupin@ti.com>
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: [PATCH 5/5] am45x-evm: Add am45x-evm machine configuration
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
X-List-Received-Date: Tue, 05 Apr 2011 15:44:10 -0000

* Added a new machine configuration for the am45x-evm device.
* This machine currently mimics the omap4430-panda configuration
  during the prototyping phase but is expected to change as the
  hardware and software evolves.
* The am45x-evm machine type is used to allow differentiating
  software components to be build and packaged (i.e. task lists)
  as well as to account for differences with the omap4430-panda
  device in the future.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 conf/machine/am45x-evm.conf |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)
 create mode 100644 conf/machine/am45x-evm.conf

diff --git a/conf/machine/am45x-evm.conf b/conf/machine/am45x-evm.conf
new file mode 100644
index 0000000..3597d37
--- /dev/null
+++ b/conf/machine/am45x-evm.conf
@@ -0,0 +1,10 @@
+#@TYPE: Machine
+#@NAME: AM45X EVM
+#@DESCRIPTION: Machine configuration for the AM45x EVM
+
+# Currently the am45x-evm machine type mimics the panda
+# machine for its configuration.  This is expected to change
+# as the hardware and software evolves.  Currently the unique
+# machine type is used to differentiate software stack being
+# built for the two devices.
+require conf/machine/omap4430-panda.conf
-- 
1.7.0.4



