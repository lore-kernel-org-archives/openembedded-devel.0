Return-Path: <flihp@twobit.us>
Received: from smtp.twobit.us (smtp.twobit.us [38.83.192.235])
	by mail.openembedded.org (Postfix) with ESMTP id 3CDBD732FC
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Feb 2015 20:57:01 +0000 (UTC)
Received: from c-50-185-54-102.hsd1.ca.comcast.net ([50.185.54.102]
	helo=[172.16.1.11])
	by smtp.twobit.us with esmtpsa (TLSv1.2:DHE-RSA-AES128-SHA:128)
	(Exim 4.80) (envelope-from <flihp@twobit.us>)
	id 1YLeJB-000153-No; Wed, 11 Feb 2015 20:54:54 +0000
Message-ID: <54DBC210.5020308@twobit.us>
Date: Wed, 11 Feb 2015 15:56:48 -0500
From: Philip Tricca <flihp@twobit.us>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Icedove/31.4.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1423669983.23617.78.camel@tycho.nsa.gov>	<CABcZANn4cy3YzOYgpSh6hC=vAA=NpyEPghs_jPNY433OeYWKSA@mail.gmail.com>
	<1423674029.1873.9.camel@tycho.nsa.gov>
In-Reply-To: <1423674029.1873.9.camel@tycho.nsa.gov>
X-SA-Exim-Connect-IP: 50.185.54.102
X-SA-Exim-Mail-From: flihp@twobit.us
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on smtp.twobit.us
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=ALL_TRUSTED,BAYES_00,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
X-SA-Exim-Version: 4.2.1 (built Mon, 26 Dec 2011 16:24:06 +0000)
X-SA-Exim-Scanned: Yes (on smtp.twobit.us)
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
X-List-Received-Date: Wed, 11 Feb 2015 20:57:05 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit

On 02/11/2015 12:00 PM, dpquigl wrote:
> On Wed, 2015-02-11 at 09:25 -0700, Christopher Larson wrote:
>> On Wed, Feb 11, 2015 at 8:53 AM, dpquigl <dpquigl@tycho.nsa.gov> wrote:
>>
>>> I'm working on OpenXT and it makes use of the meta-selinux repo hosted
>>> by the yocto project. I'm trying to use it with a base openembedded core
>>> and its not in sync with oe-core because its based on pokey. This made
>>> me think of two questions. 1) Why is this not in OE core since so many
>>> packages in core can potentially have SELinux support enabled and 2) if
>>> its not supposed to be in core where should turning on SELinux support
>>> in a recipe go? For example coreutils can have SELinux support enabled.
>>> Currently this is in meta-selinux as a bbappend to the coreutils
>>> package. This works out because its always going to be there. However
>>> there is also a bbappend for an LXC recipe. LXC isn't in core which
>>> means it has a dependency on a layer not in core.
>>>
>>
>> This is a bug in the layer. It's fairly trivial to construct a layer in
>> such a way that you can have per-layer bbappends that are only applied when
>> that layer exists. This is likely the approach meta-selinux should take to
>> address this implicit dependency upon meta-virtualization.
> 
> Thanks for the suggestion. I figured there was a way to do this but I'm
> new enough to OE and bitbake that it wasn't immediately obvious to me
> how to accomplish this. I'll look into giving it a try.

I didn't know this was possible either. Will be useful to have in
meta-selinux independent of this conversation. Looks like a good example
of this method used in meta-mentor can be found here:

https://lists.yoctoproject.org/pipermail/meta-mentor/2013-May/000052.html

>> That said, I think most folks would be open to PACKAGECONFIGs for selinux
>> capability going into the main recipes, as that's not an invasive change,
>> nor a patch, but just a tweak in configuration.
> 
> That is good to hear. I'm going through the repo now to figure out what
> is really needed to get SELinux working and what is extra. We've been
> having a discussion here about the need to support certain policy
> configurations on embedded SELinux systems. I'm still new enough to all
> of this that I imagine it will take me a while to figure out how and
> what to add PACKAGECONFIG wise to fit meta-selinux into oe-core.

I'm happy to take a crack at using the per-layer bbappend method
described above in meta-selinux. When meta-selinux picked up a
dependency on 3 new layers caused by bbappends I had to update a bunch
of my build stuff even though I'm not using said layers.

Philip

