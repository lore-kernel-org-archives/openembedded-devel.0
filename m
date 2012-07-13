Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Spc7D-0006Vo-KG
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Jul 2012 11:24:47 +0200
Received: by mail-ee0-f47.google.com with SMTP id t10so352488eei.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jul 2012 02:13:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=5Ov2y7mcJE8RKFaKDs880c4lDchKNq6LMdqBsVZXz4Y=;
	b=XPN9CN9qaIJ2Oy/ywd0DdZ4XJO/ZZ78/+VTEATLsBS1QWTvEoMWmnHqPiGtZx8iAbf
	RfRG9BmuEJMve7YIL73WFN/JqdZVERoDmdd14uZ32vcUozrBT3+fs34Y1ANr8CL+0lPK
	WOF4tff+siYpt5DB/VR9846W7SPfmdIEVnmbduIIcTVhEorRA0dC0gS+SSgIgRpLsnhM
	O45ovixgn/AYVb9ddAnewRnDOulPwJKcMQgyG736XiIZalxUAZpeEMokBbnVdZjqRQ53
	SHibp2jHu40jWMHO2wWtPm+jGTyvhnfxVGD0S2S8BEAFtissrFLd+C5+CWz1+p4o3w0m
	kNgw==
Received: by 10.14.98.200 with SMTP id v48mr91591eef.23.1342170815428;
	Fri, 13 Jul 2012 02:13:35 -0700 (PDT)
Received: from localhost (cl-267.ams-05.nl.sixxs.net. [2001:610:600:10a::2])
	by mx.google.com with ESMTPS id u14sm23245093eem.4.2012.07.13.02.13.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 13 Jul 2012 02:13:34 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Jul 2012 11:12:10 +0200
Message-Id: <1342170730-14982-24-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1342170730-14982-1-git-send-email-koen@dominion.thruhere.net>
References: <1342170730-14982-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQkcJ1eTqZaFCW2v1KdG9M0fwT2UYBmwZJMjOz6GIHE3xNIwxct4VAjfTEqQRgcQh2jlcaqW
Cc: Koen Kooi <koen@dominion.thruhere.net>, eric@eukrea.com
Subject: [for-denzil][meta-oe 24/24] ntp: unbreak fetching of ntp-ssl
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
X-List-Received-Date: Fri, 13 Jul 2012 09:24:48 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-oe/recipes-support/ntp/ntp_4.2.6p3.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/ntp/ntp_4.2.6p3.bb b/meta-oe/recipes-support/ntp/ntp_4.2.6p3.bb
index ece8720..a3d719e 100644
--- a/meta-oe/recipes-support/ntp/ntp_4.2.6p3.bb
+++ b/meta-oe/recipes-support/ntp/ntp_4.2.6p3.bb
@@ -7,7 +7,7 @@ inherit systemd
 SYSTEMD_PACKAGES = "${PN}-systemd"
 SYSTEMD_SERVICE_${PN}-systemd = "ntpd.service"
 
-SRC_URI = "http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/${P}.tar.gz \
+SRC_URI = "http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/ntp-${PV}.tar.gz \
         file://tickadj.c.patch \
         file://ntp-4.2.4_p6-nano.patch \
         file://ntpd \
-- 
1.7.10



