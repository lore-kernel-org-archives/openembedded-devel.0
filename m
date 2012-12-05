Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TgN7H-0000Ec-0V
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Dec 2012 23:06:55 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so2191970eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Dec 2012 13:52:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=w/N0VGqaqvfk/429/dZS2qyCSfXm2m/gH2gglLxTEm4=;
	b=U3efP8J+7an6DBQFd3qgpX7MNaIeGS522XPrF5wZnPaj3CvUid6HgcGcL4ctyDi5ct
	D14Ln8iwcbuoTcjnp4jY8eiv0N12WROXMKzfimOaG9xeFpXY/65+29l1peRXmryVoEf3
	0g8AjPYJTM/EgXk9iF4hewgbKr86IsVXAasYpA6+LtHf/bE3PRg0VkI0imoLZuuCam9d
	AMvWcE6VwMTg6uXXUxfgfwnWwnMOf+Jp7ESvcor4GnOBhJhQcWxCe9DLE8AFy0AZFWZS
	Brd16kipBxCqojF0fj3PEDdc4V7RTO4uI8D/LwUOobTGz8i28eUJKMdlXgVoGef0D876
	mkKQ==
Received: by 10.14.3.195 with SMTP id 43mr64999117eeh.36.1354744352904;
	Wed, 05 Dec 2012 13:52:32 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 46sm11781120eeg.4.2012.12.05.13.52.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 05 Dec 2012 13:52:32 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  5 Dec 2012 22:52:01 +0100
Message-Id: <bf23f6c33ed71c3e9ad02bc4251309ce1d169990.1354743849.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <1c92baa825d740b9c4e053de8b275e3f653395b3.1354743849.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
	<1c92baa825d740b9c4e053de8b275e3f653395b3.1354743849.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1354743849.git.Martin.Jansa@gmail.com>
References: <cover.1354743849.git.Martin.Jansa@gmail.com>
Subject: [PATCH 78/85] cheese: disable help build
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
X-List-Received-Date: Wed, 05 Dec 2012 22:06:55 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-apps/cheese/cheese_2.30.1.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-gnome/recipes-apps/cheese/cheese_2.30.1.bb b/meta-gnome/recipes-apps/cheese/cheese_2.30.1.bb
index f447817..1e8a98b 100644
--- a/meta-gnome/recipes-apps/cheese/cheese_2.30.1.bb
+++ b/meta-gnome/recipes-apps/cheese/cheese_2.30.1.bb
@@ -15,3 +15,7 @@ FILES_${PN} += "${datadir}/dbus-1"
 RRECOMMENDS_${PN} = "gst-plugins-good-meta gst-plugins-base-meta"
 
 EXTRA_OECONF += "--disable-scrollkeeper"
+
+do_configure_prepend() {
+	sed -i -e "s: help : :g" ${S}/Makefile.am
+}
-- 
1.8.0



