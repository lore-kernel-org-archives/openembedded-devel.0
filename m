Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <angweiyang@gmail.com>) id 1Rjr1u-0004UY-2m
	for openembedded-devel@lists.openembedded.org;
	Sun, 08 Jan 2012 12:35:14 +0100
Received: by wgbdt11 with SMTP id dt11so674084wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 08 Jan 2012 03:27:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=bBdNCrdWAJOKEsPEPkZpY8hMbrosnqzcl29mp765Rq0=;
	b=HYLB5v1XE909coEZGlxr7bF0VzO4UF2il9p/vWfAw5iXQcRsI2QzDI8CE2dgc3nAOq
	Wp5q3s9Zb4kot4A7RQ/f6Ht0bJHFMOuP00ux2+Ore8j2bdyRhGKKejC+8gu5teYWm14C
	0VMGwseUFQfrjxb3huIRt9mIolopBhg+LHlOs=
MIME-Version: 1.0
Received: by 10.180.95.199 with SMTP id dm7mr17689280wib.9.1326022067669; Sun,
	08 Jan 2012 03:27:47 -0800 (PST)
Received: by 10.227.60.68 with HTTP; Sun, 8 Jan 2012 03:27:47 -0800 (PST)
Received: by 10.227.60.68 with HTTP; Sun, 8 Jan 2012 03:27:47 -0800 (PST)
In-Reply-To: <1434677.NeCVNTM8Up@sencha>
References: <CAFggvfNpJGosK3E0pG=Qikk3QXLoOSHndVRqxoTkNUS47_pDQw@mail.gmail.com>
	<CAOy7-nP8oc7ZObfc7We8j4Oj7ZTrhqs-upo8KY61tvqDcRG6-g@mail.gmail.com>
	<CAOy7-nNBAYxHFzPsNwZrQ_WAzSVuzNEVX+V9OQ+XK3v69+1=Ew@mail.gmail.com>
	<1434677.NeCVNTM8Up@sencha>
Date: Sun, 8 Jan 2012 19:27:47 +0800
Message-ID: <CAOy7-nNYwu4ZSuh_eWeGG15J-vW_2O3g9BqfT8e4iHpeHLu+RA@mail.gmail.com>
From: James <angweiyang@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: openssl failing to compile
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
X-List-Received-Date: Sun, 08 Jan 2012 11:35:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

On Jan 5, 2012 4:37 PM, "Roman Khimov" <khimov@altell.ru> wrote:
>
> On 5 =D1=8F=D0=BD=D0=B2=D0=B0=D1=80=D1=8F 2012 09:50:28 James wrote:
> > >>> <gdalex@gmail.com> wrote:
> > >>>> bulding a console-image for beagleboard, openssl fails to compile.
> > >>>>
> > >>>> The log shows this:
> > >>>>
> > >>>> openssl.o: In function `main':
> > >>>> openssl.c:(.text+0x1eb): undefined reference to `BIO_s_file'
> > >>>> openssl.c:(.text+0x1f3): undefined reference to `BIO_new'
> > >>>> openssl.c:(.text+0x235): undefined reference to `BIO_ctrl'
> > >>>> .....
> > >>>>
> > >>>> Removing libdeps-first.patch solved the issue.
> > Can anyone advise on this?
>
> As written in the patch itself:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D
> Links to previously staged 0.9.8* easily otherwise
> =3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> Without this patch openssl links to any previously staged
libssl/libcrypto, if
> that was 0.9.8smth it won't work at all. I have no idea how this patch
could
> break the build. You need to carefully review the build log and especiall=
y
> compare it between different hosts, as it seems like only Ubuntu 11.10
has the
> problem.
>

Maybe a new recipe for openssl backported from current oe-core is needed in
2011.03-maintenance?

James

