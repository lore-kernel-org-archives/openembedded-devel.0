Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1OibqS-0005a9-Dn
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Aug 2010 01:33:32 +0200
Received: by pvg6 with SMTP id 6so954329pvg.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Aug 2010 16:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:references:in-reply-to
	:content-type:content-transfer-encoding;
	bh=50O4ePLS0lig6faUw+1Nxc4OuG4M9zEgEqTsQYp5GQY=;
	b=x6Xc2kJVIApVKg94mVApV4iZXlZryMk7VylDvVBLmOgh4/Pyk9YbBI4zTmLX8QYnJL
	FmYlYc20j8HSVVRlaZQLm4iuEpZaE5UTYmyfTvtu+rzAtfER07Cg9jZ/0kHpRXc9afTU
	br1ypdJ391Sv3zsxEeuWpBq6OIr9BtAF0GNIU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=ezvBPiNC4UsJmv0rCHBMZqlJvZQEF811ks9UA+vy6EHTo84Pu20oXYHDhWm5MvNIQR
	+bCuhG3bMeanA8oYxc+4UOwERuUYncJE2WPWpeEXM98n2z7iEGmH5Pxt/V9D+AEw4Drt
	euO0YcRlFlfyfotr7uMrBf45mVVrlDCpp62CI=
Received: by 10.143.26.4 with SMTP id d4mr14115366wfj.338.1281396795556;
	Mon, 09 Aug 2010 16:33:15 -0700 (PDT)
Received: from [10.0.0.5] (eth7090.sa.adsl.internode.on.net [150.101.58.177])
	by mx.google.com with ESMTPS id w8sm7072184wfd.7.2010.08.09.16.33.13
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 09 Aug 2010 16:33:14 -0700 (PDT)
Message-ID: <4C609035.7080500@gmail.com>
Date: Tue, 10 Aug 2010 09:03:09 +0930
From: Graham Gower <graham.gower@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.11) Gecko/20100721 Thunderbird/3.0.6
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <E1OhMNp-0001vS-Ot@melo.openembedded.org>
	<AANLkTimcUgoNO73WXbn2R1O-pgXT-4raSGjtsHa8SvOC@mail.gmail.com>
In-Reply-To: <AANLkTimcUgoNO73WXbn2R1O-pgXT-4raSGjtsHa8SvOC@mail.gmail.com>
X-SA-Exim-Connect-IP: 74.125.83.175
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [oe-commits] Graham Gower : package_ipk.bbclass: add lists_dir to sysroots' /etc/opkg. conf
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
X-List-Received-Date: Mon, 09 Aug 2010 23:33:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 08/10/2010 07:24 AM, Andrea Adami wrote:
> It seems this doesn't respect ${ONLINE_PACKAGE_MANAGEMENT}" == "none"
> 
> I see a spurious /var/lib/opkg in the cpio of initramfs-kexecboot-image.
> 
> oe              │      0│Aug  9 23:32│
> oe-all          │  64030│Aug  9 23:32
> oe-armv5te      │3637007│Aug  9 23:32
> oe-tosa         │ 463708│Aug  9 23:3
> 
> 
> We don't need any extra cruft there ;)
> 
> Regards
> 
> Andrea
> 

/var/lib/opkg shouldn't be populated regardless of the value of ONLINE_PACKAGE_MANAGEMENT.

Signed-off-by: Graham Gower <graham.gower@gmail.com>
---
diff --git a/classes/rootfs_ipk.bbclass b/classes/rootfs_ipk.bbclass
index db04fb6..b0baab0 100644
--- a/classes/rootfs_ipk.bbclass
+++ b/classes/rootfs_ipk.bbclass
@@ -98,15 +98,18 @@ fakeroot rootfs_ipk_do_rootfs () {
 		else
 			rm -f ${IMAGE_ROOTFS}${libdir}/opkg/lists/*
 		fi
-	
+
+		rm -rf ${IMAGE_ROOTFS}/var/lib/opkg/*
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




