Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <george.huntingtoniii@gmail.com>) id 1RERVA-00012R-2K
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Oct 2011 22:03:36 +0200
Received: by gyc15 with SMTP id 15so414130gyc.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Oct 2011 12:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=fuKM/2Oqi81w62lvqGbkcjBCVMGrnJiLywK1lN8EnrA=;
	b=hGJ7PKInZLwgmayXffC91jX2BTh68QbeYIEw4Yn3smXfAJ9xhn+REEOpoG06vIbTaX
	j8/HqITf8rEyI0uNqprauKozljI0JeVa3gP02nupc58jYRWeYR5tLFEeMTe0pSoF3FmI
	MY/vGRA2uF9xvjginfg5mtNz3tfQZlMpCGqqY=
MIME-Version: 1.0
Received: by 10.150.176.5 with SMTP id y5mr6040743ybe.53.1318535869805; Thu,
	13 Oct 2011 12:57:49 -0700 (PDT)
Received: by 10.151.112.10 with HTTP; Thu, 13 Oct 2011 12:57:49 -0700 (PDT)
In-Reply-To: <CAFu+nvFi=ML98ncOtaHQU2OESoeNtZkFJZt-=gbPaVOnY0L7Bw@mail.gmail.com>
References: <CAFu+nvHi=pWi-bX5NrTQAk_JVv04YTa=d60Rg7YVSvLv7FNsPg@mail.gmail.com>
	<20111013170423.GH26170@denix.org>
	<CAFu+nvFi=ML98ncOtaHQU2OESoeNtZkFJZt-=gbPaVOnY0L7Bw@mail.gmail.com>
Date: Thu, 13 Oct 2011 15:57:49 -0400
Message-ID: <CAFu+nvFX_+iht07N_a6ZT_46AwK6n4TuuKO8Cz+cvXaVSeOPSA@mail.gmail.com>
From: "George C. Huntington, III" <george.huntingtoniii@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [2011.03-maintenance] using sdk as external toolchain
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
X-List-Received-Date: Thu, 13 Oct 2011 20:03:36 -0000
Content-Type: text/plain; charset=UTF-8

I think my problem was caused by the
PATH_prepend = "${TOOLCHAIN_PATH}/bin:"
it seems to catch the pkg-config from the TOOLCHAIN_PATH, instead of the one
in the sysroots/x86_64-linux/usr/bin
when I change to PATH_append = ":${TOOLCHAIN_PATH}/bin"
it seems to work.

I will wipe out my tmp dir and try again to be sure.


On Thu, Oct 13, 2011 at 2:21 PM, George C. Huntington, III <
george.huntingtoniii@gmail.com> wrote:

>
>
> On Thu, Oct 13, 2011 at 1:04 PM, Denys Dmytriyenko <denis@denix.org>wrote:
>
>> On Thu, Oct 13, 2011 at 11:22:05AM -0400, George C. Huntington, III wrote:
>> > I've built an sdk with oe on the 2011.03-maintenance branch, and I am
>> now
>> > trying to set up a local.conf to use the sdk as an external toolchain
>> and I
>> > get problems building gtk+-native.  any ideas on where I should start
>> > debugging this?
>>
>> gtk+-native should be built by the host toolchain, not the target one from
>> SDK - are you sure you are setting all the correct build variables
>> properly?
>>
> I think I am setting the build variables properly, but I'm not quite sure
> where the correct place to look would be.
> I was hoping the manual or the wiki would have a "this is how you build an
> SDK" and "this is how you use the SDK you just built, as an external
> toolchain"
> I think I get how to build an SDK with the meta-sdk recipe, the other part
> is less clear.
> you can talk to me on irc, I use gchiii as my nickname there.
>
>>
>> Moreover, it's hard to help you debug your issue, if you don't provide
>> details, such as your local.conf and the build logs...
>>
>> --
>> Denys
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>
>

