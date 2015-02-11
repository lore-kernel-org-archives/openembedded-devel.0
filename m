Return-Path: <flihp@twobit.us>
X-Greylist: delayed 1119 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 11 Feb 2015 20:02:49 UTC
Received: from smtp.twobit.us (smtp.twobit.us [38.83.192.235])
	by mail.openembedded.org (Postfix) with ESMTP id 803837280D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Feb 2015 20:02:49 +0000 (UTC)
Received: from c-50-185-54-102.hsd1.ca.comcast.net ([50.185.54.102]
	helo=[172.16.1.11])
	by smtp.twobit.us with esmtpsa (TLSv1.2:DHE-RSA-AES128-SHA:128)
	(Exim 4.80) (envelope-from <flihp@twobit.us>)
	id 1YLdAe-00010g-Ul; Wed, 11 Feb 2015 19:42:01 +0000
Message-ID: <54DBB0FF.6090305@twobit.us>
Date: Wed, 11 Feb 2015 14:43:59 -0500
From: Philip Tricca <flihp@twobit.us>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Icedove/31.3.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org, 
	Paul Eggleton <paul.eggleton@linux.intel.com>
References: <1423669983.23617.78.camel@tycho.nsa.gov>	<6445648.XiRzhvmYHl@peggleto-mobl5.ger.corp.intel.com>
	<1423673755.1873.5.camel@tycho.nsa.gov>
In-Reply-To: <1423673755.1873.5.camel@tycho.nsa.gov>
X-SA-Exim-Connect-IP: 50.185.54.102
X-SA-Exim-Mail-From: flihp@twobit.us
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on smtp.twobit.us
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=ALL_TRUSTED,BAYES_00,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
X-SA-Exim-Version: 4.2.1 (built Mon, 26 Dec 2011 16:24:06 +0000)
X-SA-Exim-Scanned: Yes (on smtp.twobit.us)
Cc: yocto@yoctoproject.org
Subject: Re: meta-selinux
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 11 Feb 2015 20:02:56 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit

On 02/11/2015 11:55 AM, dpquigl wrote:
> On Wed, 2015-02-11 at 16:29 +0000, Paul Eggleton wrote:
>> (Adding yocto@yoctoproject.org to CC since that is where meta-selinux patches 
>> tend to go at least)
>>
>> On Wednesday 11 February 2015 10:53:03 dpquigl wrote:
>>> I'm working on OpenXT and it makes use of the meta-selinux repo hosted
>>> by the yocto project. I'm trying to use it with a base openembedded core
>>> and its not in sync with oe-core because its based on pokey. 
>>
>> To be clear, poky and OE-Core are in lock-step. No patch to core recipes goes 
>> into Poky directly, they are applied to OE-Core and then they flow into Poky 
>> immediately thereafter (Richard, who does the merging of patches into OE-Core, 
>> does the sync to Poky immediately afterwards.)
>>
>> What's more likely happening I suspect is that you are on a newer 
>> branch/revision of OE-Core/Poky than the meta-selinux maintainers have tested. 
>> I can't speak to the maintenance schedule for meta-selinux but maybe others 
>> with knowledge there can chime in.
> 
> 
> I think this makes the most sense. 3 of the problems were bbappend files
> trying to append the wrong version of a recipe (although with these
> changes I should move them over to a wildcard) and the last one was with
> LXC. After that I encountered a typo in one of the recipes where it
> wasn't able to pull the sources down. 

I sent out patches to fix these 4 issues to the list a week or so back.
Reviewing these things and getting them merged takes time though. AFAIK
the meta-selinux master branch hasn't built for months now mostly
because of bbappends trailing behind versions in oe-core. I've been
playing whack-a-mole on this but by the time patches get merged a new
version has changed elsewhere. I've been using wild-cards as much as
possible on account of this.

>>> This made me think of two questions. 1) Why is this not in OE core since so
>>> many packages in core can potentially have SELinux support enabled and 2) if
>>> its not supposed to be in core where should turning on SELinux support
>>> in a recipe go? For example coreutils can have SELinux support enabled.
>>> Currently this is in meta-selinux as a bbappend to the coreutils
>>> package. This works out because its always going to be there. However
>>> there is also a bbappend for an LXC recipe. LXC isn't in core which
>>> means it has a dependency on a layer not in core.
>>>
>>> Ideally I would put the recipes needed for SELinux support in core and
>>> have a distro feature which is checked in the recipes in core for
>>> whether or not to add --with-selinux to the build flags. Then LXC could
>>> check a core distro feature and enable SELinux if it wants to.
>>
>> We have to draw the line somewhere for what to include in OE-Core, and at the 
>> moment I guess we have considered SELinux to be outside its scope. Obviously 
>> these things get re-evaluated from time to time, and SELinux is a little bit 
>> painful for this because of how many recipes it has to touch. Ultimately it 
>> depends on how many people in the embedded space want to enable and use 
>> SELinux.
>>
>> Thoughts from others?

If SELinux support were to be integrated into oe-core directly this
would force similar support into other layers too no? The reach of
meta-selinux has expanded and the layers that must be pulled in to get
it to build has expanded from just oe-core to meta-virtualization (for
LXC) as well as a few layers in meta-oe.

I don't know much about the process here but these cross layer
dependencies would complicate things. I guess this would mean
integrating SELinux support as a distro feature (or whatever is
appropriate) into all of these layers directly. Not impossible but
getting buy-in from the relevant maintainers is necessary.

> In OpenXT we're using OE to generate images for dom0, a user interface
> domain, a network driver domain, and various other service domains for
> isolating tasks in the platform. In addition to that we're using
> openembedded for building on various embedded research platforms. I'm
> assuming yocto is using SELinux to some extent since they are
> maintaining the repository for it and there are quite a few developers
> using SELiunx on embedded products in Japan.

I guess I've been wondering the same thing. For OpenXT we had
implemented our own SELinux support on top of OE (we weren't OSS at the
time). Now that we are OSS we've re-based on meta-selinux but I don't
know of anyone else using this layer or at least discussing it publicly.

Philip

