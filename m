Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fromm@dresearch-fe.de>) id 1SUDOf-0001Ri-5j
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 May 2012 10:46:21 +0200
Received: by lbol5 with SMTP id l5so3966240lbo.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 May 2012 01:36:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding:x-gm-message-state;
	bh=mfLGCZWZciQ81VKn1F628AynCe8sk+juDh11QuKFetw=;
	b=mcdGUvRNkv7DnH4ZyUfT1H1IRSBN24kXakpYhqfIYh0OuW6itJkkwIukfTK2eDPjts
	LGKj+kDi8XVj5epUGOf4jCMOS1hYM0E1Z4XntELXWIDAmDmihGhGqMuN3/Q4ImXTAzVC
	IioE8p0EwcPMLrIxiU0sOiYvkqG8NZDuOtUQaYfL7TzLZ1mepCrpwJkTUvRdVmldxxDi
	DAoxDbgWgPQKdRKySN00L4zCB5Cdk5nDA3dHb2KtPR7942Fvb/PORsZL4yuY/QfEfKw8
	ML9c5dL1dqy9ZTDMdauIKLKKCBxQe0ZULEqNlBv00QUN+hyntbqY66Sd/C4OWoJyIeDd
	/+oQ==
MIME-Version: 1.0
Received: by 10.112.86.71 with SMTP id n7mr4937655lbz.33.1337070981202; Tue,
	15 May 2012 01:36:21 -0700 (PDT)
Received: by 10.112.10.201 with HTTP; Tue, 15 May 2012 01:36:21 -0700 (PDT)
In-Reply-To: <CAF6bG8fEnVNtkEO9iHtrpB822w-SNWzTd-4WSTr_SgNqNpHTtg@mail.gmail.com>
References: <CADZ6=auhe9BbFPd-F-QNLcTksuWzZdY8tUb31P2JVm38LDjCsw@mail.gmail.com>
	<CAF6bG8cN5ecwtehSBxy5M1JvR+Fbo_=q7mm7O+AJcz-9ZU79yw@mail.gmail.com>
	<CADZ6=au=JZVMD9_PNbcbSmv6JzxtZWeQD6suneG=fk9Ks4pHCg@mail.gmail.com>
	<CAF6bG8fEnVNtkEO9iHtrpB822w-SNWzTd-4WSTr_SgNqNpHTtg@mail.gmail.com>
Date: Tue, 15 May 2012 10:36:21 +0200
Message-ID: <CADZ6=atHgy6XtoO0=ju=5kb-XG7+BhtWcFCRU_TrEHNQvLN7iw@mail.gmail.com>
From: Thilo Fromm <fromm@dresearch-fe.de>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQl/2WV99vzh2lLUAPVhakaxzlAKW8Te/XIO9FTDPj4b47U/xux5/plTlKY8yRIlu0Vw+Iqd
Subject: Re: New kmod {libdir} breaks udev, systemd build
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
X-List-Received-Date: Tue, 15 May 2012 08:46:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello,

>> openembedded-core only features udev-164 (vs. -182 in meta-oe). -164
>> in oe-core does not use libkmod, so there's no issue with libkmod in
>> oe-core. It's no surprise that it "worked for you", you were building
>> anicent tools.
>
> =C2=A0I know. I were asking why versions are setup like this. If -182 mak=
es
> more sensible default, why it's not one in -core. My main point was
> that seemingly unrelated change to build xterm to my image (requiring
> meta-oe layer) caused *default* udev version to change (I'm not
> setting PREFERRED_VERSION anywhere). Shouldn't -core versions be the
> default ones, that one may override?

I don't know; this is more of a political decision. If oe-core should
be the default then oe-core should always provide the most current
version, imho. But I'm just a bystander anyways; I think this has to
be resolved between oe-core, meta-oe, and Angstrom (which we happen to
use, too).

Regards,
Thilo

--=20
Dipl.-Ing (FH) Thilo Fromm, MSc., Embedded Systems Architect
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, D-10319 Berlin, Germany
Tel: +49 (30) 515 932 228 =C2=A0 mailto:fromm@dresearch-fe.de
Fax: +49 (30) 515 932 77 =C2=A0 =C2=A0http://www.dresearch.de
Amtsgericht: Berlin Charlottenburg, HRB 130120 B
Ust.-IDNr. DE273952058
Gesch=C3=A4ftsf=C3=BChrer: Dr. M. Weber, W. M=C3=B6gle


