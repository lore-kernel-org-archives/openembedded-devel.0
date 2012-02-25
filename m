Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1S16JT-0007Nv-4D
	for openembedded-devel@lists.openembedded.org;
	Sat, 25 Feb 2012 02:20:39 +0100
Received: by vbbff1 with SMTP id ff1so2170478vbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Feb 2012 17:12:15 -0800 (PST)
Received-SPF: pass (google.com: domain of otavio.salvador@gmail.com designates
	10.52.172.196 as permitted sender) client-ip=10.52.172.196; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	otavio.salvador@gmail.com designates 10.52.172.196 as permitted
	sender) smtp.mail=otavio.salvador@gmail.com;
	dkim=pass header.i=otavio.salvador@gmail.com
Received: from mr.google.com ([10.52.172.196])
	by 10.52.172.196 with SMTP id be4mr2467274vdc.80.1330132335663
	(num_hops = 1); Fri, 24 Feb 2012 17:12:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=tIq+a46AasxLJbUaQy7KQu/9mItvIGFKkFwT/hvbxaE=;
	b=O1MGOoENUGjhkX4lmz1L4gpetc1yQiWD8J16nf9ZUufc7+UJWt/moKOiVxKUvReCLF
	IsyTaahh6xjGca4Q3M0YKR6DhLIEt9D3K0PPw9zOQuz1bTevadoBEzuQ8XCfJ+1gYjq0
	UdVuEBm90cnzGP+VcGnwQmIDNFS8xoVxi/iEk=
MIME-Version: 1.0
Received: by 10.52.172.196 with SMTP id be4mr1957941vdc.80.1330132335400; Fri,
	24 Feb 2012 17:12:15 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.220.7.208 with HTTP; Fri, 24 Feb 2012 17:12:15 -0800 (PST)
In-Reply-To: <1330126696-4716-3-git-send-email-schnitzeltony@googlemail.com>
References: <1330126696-4716-1-git-send-email-schnitzeltony@googlemail.com>
	<1330126696-4716-3-git-send-email-schnitzeltony@googlemail.com>
Date: Fri, 24 Feb 2012 23:12:15 -0200
X-Google-Sender-Auth: zOk2iizqMEnXq3TZy2EDtS2h5_k
Message-ID: <CAP9ODKo147YPC0rGhF5hGQNbC0KRS86NsVaMo52kD_3DoQ_Yfw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-mozilla, v2 3/3] firefox: add virtual/libgl to DEPENDS
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
X-List-Received-Date: Sat, 25 Feb 2012 01:20:39 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Applied.

On Fri, Feb 24, 2012 at 21:38, Andreas M=FCller
<schnitzeltony@googlemail.com> wrote:
> Build from scratch error message was:
>
> | configure: error: Can't find header GL/glx.h for WebGL (install mesa-co=
mmon-dev (Ubuntu), mesa-libGL-devel (Fedora), or Mesa-devel (openSUSE))
> | *** Fix above errors and then restart with =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
"make -f client.mk build"
> | make[2]: *** [configure] Error 1
>
> Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
> ---
> =A0recipes-mozilla/firefox/firefox_10.0.2.bb | =A0 =A02 +-
> =A01 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/recipes-mozilla/firefox/firefox_10.0.2.bb b/recipes-mozilla/=
firefox/firefox_10.0.2.bb
> index fe66f45..5e5de05 100644
> --- a/recipes-mozilla/firefox/firefox_10.0.2.bb
> +++ b/recipes-mozilla/firefox/firefox_10.0.2.bb
> @@ -1,5 +1,5 @@
> =A0DESCRIPTION ?=3D "Browser made by mozilla"
> -DEPENDS +=3D "alsa-lib curl startup-notification libevent cairo libnotif=
y libvpx"
> +DEPENDS +=3D "alsa-lib curl startup-notification libevent cairo libnotif=
y libvpx virtual/libgl"
>
> =A0LICENSE =3D "MPLv1 | GPLv2+ | LGPLv2.1+"
> =A0LIC_FILES_CHKSUM =3D "file://toolkit/content/license.html;endline=3D39=
;md5=3D9cb02f27e77e702043b827c9418bfbf8"
> --
> 1.7.4.4
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


