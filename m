Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1JfArv-00086E-Jf
	for openembedded-devel@openembedded.org; Fri, 28 Mar 2008 10:27:27 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m2S9RRqj008928
	for <openembedded-devel@openembedded.org>; Fri, 28 Mar 2008 09:27:27 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 08848-03 for <openembedded-devel@openembedded.org>;
	Fri, 28 Mar 2008 09:27:22 +0000 (GMT)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m2S9RMg0008919
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>; Fri, 28 Mar 2008 09:27:22 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <47EC3893.80908@whitby.id.au>
References: <1206638249.4514.57.camel@dax.rpnet.com>
	<200803272104.30232.openembedded@haerwu.biz>
	<47EC3893.80908@whitby.id.au>
Date: Fri, 28 Mar 2008 09:27:21 +0000
Message-Id: <1206696441.5029.18.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: ipkg/opkg offical response
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 28 Mar 2008 09:27:27 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 2008-03-28 at 10:45 +1030, Rod Whitby wrote:
> Marcin Juszkiewicz wrote:
> > So creation of "opkg-nogpg":
> > 
> > require opkg_svn.bb
> > EXTRA_OECONF += "--disable-gpg"
> > 
> > would be nice addon. Creation of "curl-nossl" and selecting it is 
> > something which should be rather DISTRO choice as it generate same 
> > packages as "curl" recipe.
> 
> +1

Creation of that has my backing too.

> > Solution would be creating DISTRO_IPK_PACKAGE_MANAGER ?= "opkg" and using 
> > it in package_ipk/rootfs_ipk and other places. Then staging 
> > ipkg-cl/opkg-cl as ipkg/opkg so we can use "${DISTRO_IPK_PACKAGE_MANAGER} 
> > update". Distros which prefer to use ipkg will stay with it, others will 
> > move to opkg.
> 
> Can we simplify to DISTRO_PACKAGE_MANAGER?  Will we ever want ipks and 
> debs to be produced at the same time?

This is useful and I'd like to continue to be able to do that. Its
useful in automated test configurations since dpkg is a lot more strict
about its control field contents and I've seen it fail when ipkg-build
has been happy. Poky's autobuilder therefore builds both.

Cheers,

Richard



