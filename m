Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1MBpmR-0003cE-3v
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Jun 2009 14:41:19 +0200
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1MBpdl-0003D9-Vl
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Jun 2009 13:32:22 +0100
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <philb@gnu.org>) id 1MBpdl-0004Jj-Ml
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Jun 2009 13:32:21 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <200906031325.48159.marcin@juszkiewicz.com.pl>
References: <200906031325.48159.marcin@juszkiewicz.com.pl>
Date: Wed, 03 Jun 2009 13:32:21 +0100
Message-Id: <1244032341.2611.53.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.2 
Subject: Re: [RFC] fix for MACHINE_KERNEL_PR stuff
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
X-List-Received-Date: Wed, 03 Jun 2009 12:41:19 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2009-06-03 at 13:25 +0200, Marcin Juszkiewicz wrote:
> This patch unbreaks current behaviour which was introduced by 
> MACHINE_KERNEL_PR variable.
> 
> As most of target machines do not use it they have PR with broken value
> (set to "r0" instead of value in recipe). I took other way which makes
> both types of users happy -- those with MACHINE_KERNEL_PR in use and 
> those without it.
> 
> By default we set M_K_PR to empty string instead of "r0" - this allows
> to check is it set at all or not. If it is set then we set PR to this value.
> Otherwise we ignore existance of that variable and use PR from recipe.

Thanks for the patch.  This does look like a reasonable compromise: as
you say, it should prevent MACHINE_KERNEL_PR causing trouble for those
people who don't want it.  So, +1 from me.

p.




