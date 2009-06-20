Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1MHxGR-0004nI-5b
	for openembedded-devel@lists.openembedded.org;
	Sat, 20 Jun 2009 11:53:35 +0200
Received: from 88-109-80-94.dynamic.dsl.as9105.com ([88.109.80.94]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1MHx5w-0000xz-JC
	for openembedded-devel@lists.openembedded.org;
	Sat, 20 Jun 2009 10:42:45 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 20 Jun 2009 10:42:33 +0100
Message-Id: <1245490953.29153.235.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: Re: [oe-commits] Koen Kooi : util-linux-ng: fix packaging, u-a and	replace hardcoded paths
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
X-List-Received-Date: Sat, 20 Jun 2009 09:53:37 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

> @@ -129,7 +131,8 @@ do_install () {
>  	install -d ${D}${sysconfdir}/default/
>  	echo 'MOUNTALL="-t nonfs,nosmbfs,noncpfs"' > ${D}${sysconfdir}/default/mountall
>  
> -	ln -sf ${sbindir}/swapon ${D}${sbindir}/swapoff.${PN}
> +	rm ${D}${sbindir}/swap* -f
> +	ln -sf ${base_sbindir}/swapon.${PN} ${D}${base_sbindir}/swapoff.${PN}
>  	ln -sf ${sbindir}/shutdown ${D}${sbindir}/reboot.${PN}
>  	ln -sf ${sbindir}/shutdown ${D}${sbindir}/halt.${PN}
>  	ln -sf ${sbindir}/shutdown ${D}${sbindir}/fastboot

What's the reason for that "rm"?  This looks like it will lose when
${base_sbindir} and ${sbindir} are the same directory.

p.




