Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TTXDc-00085l-Ss
	for openembedded-devel@lists.openembedded.org;
	Wed, 31 Oct 2012 13:16:25 +0100
Received: by mail-pb0-f47.google.com with SMTP id ro12so853573pbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Oct 2012 05:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=H/mO6rFfWRG4qD8wZWwMvbMvT43ON+0AEyeonQ0+LX8=;
	b=PGpyJMbP4YVM6M180DUv85rBYwAv4OoRuTBdC8Hsxia54m3jyfA+TFoigcPW+c7WvW
	5WgaJaYCOLUzrUaeGpRDLSBogB+lnpm8CD4kY6O9iclEUp+13Nysr0oFaojJjLXUD1ab
	hzdrdg0i2v4Jd/Rac1pj6nMf8DeUMKZzEu0uIGhuDZazjpAtgDR4OEdiUAUFrL7XEyiC
	o3gmu9Qsf572fb0P12hM6ZYkb0l3FkW0rqTA6e0t/CsYm1C0Y5Pqwl0OCmGsdJAX6LAP
	31/i4l3f8avYIpB+xUS5oht/4Gkk4zLv4kngIWGdcbeChbJiPMO4688jYhyBumiRLnlQ
	OuVA==
MIME-Version: 1.0
Received: by 10.66.79.198 with SMTP id l6mr64405916pax.43.1351684967555; Wed,
	31 Oct 2012 05:02:47 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.68.40.201 with HTTP; Wed, 31 Oct 2012 05:02:47 -0700 (PDT)
In-Reply-To: <50910EFB.7010804@gmail.com>
References: <1351681706-12778-1-git-send-email-otavio@ossystems.com.br>
	<50910EFB.7010804@gmail.com>
Date: Wed, 31 Oct 2012 10:02:47 -0200
X-Google-Sender-Auth: QbIlnpmUi-w0Ojj6zB80dkNcbcQ
Message-ID: <CAP9ODKqN0BGpgfgu2qwxu2cP4NfaEUPpamzuG4khU4GUM8vV=A@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH v2 1/3] meta-systemd: Move ntp recipes to 'meta-networking' sublayer
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
X-List-Received-Date: Wed, 31 Oct 2012 12:16:25 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 31, 2012 at 9:43 AM, Martin Erts=E5s <martiert@gmail.com> wrote=
:
> For this you should also have a look at the ntpdate.service and
> ntp.service files. There was a discussion about this earlier:
> http://patches.openembedded.org/patch/38575/
>
> Also, what is not on that discussion, is that pool.ntp.org is not really
> the way to do it. What we would like is to register something like
> pool.yocto.ntp.org, but for
> now I guess we can just use pool.ntp.org and then change it when someone
> have registered it. Kind of feel someone officially related to the
> project should register it.

I did it but in a new patch.

--=20
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


