Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1Ol9sj-000569-2e
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Aug 2010 02:18:22 +0200
Received: by pxi11 with SMTP id 11so2129246pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Aug 2010 17:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:references:in-reply-to
	:content-type:content-transfer-encoding;
	bh=x25UUr4FP1wTBG9cOO9xM1V+W4f7yZE2hzM+LC5KeCY=;
	b=PCJn2AW86IeQT+nh5qlpSSbTWa1z1K7KkmfCuN2c07j9IY0CmjTMxVLWM1VcXY6FFR
	PYH5/Q1/Gmx1pW+mwMRVA+lev+lmz19j4Os75LDm/qnaoqTsWN5OmfsbsiGi8BRntsmp
	V15MQ43ptmR1TRix/vQsEYJIITXhLYsZpLP/Q=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=MSvHqlCFX11ImCCR71o8/EDZcVzInKWuE22DO5ZzUWmzxc9dTjOFAHnuo6IeWa76E6
	Aj4EBss26Ugjqf4OR3kMlqhFZmxb6UGItAt+9AnoJj4SPxBAHVDihzRT8nR9trcOor8M
	XIPUZXSbclThhs8KdIZuCzql6PDzmbF/YI18g=
Received: by 10.114.120.7 with SMTP id s7mr6992923wac.131.1282004282575;
	Mon, 16 Aug 2010 17:18:02 -0700 (PDT)
Received: from [10.0.0.5] (eth7090.sa.adsl.internode.on.net [150.101.58.177])
	by mx.google.com with ESMTPS id
	c24sm13147916wam.19.2010.08.16.17.17.59
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 16 Aug 2010 17:18:01 -0700 (PDT)
Message-ID: <4C69D533.7060902@gmail.com>
Date: Tue, 17 Aug 2010 09:47:55 +0930
From: Graham Gower <graham.gower@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.11) Gecko/20100721 Thunderbird/3.0.6
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <E1OhMNp-0001vS-Ot@melo.openembedded.org>	<AANLkTimcUgoNO73WXbn2R1O-pgXT-4raSGjtsHa8SvOC@mail.gmail.com>	<4C609035.7080500@gmail.com>
	<AANLkTinwNNmb-b2dDWycBeKmPWK4JP0sjYAYYZhmKwau@mail.gmail.com>
In-Reply-To: <AANLkTinwNNmb-b2dDWycBeKmPWK4JP0sjYAYYZhmKwau@mail.gmail.com>
X-SA-Exim-Connect-IP: 209.85.212.175
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] rootfs_ipk.bbclass: remove host's lists in /var/lib/opkg/*
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
X-List-Received-Date: Tue, 17 Aug 2010 00:18:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


Signed-off-by: Graham Gower <graham.gower@gmail.com>
---
 classes/rootfs_ipk.bbclass |    8 ++++++--
 1 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/classes/rootfs_ipk.bbclass b/classes/rootfs_ipk.bbclass
index db04fb6..915e3d7 100644
--- a/classes/rootfs_ipk.bbclass
+++ b/classes/rootfs_ipk.bbclass
@@ -98,15 +98,19 @@ fakeroot rootfs_ipk_do_rootfs () {
 		else
 			rm -f ${IMAGE_ROOTFS}${libdir}/opkg/lists/*
 		fi
-	
+
+		# Remove lists, but leave SHR's tmp dir if it exists.
+		rm -f ${IMAGE_ROOTFS}/var/lib/opkg/* || true
+
 		# Keep these lines until package manager selection is implemented
 		ln -s opkg ${IMAGE_ROOTFS}${sysconfdir}/ipkg
 		ln -s opkg ${IMAGE_ROOTFS}${libdir}/ipkg
 	else
 		rm -rf ${IMAGE_ROOTFS}${libdir}/opkg
 		rm -rf ${IMAGE_ROOTFS}/usr/lib/opkg
+		rm -rf ${IMAGE_ROOTFS}/var/lib/opkg
 	fi
-	
+
 	log_check rootfs 	
 	rm -rf ${IPKG_TMP_DIR}
 }
-- 
1.7.1




