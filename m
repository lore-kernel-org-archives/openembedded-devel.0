Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PJJrk-0001JB-U9
	for openembedded-devel@lists.openembedded.org;
	Fri, 19 Nov 2010 06:50:37 +0100
Received: by gwaa11 with SMTP id a11so2552041gwa.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Nov 2010 21:49:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=BxNSBqeajCsvh8X7xinWwHWIivZjI0AMYghIfXyDS7Q=;
	b=j0j+ZTJq2y1DYCDezHhnecpEgeqt15zpZxP8nUeLe9A6VsqS7hqO/ReYPUv3jV5Lev
	rx/ZGD1by1D2N6m1M/VCfUrSa1doMfqro+S84NiAvvt2mSxq1v8FUoJrmGQ/q08C0Rc2
	pGcGyoURiyKjop3NEbTHDdbyYQdd/KsA4l6NU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=JT/+VXNN4jNi/o8DMPzJpKtlLFGlvRFbQGd9cYSmwjN8BZRzxggOKRCkvypUwL6WB6
	2vPuBCtNivbj0Jda0f8MEYqbNQd2lsyGATpYDZbk3rWrtapdxz3f4S/XWfT+3t7tXOGj
	QXfVWVtOGiN6MQ97dT357jtkFcyJ/XHP6K55c=
Received: by 10.90.99.8 with SMTP id w8mr2122651agb.0.1290145764242; Thu, 18
	Nov 2010 21:49:24 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.120.8 with HTTP; Thu, 18 Nov 2010 21:49:03 -0800 (PST)
In-Reply-To: <7461D474-7A94-4D7E-819F-4D8EFD5AD633@chumby.com>
References: <F8F69BD6-3BBB-4F09-B9E1-B172C31B4B96@chumby.com>
	<AANLkTikqYyVJbXE+1Ed5R8hqfybDUG264GaGPab=qy8b@mail.gmail.com>
	<7461D474-7A94-4D7E-819F-4D8EFD5AD633@chumby.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 18 Nov 2010 21:49:03 -0800
Message-ID: <AANLkTimpEJQk6qk3SmakXfY5EUg-K2YYqX6+TtNzb3Mh@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: emacs: Add emacs 23.2
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
X-List-Received-Date: Fri, 19 Nov 2010 05:50:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 18, 2010 at 8:56 PM, Sean Cross <sean@chumby.com> wrote:
>
> On 19-Nov-2010, at 12:42 PM, Khem Raj wrote:
>
>> On Thu, Nov 18, 2010 at 8:34 PM, Sean Cross <sean@chumby.com> wrote:
>>
>>>
>>> ---
>>> =C2=A0recipes/emacs/emacs_23.2.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 15 ++++
>>> =C2=A0recipes/emacs/files/emacs23.2-use-qemu.patch | =C2=A0102 ++++++++=
++++++++++++++++++
>>> =C2=A02 files changed, 117 insertions(+), 0 deletions(-)
>>> =C2=A0create mode 100644 recipes/emacs/emacs_23.2.bb
>>> =C2=A0create mode 100644 recipes/emacs/files/emacs23.2-use-qemu.patch
>>>
>>> diff --git a/recipes/emacs/emacs_23.2.bb b/recipes/emacs/emacs_23.2.bb
>>> new file mode 100644
>>> index 0000000..d57351a
>>> --- /dev/null
>>> +++ b/recipes/emacs/emacs_23.2.bb
>>> @@ -0,0 +1,15 @@
>>> +require emacs.inc
>>> +
>>> +EXTRA_OECONF =3D "--without-sound --without-x"
>>> +
>>> +#/!\warning untested recipe
>>> +DEFAULT_PREFERENCE =3D "-2"
>>
>> Why not make it default. ?
>
> Largely because I did a copy-and-paste from emacs_23.1.bb, which had the =
same setting.
>
> I'm ordinarily a vim user, but I had a request for emacs, so I got it bui=
lding. =C2=A0I haven't done any testing on it beyond building the package a=
nd running "emacs" on a target system. =C2=A0In that sense, 23.2 works much=
 better than 23.1.
>
> If you like, I can resubmit with that removed.

please do.

>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


