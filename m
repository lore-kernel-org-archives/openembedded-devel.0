Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1PSuWD-0002KW-Iy
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Dec 2010 17:47:58 +0100
Received: by wyb40 with SMTP id 40so1706967wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Dec 2010 08:46:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type:content-transfer-encoding;
	bh=J85rEaWHz8cjAHv0aGVU53yYIhElebR0+XG7Iz2KaXo=;
	b=xgXzWnGSMDeagCjlDeKxYwo3w+hXdsTFhzLpWb62GOHCMVj6IOeDCVbC5AhWnSsgvK
	itN6E+aLg3V2jeg7WpsJfCYcS2hMRrnpUId/N6UrU3EDvFW5TroenxbUPV+bAoInMm75
	rHDSw88dq+K1DBpEyXcEL7/SHQ7hvlrOn7h9g=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	b=ASdFw7gDp8jgfGZjAxP7EwBXzkTXKQ/j+JIICGAlKJyuT/+CcOsHZhV07RvKy1qm9B
	xNubZDyQ29mSunBuYG4scH63HUIblFYDZTUXdfaeqZXP/a8vZu6ceg1COQ35uznVoIKy
	RUg8FcbWI/HqGPxH2M3lwuImmzqO6BZaKPPDY=
Received: by 10.216.150.134 with SMTP id z6mr349100wej.27.1292431579425; Wed,
	15 Dec 2010 08:46:19 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.67.67 with HTTP; Wed, 15 Dec 2010 08:45:59 -0800 (PST)
In-Reply-To: <4D08F019.1010701@opendreambox.org>
References: <4D065431.6080304@dell.com>
	<AANLkTin2DnrgjhA4Qt63+pyfhPP=rLcs94CL_gbOeBGC@mail.gmail.com>
	<4D079B88.9010503@dell.com> <4D07A19D.8090602@mentor.com>
	<AANLkTinBqEGcOWys5+C3y8bGo0AMEiiOa8QTfgTxOgQ-@mail.gmail.com>
	<AANLkTin3EjUBP6Q84g-3B=rgO7Z_04oTUYqFN8hcR3a-@mail.gmail.com>
	<4D08F019.1010701@opendreambox.org>
From: Chris Larson <clarson@kergoth.com>
Date: Wed, 15 Dec 2010 09:45:59 -0700
X-Google-Sender-Auth: KWp2bt7k9kyOEhHebjZmmZ7JbH0
Message-ID: <AANLkTinkKC3rJ31FdgwWgLOKn4O7HTKTiGUwCoyfdZs2@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] eglibc: use HTTP for svn checkout
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
X-List-Received-Date: Wed, 15 Dec 2010 16:47:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 15, 2010 at 9:43 AM, Andreas Oberritter
<obi@opendreambox.org> wrote:
> On 12/15/2010 05:35 PM, Chris Larson wrote:
>> On Tue, Dec 14, 2010 at 10:11 AM, Khem Raj <raj.khem@gmail.com> wrote:
>>>> Note that if you use a mirror site with the SVN checkout archive in it=
, you
>>>> won't try and do the fetch at all. =C2=A0This may or may not be applic=
able to
>>>> your case. =C2=A0For your case I think what we really want is a way to=
 globally
>>>> toggle the svn protocol argument.
>>>
>>> yes that would be something more useful. I guess we could add it to
>>> all SCM fetching recipes.
>>
>> I wonder if the PREMIRRORS/MIRRORS handling is smart enough to let us
>> use its regex for the components to replace protocol=3D in the url
>> parameters.
>
> This won't suffice, because svn may have different URLs for svn and
> http, like in the discussed patch (branches vs. svn/branches):
>
> -SRC_URI =3D
> "svn://svn.eglibc.org/branches;module=3D${EGLIBC_BRANCH};proto=3Dsvn
>
> \
> +SRC_URI =3D
> "svn://svn.eglibc.org/svn/branches;module=3D${EGLIBC_BRANCH};proto=3Dhttp
>
> \

And of course, changes to the url can also be done via PREMIRRORS.
You'd just have the first one a specific entry to redirect eglibc, and
the second a fallback for non-specific.  Of course, there's nothing
wrong with using bbappend/amend.inc for this, just another
possibility.
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


