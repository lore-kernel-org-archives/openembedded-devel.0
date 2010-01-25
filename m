Received: from mail-iw0-f197.google.com ([209.85.223.197])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NZJFL-0000Dw-3h
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Jan 2010 08:20:30 +0100
Received: by iwn35 with SMTP id 35so1049810iwn.4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Jan 2010 23:18:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=L9iqO7SdDqlBwR6cXhjs11jTvWBrIQ01epRWN83zN7c=;
	b=kIVghkXKuwphfFPyUVF0/nxE3TDZJu5vD6m/eemWl9ooluPlhSAx7mwlIe4aEEmF0k
	xmqK5H6LV57WzlnrJOTgEP9xtpKLgFm9R+QrFLNbUhGjXOJLNPoyabudOFxny4tKS2tl
	iOAQtuKPvFgTC3qYk6vQwdRpLeNt0xSZeRp88=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=duzByxqv5MQss/356n+dd9nzPANDmo+7YQ+nqapElqV11eSMShpCVVvOgWHXO1FS2b
	BdUAy23NJrHq2F6rOI3Iwoyfu7r9tUStA2Og4lughG+q0JTcDtDk7Zluarmd8DYiYXuO
	DQx6xLwb3YmSkzMJDueNuDdwPnQ+W0wdvbnC0=
MIME-Version: 1.0
Received: by 10.231.146.4 with SMTP id f4mr967092ibv.21.1264403886529; Sun, 24 
	Jan 2010 23:18:06 -0800 (PST)
In-Reply-To: <1264384785-30439-3-git-send-email-denis@denix.org>
References: <20100125015636.GA9855@denix.org>
	<1264384785-30439-3-git-send-email-denis@denix.org>
Date: Sun, 24 Jan 2010 23:18:06 -0800
Message-ID: <19c1b8a91001242318y24f120a4s55d5fc17a5d70def@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.197
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH 2/2] base.bbclass: don't pre-generate checksums.ini entries any longer
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
X-List-Received-Date: Mon, 25 Jan 2010 07:20:30 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 24, 2010 at 5:59 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> Signed-off-by: Denys Dmytriyenko <denis@denix.org>
> ---
> =A0classes/base.bbclass | =A0 15 +--------------
> =A01 files changed, 1 insertions(+), 14 deletions(-)
>
> diff --git a/classes/base.bbclass b/classes/base.bbclass
> index 8465286..8e14636 100644
> --- a/classes/base.bbclass
> +++ b/classes/base.bbclass
> @@ -140,18 +140,7 @@ def base_chk_file(parser, pn, pv, src_uri, localpath=
, data):
> =A0 =A0 except OSError:
> =A0 =A0 =A0 =A0 raise Exception("Executing shasum failed")
>
> - =A0 =A0if no_checksum =3D=3D True: =A0 =A0# we do not have conf/checksu=
ms.ini entry
> - =A0 =A0 =A0 =A0try:
> - =A0 =A0 =A0 =A0 =A0 =A0file =3D open("%s/checksums.ini" % bb.data.getVa=
r("TMPDIR", data, 1), "a")
> - =A0 =A0 =A0 =A0except:
> - =A0 =A0 =A0 =A0 =A0 =A0return False
> -
> - =A0 =A0 =A0 =A0if not file:
> - =A0 =A0 =A0 =A0 =A0 =A0raise Exception("Creating checksums.ini failed")
> -
> - =A0 =A0 =A0 =A0file.write("[%s]\nmd5=3D%s\nsha256=3D%s\n\n" % (src_uri,=
 md5data, shadata))
> - =A0 =A0 =A0 =A0file.close()
> -
> + =A0 =A0if no_checksum =3D=3D True: =A0 =A0# we do not have SRC_URI chec=
ksums
> =A0 =A0 =A0 =A0 from string import maketrans
> =A0 =A0 =A0 =A0 trtable =3D maketrans("", "")
> =A0 =A0 =A0 =A0 uname =3D src_uri.split("/")[-1].translate(trtable, "-+._=
")
> @@ -168,8 +157,6 @@ def base_chk_file(parser, pn, pv, src_uri, localpath,=
 data):
> =A0 =A0 =A0 =A0 ufile.close()
>
> =A0 =A0 =A0 =A0 if not bb.data.getVar("OE_STRICT_CHECKSUMS",data, True):
> - =A0 =A0 =A0 =A0 =A0 =A0bb.note("This package has no entry in checksums.=
ini, please add one")
> - =A0 =A0 =A0 =A0 =A0 =A0bb.note("\n[%s]\nmd5=3D%s\nsha256=3D%s" % (src_u=
ri, md5data, shadata))
> =A0 =A0 =A0 =A0 =A0 =A0 bb.note("This package has no checksums in corresp=
onding recipe, please add")
> =A0 =A0 =A0 =A0 =A0 =A0 bb.note("SRC_URI =3D \"%s;name=3D%s\"\nSRC_URI[%s=
.md5sum] =3D \"%s\"\nSRC_URI[%s.sha256sum] =3D \"%s\"\n" % (src_uri, uname,=
 uname, md5data, uname, shadata))
> =A0 =A0 =A0 =A0 =A0 =A0 return True
> --

OK

Acked-by: Khem Raj <raj.khem@gmail.com>

> 1.6.3.3
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


