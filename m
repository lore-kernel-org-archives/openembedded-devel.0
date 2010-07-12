Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OYP0w-0004Po-53
	for openembedded-devel@lists.openembedded.org;
	Mon, 12 Jul 2010 21:50:13 +0200
Received: by iwn34 with SMTP id 34so5076494iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Jul 2010 12:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=L04/DNFFAHo1uCkWqcUFl45s8yNVVAKsDZa+z0SDfQw=;
	b=r3TeseIO7+igOQs6Lzxd6G7GL2zUf1PTl3PxiyRXlcIgKeFXQJ9yxmBqyjtolS1bJp
	2z90w6dZdFhzcK6Hrrb+GtFdRufip9cQu8VPyg1TRtTW/yBfFSNxIJfbrsb+oHida3jU
	IaiWDuOWC3NglzMw6PgEjRs2bGzxkc2+p52Go=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=FqWlktoGxlMtzIekuS11rwmSeG83bHJeg5leJ3aHeaDnPtWzBz1op5i0OfcbVJuxSg
	Ah1sfsKcgEjQLx1w2ahaRpBUSzOg1OPy8sQBUyibrLFcaYVQyNDVx/utjRWVFLnUP/uG
	frdAW5B0MSiMUgRbQ/15Tw8pgSV9PVd92+fVs=
Received: by 10.231.80.213 with SMTP id u21mr13281341ibk.173.1278963713283; 
	Mon, 12 Jul 2010 12:41:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.10.196 with HTTP; Mon, 12 Jul 2010 12:41:33 -0700 (PDT)
In-Reply-To: <201007122321.48994.roman@khimov.ru>
References: <201007071352.09254.khimov@altell.ru>
	<1278499134-24718-1-git-send-email-khimov@altell.ru> 
	<AANLkTimzHYI6PCsDfbDM2v0zpj1ovyTZ8H-43tvJIluv@mail.gmail.com> 
	<201007122321.48994.roman@khimov.ru>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 12 Jul 2010 12:41:33 -0700
Message-ID: <AANLkTim3XEKPA83SRfFLHDOu0ltIAfDKT8hWZbARxmi4@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] busybox: add suport for FEATURE_INDIVIDUAL setup
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
X-List-Received-Date: Mon, 12 Jul 2010 19:50:14 -0000
Content-Type: text/plain; charset=KOI8-R
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 12, 2010 at 12:21 PM, Roman I Khimov <roman@khimov.ru> wrote:
> =F7 =D3=CF=CF=C2=DD=C5=CE=C9=C9 =CF=D4 =F0=CF=CE=C5=C4=C5=CC=D8=CE=C9=CB =
12 =C9=C0=CC=D1 2010 22:34:48 =C1=D7=D4=CF=D2 Khem Raj =CE=C1=D0=C9=D3=C1=
=CC:
>> On Wed, Jul 7, 2010 at 3:38 AM, Roman I Khimov <khimov@altell.ru> wrote:
>> > Where each applet is installed as a tiny binary linked against shared
>> > libbusybox.
>>
>> may be it should be a DISTRO_FEATURE in OE
>
> Well, I don't think so. First, it doesn't change anything functional, onl=
y the
> way busybox is linked/installed/packaged and second is that it only affec=
ts
> one package, so if distro wants that, I think it should maintain its own
> defconfig (at least four distros do that already

ok in that case, it seems ok. This makes it a distro feature.

 and IMO busybox is the
> package you want to tune for your specific needs). Or the distro itself m=
ay
> choose not to use busybox at all so such FEATURE would make no sense in t=
hat
> case.
>
> I view FEATUREs as a way to make distro-global configuration, ipv6 is pro=
bably
> one of the best examples as it potentially affects many packages.
> FEATURE_INDIVIDUAL is completely busybox-specific.

if a distro does not support shared libraries then this feature is a proble=
m.
but then if we tune it in busybox config then even that can be taken care o=
f
so seems fine.

>
> --
> =9Ahttp://roman.khimov.ru
> mailto: roman@khimov.ru
> gpg --keyserver hkp://subkeys.pgp.net --recv-keys 0xE5E055C3
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>


