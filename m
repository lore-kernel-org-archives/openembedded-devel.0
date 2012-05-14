Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fromm@dresearch-fe.de>) id 1STz8q-0005TG-2O
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 May 2012 19:33:04 +0200
Received: by lags15 with SMTP id s15so3502418lag.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 May 2012 10:23:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding:x-gm-message-state;
	bh=+uIXmKaUQq3Kscdt9UNEJh+AbHUiBvNFhHK3adUYk+w=;
	b=CTdM9/rnm7XfyYq3SBzNXD+GQARFafAbp8G+IgIZC5y5I8CjhAEjRVOrZ35zn43RQo
	ATtQ44y/tW5I5t5WJy+t6tDk8f5MDbQuHYaI7UDAgfjPZbEnv6UcWb3fdGMVQKFEa32F
	7q5kAJVA1t67IigNG42RLob8TI5UNx7NgbdVX+FyTLK+dikEhgbvSpIf5pxVywtWVTss
	RQykpN6St65pxAGCmxsOvHlhwFM7tC5c8Nrgo2Ne8XuU80vaCyR3AlY1HSAae9F0a2WK
	y/iwRp/BPMKWhwvnZ1qL2BaXoJssLcQ/hoJFhdzdosPb2lYxv6II3zZDutbh6t5xgzKC
	Ywlg==
MIME-Version: 1.0
Received: by 10.112.27.228 with SMTP id w4mr4039419lbg.5.1337016184823; Mon,
	14 May 2012 10:23:04 -0700 (PDT)
Received: by 10.112.10.201 with HTTP; Mon, 14 May 2012 10:23:04 -0700 (PDT)
In-Reply-To: <CAF6bG8cN5ecwtehSBxy5M1JvR+Fbo_=q7mm7O+AJcz-9ZU79yw@mail.gmail.com>
References: <CADZ6=auhe9BbFPd-F-QNLcTksuWzZdY8tUb31P2JVm38LDjCsw@mail.gmail.com>
	<CAF6bG8cN5ecwtehSBxy5M1JvR+Fbo_=q7mm7O+AJcz-9ZU79yw@mail.gmail.com>
Date: Mon, 14 May 2012 19:23:04 +0200
Message-ID: <CADZ6=au=JZVMD9_PNbcbSmv6JzxtZWeQD6suneG=fk9Ks4pHCg@mail.gmail.com>
From: Thilo Fromm <fromm@dresearch-fe.de>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQlV1tZYe0StTTzBJAd3POAAFFmZUtTpzc/7IyaxxcNnmjkalsCvan5YJkrac+bdjdKOatvL
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
X-List-Received-Date: Mon, 14 May 2012 17:33:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello,

>>>> Take meta-openembedded/meta-oe/recipes-core/udev/udev_182.bb, for
>>>> example. The build predictably fails with
>>>>
>>>> checking for KMOD... no
>>>> configure: error: Package requirements (libkmod >=3D 5) were not met:
>>>>
>>>> No package 'libkmod' found
>>>>
>>>> So what's the right thing do do here? Use a different package install
>>>> path for libkmod, or point udev to /lib/pkgconfig by extending its
>>>> PKG_CONFIG_PATH correspondingly?
>>>
>>> I have some build failure.
>>
>> Me too.
>
> =C2=A0Worked for me until I enabled meta-openembedded/meta-oe layer for
> unrelated reason. Wouldn't behavior meet least-surprise goals better
> if openembedded-core version of udev would be the default one
> regardless of what additional layers one enables/disables, and meta-oe
> version to be the one one has to request explicitly?

openembedded-core only features udev-164 (vs. -182 in meta-oe). -164
in oe-core does not use libkmod, so there's no issue with libkmod in
oe-core. It's no surprise that it "worked for you", you were building
anicent tools.

Try building any tool in oe-core which requires libkmod (and therefore
will go look for libkmod's pkgconf file). If there is such a thing, it
will fail to build. Because kmod installs it .pc file to the wrong
place.

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


