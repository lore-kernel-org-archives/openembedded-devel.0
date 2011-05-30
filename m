Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QR41h-0001G0-Eu
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 May 2011 17:05:05 +0200
Received: by gyf1 with SMTP id 1so1567588gyf.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 May 2011 08:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references;
	bh=JMVEJNP3XzteH7JDK8gF9ilqIh/tcOH1hUSK56O7ecc=;
	b=W5pxltyxf7hM3HyBZ0OIiTKWrjdPZgwObKSheks7y6oS7k1yXf1LMPNa6NYnVuWHoI
	c53yD50OGtMy9uyCjrYH1QirJ4+mAJlv9ZLBLWeBB+R6OWWh1mvYIbgy3wOqpPPPRfic
	WqqowDbInJxTrcevHgcQoHiuKO0s/hnbsOFn0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=MzQUs2H++s9+SbLnBGOybaC56g2vWgPq6G0hMb8oMYvPzwMeKHSdre5wQU0rYJCugM
	r8u4hdgt2QI7wVCFCXjdR9GfSFB6GezHLQtckc6NGuNR8jhl13tA8+fUtXkJEzMF1Hku
	U4MEMK/NjP+lGg50jGXwzSaI+FIIz9pp1gthE=
Received: by 10.236.143.8 with SMTP id k8mr6170876yhj.351.1306767295790;
	Mon, 30 May 2011 07:54:55 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id e48sm2530494yhk.56.2011.05.30.07.54.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 30 May 2011 07:54:54 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 30 May 2011 14:54:13 +0000
Message-Id: <1306767263-29895-8-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1306767263-29895-1-git-send-email-otavio@ossystems.com.br>
References: <1306767263-29895-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 07/17] kernel.bbclass: store EXTENDPV into STAGING_KERNEL_DIR
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
X-List-Received-Date: Mon, 30 May 2011 15:05:05 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 classes/kernel.bbclass |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/classes/kernel.bbclass b/classes/kernel.bbclass
index 8817186..943cdbc 100644
--- a/classes/kernel.bbclass
+++ b/classes/kernel.bbclass
@@ -208,6 +208,7 @@ sysroot_stage_all_append() {
 	ln -sf config-${KERNEL_VERSION} $kerneldir/.config
 	ln -sf config-${KERNEL_VERSION} $kerneldir/kernel-config
 	echo "${KERNEL_VERSION}" >$kerneldir/kernel-abiversion
+	echo "${EXTENDPV}" >$kerneldir/kernel-extendpv
 	echo "${S}" >$kerneldir/kernel-source
 	echo "${KERNEL_CCSUFFIX}" >$kerneldir/kernel-ccsuffix
 	echo "${KERNEL_LDSUFFIX}" >$kerneldir/kernel-ldsuffix
-- 
1.7.1



