Received: from mail-yx0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1NUR11-0006fh-2k
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Jan 2010 21:37:34 +0100
Received: by yxe5 with SMTP id 5so16438483yxe.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Jan 2010 12:35:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=Xyx7mXt/L9RzdnAmIKVWMT/QQ1rp+KD3vvS+BNv1Xds=;
	b=JxP5Ku2E+psqDb24eLq24GYdOolzPiMfIlqzmJsVc7QiT2th+e2fEWGzmc+qc+Yeil
	nSnHF1EaUhfs6+KuNgwv82/vCjhqekjHhGVdeSInahlOoXRpU/sqQSF/A98CZ+CrBLyy
	+ofixx9uDuGEcUJ8CPoUOK4q2A3T9pE+uUx9A=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=Jc51p437ffDuB0LO7vqH4GirF99A9CWG0ENoT87pomB4W8CL6VCPb5F/a//PYGjvmJ
	GCnSl9HD0hPnGvUsVmB2oHssubWXb6WI5VO9r7VlAilp0/pbU+jTA6tBvJ+PLgp81aCn
	IEzDivcfkm0WeQFzEGckNBwsofFVmJPYtqe3c=
MIME-Version: 1.0
Received: by 10.101.138.5 with SMTP id q5mr7583824ann.158.1263242121653; Mon, 
	11 Jan 2010 12:35:21 -0800 (PST)
In-Reply-To: <1263236290.22868.33.camel@andromeda>
References: <18e217241001110959k4d346f05j7e00c36dfd18021d@mail.gmail.com>
	<1263236290.22868.33.camel@andromeda>
Date: Mon, 11 Jan 2010 21:35:21 +0100
Message-ID: <ac9c93b11001111235t5eac350csee3fe9b4621d02b4@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.210.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: dependencies between packages
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
X-List-Received-Date: Mon, 11 Jan 2010 20:37:34 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/1/11 Michael 'Mickey' Lauer <mickey@vanille-media.de>:
> Am Montag, den 11.01.2010, 09:59 -0800 schrieb C Michael Sundius:
>> Some of our developers have been running into this problem and I'm wonde=
ring
>> how others deal with it.
>>
>> It seems if we have a recipe, (A) that depends upon header files staged =
by
>> another recipe (B) then:
>>
>> 1) if the source for recipe (B) is modified and recompiled with:
>>
>> =A0 =A0 bitbake -f -c compile B
>> =A0 =A0 bitbake B,
>>
>> I would expect that when recipe A is run:
>>
>> =A0 =A0bitbake A
>>
>> It too would be recompiled, however that does not seem to be the case. I=
n
>> fact even if recipe B is cleaned up:
>>
>> =A0 =A0 bitbake -c clean B
>>
>> and then we run recipe A
>>
>> =A0 =A0 bitbake A
>>
>> only recipe B is run and recipe A is NOT rerun! the dependency is satisf=
ied
>> by rerunning recipe B and then bitbake stops..
>>
>> is this expected behaviour? Is there away to force rerunning of recipes =
that
>> would be "out of date" due to one of its dependent recipes being return =
and
>> re-staging (potentially) new headers and libraries?
>
> It is indeed expected behaviour, since there is no code in Bitbake that
> would add any dependending packages and add them to your build.
>
> Frans' suggestion is a workaround, however that only works with targets
> that already include all the depending packages, usually a 'task',
> 'feed', or 'image' target.
>
> I would welcome such a mode that automatically rebuilds all depending
> packages, however as this could dramatically increase build time it
> would need to be optional. BitBake hackers, what do you think?
>

Let's first start with a mechanism that lists the users of a package.

Frans


