Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OVTUE-0001HT-Cq
	for openembedded-devel@lists.openembedded.org;
	Sun, 04 Jul 2010 20:00:29 +0200
Received: by iwn34 with SMTP id 34so4854729iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 04 Jul 2010 10:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=UsvakqFUDEbFFjjlsi9FSYvW6We/fFtacwu8u6AQH4g=;
	b=hV+HBVfqmFUBHnD8UHtUYWvIQPHA8Nv0r7sLpIuUZ0WvBUHEfWzUrt0R5lfGelMARv
	EaVn6XnusWn7cKtEuNM2luWxEmixeD7FE04SP/Smvcns3hFcK/v6LNvSclZVFPR1+W8r
	CdSYGB0IGYwjV+lc8xmKSH5K/I1BnbdIdo6C4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=UTDOyACzu2IxSeb4BTfUxQ3u5HwOyfPVOXgCbiHqlLclYJTNDAYcgw+fCbgwxY8ucW
	s64ajPQBbZh/U5x/3lHojPyEogiTx29QKXqbbC0AOBY0lyLkYZMcsjiQLGQiZADB0oXU
	MbGVmfQB1MoRzVv8RTMxfoCoXickNaokaucJo=
Received: by 10.231.168.201 with SMTP id v9mr1780338iby.116.1278266119253; 
	Sun, 04 Jul 2010 10:55:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.14.131 with HTTP; Sun, 4 Jul 2010 10:54:59 -0700 (PDT)
In-Reply-To: <201007041550.26470.schnitzeltony@gmx.de>
References: <201007041550.26470.schnitzeltony@gmx.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 4 Jul 2010 10:54:59 -0700
Message-ID: <AANLkTiks6AKzZhkZSMahSKYTCJoRH-cl2P2yjb3gQCbF@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] libpam-base-files.bb: Change pam.d files location to fix install error.
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
X-List-Received-Date: Sun, 04 Jul 2010 18:00:34 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 4, 2010 at 6:50 AM, Andreas Mueller <schnitzeltony@gmx.de> wrot=
e:
> From 92b22e619df257257d78dc51332a684d4cd377aa Mon Sep 17 00:00:00 2001
> From: Andreas Mueller <schnitzeltony@gmx.de>
> Date: Sun, 4 Jul 2010 15:48:11 +0200
> Subject: [PATCH] libpam-base-files.bb: Change pam.d files location to fix=
 install error.
>
>
> Signed-off-by: Andreas Mueller <schnitzeltony@gmx.de>
> ---
> =A0recipes/pam/libpam-base-files.bb | =A0 =A04 ++--
> =A01 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/recipes/pam/libpam-base-files.bb b/recipes/pam/libpam-base-f=
iles.bb
> index ddcfe4c..ad31952 100644
> --- a/recipes/pam/libpam-base-files.bb
> +++ b/recipes/pam/libpam-base-files.bb
> @@ -7,10 +7,10 @@ DEPENDS =3D ""
> =A0RDEPENDS_${PN} =3D "libpam"
> =A0RRECOMMENDS_${PN} =3D "libpam-meta"
>
> -PR =3D "r6"
> +PR =3D "r7"
>
> =A0SRC_URI =3D " \
> - =A0 =A0 =A0 =A0 =A0 file://pam.d/* \
> + =A0 =A0 =A0 =A0 =A0 file://pam.d \
> =A0"
>
> =A0do_install() {
> --
> 1.5.3.4
>

You do not need this fix if you take base.bbclass patch
I posted earlier.

http://article.gmane.org/gmane.comp.handhelds.openembedded/34074

can you try it out ?
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


