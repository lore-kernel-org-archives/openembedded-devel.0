Received: from [209.85.198.250] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1JwkRP-0001Wb-BX
	for openembedded-devel@lists.openembedded.org;
	Thu, 15 May 2008 22:52:43 +0200
Received: by rv-out-0708.google.com with SMTP id f25so824489rvb.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 May 2008 13:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	bh=2ekwfrR0LXFAYZ/CC+C8JerLjEozyWNrWGRig+bSBF4=;
	b=isCoTtR34Lyj6BVumKSpuCJ0qKapOa9G1ZcZQHvLSfR6+PwqjVTBi+kroBUgzinehFvSNCGfdcXYDojYoUcXeTxeaEQFnVwP/dK2YEp/iLIB+jnim0MUoLuBTxKpbvcCa5uqZvLTfMNKCVg+L2goqheA9Rhmsg54Xia3c4dAFtI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	b=JXZ0dlYFFl4Mvr6he0f5vo4SMkS++Up7ySNZC+gc6YvBLRIhIDYOey3xSpckCgYCvK0cZUT+5P4juK/dpLkpruSMOD9gceRIQFYcc0AWTfoFKfXaf3GqUQKwlkZMQyPj6k5b7ZF1VTRY3BfVJNNtXi7EEBp6CFQCgQuZuUeH264=
Received: by 10.140.251.1 with SMTP id y1mr1347789rvh.107.1210884658364;
	Thu, 15 May 2008 13:50:58 -0700 (PDT)
Received: by 10.140.250.18 with HTTP; Thu, 15 May 2008 13:50:58 -0700 (PDT)
Message-ID: <c384c5ea0805151350o19a22753y87545cfc9e22c7d1@mail.gmail.com>
Date: Thu, 15 May 2008 22:50:58 +0200
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20080515201138.GB8281@smtp.west.cox.net>
MIME-Version: 1.0
References: <c384c5ea0805141436m9f5151dje832c2da95379127@mail.gmail.com>
	<1210869726.7097.93.camel@localhost.localdomain>
	<c384c5ea0805151151v35e28a99i2ccb39157d5d47f6@mail.gmail.com>
	<20080515201138.GB8281@smtp.west.cox.net>
Subject: Re: [RFC] Stop on multiple providers but none explicitly specified
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10b4
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
X-List-Received-Date: Thu, 15 May 2008 20:52:43 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello Tom,

On Thu, May 15, 2008 at 10:11 PM, Tom Rini <trini@kernel.crashing.org> wrote:
> On Thu, May 15, 2008 at 08:51:29PM +0200, Leon Woestenberg wrote:
>
>> However, is it intuitive from the *user's* point-of-view to have
>> BitBake make this decision?
>> I think not; at least in the case of OpenEmbedded, there is at least a
>> 50% chance this is not what the user intended.
>>
>> 1) Besides fixing this in BitBake (by bailing out, my first proposal),
>> 2) an alternative solution is to set the preferred provider for the
>> toolchain/libc elements to a built..
>> a) ..in each distro file
>> b) ..globally where we can build the toolchain/libc elements in
>> OpenEmbedded for the target.
>>
>> I think 2a)  is not the way OpenEmbedded should work. The distro is
>> not the authorative component that decides whether we can build a
>> toolchain/libc for each target (like Angstrom does now).
>>
>> Shouldn't we do (2b), where the distribution can *optionally* override
>> the preferred provider if it knows better?
>
> How do we know what's right?  Since in many cases it's glibc OR uclibc
> OR external-toolchain, there is no right default there.  If we just bail
> out here..
>
Yes, bailing out is my first proposal, which modifies bitbake.

"Setting what's right" is a secondary solution, and modifies
OpenEmbedded metadata. I would prefer to default to our self-built
toolchain for targets that have a known "good" cross-toolchain in
OpenEmbedded. We can default to glibc for targets where glibc is the
"best" choice, i.e. bigger targets, and default to uclibc where it
makes sense (your favourite router?).

The distro can override where necessary (this is the exception, and in
most cases it locks down toolchain versions, does not select
providers).

> - Distro maintainers know what's right for their distro and lock things
>  down (or know the complex table of their correct answers, and lock
>  down).
>
Hmm, do I *need* to set a distro?

Does the *distro* limit me to what targets I want to build?

What if I want to build helloworld-image for the microblaze
achitecture? (Just babbling here - but it has MMU now :-).

> - End users never see this unless the distro isn't up to date, and ping
>  the distro maintainer.
>
No. Only very experienced end users ping the distro maintainer. New
end-users complain on #oe, they don't see the NOTE: at the top, and
don't understand why stuff fails.

> - Custom folks get a build that bails out, with a good reason and they
>  pick what they know they need here.
>
Yes, my preference.


But let me put it another way:

The concept of distro's should not restrict me from using OpenEmbedded
as a cross platform build system. Our default configuration should
much mimick buildroot. Select machine, packages, go. We should start
where buildroot ends.

Use cases:

Selecting "MACHINE=microblaze_dev_board, bitbake helloworld-image.bb"
should work out of the box if we add the microblaze toolchain.

Selecting "MACHINE=new_machine_with_new_arch DISTRO=old_distro bitbake
some-image.bb" should as least TRY to build the image for the machine
using the toolchain that is available in OpenEmbedded.

My 2cts,

Regards,
-- 
Leon


