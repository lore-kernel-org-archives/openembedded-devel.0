Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heroor@gmail.com>) id 1QHIo5-0000fN-PA
	for openembedded-devel@lists.openembedded.org;
	Tue, 03 May 2011 18:50:41 +0200
Received: by qwh5 with SMTP id 5so160031qwh.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 May 2011 09:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=f3QmZ/ZB4Ut8sDlxf0LD+Y81SHn1c1Il2JrFXf2PDGE=;
	b=BW4x763hXUkR1tWeBRMo7H5YLxAryHV0cZnqPmE/61o/ToVnYL1+/+aUyvaD5OPZGl
	n+Jsn7VGimX7EzW22x1Ovf+mRbZgJtFYs4CDTV2f/kO/TTaggcDVUOe78Gz6S3Om0aO4
	/ET2TzngUolneychdbGVPF944YkLt2SC3UPuY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=wQmwaLrZLpKQAm3uiHjiZosnMjBjAa1IMW8D2bkQHbpOKlNL24KXVYF+xCUQEPTl+p
	iXdmJ9Vw6dQqu00l8jZMTGIjeRkA3rguSoHOOaAvZZXXIX6bi8v/aJtPxtUow1y1bM6n
	Gx26XLxKxk4/62rAyTLYdN4ytbVHZCBkp5Eng=
MIME-Version: 1.0
Received: by 10.224.210.8 with SMTP id gi8mr41230qab.292.1304441283715; Tue,
	03 May 2011 09:48:03 -0700 (PDT)
Received: by 10.224.2.209 with HTTP; Tue, 3 May 2011 09:48:03 -0700 (PDT)
In-Reply-To: <20110501173015.GI27708@ibawizard.net>
References: <1304243449-12028-1-git-send-email-heroor@ti.com>
	<20110501173015.GI27708@ibawizard.net>
Date: Tue, 3 May 2011 22:18:03 +0530
Message-ID: <BANLkTimKHp5M5VvMR21+C_rSRBiu2M0BKQ@mail.gmail.com>
From: Siddharth Heroor <heroor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 1/2] zeromq: Add zeromq socket library.
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
X-List-Received-Date: Tue, 03 May 2011 16:50:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, May 1, 2011 at 11:00 PM, Petr =C5=A0tetiar <ynezz@true.cz> wrote:
> Siddharth Heroor <heroor@gmail.com> [2011-05-01 15:20:48]:
>
> Hi,
>
>> +PR =3D "r1"
>> +
>> +SRC_URI =3D "http://download.zeromq.org/zeromq-${PV}.tar.gz"
>> +
>> +inherit autotools
>
> for version 2.1.1 I've needed also the following:
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0DEPENDS +=3D "util-linux-ng"
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0do_configure_prepend() {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0./autogen.sh
> =C2=A0 =C2=A0 =C2=A0 =C2=A0}
>
> It's not needed anymore?
Is the older recipe available somewhere? I didn't have to do this for
the latest version.

--=20
Sid


