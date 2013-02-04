Received: from mail-wi0-f174.google.com ([209.85.212.174])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1U2VAB-0003t6-9N
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Feb 2013 00:09:23 +0100
Received: by mail-wi0-f174.google.com with SMTP id hi8so3049332wib.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Feb 2013 14:53:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=gDs5WFYEPZDCfa+ntRVxrfd5g43NGSadpf6Fx7/k50s=;
	b=r710h7OzpYByDzDkIRYpNR29Luz0+pAfg1c9nL/TbysobGWXQbpzRP/XsXPFbKpjbm
	R1KRcd9WiRqtKWBdQedW6ueKod3XhS+0W9NjakLjKAq8RF6+IWdBEZSVGxy+TT0g8oRS
	BU4vgtUy5aHIU/qdYhyQ+xNQY4UoEoNncjtgsyfjZH5fV/37pV7H0FUl8norXDAlyF/b
	erseHeVsaFq0ItnHCCWqjOoSvNdKl1X0f3sS0KnFZV9uP2b9rIMUqFmmJNKtSVUi1+90
	7p8OaUo29lEjUtSnQl12lq2rYOg9dbewDqNJBILsDJfkcB48CZRYRn+zBbBTBSG09mza
	F8OQ==
X-Received: by 10.180.77.35 with SMTP id p3mr13284491wiw.18.1360018414822;
	Mon, 04 Feb 2013 14:53:34 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id ex1sm2845414wib.7.2013.02.04.14.53.33
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 04 Feb 2013 14:53:34 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  4 Feb 2013 23:53:28 +0100
Message-Id: <1360018408-29809-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <1360018408-29809-1-git-send-email-Martin.Jansa@gmail.com>
References: <1360018408-29809-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH][meta-gnome][meta-efl 2/2] enjoy: improve RDEPENDS to set it only on PN
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
X-List-Received-Date: Mon, 04 Feb 2013 23:09:23 -0000

---
 meta-efl/recipes-efl/e17/enjoy_svn.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-efl/recipes-efl/e17/enjoy_svn.bb b/meta-efl/recipes-efl/e17/enjoy_svn.bb
index 8dff593..5137c4e 100644
--- a/meta-efl/recipes-efl/e17/enjoy_svn.bb
+++ b/meta-efl/recipes-efl/e17/enjoy_svn.bb
@@ -12,7 +12,7 @@ DEPENDS += "gst-plugins-good ${@base_conditional('ENTERPRISE_DISTRO', '1', '', '
 #3d needed for ogg playback
 #4th needed for flac playback
 #5th needed binary to create db
-RDEPENDS += "\
+RDEPENDS_${PN} += "\
        gst-plugins-base-typefindfunctions gst-plugins-base-playbin gst-plugins-base-volume gst-plugins-base-decodebin2 gst-plugins-good-autodetect \
        ${@base_conditional('ENTERPRISE_DISTRO', '1', '', 'gst-plugins-ugly-mad gst-plugins-good-id3demux', d)} \
        gst-plugins-base-ogg gst-plugins-base-ivorbisdec \
-- 
1.8.1.2



