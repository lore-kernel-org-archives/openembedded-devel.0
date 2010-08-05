Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1Ogz5A-0008Lh-GE
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 Aug 2010 13:57:57 +0200
Received: by fxm12 with SMTP id 12so2907115fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Aug 2010 04:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=azxyuUWfhWCV6MddipYqWJ9L1WHq4Ak1XeNHEk9LQPo=;
	b=PEkABOTUEHGiyE9J5QJMdgMOl9jgyw5S5n6iJmBA9tIyxQ9BBYYo8Iy/8ih4umqgx5
	XcLbK3VCN5jmEwcClQc+Lr3IPsnD+c0ZPR/RZD5dHZIryIKpS4wuVfzTACzTuWn8JwCX
	85sCU8oGj+PInyxxNhRkVNPvUD3TysUh/SFtc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=IyrhVorPByIT5ODB7TPAgmiKAx663tV6MBRo5AnhnuLXzoywjtfyqw4l65jSSK+EB5
	Bc7fq6lJjmOr9sOiodQVJvcZe0NybGtkZVh1fKT/ZdX0Ylc8SCYHRxOAhMgESPZN8pRk
	MtLTXu2s9gZD5P3/Rx9/5f55+EPMwSmU1Z3Z0=
Received: by 10.223.119.67 with SMTP id y3mr10529525faq.45.1281009471231;
	Thu, 05 Aug 2010 04:57:51 -0700 (PDT)
Received: from s42.loc (85-127-241-5.dynamic.xdsl-line.inode.at [85.127.241.5])
	by mx.google.com with ESMTPS id q17sm41193faa.21.2010.08.05.04.57.50
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 05 Aug 2010 04:57:50 -0700 (PDT)
Received: from cow by s42.loc with local (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1Ogz4z-0004SK-6C; Thu, 05 Aug 2010 13:57:45 +0200
Date: Thu, 5 Aug 2010 13:57:45 +0200
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100805115745.GH28187@mx.loc>
References: <1281006613-31148-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1281006613-31148-1-git-send-email-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] Revert "rootfs_ipk.bbclass: install the package manager in a separate pass from the other packages"
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
X-List-Received-Date: Thu, 05 Aug 2010 11:57:57 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 05, 2010 at 01:10:13PM +0200, Martin Jansa wrote:
>This reverts commit acc720fa80227d08fd15764117e0c34e2387e804.

I'd suggest to fix it instead, like put it into the properly guarded
block:

diff --git a/classes/rootfs_ipk.bbclass b/classes/rootfs_ipk.bbclass
index 7c85aae..4256945 100644
--- a/classes/rootfs_ipk.bbclass
+++ b/classes/rootfs_ipk.bbclass
@@ -63,7 +63,6 @@ fakeroot rootfs_ipk_do_rootfs () {
 			opkg-cl ${IPKG_ARGS} install $i 2>&1 || true
 		done > ${T}/log.do_rootfs-attemptonly.${PID}
 	fi
-	opkg-cl ${IPKG_ARGS} install ${PACKAGE_INSTALL_PKGMGR}
 
 	export D=${IMAGE_ROOTFS}
 	export OFFLINE_ROOT=${IMAGE_ROOTFS}
@@ -71,6 +70,7 @@ fakeroot rootfs_ipk_do_rootfs () {
 	export OPKG_OFFLINE_ROOT=${IPKG_OFFLINE_ROOT}
 	
 	if [ "${ONLINE_PACKAGE_MANAGEMENT}" != "none" ]; then
+		opkg-cl ${IPKG_ARGS} install ${PACKAGE_INSTALL_PKGMGR}
         	mkdir -p ${IMAGE_ROOTFS}${sysconfdir}/opkg/
 		grep "^arch" ${IPKGCONF_TARGET} >${IMAGE_ROOTFS}${sysconfdir}/opkg/arch.conf
 	fi



