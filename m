Received: from mail-gh0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Se0Ws-0000Ou-TS
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Jun 2012 11:03:20 +0200
Received: by ghbz2 with SMTP id z2so2135087ghb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Jun 2012 01:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=KwstgK9MqiNfJWMpZw/czMgKx4ED903bHgKdveSSXgY=;
	b=VMvimqkxdILrg3uMCFgmlxMR+ekttJqEqazZ0m7Eiw+0S4MPXHZXKuainlMBn6bCXi
	JOzA26DO6v2x/p130aToo+R6tHELavgJJgGL3xYsrDLvgFX/eOvzACoY5S0s3lJb2JQS
	gHYfA6DSnAO1DR9g1ZO5l/GwQ9tw+a8a4f4BHUgr7pwazbayuSYAScfrntVYIe+oG018
	pRHcQNdQ3fERUN4VoZOYyeFX3IyVd5TjWkffmpX48UfBJFbQuUG9eZIsKPyZMtB9TOoe
	49P4mWtWGymW9U1MaQ/gzuwl4yIZWwFOd9bV6MBs2d+BWyiOEqsQjApjooVhRe9EfI8o
	GtNw==
MIME-Version: 1.0
Received: by 10.50.163.99 with SMTP id yh3mr5727196igb.53.1339404765103; Mon,
	11 Jun 2012 01:52:45 -0700 (PDT)
Received: by 10.64.18.10 with HTTP; Mon, 11 Jun 2012 01:52:45 -0700 (PDT)
In-Reply-To: <CAMKF1sqZt_v_kJi9NDQt3LQDqMevGZP8_2hGFbRYE6k--DMbxg@mail.gmail.com>
References: <1339364820-2880-1-git-send-email-schnitzeltony@googlemail.com>
	<1339364820-2880-4-git-send-email-schnitzeltony@googlemail.com>
	<CAMKF1sqZt_v_kJi9NDQt3LQDqMevGZP8_2hGFbRYE6k--DMbxg@mail.gmail.com>
Date: Mon, 11 Jun 2012 10:52:45 +0200
Message-ID: <CALbNGRS8ghCzOE6UFW9gKk+Ry8cRiE9nHN9e4-ZuJzqKxrWgwg@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [RFC, meta-oe 03/27] layer.conf/README: search directory structure for bbappends changed
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
X-List-Received-Date: Mon, 11 Jun 2012 09:03:20 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 11, 2012 at 1:12 AM, Khem Raj <raj.khem@gmail.com> wrote:
> On Sun, Jun 10, 2012 at 2:46 PM, Andreas M=FCller
> <schnitzeltony@googlemail.com> wrote:
>> -BBFILES +=3D "${LAYERDIR}/recipes-*/*/*.bb ${LAYERDIR}/recipes-*/*/*.bb=
append"
>> +BBFILES +=3D "${LAYERDIR}/recipes-*/*/*.bb ${LAYERDIR}/*/recipes-*/*/*.=
bbappend"
>
> why only for bbappends and why not for bb files as well can you explain t=
his
> change a bit and its usecases
>
I think all systemd related stuff should finally live in meta-systemd
to make other layers independent of using systemd or not. I separated
two types of metadata:
1. Recipes/classes only found in this layer - like systemd itself (or
later e.g dietsplash designed to work only with systemd)
2. Extends of other layers (currently meta-oe/meta-gnome/meta-efl -
and in the future e.g oe-core/meta-ti/meta-angstrom...). For this an
additional directory hierarchy was added to give a better chance to
BBMASK. E.g a user wants to use systemd but does not want meta-ti. The
idea of only having bbappends was to force only appending not
overriding recipes of other layers.

Andreas


