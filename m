Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1Ogtzn-0003XI-RZ
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 Aug 2010 08:32:05 +0200
Received: by pxi16 with SMTP id 16so216067pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Aug 2010 23:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=VeGSPfK1IAx3W2j/lS7vgiNxQLIkf/JDcjkTTz2296A=;
	b=w1sBZd6o6VaOXjoBt03l4LDoinfYxb5qCM9KfWUEOIc9LH5XY3idnG9D/03fe22TI1
	meLtmwxx7QxbR68J8VHV7XZlyOWuNWA5qf7/R6dL77dsU3T9iv+vIOQ5OZuTZDQeh1bO
	uIc60xf6HvhVRcpyzCzlHwqd+TgjpzuQLKC4c=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=vY4XhrzyAMuPcS12qmbVc55YyaIfq0viBAZnZuGxiaqHlTiAHHSeNgEA4vPu77VfNA
	wH32sABUnapQ6pEcNp8JwW5qxbmptoZI6QbtmZ2uAnTYI9I7GGqO0aOh2VjE8z393/Pv
	v0Rm/J2+UJQ+I6abk/Epaks5y7/i4sMVL3bOA=
Received: by 10.115.77.17 with SMTP id e17mr11919926wal.108.1280989916595;
	Wed, 04 Aug 2010 23:31:56 -0700 (PDT)
Received: from [10.0.0.5] (eth7090.sa.adsl.internode.on.net [150.101.58.177])
	by mx.google.com with ESMTPS id
	c24sm17623296wam.19.2010.08.04.23.31.54
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 04 Aug 2010 23:31:55 -0700 (PDT)
Message-ID: <4C5A5AD6.9090409@gmail.com>
Date: Thu, 05 Aug 2010 16:01:50 +0930
From: Graham Gower <graham.gower@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.11) Gecko/20100721 Thunderbird/3.0.6
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.212.175
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] package_ipk.bbclass: add lists_dir to sysroots' /etc/opkg.conf
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
X-List-Received-Date: Thu, 05 Aug 2010 06:32:05 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

This makes the sysroots' /etc/opkg.conf agree with opkg-collateral on where
the package lists database should be found. Fixes a problem whereby opkg
cannot find the package lists after opkg-collateral is installed.

This fixes the same problem as acc720fa80227d08fd15764117e0c34e2387e804.
But since that doesn't take into account other dependencies bringing
opkg-collateral into the image, it doesn't solve the problem in all
cases and could probably be reverted.

This is a bit messy, having hardcoded /var/lib/opkg as the lists_dir
in multiple locations. Other suggestions welcome.
I'm not sure its all that necessary to be using /usr/lib/opkg other
than for backwards compatibility with existing installations.

Signed-off-by: Graham Gower <graham.gower@gmail.com>
---
 classes/package_ipk.bbclass |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/classes/package_ipk.bbclass b/classes/package_ipk.bbclass
index cd01496..3d70181 100644
--- a/classes/package_ipk.bbclass
+++ b/classes/package_ipk.bbclass
@@ -132,6 +132,9 @@ package_generate_ipkg_conf () {
 		        echo "src oe-${SDK_SYS}-sdk-$arch file:${DEPLOY_DIR_IPK}/${SDK_SYS}-sdk-$arch" >> ${IPKGCONF_CANSDK}
 		fi
 	done
+	echo "lists_dir ext /var/lib/opkg" >> ${IPKGCONF_TARGET}
+	echo "lists_dir ext /var/lib/opkg" >> ${IPKGCONF_SDK}
+	echo "lists_dir ext /var/lib/opkg" >> ${IPKGCONF_CANSDK}
 }
 
 python do_package_ipk () {
-- 
1.7.1



