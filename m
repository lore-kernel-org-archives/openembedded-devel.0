Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders.darander@gmail.com>) id 1QMwWN-0006j1-A5
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 May 2011 08:15:43 +0200
Received: by fxm19 with SMTP id 19so2038614fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 May 2011 23:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=hwmnEWp6EL0LJ1K07GJ6iu9UzCr8FarCDaLVk3Ftmh0=;
	b=pahW8KVsF5m+w3fL+i9xx/LAFQHRKcYSNcU1XLzcPqtWXZp/I5EjHDXF79sYZWbMsv
	s0LI1zfBwY8wp50OP8NZuEntRBvqut+nvcJ7mAiN0kt0XSg13PKVh2LUu9xZG2zJ3XcZ
	vew0jW/KJYTp10xA3s0s4ICPVjzTnbvAXiqPY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=f0qOaDQvB1SlinBO7NLZ3SxSLyIHA4vJ3YeuRyO2O1SZZCUqhy5abOxcIlv2wrhk2P
	yF25LYsgj/MFINRK+0RkQN0Iv/6nxZ2Ok/HYVW1JmHdimgNX8eriLUjroi3v8NIekcaM
	U/mYcVbESRUY7BI9aWQjQfd0MPq84ekLbjiQw=
MIME-Version: 1.0
Received: by 10.223.25.152 with SMTP id z24mr3480898fab.133.1305785567963;
	Wed, 18 May 2011 23:12:47 -0700 (PDT)
Received: by 10.223.93.206 with HTTP; Wed, 18 May 2011 23:12:47 -0700 (PDT)
In-Reply-To: <1305661792.3424.285.camel@rex>
References: <1305545218.3424.29.camel@rex>
	<BANLkTimSNvdsc1BoCk4ofNh4-nFuO5bg2A@mail.gmail.com>
	<1305564582.2429.90.camel@phil-desktop>
	<BANLkTimtfuCEo253ye-96xeo1dsvJgRFBw@mail.gmail.com>
	<iqt55i$59d$1@dough.gmane.org>
	<BANLkTikg=j9+Y-o8CfXEpBbY51u+tBLa8A@mail.gmail.com>
	<20110517092550.GG1544@ibawizard.net>
	<1305661792.3424.285.camel@rex>
Date: Thu, 19 May 2011 08:12:47 +0200
Message-ID: <BANLkTinsMC13prQ6z6RiEc-1150OO_KSsw@mail.gmail.com>
From: Anders Darander <anders.darander@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: OpenEmbedded Core - Ready for extended users
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
X-List-Received-Date: Thu, 19 May 2011 06:15:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, May 17, 2011 at 21:49, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Tue, 2011-05-17 at 11:25 +0200, Petr =C5=A0tetiar wrote:
>> Anders Darander <anders.darander@gmail.com> [2011-05-17 09:04:35]:
>> > Though, that was only one example of a package that has either runtime
>> > or only build-time dependencies on X in some form or another. Earlier,
>> > in the 2011.03-releases, we had systemd depending on gtk+, which has
>> > been removed in the lates updates. Thats just another example.
>>
>> Don't worry, you're not alone in that feeling, actually I think, that we=
're
>> quite a large group fighting with this :-) One day the image has 1700 ta=
sks,
>> after one rebase within a week timespan it grows almost to 3000, don't m=
ention
>> bluetooth and similar stuff etc. Well, I'm also looking forward to see, =
how it
>> will change with oe-core.
>
> These are issues we need to address I think everyone agrees on that.
> What we do need is some overall architectural way to handle it though
> rather and doing it adhoc on a case by case basis. There has been some
> discussion on the OE-Core list about it but I don't think we've reached
> any conclusion.

I had some trouble locating these discussions on the oe-core list. Do
you have hint/link towards those discussions? I'd be interested to
read them and see what ideas has been discussed.

> Out of interesting are there any new proposals on how to handle this?
> I'm interested in proposals that are thought through to details like how
> distros handle differences and being able to identify which
> configurations are used when presented with packages...

Has there been any proposals earlier?

Sorry, no real ideas at the moment. The main alterniatives, I guess,
are to conditionally add depends and configure options based on
either:
* More variables. Although this could lead to _a lot more_ variables
in the end. (I.e. see the recent discussion on the oe-core list on
task-base etc.)
*  On if certain other recipes are selected. I'm not sure that this is
even possible? (I haven't looked that much into bitbake and recipe
parsing) This is solution is obviously a lot easier when using e.g.
Kconfig-based configurations, like Buildroot.

I'm not sure of which option is the best, or if there is another
better option...

Regards,
Anders


