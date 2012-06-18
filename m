Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SgguA-0002Y7-9h
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Jun 2012 20:42:26 +0200
Received: by eekd49 with SMTP id d49so1729690eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jun 2012 11:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=4wij2blDUCXjF7fDeFBEaCuDxK+4uPSPpYyh7JQZht0=;
	b=ZeqRh681q9I+2mtb1s3lkSsOHhp9lA/Z2lIDB3e+XsExYtBP4ZxzVVS2NYGRs/Gn15
	R3RlpM8NdVEuxUQF1NYBUtlcajxkl2gcmgqnvUoycJyK1zRppf36zcWXKGxKjHdMOe/h
	RVPwZ0i5umDaPS2vzo1c/F+2r0g7JoL3DD965zUrztVE/6BLADJNQL+ryrlmLxXKfsHm
	m7KMwEpPsw+cOyIHgrKJFGJUMdBzS/suSn3mXoxiQLuBkKvNEku1oASiXJsVXaB0YFD0
	TtkTVXGzph2JCvQfqOg2fAwe2zWB7KgXnf9ggq/DQhVzX5G5GjrYZwxl9UG7kE+YJXo9
	WvlQ==
Received: by 10.14.94.201 with SMTP id n49mr3728531eef.158.1340044303838; Mon,
	18 Jun 2012 11:31:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.188.11 with HTTP; Mon, 18 Jun 2012 11:31:13 -0700 (PDT)
In-Reply-To: <CAE9DZUTckmmxoW_kdKksyT7tq86zV-AacJGwrEqpCFh+vBZYFw@mail.gmail.com>
References: <CAE9DZUTckmmxoW_kdKksyT7tq86zV-AacJGwrEqpCFh+vBZYFw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 18 Jun 2012 11:31:13 -0700
Message-ID: <CAMKF1soavWbcgpsOD6RruFyfY8qbqe7Wddzv0KMJfi-HbhsLVg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Package selection
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
X-List-Received-Date: Mon, 18 Jun 2012 18:42:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 18, 2012 at 9:57 AM, Dallas Clement
<dallas.a.clement@gmail.com> wrote:
> Pardon my ignorance, I am a newb to OE / BitBake. =C2=A0I've been buildin=
g
> custom embedded rootfs images the old fashioned way by hand for a long
> time.
>
> Recently I've been experimenting with OE / BitBake to determine if it
> is suitable for my needs. =C2=A0I want to be able to select exactly which
> packages are included in my custom distro. =C2=A0I tried to build the
> "helloworld" example, and it seemed to download and build gobs of
> packages, when all I wanted was the most rudimentary rootfs. =C2=A0In fac=
t,
> for starters I'd like to build a rootfs that simply consists of a
> statically built busybox and have the init process point to the ash
> shell. =C2=A0Is this even possible with OE? =C2=A0Once I gain confidence =
with
> something simple like this, I'd like to continue refining things by
> adding packages that I select.

Depending on if you are using OE-Core or classic OE say you are using OE-Co=
re
then you can use core-image-minimal target that will generate minimal packa=
ges
into image thats required to boot.

in classical OE there was base-image, micro-image that you could use
I dont think there is exact image you want but then its not that hard
to create one

>
> Lastly, it is possible to avoid the repeated fetching of source
> packages? =C2=A0In other words, can the source URI's point to packages in=
 a
> local file system repository?

fetch operation should happen first time thereafter it should always
look in your
DL_DIR before it goes out and fetches stuff

>
> Thanks much,
>
> Dallas
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


