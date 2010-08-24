Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1Oo0px-0008Nd-Cw
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 Aug 2010 23:15:29 +0200
Received: by ewy7 with SMTP id 7so3731922ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Aug 2010 14:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=XAyRXXoWmUwxUFzZl0ih+q4r7S/81VB60zMXzLzZiY0=;
	b=Z3MnpxWpu6Y9MXb9NtrSoNyFZ1VUWb3TavQvLRPGqiclxlUdgQfOMbAH+qdjQfAg1a
	SJ3iG1tq/3cx/TgQoaUPgTKZaGr2AAxJIxuWChDCp45JUq5ZDOxdM/6Kdwke6loLAjq8
	RJw4c/VIMDb5wnd6ooptDcGq8qU49Yi73pzN0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=v62vOJsGlONfoV3kTBfXj9HxklKprN0/ZQQNluWaoPAm8VRaHnfBp47pbVNVWGPR2U
	3roa215cF2VOHgwNIid+N1LcVAMbh80Tw6MlQORk5L6NokqFIU6makLMkcSvFZk0oaws
	BbcSufjwWtHEDJQxDyyOU4cI/VcwONmf1+0eQ=
Received: by 10.216.187.130 with SMTP id y2mr1296159wem.60.1282684490369; Tue,
	24 Aug 2010 14:14:50 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.237.166 with HTTP; Tue, 24 Aug 2010 14:14:30 -0700 (PDT)
In-Reply-To: <1282674796964487500@rkmorris.us>
References: <1282619507633564500@rkmorris.us>
	<AANLkTim+-=cuW25MrceDNWwExvw+gHcs=jdaw8LCo17L@mail.gmail.com>
	<1282668095790087500@rkmorris.us>
	<AANLkTimHMk2JCmk-f7v+f20oOCLimFmvmMOXHNAXWbZV@mail.gmail.com>
	<1282674796964487500@rkmorris.us>
From: Chris Larson <clarson@kergoth.com>
Date: Tue, 24 Aug 2010 14:14:30 -0700
X-Google-Sender-Auth: MVxG1OnAB5FncVkfB9fFGhaNW6g
Message-ID: <AANLkTik2UkjmyPfZHG4k3pOgjYYk8zn-72=WcemM8GQP@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.215.47
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Build Directory inside conf
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
X-List-Received-Date: Tue, 24 Aug 2010 21:15:29 -0000
Content-Type: text/plain; charset=UTF-8

No, the existence of conf/build/ has nothing to do with what you're doing,
and doesn't require any setup on your part.  OE check uname information to
learn what it's running on automatically.

On Tue, Aug 24, 2010 at 11:33 AM, <openembedded@rkmorris.us> wrote:

> That makes sense - thanks!
> One more question then, as this isn't mentioned in the "Getting Started"
> section of the Wiki - do I need to configure this? I ask because I'm having
> issues with my build results right now (kernel is fine, initrd is hanging).
> Thanks again,... Russell
>
> On Tue, Aug 24, 2010 01:21  PM, Chris Larson <clarson@kergoth.com> wrote:
> > On Tue, Aug 24, 2010 at 9:41 AM, <openembedded@rkmorris.us> wrote:
> >
> > > Hi,
> > > Maybe we're not talking about the same thing ... but to confirm -
> inside
> > > the conf directory there is a build directory, with the file "Power
> > > Macintosh-darwin.conf" inside. Is this really supposed to be part of
> the
> > > "official" build?
> >
> >
> > No, we're talking about exactly the same thing.  "build" in this context
> is
> > referring to the *build machine*, not a "build" as in the output from
> > running bitbake.
> > --
> > Christopher Larson
> > clarson at kergoth dot com
> > Founder - BitBake, OpenEmbedded, OpenZaurus
> > Maintainer - Tslib
> > Senior Software Engineer, Mentor Graphics
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> >
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

