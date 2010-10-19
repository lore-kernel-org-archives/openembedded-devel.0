Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P8G3S-00031o-Nh
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Oct 2010 19:32:55 +0200
Received: by gwb17 with SMTP id 17so1464034gwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Oct 2010 10:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=yOtUUPLcqJW59aAWG3aJBQiB8n5Cuor7ijfN1a3urgQ=;
	b=gm1Q/WXoxn1peACO7fPXx8ROWVHcWjl4Rhw1NC+wlx3XMiF7klD86UYvx41JuA/yPK
	jIJCdrMO7nM/SIN7aXe2r10zUrwv/pP5ETT5BIliPg5rNO31zf+xjNothcKUkDDXc0bq
	oZBREmRN3w9EBfaX7FZ4NX2mjDVEEFIxv9Wxc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=F2gexe2Vctejwgz79wLX0TApp8C7tB2Nv2z2l/zjnGVShMfmwIJbpJGtc0Q3+kMDCV
	dNe9bsRs1id+XrouCPngwyzMTmvCsx8L901qYxbuu8WTF+BacZw9hjmWi++C8DkQTy0m
	XlJ9Qy0e1ei5CRJXQuB7h54WYXw8ixGtqSDRI=
MIME-Version: 1.0
Received: by 10.42.191.18 with SMTP id dk18mr1752483icb.251.1287509538909;
	Tue, 19 Oct 2010 10:32:18 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Tue, 19 Oct 2010 10:32:14 -0700 (PDT)
In-Reply-To: <1287507624-29362-1-git-send-email-obi@opendreambox.org>
References: <1287506184-13086-1-git-send-email-obi@opendreambox.org>
	<1287507624-29362-1-git-send-email-obi@opendreambox.org>
Date: Tue, 19 Oct 2010 19:32:14 +0200
Message-ID: <AANLkTikVU2M3gEC_Zd4PTPys_Er4x+uU0txYw5BftQVJ@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH v2] dvdauthor-0.6.18: initial recipe
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
X-List-Received-Date: Tue, 19 Oct 2010 17:32:56 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/10/19 Andreas Oberritter <obi@opendreambox.org>:
> * v2: updated DESCRIPTION, SECTION and PRIORITY
>
> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> ---
> =A0recipes/dvdauthor/dvdauthor_0.6.18.bb | =A0 13 +++++++++++++
> =A01 files changed, 13 insertions(+), 0 deletions(-)
> =A0create mode 100644 recipes/dvdauthor/dvdauthor_0.6.18.bb
>
> diff --git a/recipes/dvdauthor/dvdauthor_0.6.18.bb b/recipes/dvdauthor/dv=
dauthor_0.6.18.bb
> new file mode 100644
> index 0000000..24f3a74
> --- /dev/null
> +++ b/recipes/dvdauthor/dvdauthor_0.6.18.bb
> @@ -0,0 +1,13 @@
> +DESCRIPTION =3D "A set of tools to help you generate DVD files to be pla=
yed back on a standalone DVD player"
> +SECTION =3D "console/multimedia"
> +PRIORITY =3D "optional"
> +LICENSE =3D "GPLv2"

Have you verified this is v2 and not v2 or later (aka v2+)?

> +DEPENDS =3D "freetype libdvdread libfribidi libpng libxml2 zlib"
> +
> +SRC_URI =3D "${SOURCEFORGE_MIRROR}/${PN}/${P}.tar.gz"
> +SRC_URI[md5sum] =3D "ded5373800ac6448ff044606f5047550"
> +SRC_URI[sha256sum] =3D "0e21c2d9c09f7e347c4c9bd7b691455f524ec2e91bcafc18=
b84d7b7fb3a9cb26"
> +
> +S =3D "${WORKDIR}/${PN}"
> +
> +inherit autotools
> --
> 1.7.1
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


