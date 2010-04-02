Received: from mail-pz0-f192.google.com ([209.85.222.192])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NxlbE-0003B7-Js
	for openembedded-devel@lists.openembedded.org;
	Fri, 02 Apr 2010 20:28:10 +0200
Received: by pzk30 with SMTP id 30so1866589pzk.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Apr 2010 11:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:received:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=xpbX8IxEG1RG40hzrYG8i2/GqomDZ7l38ZwQ8D5lj+Y=;
	b=lBxm+5/2KFkPyoOI8ssqOfG/yRVR9Hk2b0WT737dYxEWzqjoDDCdlOUvaxPsf/hbuG
	M/UllCBg8fUCvKJsIh6mKQGyq1UNBcU8GdTbgN4nCAncyRMah5+8nKga01Ly4tp/kmf6
	EghY9Bh8frlm6iWmdcjXFrP249RAXdIzKGjDM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=ZLbY1PPdyKjYt9uSg42lu4LTSBqEjH0+9ut1lmx9oGdHkLH0z8WM+gXMOlBC3kbYii
	Uay+TOOvcPgTZHFDPraWEPgNSMCgVIiqZmqdCPVEebU6I2XLJvJsLmKE4RAJMTPrDBhA
	+6INFfomV3IKWM69UF+0c6kALo0lcdiVehr5g=
MIME-Version: 1.0
Received: by 10.231.16.77 with HTTP; Fri, 2 Apr 2010 11:24:49 -0700 (PDT)
In-Reply-To: <1270223518.3873.22.camel@mattotaupa>
References: <1270223518.3873.22.camel@mattotaupa>
Date: Fri, 2 Apr 2010 11:24:49 -0700
Received: by 10.142.210.16 with SMTP id i16mr526602wfg.166.1270232689748; Fri, 
	02 Apr 2010 11:24:49 -0700 (PDT)
Message-ID: <l2w19c1b8a91004021124q299e5349vea2a2d9dbf2729e0@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.222.192
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] libvalhalla: Correct `PV` for `libvalhalla_hg.bb`.
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
X-List-Received-Date: Fri, 02 Apr 2010 18:28:11 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 2, 2010 at 8:51 AM, Paul Menzel
<paulepanter@users.sourceforge.net> wrote:
> Otherwise `libvalhalla_1.0.1.bb` is the preferred recipe if `bitbake libv=
alhalla` is run.
>
> Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>

Acked-by: Khem Raj <raj.khem@gmail.com>

> ---
> =A0recipes/libvalhalla/libvalhalla_hg.bb | =A0 =A02 +-
> =A01 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/recipes/libvalhalla/libvalhalla_hg.bb b/recipes/libvalhalla/=
libvalhalla_hg.bb
> index 73a4cd0..5f08fdc 100644
> --- a/recipes/libvalhalla/libvalhalla_hg.bb
> +++ b/recipes/libvalhalla/libvalhalla_hg.bb
> @@ -1,5 +1,5 @@
> =A0require libvalhalla.inc
> -PV =3D "1.0.0+hg"
> +PV =3D "1.0.1+hg"
> =A0PR =3D "${INC_PR}.0"
>
> =A0SRCREV =3D "a12610802732"
> --
> 1.7.0.3
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>


