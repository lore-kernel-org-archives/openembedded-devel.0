Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f170.google.com (mail-ig0-f170.google.com
	[209.85.213.170])
	by mail.openembedded.org (Postfix) with ESMTP id 6C0C5769A7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Oct 2015 14:42:23 +0000 (UTC)
Received: by igbdj2 with SMTP id dj2so13428693igb.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Oct 2015 07:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=kqk+9E4ku9EP5TgrCQjS6HscpI1GABomhpLK0DzXsLU=;
	b=gSlfzQwlFVVquHYuZiXevXqm2sB/IC0LjDtNHmiFL7X/8JdI3p4aZg09m2dulOTqFL
	wNYpr8XCBxpcbPYNIHjW2kklMzuak/RojRJ7XzMUGQF2PiCUEbVh9jiwcChLXT119Ljq
	KqIykl024UuYth3mrCkRzESSbubfWTvgFqVrI1xMXnwWDJTdtIVyS+1OGeB7ONChyjfQ
	AE2TiKwxbD1HddGBrFQ7BumepAbicRWmPdq2zOf//sRvBLSGBB3l2DVh5g0Zl7V1kj68
	imeU+1E3UeJe51tH9yiUwIwWVCd+0AUFdBwV5sypRf/9mKEgQRR9TlafAFYh6nzQAJlT
	9qeg==
X-Received: by 10.50.6.43 with SMTP id x11mr20101526igx.77.1444920144197; Thu,
	15 Oct 2015 07:42:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.142.130 with HTTP; Thu, 15 Oct 2015 07:41:54 -0700 (PDT)
In-Reply-To: <CALbNGRQ1vE0=GP7EfvpdHpNiHW1C1O1ntmFmTPtzeP9+ryTZFg@mail.gmail.com>
References: <1444871185-1173-1-git-send-email-raj.khem@gmail.com>
	<CALbNGRQ1vE0=GP7EfvpdHpNiHW1C1O1ntmFmTPtzeP9+ryTZFg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 15 Oct 2015 07:41:54 -0700
Message-ID: <CAMKF1sqT7q4VGFbspYV=EOfM8+B21rvdFetpv5PjJhtmFsYHtQ@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] plymouth: Disable documentation
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 15 Oct 2015 14:42:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2015 at 6:22 AM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> On Thu, Oct 15, 2015 at 3:06 AM, Khem Raj <raj.khem@gmail.com> wrote:
>> It need docbook-xsl built natively and right now its not in its deps
>> disable the documentaion generation completely to avoid the build issue
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb b/meta-oe/r=
ecipes-core/plymouth/plymouth_0.9.2.bb
>> index b8c82ed..01f633d 100644
>> --- a/meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb
>> +++ b/meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb
>> @@ -20,7 +20,7 @@ SRC_URI[md5sum] =3D "ff420994deb7ea203df678df92e7ab7d"
>>  SRC_URI[sha256sum] =3D "2f0ce82042cf9c7eadd2517a1f74c8a85fa8699781d9f29=
4a06eade29fbed57f"
>>
>>  EXTRA_OECONF +=3D " --enable-shared --disable-static --disable-gtk \
>> -                 --with-logo=3D${LOGO} \
>> +                  --with-logo=3D${LOGO} --disable-documentation \
>>                    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '-=
-enable-systemd-integration --with-system-root-install', '', d)} \
>>                  "
>>
>> --
>> 2.6.1
>>
> I think I've sent similar - and if I am not mistaken it was already appli=
ed.
>

indeed you did and its applied. My snapshot was not uptodate with master

> Andreas
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

