Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1PnCGo-0007cA-Vq
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Feb 2011 16:47:55 +0100
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1PnCFn-0004gN-7j from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Feb 2011 07:46:51 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	svr-orw-fem-01.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Wed, 9 Feb 2011 07:46:51 -0800
Received: from [172.30.80.130] ([172.30.80.130]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Wed, 9 Feb 2011 08:46:49 -0700
Message-ID: <4D52B6E5.10000@mentor.com>
Date: Wed, 09 Feb 2011 08:46:45 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1297116822-30938-1-git-send-email-filip.zyzniewski@gmail.com>	<201102091039.27832.marcin@juszkiewicz.com.pl>	<AANLkTikDHBWTnf2S3j-P9_rpscdRQ7GZHVxrNLbLCXZW@mail.gmail.com>	<iiu4qb$8st$1@dough.gmane.org>
	<4D52AC3D.4050906@mentor.com>
	<1297264927.2161.15.camel@phil-desktop>
In-Reply-To: <1297264927.2161.15.camel@phil-desktop>
X-OriginalArrivalTime: 09 Feb 2011 15:46:49.0913 (UTC)
	FILETIME=[90A9CA90:01CBC870]
Subject: Re: [PATCH] task-base: conditional wifi and bluetooth tasks in PACKAGES
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
X-List-Received-Date: Wed, 09 Feb 2011 15:47:55 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/09/2011 08:22 AM, Phil Blundell wrote:
> On Wed, 2011-02-09 at 08:01 -0700, Tom Rini wrote:
>> So... wouldn't making the patch be DISTRO_FEATURES rather than
>> MACHINE_FEATURES be what people want?
>
> I think that's still not quite right.  As far as I can tell there are
> three interesting scenarios that need to be distinguished:
>
> 1. DISTRO doesn't want bluetooth at all: bluez shouldn't be built,
> nothing should depend on it, and bluetooth should be disabled in all
> packages where it's an option.  If nothing is using bluez then clearly
> it isn't going to be wanted in the bootstrap images.
>
> 2. DISTRO does want bluetooth as an option in the feeds but it isn't
> needed for bootstrapping (on distros where that's a meaningful concept).
> Bluez should be built, packages where it's an option should depend on
> it, but task-base/task-bootstrap should not make any special effort to
> haul bluez into the installation images.
>
> 3. DISTRO wants bluetooth and it is required for bootstrapping.  In this
> case, evidently something in task-base/task-bootstrap needs to RDEPEND
> on it in order to make sure it's available at install time.
>
> I think case (1) corresponds to DISTRO_FEATURES not including bluetooth.
> Case (3) corresponds to DISTRO_FEATURES having bluetooth and the MACHINE
> declaring that it is bluetooth-capable in some way (either by mentioning
> it directly in MACHINE_FEATURES or by mentioning a bus like pci or cf
> which could accept a bluetooth card).

Right, and same for "wifi" (which is a much smaller set of stuff that 
gets pulled in).

> The difficulty seems to be that, for case (2), there is currently no way
> for a DISTRO to say that it isn't interested in bluetooth for bootstrap
> purposes even though the hardware might be capable of it.  That might be
> a legitimate point of view if all the hardware that it runs on also
> supports an easier bootstrap method (e.g. wifi).

I think in the cases where it's being pulled into the image, doing 
$distro-bootstrap-image.bb which just adds the logic that says "remove 
... for $machine" and spits out the N different bootstrap possible 
images is fine.  But the problem, if I read it right is:

Lots of things are being built and then task-base-{bluetooth,wifi} 
exist, but aren't installed.

> If you change the patch to just look at DISTRO_FEATURES then it will
> essentially be a no-op since the distros which are having this problem
> must already be enabling bluetooth in DISTRO_FEATURES.

I warned you I have my stupid hat on, but jlime-2010.1.conf doesn't list 
bluetooth or wifi.

> All that said, though, I think there is a fairly strong case for just
> saying that each distro should provide its own task-bootstrap equivalent
> (if it cares about bootstrapping).  It seems a bit silly to try to have
> a single one-size-fits-all recipe with a zillion little switches that
> make it behave differently in a multitude of ways.

I don't know.  Switching hats, we've never used task-base/etc since it's 
always pulled in more stuff than we cared for and seemed like a PITA to 
take things out.  But it's also long been a wishlist item to give it 
another go.  But it's a good and honest question, does task-base really 
work today, as the various distros wish that it would, for anyone other 
than Angstrom?  If not, that'd be a pretty good case for abstracting 
things a little and saying if you want to use images X/Y/Z, $distro 
needs to provide $something that's installed in the images and it must 
do ....

-- 
Tom Rini
Mentor Graphics Corporation


