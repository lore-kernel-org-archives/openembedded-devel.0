Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PCyGi-0007V8-0a
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Nov 2010 18:34:05 +0100
Received: by gwaa11 with SMTP id a11so3516304gwa.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Nov 2010 10:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=Wkzb3POtZLklF1eeDCBd1F6ce7nZb6Svo4iZ9No8KMw=;
	b=Gc9HF+ZtDVxOq8uc7oWY1MNdpi2KvdHB8LXF1XVQ2iL2z3LML9yDULgmDafrFTuLFi
	QKS8zQ/Jsbf1yGyPAo+rMrEE87RHyoE5PFTiynWM6XUMrwRoiEwVA+xtObGmUY/cbxNZ
	PGc6/OkNzatMzN/8Dqq6NxdjeU3nIBKiimxTk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=D8D/1hl98Nk4X5cKOaGg235R85gEODH5RUydlB07BKInacQ9rhpHCRnVmTTYh8ogqx
	3zTXbGwPUn8wWdnyDC+fnuW+u3A59ACZjrXrdReZHjV+HqTPJRQOhNkyu4/+Dp/ds4cq
	lv/+3Z0xM2OCCNARthBqo0z+2CJuULJ8Vusxo=
Received: by 10.90.2.20 with SMTP id 20mr38683agb.69.1288632794585; Mon, 01
	Nov 2010 10:33:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.91.135.18 with HTTP; Mon, 1 Nov 2010 10:32:53 -0700 (PDT)
In-Reply-To: <AANLkTikQvYRyaMspRo9Skt_jmfNjz2MuOT+ff4wv=a82@mail.gmail.com>
References: <AANLkTin70=KBJDjW8K6ViS5X03ZaE92680oR88hhy9eK@mail.gmail.com>
	<AANLkTimEKL_6r_DZmq_W2i9eqHPgbRFc-oFMftKNFBJv@mail.gmail.com>
	<iakpd7$ja7$1@dough.gmane.org>
	<AANLkTikQvYRyaMspRo9Skt_jmfNjz2MuOT+ff4wv=a82@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 1 Nov 2010 10:32:53 -0700
Message-ID: <AANLkTi=zxQ1AxJ9chbFjLJzps1LB8RCyaNkJk5HApTZ=@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: testing branch 2010-10-29
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
X-List-Received-Date: Mon, 01 Nov 2010 17:34:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 1, 2010 at 9:19 AM, Cliff Brake <cliff.brake@gmail.com> wrote:
> On Sun, Oct 31, 2010 at 6:08 PM, Koen Kooi <k.kooi@student.utwente.nl> wr=
ote:
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> On 31-10-10 22:03, Yuri Bushmelev wrote:
>>> 2010/10/29 Cliff Brake <cliff.brake@gmail.com>:
>>>> testing-next is ready for clean builds. =C2=A0I'm still working on my
>>>> process to get this branch created automatically--thanks for your
>>>> patience.
>>>
>>> I have joined to testing initiative with:
>>>
>>> DISTROS=3D"angstrom-2008.1 minimal"
>>> MACHINES=3D"tosa collie akita efikamx ben-nanonote qemux86 qemuarm"
>>> IMAGES=3D"x11-image opie-image"
>>>
>>> Test-builder will build every image for every machine for every distro
>>> from list.
>>> Every build will be started with clean $TMPDIR for now at least
>>
>> I mentioned this at OEDEM as well, only doing clean builds hides upgrade
>> path type of bugs (e.g. libcdio5 -> libcdio). It would be nice if an
>> incremental build going from testing-prev to testing-next would be done
>> as well before tagging.
>
> Good idea--I agree this would be good to do where possible, as it
> would not cost much, and help us identify issues. =C2=A0The main focus of
> current testing is to identify good starting points for new users, or
> people just looking for a build-able snapshot, so clean builds are
> where we started. =C2=A0I'll add a note to the wiki to build incremental
> builds first if possible. =C2=A0Based on the feedback of people doing the
> actual testing work, perhaps it will make sense to do something else
> in the future.
>

Hi Cliff

We should add another column identifying the build is from clean tmp
or an incremental one

> Thanks,
> Cliff
>
> --
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> http://bec-systems.com
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


