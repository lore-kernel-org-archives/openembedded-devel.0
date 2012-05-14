Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1STucG-000826-TE
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 May 2012 14:43:09 +0200
Received: by yhjj56 with SMTP id j56so4328322yhj.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 May 2012 05:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=PDhdTDUqLF9jDhkrjG8aHzerZ18DOKN54Xuc/AHx5HM=;
	b=SHn2tA8PovZr74scyJX+3FaiVy1BA+/98PSXu+pMGfCeZP1Y8RvBJEDWDU3AOBkkh4
	jdtWcTYgjAFtQa0kEm7LpqBEO/QhjbpAvD4sHAURgvweAf5Zx+sQIFEGOrfLtp9aBpAl
	fKoaYtP1saoedIQxU9aEmxnsXuqaumFaiiIkKu58cQyE95fyInjKSLnfyAlGO0rS5lOv
	FUZLoEgbLd2zZM0jaQXibln5CVco+oZsUIDTRl2ltYwqE2tnt+uRXcurCHkLQ3XI76f6
	T+fH3AQWiq+K8YFmt4Y4AnC/Mob/Cj6K5PfP304OFrPdzWZZHzmdnEH4Fvh+Sc7an8t7
	7p/A==
MIME-Version: 1.0
Received: by 10.220.141.207 with SMTP id n15mr4909516vcu.68.1336998789531;
	Mon, 14 May 2012 05:33:09 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.220.152.82 with HTTP; Mon, 14 May 2012 05:33:09 -0700 (PDT)
In-Reply-To: <CADZ6=avMrT89BZA=awFOhCQFMhTDo1n67ZQya7J3Z9BSQeZHqw@mail.gmail.com>
References: <CADZ6=avMrT89BZA=awFOhCQFMhTDo1n67ZQya7J3Z9BSQeZHqw@mail.gmail.com>
Date: Mon, 14 May 2012 09:33:09 -0300
X-Google-Sender-Auth: AB6ckohr8DtwVNA8wWuWyUVvJ5I
Message-ID: <CAP9ODKrUgckJvtxK4rtHccD2JRTCwW_6rTeeZRUayd-=GXSioQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: New kmod {libdir} breaks udev 182 build
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
X-List-Received-Date: Mon, 14 May 2012 12:43:09 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, May 14, 2012 at 8:18 AM, Thilo Fromm <fromm@dresearch-fe.de> wrote:
> I've got an issue with
> openembedded-core/meta/recipes-kernel/kmod/kmod_git.bb, with the way
> {libdir} is set in line 19:
>
> libdir =3D "${base_libdir}"
>
> "git blame" claims this was added by Khem Raj on 2012-05-08. This line
> causes libkmod to put its pkgconfig ".pc" file in the staging area at
> "/lib/pkgconfig/libkmod.pc". This is sad because other recipes would
> only look at /usr/lib/pkgconfig/ and /usr/share/pkgconfig.
>
> Take meta-openembedded/meta-oe/recipes-core/udev/udev_182.bb, for
> example. The build predictably fails with
>
> checking for KMOD... no
> configure: error: Package requirements (libkmod >=3D 5) were not met:
>
> No package 'libkmod' found
>
>
> So what's the right thing do do here? Use a different package install
> path for libkmod, or point udev to /lib/pkgconfig by extending its
> PKG_CONFIG_PATH correspondingly?

I have some build failure.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


