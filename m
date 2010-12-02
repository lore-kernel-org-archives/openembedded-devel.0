Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1PNx29-0007ET-7R
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Dec 2010 01:28:26 +0100
Received: by pxi17 with SMTP id 17so1216595pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Dec 2010 16:27:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=9hNKK8Q1SiDKvyggGCKggpMPM4QJaOjbcQWTHoZgsDQ=;
	b=lv6aM6XL25WWJK8UntMnkplrk8uZJ1xglcPD+vVXezK7mT/Ka/Jr/LIax9JdfAauGJ
	VGVtaQtGzxHGCpFU0z83S6vRTij7Kz84sPODj5u3IwK7/NolH+3hrshxWtfGM3yfuGEj
	ZIs/rMLkOKrHXITv7Qg6Ig4uGLYClsNBWuHXc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=K6nZxStzzN6Tsg2JOifN640CufxWn8DizCcijT4ieMBDyMFdNDk3Di39OZixAMApDJ
	nPQ3UkJcjyncUzw678K516UvLLkSypcQYT5CPxt6C21xMervhw1AAOIhAPky8K/Axqh5
	NXnt9tuK5LPv23J0sYWVN8O3fSJlMx0MDKI4Y=
Received: by 10.142.13.5 with SMTP id 5mr9724763wfm.17.1291249620795;
	Wed, 01 Dec 2010 16:27:00 -0800 (PST)
Received: from [10.0.0.5] (eth7090.sa.adsl.internode.on.net [150.101.58.177])
	by mx.google.com with ESMTPS id x35sm671265wfd.13.2010.12.01.16.26.58
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 01 Dec 2010 16:26:59 -0800 (PST)
Message-ID: <4CF6E7CE.8090801@gmail.com>
Date: Thu, 02 Dec 2010 10:56:54 +1030
From: Graham Gower <graham.gower@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.15) Gecko/20101113 Thunderbird/3.0.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.212.175
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] bind_9.3.6.bb: Don't remove nslookup, it exists in FILES_${PN}-utils.
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
X-List-Received-Date: Thu, 02 Dec 2010 00:28:27 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Also fixes the following with uclibc:
rm: cannot remove `/mnt/oe/tmp/work/mipsel-oe-linux-uclibc/bind-9.3.6-r1/image/usr/bin/nslookup': No such file or directory

Signed-off-by: Graham Gower <graham.gower@gmail.com>
---
 recipes/bind/bind_9.3.6.bb |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/recipes/bind/bind_9.3.6.bb b/recipes/bind/bind_9.3.6.bb
index 1412a68..c63331f 100644
--- a/recipes/bind/bind_9.3.6.bb
+++ b/recipes/bind/bind_9.3.6.bb
@@ -24,7 +24,6 @@ FILES_${PN}-utils = "${bindir}/host ${bindir}/dig ${bindir}/nslookup"
 FILES_${PN}-dev += "${bindir}/isc-config.h"
 
 do_install_append() {
-	rm "${D}/usr/bin/nslookup"
 	install -d "${D}/etc/bind"
 	install -d "${D}/etc/init.d"
 	install -m 644 ${S}/conf/* "${D}/etc/bind"
-- 
1.7.1



