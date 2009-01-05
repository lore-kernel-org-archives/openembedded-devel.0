Received: from [209.85.132.245] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <esbenhaabendal@gmail.com>) id 1LJqaT-0003Lf-FN
	for openembedded-devel@lists.openembedded.org;
	Mon, 05 Jan 2009 15:37:50 +0100
Received: by an-out-0708.google.com with SMTP id d40so3145439and.42
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 Jan 2009 06:31:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=/Om2i8W5Vpl79YQBrSe0rqx4wo2Gw/EGv7yklHYSWAk=;
	b=gGdjqcfhIcSdz9zHgmpmFw+LdBO9CT6KAMFiHLnuT7RpSOWoCpoDefIdB9s/L6yr8y
	fnvVYKiE8/OGxdoaxK/uF0yKTLYDV4mRaW+j3E6J0PgyysY5pUqAgxrmdA11EHQFhe6n
	qMZQl1kM1anpNQ4qxOGsd/6X8+7n5lkvnwuA0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=XrIonXzHr5C9UC7+kYs1RV9KTzXDm2FFbLZSN40qj6TeZ3aGKPtH1jiMyOmRO5Up3a
	xW9XdexuqiX6HmUtQ1Wvza93/I9w5O1FCSX9PIqqOMgjYI/WX736LnHBXA50AsSeNze9
	F7d2/LDuMMZseuh+9r4GkmQRA8JY/RwwCtpPI=
Received: by 10.100.127.15 with SMTP id z15mr11047232anc.10.1231165913529;
	Mon, 05 Jan 2009 06:31:53 -0800 (PST)
Received: by 10.100.106.3 with HTTP; Mon, 5 Jan 2009 06:31:53 -0800 (PST)
Message-ID: <d2b9ea600901050631h5eda6de5yee190bf0841e5b15@mail.gmail.com>
Date: Mon, 5 Jan 2009 15:31:53 +0100
From: "Esben Haabendal" <esbenhaabendal@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20090102043755.GC400@smtp.west.cox.net>
MIME-Version: 1.0
References: <1230827114.5320.42.camel@dax.rpnet.com>
	<20090101182526.GF7040@smtp.west.cox.net>
	<1230840687.5320.56.camel@dax.rpnet.com>
	<20090101220229.GH7040@smtp.west.cox.net>
	<1230858713.10424.4.camel@dax.rpnet.com>
	<20090102043755.GC400@smtp.west.cox.net>
Subject: Re: Native/Cross/SDK rethink (Was: Re: RFC: "Virtual" native and sdk recipes)
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
X-List-Received-Date: Mon, 05 Jan 2009 14:37:51 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Fri, Jan 2, 2009 at 5:37 AM, Tom Rini <trini@kernel.crashing.org> wrote:
> On Fri, Jan 02, 2009 at 01:11:53AM +0000, Richard Purdie wrote:
>
> [snip]
>> Ideally I want to be able to generate a Linux 32 bit toolchain, a Linux
>> 64 bit toolchain and a windows one. If I can do that using canadian-sdk,
>> the current -sdk stuff can be removed.
>
> It's a theory, and not one I've tested (and I know it won't work _today_
> as there's some hard-coded C:\ paths right now.  Those can die if we
> build it properly relocatible like CodeSourcery does).

Sorry, but where would that be?

In class/canadian-sdk.bbclass:

SDK_PATH_sdk-mingw32 = "/OpenEmbedded/${SDK_NAME}"
SDK_REALPATH = "${SDK_PATH}"
SDK_REALPATH_sdk-mingw32 = "C:/OpenEmbedded/${SDK_NAME}"

Which should only hard-code C:/ into mingw32 toolchains.  I don't
remember seing C:\
in any other places, so that shouldn't get in the way of building
Linux toolchains
with canadian-sdk.

>> Lets for a second make the decision that MACHINE is actually the HOST
>> value. This makes sense in that everything we usually build is to run on
>> the HOST. From here we only need to add gcc-canadian recipe which builds
>> a compiler that runs on HOST but targets a different TARGET to normal to
>> have our BUILD != HOST != TARGET.
>
> Right.  We  get that in the current Canadian stuff, just using different
> variable names, I think.  I _think_ if the new SDK_foo variables were
> set right, it would in fact kick out a working Linux SDK.

I agree on that, although this must come with a YMMV for now ;-)

It would be really great if someone give this a spin, and perhaps a few small
fixes.  I really don't think there should be any big showstoppers ahead.

>> This does reverse the logic that the current sdk class we use however
>> since MACHINE is now the machine we want to run the compiler on, not the
>> machine we want to compile for. It should be simple enough to add some
>> MACHINEs and version setups which correspond to a Linux 32 bit system, a
>> Linux 64 bit system and a windows system though. Assuming the choice of
>> TARGET for gcc-canadian is controlled by a variable like SDKTARGET, to
>> run the builds I'd want, I'd run:
>>
>> MACHINE=i686-generic   SDKTARGET=armv5te-generic bitbake gcc-canadian
>> MACHINE=x86-64-generic SDKTARGET=armv5te-generic bitbake gcc-canadian
>> MACHINE=winxp-generic  SDKTARGET=armv5te-generic bitbake gcc-canadian
>
> Or 'meta-toolchain-sbox' for an existing SDK type target.

I'm sorry, but this seems like a dangerous way of starting confusion of terms.
MACHINE in how I see OE is really the _TARGET_, ie. the small device this all
is targeted at.

And AFAICS, the end result is at best the same as the current canadian-sdk
approach.

>> By contrast, the scheme you are aiming for (as I understand it) would
>> be:
>>
>> MACHINE=armv5te-generic SDKARCH=i686-generic   bitbake gcc-canadian
>> MACHINE=armv5te-generic SDKARCH=x86-64-generic bitbake gcc-canadian
>> MACHINE=armv5te-generic SDKARCH=winxp-generic  bitbake gcc-canadian
>
> With a "but I'm lazy and we'll just re-use current SDK recipes for
> the first choice, canadian for the second and, what? a third choice?
> la-la-la I can't hear you!".  The biggest hiccup I see here is my usage
> would be more like (using current machine.conf's):
> MACHINE=qemux86 SDKTARGET=db1200 bitbake meta-toolchain-sbox

It would be rather nice if local.conf could be setup with the set of SDKARCH's
that is supported by the particular project, so that bitbake canadian-sdk would
actually build sdk's for all required archs.  And a default of
building i686-linux,
x86_64-linux and i686-mingw32 might be a good default setting for this.

>> Also note why I don't see this being possible to combine into one
>> bitbake command, much the same way you can't build 10 machines with one
>> bitbake command.
>
> Trying to get more than one machine into an SDK is something else I've
> pondered, but only lightly so far.

The same thought have hit me as well.
But let's get one thing done right first :-)

Esben Haabendal


