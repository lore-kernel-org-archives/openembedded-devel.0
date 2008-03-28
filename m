Received: from [66.111.4.28] (helo=out4.smtp.messagingengine.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rod@whitby.id.au>) id 1Jf2Fc-0001FC-OC
	for openembedded-devel@lists.openembedded.org;
	Fri, 28 Mar 2008 01:15:20 +0100
Received: from compute1.internal (compute1.internal [10.202.2.41])
	by out1.messagingengine.com (Postfix) with ESMTP id 38588DFBC2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Mar 2008 20:15:20 -0400 (EDT)
Received: from heartbeat2.messagingengine.com ([10.202.2.161])
	by compute1.internal (MEProxy); Thu, 27 Mar 2008 20:15:20 -0400
X-Sasl-enc: +YdUFlRuxWNl0zoh2Q4N8/+vxoeXwBW99pyavqzwY1m7 1206663319
Received: from [192.168.124.11] (secure.astc-design.com [203.122.250.137])
	by mail.messagingengine.com (Postfix) with ESMTPSA id 68A5F30BEB
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Mar 2008 20:15:19 -0400 (EDT)
Message-ID: <47EC3893.80908@whitby.id.au>
Date: Fri, 28 Mar 2008 10:45:15 +1030
From: Rod Whitby <rod@whitby.id.au>
User-Agent: Thunderbird 2.0.0.12 (Windows/20080213)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1206638249.4514.57.camel@dax.rpnet.com>
	<200803272104.30232.openembedded@haerwu.biz>
In-Reply-To: <200803272104.30232.openembedded@haerwu.biz>
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
X-List-Received-Date: Fri, 28 Mar 2008 00:15:20 -0000
Content-Type: text/plain; charset=ISO-8859-2; format=flowed
Content-Transfer-Encoding: 7bit

Marcin Juszkiewicz wrote:
> So creation of "opkg-nogpg":
> 
> require opkg_svn.bb
> EXTRA_OECONF += "--disable-gpg"
> 
> would be nice addon. Creation of "curl-nossl" and selecting it is 
> something which should be rather DISTRO choice as it generate same 
> packages as "curl" recipe.

+1

> Solution would be creating DISTRO_IPK_PACKAGE_MANAGER ?= "opkg" and using 
> it in package_ipk/rootfs_ipk and other places. Then staging 
> ipkg-cl/opkg-cl as ipkg/opkg so we can use "${DISTRO_IPK_PACKAGE_MANAGER} 
> update". Distros which prefer to use ipkg will stay with it, others will 
> move to opkg.

Can we simplify to DISTRO_PACKAGE_MANAGER?  Will we ever want ipks and 
debs to be produced at the same time?

-- Rod


