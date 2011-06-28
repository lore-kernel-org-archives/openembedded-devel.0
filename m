Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Qbb9g-0002vW-PP
	for openembedded-devel@lists.openembedded.org;
	Tue, 28 Jun 2011 18:28:52 +0200
Received: by bwf20 with SMTP id 20so387353bwf.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Jun 2011 09:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=mK2VjSP6sTI8JW9obGRQSWokV4gfxcKNdljQsFb4qJM=;
	b=vC5aZSE777atujIkVSRbj2aLeo67SP8Ji5JHpsAmfAHJc7cndFb8kYdxKhbIYKSdnB
	Ha992oc1rkIHcznqLEY/IVXz2GzwOQZd00bUO8kE3CqJHw3IQ+w0ZuAUOvjGYVfy+qpO
	Cm4NUfjaS++ZrrYAVH5xsz6ylGnjhHP90s8iU=
MIME-Version: 1.0
Received: by 10.205.24.9 with SMTP id rc9mr5665873bkb.92.1309278310949; Tue,
	28 Jun 2011 09:25:10 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.73.70 with HTTP; Tue, 28 Jun 2011 09:25:10 -0700 (PDT)
In-Reply-To: <iucsbb$gp2$1@dough.gmane.org>
References: <cover.1309272010.git.otavio@ossystems.com.br>
	<iucpq7$uav$1@dough.gmane.org>
	<BANLkTinqwZhxLGtp997dgKh9BmAD02LU-A@mail.gmail.com>
	<iucsbb$gp2$1@dough.gmane.org>
Date: Tue, 28 Jun 2011 13:25:10 -0300
X-Google-Sender-Auth: 1T-z6zWWpaH2srVrxW9To0CIEkM
Message-ID: <BANLkTimmBeR1COc-BRuASQf3O3g20uhkxg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 0/2] Fix parse errors
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
X-List-Received-Date: Tue, 28 Jun 2011 16:28:52 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 28, 2011 at 12:35, Koen Kooi <koen@dominion.thruhere.net> wrote=
:
> It makes it easier to deploy updates for the main packages (e.g.
> sysvinit, systemd) to all the targets without having to build it for all
> targets. It's a weird optimization, but makes life a lot easier for
> people needing to support a ton of machines :)

I didn't follow it; for example if you change PR of the recipe  it
will be rebuild n times (being n the number of machines) and each of
it will *overwrite* the non-machine packages. This seems wrong for me.

Can you describe a use case?

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


