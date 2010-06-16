Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OOwxX-0006Hx-BS
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Jun 2010 20:03:48 +0200
Received: by gyg10 with SMTP id 10so4512306gyg.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Jun 2010 10:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:cc:content-type
	:content-transfer-encoding;
	bh=KhUhZvaOy7c2wMv5KK9PfoITfbYjTtesHODiCzzPnes=;
	b=ND9qMHKdQQda7ugUhT2XiL6POK7BqdZJrzMNdLHaTdlYwqs0qoHV/cMGAo4PVYk4H9
	H7H7KNGQc7hyrxYkthIMbxJdo1gITqqpBOyBz305Z15LdJOLZx4iBIqxf2w2cVfX+s5K
	zqGS8Bq1suZhFEQKNjzykSH15v9bn+AU0ik5Y=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=Df7yvlvZjSaewjUeA3KaN/PJOwYuCCRB9pU+zf0OSCJUcaPb/O6mFOBeeB2Nvfomva
	ObPBFCFNNOu0/Qav3O4FJ7BUGaOOP8XFFKH/XaAZiYFpItGcUWuc5opHxPYNU7f4UEht
	IBhgYfMUnpeqn0DHHqWz5VHhZBYXgXJLaeGlM=
Received: by 10.91.55.17 with SMTP id h17mr6789685agk.57.1276711138869; Wed, 
	16 Jun 2010 10:58:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.17.130 with HTTP; Wed, 16 Jun 2010 10:58:37 -0700 (PDT)
In-Reply-To: <4c168f9c.02afcc0a.1a9e.7e1c@mx.google.com>
References: <4c168f9c.02afcc0a.1a9e.7e1c@mx.google.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 16 Jun 2010 10:58:37 -0700
Message-ID: <AANLkTinIWAMOOrdEFYCPaCEDAyainImJgA3Sa4wKBehB@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Leon Woestenberg <leon@sidebranch.com>
Subject: Re: [PATCH] udev/{acl, attr}: Fix install. Wanted to install to 	host /usr/bin/.
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
X-List-Received-Date: Wed, 16 Jun 2010 18:03:48 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 14, 2010 at 1:12 PM, Leon Woestenberg
<leon.woestenberg@gmail.com> wrote:
> The subdirectory Makefile includes a file, that overrides the
> variables inherited from the parent Makefile. Those where provided
> to the parent make through '-e'.
>
> Make sure the subdir makes also use '-e'.
>
> (An alternative fix is to sed the include file.)
>
> Signed-off-by: Leon Woestenberg <leon@sidebranch.com>

Acked-by: Khem Raj <raj.khem@gmail.com>

> ---
> =A0recipes/udev/acl_2.2.49.bb =A0| =A0 =A02 ++
> =A0recipes/udev/attr_2.4.44.bb | =A0 =A02 ++
> =A02 files changed, 4 insertions(+), 0 deletions(-)
>
> diff --git a/recipes/udev/acl_2.2.49.bb b/recipes/udev/acl_2.2.49.bb
> index aeec494..027a8c6 100644
> --- a/recipes/udev/acl_2.2.49.bb
> +++ b/recipes/udev/acl_2.2.49.bb
> @@ -30,6 +30,8 @@ do_install() {
> =A0 =A0 export PKG_MAN_DIR=3D${D}${mandir}
> =A0 =A0 export PKG_DOC_DIR=3D${D}${datadir}/doc/acl
> =A0 =A0 export PKG_LOCALE_DIR=3D${D}${datadir}/locale
> + =A0 =A0# ensure the subdir Makefile do not use the (wrong) variable ove=
rrides from the include file
> + =A0 =A0export MAKE=3D"${MAKE} -e"
>
> =A0 =A0 oe_runmake -e install install-dev install-lib
>
> diff --git a/recipes/udev/attr_2.4.44.bb b/recipes/udev/attr_2.4.44.bb
> index ee48693..c2054d1 100644
> --- a/recipes/udev/attr_2.4.44.bb
> +++ b/recipes/udev/attr_2.4.44.bb
> @@ -30,6 +30,8 @@ do_install() {
> =A0 =A0 =A0 =A0export PKG_MAN_DIR=3D${D}${mandir}
> =A0 =A0 =A0 =A0export PKG_DOC_DIR=3D${D}${datadir}/doc/attr
> =A0 =A0 =A0 =A0export PKG_LOCALE_DIR=3D${D}${datadir}/locale
> + =A0 =A0 =A0 =A0# ensure the subdir Makefile do not use the (wrong) vari=
able overrides from the include file
> + =A0 =A0 =A0 =A0export MAKE=3D"${MAKE} -e"
>
> =A0 =A0 =A0 =A0oe_runmake -e install install-dev install-lib
>
> --
> 1.6.3.3
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


