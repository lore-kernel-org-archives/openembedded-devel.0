Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OWR9p-0002J0-IM
	for openembedded-devel@lists.openembedded.org;
	Wed, 07 Jul 2010 11:43:18 +0200
Received: by bwz10 with SMTP id 10so3812870bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Jul 2010 02:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=xV8tO3vtETeEjT+Bvx4z/J7lTh4wEZhWzKTvoK7UXmo=;
	b=tqJzrejOLk9blsmus7jAoowzvdgkDYnTAyxB9mvQKpjLEjDcZwt2t3cXT8E8AephSp
	h0TFaj1hQTA0dtBZgp+jU7Ih4KC9giRWgPbhUyWHtyoMqU/nZC82YgbfGR1tgthzjY9T
	CWOoiArQ1aVg9UCT3KEL7dtp5jZqVhcCXa6vU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=ZvH2hmOKBTU2SSvyf8ZhlRSqHw/dlpEXOeGyO2RWDfmOzqVm4jSL4QuDBTeibMr6AL
	Quwe54xRTOuNEJ/PtaMgQDkjluqtNYw6ixK3z5Ur1Qo4LoerO/p18CPR4r7WUOyNM1zY
	gMaL5+IhuxJut2aZyKK3GDwJ2yCLYCoOnQ7bM=
MIME-Version: 1.0
Received: by 10.204.74.10 with SMTP id s10mr4747331bkj.26.1278495500617; Wed, 
	07 Jul 2010 02:38:20 -0700 (PDT)
Received: by 10.204.66.68 with HTTP; Wed, 7 Jul 2010 02:38:20 -0700 (PDT)
In-Reply-To: <1278458982-3362-1-git-send-email-raj.khem@gmail.com>
References: <1278458982-3362-1-git-send-email-raj.khem@gmail.com>
Date: Wed, 7 Jul 2010 11:38:20 +0200
Message-ID: <AANLkTikLt386MmRbOllffnFTi6DKPDU4lFep9FQ0_jCc@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH][v2] base.bbclass: re-add backward compatibility with bitbake w.r.t decodeurl fix in bitbake
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
X-List-Received-Date: Wed, 07 Jul 2010 09:43:19 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/7/7 Khem Raj <raj.khem@gmail.com>:
> This patch seems to work with both bitbakes
>
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> =A0classes/base.bbclass | =A0 15 +++++++++++++--
> =A01 files changed, 13 insertions(+), 2 deletions(-)
>
> diff --git a/classes/base.bbclass b/classes/base.bbclass
> index 2da0b7a..b30310d 100644
> --- a/classes/base.bbclass
> +++ b/classes/base.bbclass
> @@ -219,14 +219,25 @@ def oe_unpack_file(file, data, url =3D None):
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0# The "destdir" handling w=
as specifically done for FILESPATH
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0# items. =A0So, only do so=
 for file:// entries.
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if type =3D=3D "file":
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dest =3D os=
.path.dirname(path) or "."
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if not host=
:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 dest =3D os.path.dirname(path) or "."
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 else:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 # this case=
 is for backward compatiblity with older version
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 # of bitbak=
e which do not have the fix
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 # http://cg=
it.openembedded.org/cgit.cgi/bitbake/commit/?id=3Dca257adc587bb0937ea76d8b3=
2b654fdbf4192b8
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 # this shou=
ld not be needed once all releases of bitbake has this fix
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 # applied/b=
ackported
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 dest =3D host + os.path.dirname(path) or "."
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0else:
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0dest =3D "=
."
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0bb.mkdirhier("%s" % os.pat=
h.join(os.getcwd(),dest))
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0cmd =3D 'cp %s %s' % (file=
, os.path.join(os.getcwd(), dest))
> =A0 =A0 =A0 =A0if not cmd:
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return True
> - =A0 =A0 =A0 dest =3D os.path.join(os.getcwd(), path)
> + =A0 =A0 =A0 if not host:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 dest =3D os.path.join(os.getcwd(), path)
> + =A0 =A0 =A0 else:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 dest =3D os.path.join(os.getcwd(), os.path.=
join(host, path))
> =A0 =A0 =A0 =A0if os.path.exists(dest):
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if os.path.samefile(file, dest):
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return True
> --
> 1.7.1
>

This fixes things for me so:
Acked-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>


