Received: from mx1.altell.ru ([178.16.156.2] helo=office.altell.ru)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <khimov@altell.ru>) id 1RiivS-0005JM-6X
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 Jan 2012 09:43:54 +0100
Received: from sencha.localnet (unknown [10.160.56.110])
	by mx1.altell.ru (Postfix) with ESMTPS id 96EB55419
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Jan 2012 12:31:16 +0400 (MSK)
From: Roman Khimov <khimov@altell.ru>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 05 Jan 2012 12:31:13 +0400
Message-ID: <1434677.NeCVNTM8Up@sencha>
Organization: ALTELL Ltd.
User-Agent: KMail/4.7.2 (Linux/3.1.0-1.2-desktop; KDE/4.7.2; x86_64; ; )
In-Reply-To: <CAOy7-nNBAYxHFzPsNwZrQ_WAzSVuzNEVX+V9OQ+XK3v69+1=Ew@mail.gmail.com>
References: <CAFggvfNpJGosK3E0pG=Qikk3QXLoOSHndVRqxoTkNUS47_pDQw@mail.gmail.com>
	<CAOy7-nP8oc7ZObfc7We8j4Oj7ZTrhqs-upo8KY61tvqDcRG6-g@mail.gmail.com>
	<CAOy7-nNBAYxHFzPsNwZrQ_WAzSVuzNEVX+V9OQ+XK3v69+1=Ew@mail.gmail.com>
MIME-Version: 1.0
X-Altell-MailScanner-ID: 96EB55419.5D81D
X-Altell-MailScanner: Found to be clean
X-Altell-MailScanner-From: khimov@altell.ru
X-Spam-Status: No
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
X-List-Received-Date: Thu, 05 Jan 2012 08:43:54 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On 5 =D1=8F=D0=BD=D0=B2=D0=B0=D1=80=D1=8F 2012 09:50:28 James wrote:
> >>> <gdalex@gmail.com> wrote:
> >>>> bulding a console-image for beagleboard, openssl fails to compil=
e.
> >>>>=20
> >>>> The log shows this:
> >>>>=20
> >>>> openssl.o: In function `main':
> >>>> openssl.c:(.text+0x1eb): undefined reference to `BIO_s_file'
> >>>> openssl.c:(.text+0x1f3): undefined reference to `BIO_new'
> >>>> openssl.c:(.text+0x235): undefined reference to `BIO_ctrl'
> >>>> .....
> >>>>=20
> >>>> Removing libdeps-first.patch solved the issue.
> Can anyone advise on this?

As written in the patch itself:
=3D=3D=3D=3D=3D=3D=3D=3D=3D
Links to previously staged 0.9.8* easily otherwise
=3D=3D=3D=3D=3D=3D=3D=3D=3D

Without this patch openssl links to any previously staged libssl/libcry=
pto, if=20
that was 0.9.8smth it won't work at all. I have no idea how this patch =
could=20
break the build. You need to carefully review the build log and especia=
lly=20
compare it between different hosts, as it seems like only Ubuntu 11.10 =
has the=20
problem.


