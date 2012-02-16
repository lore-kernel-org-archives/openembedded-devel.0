Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Rxqm5-000644-8A
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Feb 2012 03:08:45 +0100
Received: by mail-ee0-f47.google.com with SMTP id d41so504566eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Feb 2012 18:00:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=Ypejjoa7wv91ymOYdXViHnzPRFI4uVedJEe//3OhS+w=;
	b=Phd+eMvK0xXA3l1qcAGWZosZ2ieSf397l5NlaLPL/UZRVZyuN5ZLJ0VRznKWajye+R
	iQ9LJu9GQ8NLFhaGgKLFCmD+pQgQKJWscuCL7az5EJxiLhpRTTJfZQcE+hasGG5XM15n
	o2u9BiAZlGGW9DF4fk2zJaKoXU7phlQ2ZWXKk=
Received: by 10.14.17.35 with SMTP id i35mr327747eei.112.1329357634079;
	Wed, 15 Feb 2012 18:00:34 -0800 (PST)
Received: from localhost.localdomain (p5B0A2E3F.dip.t-dialin.net.
	[91.10.46.63])
	by mx.google.com with ESMTPS id n58sm17552669een.10.2012.02.15.18.00.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 15 Feb 2012 18:00:33 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 16 Feb 2012 03:03:10 +0100
Message-Id: <1329357796-27398-17-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1329357796-27398-1-git-send-email-schnitzeltony@googlemail.com>
References: <1329357796-27398-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe][v2] 16/22] rsyslog: remove unneeded systemd code
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
X-List-Received-Date: Thu, 16 Feb 2012 02:08:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-extended/rsyslog/rsyslog.inc |    7 +------
 1 files changed, 1 insertions(+), 6 deletions(-)

diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog.inc b/meta-oe/recipes-extended/rsyslog/rsyslog.inc
index ea7fa22..d4552cf 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog.inc
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog.inc
@@ -4,7 +4,7 @@ HOMEPAGE = "http://www.rsyslog.com/"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=51d9635e646fb75e1b74c074f788e973"
 
-INC_PR = "r2"
+INC_PR = "r3"
 
 SRC_URI = "http://www.rsyslog.com/files/download/rsyslog/${PN}-${PV}.tar.gz \
            file://rsyslog.conf"
@@ -20,9 +20,4 @@ do_install_append() {
         install ${WORKDIR}/rsyslog.conf ${D}${sysconfdir}/rsyslog.conf
 }
 
-PACKAGES =+ "${PN}-systemd"
-
 CONFFILES_${PN} = "${sysconfdir}/rsyslog.conf"
-
-FILES_${PN}-systemd += "${base_libdir}/systemd"
-RDEPENDS_${PN}-systemd += "${PN}"
-- 
1.7.4.4



