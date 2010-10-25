Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PARBp-0008Sy-GS
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Oct 2010 19:50:35 +0200
Received: by gxk22 with SMTP id 22so2349735gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Oct 2010 10:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=ZL6Ty6ysYsuQ4thzbklKacDf3BA02GpWhfPqxFBkFl0=;
	b=G3jNgLn0I1JzKqfLSe0CY+nGFLEs4bMDtaaRQp2t7MQWQ+xCxIfXeDR5/Gjt+p2S+f
	fQEwS9qokWrUvLayR8RfUWrndyGGQcZsjcAtVkMHsQ7d0wD2AyyIve5C+j2FV6cn+Ix0
	dseUrnXKzq/BeZUF8pF4+lnJgsAnVLQnkTwM4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=RdS9Bwp0ccuCNfGdDgxOLa/Sjd00LeVS37ruyI6GARNPXvVQfsWxVOxu3ESctiIHz7
	ZwqcOIPRuRPzHeno5FznouIqp2HAVmmPH02fpCwQT92VvLz0sp7V9NxFKqHxlHwTRTdM
	mQZPVQ0S16PRK0rgJw7/Nl48B8W589iovjdPw=
MIME-Version: 1.0
Received: by 10.42.220.70 with SMTP id hx6mr4226907icb.84.1288028988668; Mon,
	25 Oct 2010 10:49:48 -0700 (PDT)
Received: by 10.42.164.194 with HTTP; Mon, 25 Oct 2010 10:49:48 -0700 (PDT)
In-Reply-To: <lyd3qy5ysk.fsf@ensc-virt.intern.sigma-chemnitz.de>
References: <4CC14738.9070309@nedap.com>
	<lyfwvvaftm.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<AANLkTinMHO=XRv=EDuVVmLcfjJoLETgW8rv96jEus_YE@mail.gmail.com>
	<lyd3qy5ysk.fsf@ensc-virt.intern.sigma-chemnitz.de>
Date: Mon, 25 Oct 2010 10:49:48 -0700
Message-ID: <AANLkTi=aXZP1fhpW4Cj9yQLgbzhzKt9wwiac2_hJdvyO@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] cacaoh: patches to get do_install do its work
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
X-List-Received-Date: Mon, 25 Oct 2010 17:50:35 -0000
Content-Type: text/plain; charset=UTF-8

On 10/25/10, Enrico Scholz <enrico.scholz@sigma-chemnitz.de> wrote:
> Khem Raj <raj.khem@gmail.com> writes:
>
>>>> -    install -m 0755 src/cacaoh/.libs/cacaoh
>>>> ${STAGING_BINDIR}/cacaoh-cldc-${PV}
>>>> +    install -m 0755 src/cacaoh/cacaoh
>>>> ${STAGING_BINDIR}/cacaoh-cldc-${PV}
>>>
>>> This is the wrong way to install libtool binaries/libraries.  Please
>>> use 'libtool --mode=install install -m ...' (or the platform prefixed
>>> 'libtool' program).
>>
>> whats the difference ?
>
> * 'libtool --mode=install' is the documented way[1] to install libtool
>   binaries (in case of libraries, a 'libtool --mode=finish' might be
>   required too)

that should not be a problem here as its not a library and does not have .la
files to be fixed.

>
> * libtool creates sometimes a wrapper script for executables (e.g. when
>   they are linked against local libraries) and places the real executable
>   in .libs/.  Manually installing one of them is error prone and it might
>   break with other linker flags or libtool versions.
>

the binary in .libs do not exist so the link is final in this case.
but in any case If you can come up with a patch to install it using
libtool that would be nice.

>
> Enrico
>
> Footnotes:
> [1]  info libtool -> Installing libraries + Installing executables
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


-- 
-Khem


