Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Rxqlx-00063p-Br
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Feb 2012 03:08:37 +0100
Received: by mail-ey0-f175.google.com with SMTP id l10so479837eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Feb 2012 18:00:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=LnAf9VWiVAcc715IgiUJLywf+k82r3nu2bWe8JaXYhc=;
	b=vbVlG+TgTjEq/G6/m/fb5g1M0MpgWxhYYFuPHYXYbnEO5gyym8nsIhSCa+3f6tXzKH
	+3cD6SPbqzWiK3YUGacW8UiQOsZAbtjcYsCHFgQevTaRwNXCO126v0274Q9TevpH39wW
	M3etNDIvbuyXZYFtjv6f2q0Pq6t0HXu86JZLk=
Received: by 10.14.206.133 with SMTP id l5mr349887eeo.22.1329357627234;
	Wed, 15 Feb 2012 18:00:27 -0800 (PST)
Received: from localhost.localdomain (p5B0A2E3F.dip.t-dialin.net.
	[91.10.46.63])
	by mx.google.com with ESMTPS id n58sm17552669een.10.2012.02.15.18.00.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 15 Feb 2012 18:00:26 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 16 Feb 2012 03:03:02 +0100
Message-Id: <1329357796-27398-9-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1329357796-27398-1-git-send-email-schnitzeltony@googlemail.com>
References: <1329357796-27398-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe][v2] 08/22] connman: remove unneeded systemd code
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
X-List-Received-Date: Thu, 16 Feb 2012 02:08:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../connman/connman_0.78.bbappend                  |    7 +------
 1 files changed, 1 insertions(+), 6 deletions(-)

diff --git a/meta-oe/recipes-connectivity/connman/connman_0.78.bbappend b/meta-oe/recipes-connectivity/connman/connman_0.78.bbappend
index d6f756c..eacd7d9 100644
--- a/meta-oe/recipes-connectivity/connman/connman_0.78.bbappend
+++ b/meta-oe/recipes-connectivity/connman/connman_0.78.bbappend
@@ -2,12 +2,7 @@ inherit systemd
 
 EXTRA_OECONF += "--with-systemdunitdir=${base_libdir}/systemd/system/"
 
-PRINC := "${@int(PRINC) + 1}"
+PRINC := "${@int(PRINC) + 2}"
 
 SYSTEMD_PACKAGES = "${PN}-systemd"
 SYSTEMD_SERVICE_${PN}-systemd = "connman.service"
-
-# systemd files
-PACKAGES =+ "${PN}-systemd"
-FILES_${PN}-systemd += "${base_libdir}/systemd"
-RDEPENDS_${PN}-systemd += "${PN}"
-- 
1.7.4.4



