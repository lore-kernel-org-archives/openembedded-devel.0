Received: from [209.85.221.175] (helo=mail-qy0-f175.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1MjEGN-0008KI-OQ
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 Sep 2009 17:30:16 +0200
Received: by qyk5 with SMTP id 5so627405qyk.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Sep 2009 08:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=x7b2G0bsLe7Fube1rFC87+zy3HZzi3Zm7xw5dx71vSw=;
	b=rRZov7p4fH8OaMg4R86sRRCxDcl3Gdq5MhqoA3xbRO0JoQRt8Ii0a82CvkOxb/csa+
	o1goohOoqfc79Q52qQCuETkfXA7IZxpk/fkEbkJJMa3OhNtDaSlsYkbEXoJyWX3eBn3O
	oQALjGUqCqX9tLzt7J6L/E1G73heTgyY+YJpw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=vKe3BfhXO/8s/K03C++4tG0c3occnuAMma7esCYDTU4i+iGgCHrhdG3YBY10C5H08g
	+ogwrUXx0DrBSTIYusPrL4CBgVJEQQP5hBaUiRfytlqjwNMb+BF9oH4zOCDDZpVRHJqQ
	JTF83bV1y6NyVlsmPbbmBQO2nBkXfXN60c1d4=
MIME-Version: 1.0
Received: by 10.229.10.13 with SMTP id n13mr2814483qcn.103.1251990682141; Thu, 
	03 Sep 2009 08:11:22 -0700 (PDT)
In-Reply-To: <1251970342.27780.192.camel@mill.internal.reciva.com>
References: <1251620948.4215.673.camel@lenovo.internal.reciva.com>
	<20090901055731.GA22534@gmail.com>
	<57768.87.139.24.177.1251793302.squirrel@home.opfer.tk>
	<20090901153102.GA12420@gmail.com> <20090901230722.GA25864@gmail.com>
	<20090902192044.GA18621@gmail.com>
	<1251923389.4490.20.camel@lenovo.internal.reciva.com>
	<19c1b8a90909021407k5610f615q41c7d13bc3b38ff0@mail.gmail.com>
	<20090903043630.GQ23034@smtp.west.cox.net>
	<1251970342.27780.192.camel@mill.internal.reciva.com>
Date: Thu, 3 Sep 2009 08:11:22 -0700
Message-ID: <19c1b8a90909030811k7f6932e0r93c94fccc43e9b1c@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] sane-toolchain-eglibc.inc: Set TARGET_OS?= linux-gnuspe for e500
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
X-List-Received-Date: Thu, 03 Sep 2009 15:30:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 3, 2009 at 2:32 AM, Phil Blundell<philb@gnu.org> wrote:
> On Wed, 2009-09-02 at 21:36 -0700, Tom Rini wrote:
>> Can we get away with that? =C2=A0'linux-gnu' over 'linux' should be fine=
 I
>> think but I'm worried about 'linux-uclibceabi', is that really a normal
>> standard and known host? =C2=A0Also, there's some overrides that depend =
on
>> 'uclibcgnueabi' iirc, which need to be updated for libc-uclibc override
>> instead.
>
> I think Khem's patch does update most/all of the overrides in question,
> but if this requires an OELAYOUT_ABI change then it seems like a lot of
> disruption to fix what is (if I understand correctly) only a cosmetic
> problem in the first place.

The documentation around OELAYOUT_ABI says that it should be bumped
whenever there
is a change in tmp layout structure and this change will do rename few
directories and
binaries in the tmp folder thats why the bump

and incremental builds wont work anyway because cross compiler names
will be different.
thats why I was bumping it up.

Thanks

-Khem

>
> p.
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


