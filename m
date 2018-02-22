Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-oi0-f49.google.com (mail-oi0-f49.google.com
	[209.85.218.49])
	by mail.openembedded.org (Postfix) with ESMTP id 8E6797870D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Feb 2018 09:40:58 +0000 (UTC)
Received: by mail-oi0-f49.google.com with SMTP id j79so3246961oib.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Feb 2018 01:41:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=wRmK+XiWA+cZGr+nkeZRovgfy/iLqpvsq6jE7I97P/o=;
	b=nnwYLZNSkE7kNHLDTnFa/Fyb9nmyxi48VvHjdJKDR9C9W3MNMMss3lwJG0QYwPhtfg
	7WYjbGrzPyW92gvZn/TLXS4JQ+wbNzsnMxMnA8/4OpzNZBLSz/bS/WC9FQ4oWrIMxpgw
	r3aI0vl7vMDj8HGpUVVe5UiaUCRxB0hypbYL6r1koFDd/SQ5oWcjR0sztXV6AySoerBf
	au99THyOJWKrfOntTWk3h2S6g6ZteePPnDLkVRJDVNc5rPs6Ehgn0LRzTqfgXbgsHsl+
	XiBkyJLynB4+JTK3l8jHMU4ThymO60lMoRRJ/oemot6N+VazH7VD7jCCC/xX5St2Ug+X
	kSkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=wRmK+XiWA+cZGr+nkeZRovgfy/iLqpvsq6jE7I97P/o=;
	b=haz0kYG6P8z40ymsOcglytQYsPTAONk/71kMDhuttlYjGwj8o7GU9MlZiQYdaj9uXa
	BZ0MspGlxX/1ipK/bcvGTDXezeuOuu0dUayIA4P8DrDG11Ap0kFoCiKjHSgkJwolYeZs
	2H+DZlYfC2V+mmgGqA7sFyt29k7YkXAIO9x1mQ6CK3SnX7lJNdiTz3yNRpnG+X8voUnn
	teEpbzABpYoLbiEC4w+P2JWiAHhnREgnnFM5T1Gfdm6cahvSSnIl1vcRd+hGDR7RBYsh
	exj1yARkES11HiLprQ57qJVogWlJSngu37OpaPJNf5BSZqnMvIWXH7UJHxLiQkz8J0RH
	q2IA==
X-Gm-Message-State: APf1xPBvZBC/D3mrx1c9UHACOa8w1Y/bt0+3B5ZwSDNLrzVuxarLH3Ek
	dCB36js2TFLWHbNRhVyc7u5UdQ8C
X-Google-Smtp-Source: AH8x224ID5z7r2L53WZEdohsI+iGjEIuv0Sd6/ZDW0E0Gn3jvSIQU6ipqc3I7ffY9guQWdUjZ12EuA==
X-Received: by 10.202.23.9 with SMTP id j9mr4239011oii.50.1519292459137;
	Thu, 22 Feb 2018 01:40:59 -0800 (PST)
Received: from mail-oi0-f43.google.com (mail-oi0-f43.google.com.
	[209.85.218.43])
	by smtp.gmail.com with ESMTPSA id u6sm4634318otb.69.2018.02.22.01.40.57
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 22 Feb 2018 01:40:57 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f43.google.com with SMTP id f186so3264525oig.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Feb 2018 01:40:57 -0800 (PST)
X-Received: by 10.202.215.132 with SMTP id o126mr4249195oig.56.1519292457327; 
	Thu, 22 Feb 2018 01:40:57 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.80.129 with HTTP; Thu, 22 Feb 2018 01:40:56 -0800 (PST)
In-Reply-To: <1519291653.6698.13.camel@intel.com>
References: <CAJTo0LYxqFFmUA9XcCO3_WO32NB4YLYy7pJK5ivyzPQYY5-hvQ@mail.gmail.com>
	<f808dcd5-82b9-b9c7-2c4a-b5b35b21fb42@gmail.com>
	<1519148811.24236.321.camel@linuxfoundation.org>
	<CANx9H-AioXLbdF=aZjuFSU3Ev3d131wFQbF1b-RH1PtMES3-3Q@mail.gmail.com>
	<f16ec80b-f2b9-c154-5262-ac4562da8cba@gmail.com>
	<1519152750.24236.330.camel@linuxfoundation.org>
	<CAP9ODKrxvspWQ9hXd7gWvGmTzTqHUYZyMejL=yVXHqG258ggkA@mail.gmail.com>
	<CAP9ODKo=z65e9_kj0fxpGRugsKTOun6mnTzdfpAbkmekKSKpCA@mail.gmail.com>
	<20180221135732.GI4311@bill-the-cat>
	<766040fa-b622-5610-4ba3-87d416c7ee4f@prevas.dk>
	<CACM3HyG=gT1anu6qh1jbm0+J=Tf15KNUUSN-pYLy_L1nJa7kEQ@mail.gmail.com>
	<1519291653.6698.13.camel@intel.com>
Date: Thu, 22 Feb 2018 06:40:56 -0300
X-Gmail-Original-Message-ID: <CAP9ODKrMG5Aw_4nBx6RjuZMpefDYabF9iK6tf4at4C+DcHHfWg@mail.gmail.com>
Message-ID: <CAP9ODKrMG5Aw_4nBx6RjuZMpefDYabF9iK6tf4at4C+DcHHfWg@mail.gmail.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: Splitting meta-oe?
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
X-List-Received-Date: Thu, 22 Feb 2018 09:40:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 22, 2018 at 6:27 AM, Patrick Ohly <patrick.ohly@intel.com> wrot=
e:
> On Thu, 2018-02-22 at 07:53 +0100, Jonas Bonn wrote:
>> On 21 February 2018 at 15:09, Martin Hundeb=C3=B8ll <mnhu@prevas.dk>
>> wrote:
>>
>> > Now that the discussion branched out a bit...
>> >
>> > We would like better support for this too. Our setup uses a
>> > "manifest"
>> > repository with git submodules to setup the layers:
>> >
>> > > yocto/
>> > >       meta-poky/
>> > >       meta-qt5/
>> > >       meta-foo/
>> > >       meta-bar/
>> > >       conf/
>> > >            bblayers.conf
>> > >            local.conf
>> > >       .gitmodules
>> >
>> > With this setup, customers simply need to clone our yocto repo
>> > recursively, run `yocto/meta-poky/oe-init-build-env yocto` and then
>> > `bitbake image-recipe`.
>> >
>> > But this is rather inflexible, as it requires the "yocto" folder to
>> > be the
>> > build folder to activate the config files...
>> >
>> > We looked into putting the configs in "meta-foo/conf/*.conf.sample"
>> > and
>> > using TEMPLATECONF, but the "oe-init-build-env" script is rather
>> > picky
>> > about poky being the "top" directory.
>> >
>> > I guess the oe-init-build-env script can be changed to look for
>> > .templateconf in any parent folder?
>>
>>
>> Putting together a deliverable setup that's easy for the customer to
>> get
>> started with is a bit tricky.  Here's the approach that's worked well
>> for
>> me:
>>
>> /myproject
>>     /env        <-- script
>>     /build
>>     /meta-myproject
>>     /bitbake
>>     /oe-core
>>     /meta-layer1
>>     /meta-layer2
>>
>> env, build, meta-myproject are part of the myproject repo, everything
>> else is a submodule.
>
> refkit used the same approach. One thing that I would prefer to do
> differently is the location of the submodule: having them in their own
> directory would make it more transparent which code is "external" and
> which is "internal".
>
>> "env" is a script containing just the following:
>> . ./oe-core/oe-init-build-env build/ bitbake/
>
> We ended up with a top-level "oe-init-build-env" wrapper script around
> the actual oe-core/oe-init-build-env. That way the repo could be used
> the same way as poky. The script sets TEMPLATECONF, so the usual local
> build setup happens based on refkit sample files.

We have a script set and a document which describes how we do it:

http://doc.ossystems.com.br/managing-platforms.html

The script sources can be seen at:

https://code.ossystems.com.br/gitweb?p=3Dossystems-yocto-base-scripts.git

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

