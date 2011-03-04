Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Pvels-0000eX-Li
	for openembedded-devel@lists.openembedded.org;
	Sat, 05 Mar 2011 00:50:56 +0100
Received: by fxm8 with SMTP id 8so2676967fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Mar 2011 15:49:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=qiB33d+yj5yHPo7vyqDb5oWJSN3uNr5kXAUkUWZ8gMw=;
	b=XGzdG2zaTw1WbuzKYlivw+rnZlAWozI8hdQDWGn8YEfAez5nhPqXzmPNY8wy5c6mtA
	lagXqYHXMu0zIiYehzY7SQ5w/pZlr8XSIp/+11g9OgUYn4eaDYkl4pm6MrS2GfVZdh6K
	H5D4VDvpTQ4+igPIwfPOiAQDAj51Xy+lAyYmY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=NIzAmWMKRL+woxVTR7AyXGCfR/uGS0HN4Kfq5Ux0G1BecXISwZdlN7IGJ8TSxhkpo+
	+iBXbF0G25b7XLtdzHBMdBYJpof8AvXxc6JQd+Y0klBb2IvEjrhol09IyCxbaMmAhdFa
	GnlDaq6YQgyP4g2Dmh9ACV8dS46W4Nhj25mew=
Received: by 10.223.75.1 with SMTP id w1mr1460867faj.17.1299282563805; Fri, 04
	Mar 2011 15:49:23 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.30.151 with HTTP; Fri, 4 Mar 2011 15:48:52 -0800 (PST)
In-Reply-To: <1299275257.3930.23.camel@lenovo.internal.reciva.com>
References: <AANLkTinUjtis22ZnLaP7uc0fa9nzxvhWod2uv43ZcJH=@mail.gmail.com>
	<1298669695.3818.5.camel@lenovo.internal.reciva.com>
	<AANLkTi=afktV1HC4Jdq_ammNdA+h4iMAWdJT809s+LMv@mail.gmail.com>
	<1298905700.23547.6.camel@phil-desktop>
	<AANLkTimyU4bSm9tM2LO5bMoqiFQqZXxt5Js7fg0B_HhJ@mail.gmail.com>
	<1298913422.23547.20.camel@phil-desktop>
	<AANLkTimomznky1rBn5QTqzS16O6Lk3VxHUx1pG+ULe3v@mail.gmail.com>
	<1298979308.23547.67.camel@phil-desktop>
	<AANLkTimk6cXCRROwcD5cOkfarJuMkvg=A0cM_Um6oOSZ@mail.gmail.com>
	<1299080486.23547.230.camel@phil-desktop>
	<20110303041807.GA2692@sakrah.homelinux.org>
	<1299254943.23547.334.camel@phil-desktop> <4D711947.4030104@gmail.com>
	<1299275257.3930.23.camel@lenovo.internal.reciva.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 4 Mar 2011 15:48:52 -0800
Message-ID: <AANLkTi=K+z6zmHcw3CwaAxQ=fvrXODMw-=FbH5YOGk0Q@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Missing GLIBC_<version> tags on binaries
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
X-List-Received-Date: Fri, 04 Mar 2011 23:50:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 4, 2011 at 1:47 PM, Phil Blundell <philb@gnu.org> wrote:
> On Fri, 2011-03-04 at 08:54 -0800, Khem Raj wrote:
>> I am talking about --with-linker option
>
> Does that make much of a difference here? =C2=A0I would have thought that=
 any
> given DISTRO would probably want to use either gold or ld.bfd as the
> default and they could manage that by just configuring binutils
> appropriately, and/or by installing a wrapper script for ld. =C2=A0It's n=
ot
> totally obvious to me that --with-linker solves any significant problem.
>

I think there is more to integration of gold in 4.6 since in local
setups I have got trunk/4.6 working well with gold but not 4.5
since trunk worked for me I really did not dig deeper why it would not
work on 4.5

> p.
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


