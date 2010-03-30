Received: from mail-yw0-f197.google.com ([209.85.211.197])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <aalonso00@gmail.com>) id 1NwU1V-0005eO-7J
	for openembedded-devel@lists.openembedded.org;
	Tue, 30 Mar 2010 07:29:58 +0200
Received: by ywh35 with SMTP id 35so3759708ywh.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Mar 2010 22:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:received:message-id:subject:from:to:content-type;
	bh=eNExyqSTcNppzKzNx4kpIojZhBSk0LJ17YxW7HwQ3Fc=;
	b=NiXeabh38UuwHHaN1H2+H0cHGW3CwgZsvBQI7NxyDFXqM6iwwWzvHxaUGY0R/qtFkU
	JXGfefZO73PRvSzb36U0PP08ZJt00FJZk3xJi/29szRTmirxtJayixUVvB26GZkVQfaK
	ZeRlNR22aNIAZ5wNbNw6FbfFgW/uncBdJoFdQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=hY0Da4UeE/ppRcrd5sVJUB+Ey8hNtAjg9crseRQe78Gvn4XSX18T4qKt44abZ2+XV0
	4PioYEHNlTNjm5keObmjhGTGaeUjYiUcp6gWISZM5VGiGZrLkw2iILVSCAbJx69cI0Vt
	NWSYKfO5xfXokywl2+LjqBj6M/4zsydQOuQ94=
MIME-Version: 1.0
Received: by 10.90.56.18 with HTTP; Mon, 29 Mar 2010 22:26:41 -0700 (PDT)
In-Reply-To: <201003251014.27055.ml@vdm-design.de>
References: <b6ebd0a51003240909t642135dfy5b2667f6dac0a8c5@mail.gmail.com>
	<1269507272-19036-1-git-send-email-ml@vdm-design.de>
	<201003251014.27055.ml@vdm-design.de>
Date: Mon, 29 Mar 2010 23:26:41 -0600
Received: by 10.91.45.24 with SMTP id x24mr1621889agj.45.1269926802021; Mon, 
	29 Mar 2010 22:26:42 -0700 (PDT)
Message-ID: <d1ded4381003292226g35795693r72604a2cfb20d8d9@mail.gmail.com>
From: Adrian Alonso <aalonso00@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.211.197
X-SA-Exim-Mail-From: aalonso00@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH] imagemagick: convert to BBCLASSEXTEND and new staging
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
X-List-Received-Date: Tue, 30 Mar 2010 05:29:58 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi,

I test imagemagick_6.3.5-10.bb and it fails
due that my host system of autoconf > 2.63

I search a bit and found a patch in gnulib mailing list [1] that skips
openm4 configuration when autoconf > 2.62, applying it resolves the failure
with imagemagic_6.3.5-10;

Patches should be at patchwork queue.

[1] http://www.mail-archive.com/bug-gnulib@gnu.org/msg12387.html


On Thu, Mar 25, 2010 at 3:14 AM, Thomas Zimmermann <ml@vdm-design.de> wrote=
:

> Am Donnerstag 25 M=E4rz 2010 09:54:32 schrieb Thomas Zimmermann:
> > * now imagemagick is buildable again with autoconf > 2.63
> > * tiff-native now exists, so no need to override DEPENDS of -native
> anymore
> >
> > Signed-off-by: Thomas Zimmermann <ml@vdm-design.de>
> > ---
> >  recipes/imagemagick/imagemagick-native_6.3.5-10.bb |    6 ------
> >  recipes/imagemagick/imagemagick_6.3.5-10.bb        |   10 ++++------
> >  recipes/imagemagick/imagemagick_6.4.4-1.bb         |   10 ++++------
> >  3 files changed, 8 insertions(+), 18 deletions(-)
> >  delete mode 100644 recipes/imagemagick/imagemagick-native_6.3.5-10.bb
>
> 6.4.4-1 builds fine, but i can't try if 6.3.5 builds fine too, as it
> doesn't
> compile anymore for me because of to recent autoconf...
>
> So it would be nice if someone can confirm that 6.3.5 builds fine too.
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



--=20
Saludos
Adrian Alonso
http://aalonso.wordpress.com

