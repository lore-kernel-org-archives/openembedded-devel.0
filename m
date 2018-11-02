Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
	[209.85.128.54])
	by mail.openembedded.org (Postfix) with ESMTP id D575F7A04F
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Nov 2018 23:54:32 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id q19-v6so3304762wmc.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Nov 2018 16:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=YMWGIG6vuyX1ztXZYcxUVomas4hFjvVONR6LWyTqdlQ=;
	b=JNaCra0yq0JADFkSiQpkaVLaKCZFNtO6pz66CUMvCQVgWA/YNIzRepGJ47LyF0U8D9
	s2zvwngjWvBcsHbpjHd6/CJhWlH4ncI0M7PB3YRV26iu6hAX27GPWQuXQHIggjROjhMf
	NOwQ0r8YKVF5s68wz6QbMaNPqxa/7BeDeGG8pPR+14PRnIFPBnsYq4/VN8tV/Ca+MAo7
	mSQ1poL00eAYSGMPuN41eBz1M9sW+sSvOPD8vDXMjq2hzY3+W4uWtnTnknCnC3yk2kdM
	pM0MRQYZhn6hpbMw5ylRBb8POsk/MrW2ad3ZiPM/V7aN7IlwO1LTAIWD/ZZ8wMoftwdP
	2jqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=YMWGIG6vuyX1ztXZYcxUVomas4hFjvVONR6LWyTqdlQ=;
	b=mPtPmIDT7S/J+LxWpOyfxQ2dgwIu1nxtQorg7cIp84LobF6PxYu5TqxTugXiyfV0EI
	tujJnCe/PQSPbn6HeKKBAzmJGNlFQYvrZ1ISTEJf40HvEskQFzM/mmEWoA2SGRjAtxGN
	d0Rl+/jB82pCnQw9Bt3iHyghe81kKkSVzWL6iAn9ItlmFNEufptgKEiDqW+zJL2zZ/KW
	MFY1GHrlul9vIuSX+q+IpaxTDikZ6jh6bp0xA6zmmbI14r785z+FFjJJ7AGZHAgOFvRZ
	DmrCBuDXRYcNlB5IONp0gWXHQDiDS27L1BXb20dTVTdwXPJ5qhI/ht67NvPkZ8gdQfOy
	i6UQ==
X-Gm-Message-State: AGRZ1gLMfkfpDm+M17iuLlpMTrzNU/x1/BQh83+AB33pX0nePAj1+Qhp
	6BmC24YKTYKMxmJzxvic7di4gK3VR8e0Ao5zVBo=
X-Google-Smtp-Source: AJdET5cRusjS42kOf3b0ProddMUvKcWqVEmHWigm7EheR1FLdxJtCy9Ir8ezKcOLjvByqnm6RbrMEI8CihKfDtqql2Y=
X-Received: by 2002:a1c:bb42:: with SMTP id l63-v6mr48004wmf.32.1541202873116; 
	Fri, 02 Nov 2018 16:54:33 -0700 (PDT)
MIME-Version: 1.0
References: <20181102193911.784-1-Martin.Jansa@gmail.com>
	<CAJTo0LapUWEmLVDYvyR+WLrBOK=7m+TDmQ_tYGLQ=RHLtfVPOQ@mail.gmail.com>
In-Reply-To: <CAJTo0LapUWEmLVDYvyR+WLrBOK=7m+TDmQ_tYGLQ=RHLtfVPOQ@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sat, 3 Nov 2018 00:54:21 +0100
Message-ID: <CA+chaQdFuw=hujyefJZpsZh5=eCUqMeydoT=57sy59D_dpd8QQ@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH][meta-oe] pcsc-lite: fix SRC_URI
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
X-List-Received-Date: Fri, 02 Nov 2018 23:54:33 -0000
Content-Type: text/plain; charset="UTF-8"

True, maybe I should have mentioned it in commit message.

https://en.wikipedia.org/wiki/Alioth_(Debian)
In 2018, Alioth has been replaced by a GitLab
<https://en.wikipedia.org/wiki/GitLab> based solution hosted on
*salsa.debian.org
<http://salsa.debian.org>*. Alioth has been finally switched off in June
2018.

On Fri, Nov 2, 2018 at 11:03 PM Burton, Ross <ross.burton@intel.com> wrote:

> Just in case anyone didn't knot, it's not temporarily down, it's dead for
> good.
>
> Ross
> On Fri, 2 Nov 2018 at 19:39, Martin Jansa <martin.jansa@gmail.com> wrote:
> >
> > * alioth.debian.org is down
> >   Connecting to alioth.debian.org (alioth.debian.org)|5.153.231.21|:443...
> failed: No route to host.
> >
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.22.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.22.bb
> b/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.22.bb
> > index 90d58b00d9..10f724e6c8 100644
> > --- a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.22.bb
> > +++ b/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.22.bb
> > @@ -11,7 +11,7 @@ LICENSE_${PN}-spy-dev = "GPLv3+"
> >  LIC_FILES_CHKSUM = "file://COPYING;md5=f38b3d1c7ef7fc2c8b6d20cd38efdc29"
> >  DEPENDS = "udev"
> >
> > -SRC_URI = "
> https://alioth.debian.org/frs/download.php/file/4225/pcsc-lite-${PV}.tar.bz2
> "
> > +SRC_URI = "https://pcsclite.apdu.fr/files/${BP}.tar.bz2"
> >  SRC_URI[md5sum] = "0ec103b1ef298d0c58d6ef6b00b9cf17"
> >  SRC_URI[sha256sum] =
> "6a358f61ed3b66a7f6e1f4e794a94c7be4c81b7a58ec360c33791e8d7d9bd405"
> >
> > --
> > 2.17.1
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

