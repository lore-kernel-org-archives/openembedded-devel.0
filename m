Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rpurdie@rpsys.net>) id 1Il9BO-0001Vq-2r
	for openembedded-devel@openembedded.org; Thu, 25 Oct 2007 22:19:58 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l9PKCZ1R007825
	for <openembedded-devel@openembedded.org>;
	Thu, 25 Oct 2007 21:12:35 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 07417-10 for <openembedded-devel@openembedded.org>;
	Thu, 25 Oct 2007 21:12:32 +0100 (BST)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l9PKCScb007818
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Thu, 25 Oct 2007 21:12:29 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <20071025120035.49703327@cimmeria>
References: <20071025120035.49703327@cimmeria>
Date: Thu, 25 Oct 2007 21:12:28 +0100
Message-Id: <1193343148.5697.21.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Kernel Packages/Modules and Versioning
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
X-List-Received-Date: Thu, 25 Oct 2007 20:19:59 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 2007-10-25 at 12:00 +0100, Graeme Gregory wrote:
> Currently kernel modules create packages with names of the form
> 
> kernel-module-umaga_${PV}-${PR}.ipk
> 
> This I feel is not a good idea for mobile system that can have package
> upgrades in the field. It is my feeling that kernel modules/images
> should never upgrade without attendance from the user.
> 
> On reason for this is to make sure user is plugged into sufficient
> power and has facilities to fix device before doing such a drastic
> upgrade.
> 
> I would like to suggest all kernel packages are actually packaged as
> 
> kernel-module-umaga-${PV}_${RELEASE_NO}-${PV}.ipk
> 
> and that a kernel-updater is developed to guide user through kernel
> upgrades with less danger of broken devices at the end.
> 
> Obviously some policy would be needed so that ${RELEASE_NO}-${PV} is
> guaranteed to load on all kernel-image-${PV} kernels.
> 
> Anyway I thought I would expose this to the wider audience for more
> comments than just openmoko lists. I know this is suitable for all
> devices so Id like opinions.

Putting on the devils advocate hat, why not enhance ipkg or whatever so
kernel-modules-* is blacklisted and warns the user an update is
available but to install it see/do "foo".

Trying to solve this package management/user issue that deeply in the
build system doesn't seem an entirely good idea.

On a technical level, do we like task-base rrecommending
"kernel-module-umaga-${PV}"? How/when do you upgrade task-base? or do we
then need "task-base-${PV}"?

Cheers,

Richard





