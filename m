Return-Path: <williamdelacre@gmail.com>
Received: from mail-ua0-f178.google.com (mail-ua0-f178.google.com
	[209.85.217.178])
	by mail.openembedded.org (Postfix) with ESMTP id 343D1747EC
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  4 Aug 2018 14:19:59 +0000 (UTC)
Received: by mail-ua0-f178.google.com with SMTP id h1-v6so7526105uao.8
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 04 Aug 2018 07:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=xvZuER9gNfNxVq6wni/QszBAvgT24NLvULPo3/CXlRI=;
	b=lANTFQka6g0b5ykhEV49g67ip41utx/VwfxfUFo+PQ5Ubfrl2C7QNW4C9+yYT5rWNG
	ZbnBuGJdp7FvF8f5vF/26bCKhiP4a1RGt/6FJ1Z7eEApK7sw44LtD/9GcN5I3ueFF6mC
	u3cEw6Ua7GLYlCCQzA/TCS2YSiD70ohuMPB/n+Qr3D1nP61YkV/hnIeYt82ktzEfLi8S
	/DV5grJHRpcWYzVs62mRBWiAeWNrLHM5nxrdL5XL09FBRbfSWj8/XhtTV+fonyeKD74p
	in2OjTEMMFvjdoCyGdEiL6oLnzeHbti0UQ0j3YTDPT0/jqFNxx0L+RCIfskRfgnhiG0j
	4etA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=xvZuER9gNfNxVq6wni/QszBAvgT24NLvULPo3/CXlRI=;
	b=NxUz5RAx8GsbZ7D+egemXJqXbmz1cJVYeE/l8cTNkFZCQ5rurBCubjkRpwRxvdJHgR
	azK8xcg52JXi4m8yTseolZmDZMYJmBYeOs6+UXAOXSW8qvd3xIpzmA6Wl3Vz5aEz1KH7
	K8XWXHOMUl6SGr9N2Nb7APhdU2nLSSeCcyNrgHuDZTWQIzeYIg1OlxnOvYPMz9z3Mnh0
	YERYNkb1bWIjXi2RJahl9A5h74yIEbU4TVA2DwQflS/fiPbLJZvTHXzmFmcJzhvaPom9
	g+FrLp/RpUXY54pQAmYd6y1rKJ4jm3GMPt6k9kHrats2Pl68PFuh1S0+nyvCt/7O+EK5
	B12g==
X-Gm-Message-State: AOUpUlFvw9Boz3GQS10cxZ0ZOAcHilo4xSeLAAp6CzIRRB0Fu4m/B0cT
	8Id4VxvMj5/TGfLoMsfkVJVbG8o3VeIagQJm8+Y=
X-Google-Smtp-Source: AAOMgpdfKuIb7iFKJwJ47S/0xhKE9uQuAvymGqWizcaXPDQLG4k4Ce5u63TY3dxrwVO+8W7LYO+Y86ba0R079kXcOH4=
X-Received: by 2002:ab0:1861:: with SMTP id
	j33-v6mr5685457uag.119.1533392400099; 
	Sat, 04 Aug 2018 07:20:00 -0700 (PDT)
MIME-Version: 1.0
References: <CAOnRZEJX6vtCikSJK4py2y3r3J-N3fT_tA5FLFYFyPF6vrczjw@mail.gmail.com>
	<1533334371.30932.14.camel@gmail.com>
	<CAOnRZELTAgoQ4yMaB8L4vmo8JV6Lx-HWfGCAORk=Rm3Djn0aaw@mail.gmail.com>
In-Reply-To: <CAOnRZELTAgoQ4yMaB8L4vmo8JV6Lx-HWfGCAORk=Rm3Djn0aaw@mail.gmail.com>
From: William Delacre <williamdelacre@gmail.com>
Date: Sat, 4 Aug 2018 16:19:49 +0200
Message-ID: <CAOnRZE+mRfYDwY7P3Dhs9-RcMZRH8QH9-2MQzKbVaxUBNpdeRA@mail.gmail.com>
To: Max Krummenacher <max.oss.09@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: Actually installed packages
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 04 Aug 2018 14:19:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sorry, I just have a last question about those packages.
In bitbake.conf, you can find this :

PACKAGE_BEFORE_PN ?=3D ""
PACKAGES =3D "${PN}-dbg ${PN}-staticdev ${PN}-dev ${PN}-doc ${PN}-locale
${PACKAGE_BEFORE_PN} ${PN}"

This means that all those packages (whatever the recipe is) will be
automatically installed if the PACKAGES variable is not redefined in the
recipe (so if '=3D' is used and not '+=3D' or *append) *So if I don't want
those packages for one of my software/library, I have to explicitely
specify it in the recipe ?

Thanks :-)

William

Le sam. 4 ao=C3=BBt 2018 =C3=A0 14:12, William Delacre <williamdelacre@gmai=
l.com> a
=C3=A9crit :

>
>
> Le sam. 4 ao=C3=BBt 2018 =C3=A0 00:12, Max Krummenacher <max.oss.09@gmail=
.com> a
> =C3=A9crit :
>
>> Hi
>>
>> > What=E2=80=99s the difference between the build/buildhistory/packages =
content
>> (all
>> > the packages found here) and the installed-packages.txt file in
>> > /buildhistory/images/...... ?
>> >
>> > I can see packages in first one which are not included in
>> > installed-packages.txt
>>
>> A recipe can provide several packages, usually one with the same
>> name as the recipe name, then the -dev, -dbg, -doc ... packages,
>> but a lot of recipes provide additional packages.
>>
>> An image recipe defines what packages need to be installed in an
>> image.
>>
>> Even if your image requires only a part of the packages that a
>> recipe provides, all packages will be built and will be visible
>> in build/buildhistory/packages leading to what you describe above.
>>
>> On top of that, if you built an image which contains different
>> packages before or bitbaked single recipes then those would also
>> be seen in the build/buildhistory/packages tree.
>>
>> Max
>
>
> That=E2=80=99s really clear ! All I needed ! Thanks a lot :-)
>
>>
>>
>>

