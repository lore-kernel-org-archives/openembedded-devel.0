Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OxnyO-0004wh-Vx
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Sep 2010 23:32:29 +0200
Received: by fxm17 with SMTP id 17so1141781fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Sep 2010 14:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=3q0gS/uDhmwt0akOE5EsTTmzMMhVFyHsqFX1kXcWvuk=;
	b=oDdT/f++8dzL9qHJs5UWy7kJ0Bn5yoN8kdmOMX3vs+tkcIsgWVDYzvvJ/e65BU6IPe
	deNiAftskSmCoaqGKNaPrdwpJoSSKfiNUwEPkb7dUxT8PXcz19Qz5UJPQDbv/q3mFfxf
	0yq5/LbuiRlkhRyNpS1lGm99R7qtPe7yCMWeA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=weuVSW1FAHY3fCiAJxXIejeP6cIcuIlMdLJex7P2JhCdiUs/EdFXYn4D1KIL5nWqYR
	XvE4U1Zh3NUgFbzyjALjyObMmHu6Q+RgP7puQofWJ4EZwZRy2XBxauZYzzdoIWeDbVZt
	B2dTDwvMbNdKAdd+hIyXvE+Sj70bq58741qIc=
Received: by 10.102.228.12 with SMTP id a12mr593584muh.41.1285018346075; Mon,
	20 Sep 2010 14:32:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.107.20 with HTTP; Mon, 20 Sep 2010 14:32:06 -0700 (PDT)
In-Reply-To: <4C97CF65.7010409@mentor.com>
References: <E1OxTYC-0004Sl-3k@melo.openembedded.org>
	<4C97723F.7010401@mentor.com>
	<AANLkTimSpV1UQgFg5-PgvhwhmGj-NZ-QMg-wOkLtzZtw@mail.gmail.com>
	<AANLkTiktTQbys+N_qKijzDf6EASk1kDTO-F5u2=Hy9xh@mail.gmail.com>
	<4C97CF65.7010409@mentor.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 20 Sep 2010 14:32:06 -0700
Message-ID: <AANLkTimwC0eECkS0Ocs_b=ak0_pt+dkt0G2QRPPwn-fA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [oe-commits] Khem Raj : iphone: Exclude from world.
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
X-List-Received-Date: Mon, 20 Sep 2010 21:32:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 20, 2010 at 2:17 PM, Tom Rini <tom_rini@mentor.com> wrote:
> Frans Meulenbroeks wrote:
>>
>> 2010/9/20 Khem Raj <raj.khem@gmail.com>:
>>>
>>> On Mon, Sep 20, 2010 at 7:39 AM, Tom Rini <tom_rini@mentor.com> wrote:
>>>>
>>>> git version control wrote:
>>>>>
>>>>> Module: openembedded.git
>>>>> Branch: master
>>>>> Commit: 0319f8878547c6e8a78373cfc86a85cea60450ae
>>>>> URL:
>>>>>
>>>>> =C2=A0http://gitweb.openembedded.net/?p=3Dopenembedded.git&a=3Dcommit=
;h=3D0319f8878547c6e8a78373cfc86a85cea60450ae
>>>>>
>>>>> Author: Khem Raj <raj.khem@gmail.com>
>>>>> Date: =C2=A0 Sun Sep 19 16:38:38 2010 -0700
>>>>>
>>>>> iphone: Exclude from world.
>>>>>
>>>>> apple-csu overwrites the C startup files and nothing works after that
>>>>> we can not select them with normal linux toolchain being staged and
>>>>> used
>>>>>
>>>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>>>
>>>> Shouldn't this be a COMPATIBLE_something case? =C2=A0You'd want this f=
or
>>>> world if
>>>> that was what you were targeting... no?
>>>
>>> yes. Actually its a distro iphone-compat that can be used to
>>> differentiate. but then will COMPATIBLE_<distro> work ?
>>>
>>
>> Hm. I'm inclined to say that it is not distro specific (unless you see
>> iphone as a distro).
>> I can imagine different distro's running on iphone (ok maybe not *that*
>> likely).
>> For me iphone is a machine.
>
> I bet the iphone distro conf really only works with the iphone machine co=
nf,
> so COMPATIBLE_MACHINE is probably fine :)

yes thats right. I will do something on these lines.

>
> --
> Tom Rini
> Mentor Graphics Corporation
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



--=20
-Khem


