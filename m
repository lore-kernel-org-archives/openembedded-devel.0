Received: from mail-yx0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1NZJGr-0000Je-Mr
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Jan 2010 08:22:04 +0100
Received: by yxe5 with SMTP id 5so2567066yxe.24
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Jan 2010 23:19:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=9ki9LV04p5R6dIbWaDCcflB5Cwu4aUfgB43YQdiqbwQ=;
	b=WmsfnHbARjVutG4Stqfn7mTTx2Zbw5rIrYSNIlUDyfvN6UyQpiHVo9EB7kq0CbaQTq
	2PR1gG1K1y87OvFKtiAgnwLzeqmIvPMNemUevLzyUQ7eI3lH6p/2iNDj7iesDVRcfX80
	zHt41Q6RSqkvqGUuFI7QsSBe8uhXTrRR+b3Os=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=A6LzeFVXHJwvgVEPtlUVcAFre4DGlT1w6x+DvIzcbr/KM0jDx1NxJ6iEZaHjBMVSkJ
	WpVcV7ZsRCpLt2tL0P5tVtgrj1yuiw6pGxbacKF89t63J8f/Ul6KyHbDoBZyZEOY9B6+
	a7X+GmVMiOItGfNg/GAOgxVSiwOES+x5McAJI=
MIME-Version: 1.0
Received: by 10.101.149.39 with SMTP id b39mr7445935ano.17.1264403981231; Sun, 
	24 Jan 2010 23:19:41 -0800 (PST)
In-Reply-To: <1264384785-30439-2-git-send-email-denis@denix.org>
References: <20100125015636.GA9855@denix.org>
	<1264384785-30439-2-git-send-email-denis@denix.org>
Date: Mon, 25 Jan 2010 08:19:41 +0100
Message-ID: <ac9c93b11001242319v6095ee64x4c1a8de063517bdc@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.210.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH 1/2] base.bbclass: pre-create SRC_URI checksums to include in the recipe
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
X-List-Received-Date: Mon, 25 Jan 2010 07:22:05 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/1/25 Denys Dmytriyenko <denis@denix.org>:
> Signed-off-by: Denys Dmytriyenko <denis@denix.org>
> ---
> =A0classes/base.bbclass | =A0 18 ++++++++++++++++++
> =A01 files changed, 18 insertions(+), 0 deletions(-)
>
> diff --git a/classes/base.bbclass b/classes/base.bbclass
> index 384a67d..8465286 100644
> --- a/classes/base.bbclass
> +++ b/classes/base.bbclass
> @@ -151,9 +151,27 @@ def base_chk_file(parser, pn, pv, src_uri, localpath=
, data):
>
> =A0 =A0 =A0 =A0 file.write("[%s]\nmd5=3D%s\nsha256=3D%s\n\n" % (src_uri, =
md5data, shadata))
> =A0 =A0 =A0 =A0 file.close()
> +
> + =A0 =A0 =A0 =A0from string import maketrans
> + =A0 =A0 =A0 =A0trtable =3D maketrans("", "")
> + =A0 =A0 =A0 =A0uname =3D src_uri.split("/")[-1].translate(trtable, "-+.=
_")
> +
> + =A0 =A0 =A0 =A0try:
> + =A0 =A0 =A0 =A0 =A0 =A0ufile =3D open("%s/%s.sum" % (bb.data.getVar("TM=
PDIR", data, 1), uname), "wt")
> + =A0 =A0 =A0 =A0except:
> + =A0 =A0 =A0 =A0 =A0 =A0return False
> +
> + =A0 =A0 =A0 =A0if not ufile:
> + =A0 =A0 =A0 =A0 =A0 =A0raise Exception("Creating %s.sum failed" % uname=
)
> +
> + =A0 =A0 =A0 =A0ufile.write("SRC_URI =3D \"%s;name=3D%s\"\nSRC_URI[%s.md=
5sum] =3D \"%s\"\nSRC_URI[%s.sha256sum] =3D \"%s\"\n" % (src_uri, uname, un=
ame, md5data, uname, shadata))
> + =A0 =A0 =A0 =A0ufile.close()
> +
> =A0 =A0 =A0 =A0 if not bb.data.getVar("OE_STRICT_CHECKSUMS",data, True):
> =A0 =A0 =A0 =A0 =A0 =A0 bb.note("This package has no entry in checksums.i=
ni, please add one")
> =A0 =A0 =A0 =A0 =A0 =A0 bb.note("\n[%s]\nmd5=3D%s\nsha256=3D%s" % (src_ur=
i, md5data, shadata))
> + =A0 =A0 =A0 =A0 =A0 =A0bb.note("This package has no checksums in corres=
ponding recipe, please add")
> + =A0 =A0 =A0 =A0 =A0 =A0bb.note("SRC_URI =3D \"%s;name=3D%s\"\nSRC_URI[%=
s.md5sum] =3D \"%s\"\nSRC_URI[%s.sha256sum] =3D \"%s\"\n" % (src_uri, uname=
, uname, md5data, uname, shadata))
> =A0 =A0 =A0 =A0 =A0 =A0 return True
> =A0 =A0 =A0 =A0 else:
> =A0 =A0 =A0 =A0 =A0 =A0 bb.note("Missing checksum")
> --
> 1.6.3.3

Nice!

Acked-by: Frans meulenbroeks <fransmeulenbroeks@gmail.com>


