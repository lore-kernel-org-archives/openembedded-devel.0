Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <daniel.mcdougall@liftoffsoftware.com>)
	id 1ScI8A-0002Lw-Ch for openembedded-devel@lists.openembedded.org;
	Wed, 06 Jun 2012 17:26:42 +0200
Received: by wibhm14 with SMTP id hm14so4570963wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Jun 2012 08:16:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:date
	:message-id:subject:from:to:content-type:x-gm-message-state;
	bh=sV4MGCuEghoi18nS0RW93WJcsxqEdnuTV45136Kshv0=;
	b=TQnuciRIOVGHpsHOm3jK8sJmOvu702Y+iY1KalP1fWN9EcWTs8mqQkQt+T+kpFj45K
	c7F8ad3PuqhzdVFQUTYCd2Zc1fkskHbCcFYSpwF09DuuCVB3jqUpaSbHlf7EBYqGeM9S
	N28g4sRyDr7QB8V0BWh1UhKcfPfEko4LP6VhUtLQANMiL80+nowk3zYstjAF9ZjC5xjZ
	VJK7miNLcBelCxPofJ1BCPGvvqq+rTJpwv5qezG/ESv17vwbZBXCII4r4XX1Zj6L7rlH
	9mkhI/WmjsDvcXwHP84FcF4oGemwd07Y6I+xTM/XNoqcRq+bKdXaFYFwMFfp2Ew0FKlI
	7gPA==
MIME-Version: 1.0
Received: by 10.216.227.154 with SMTP id d26mr17788147weq.9.1338995774890;
	Wed, 06 Jun 2012 08:16:14 -0700 (PDT)
Received: by 10.223.76.200 with HTTP; Wed, 6 Jun 2012 08:16:14 -0700 (PDT)
X-Originating-IP: [69.180.64.152]
In-Reply-To: <1338995599-32521-1-git-send-email-daniel.mcdougall@liftoffsoftware.com>
References: <1338995599-32521-1-git-send-email-daniel.mcdougall@liftoffsoftware.com>
Date: Wed, 6 Jun 2012 11:16:14 -0400
Message-ID: <CAG3aBq4LamuK4MT3G4-+az123UCs91J1AvM2GEuK6MTWfRjpQA@mail.gmail.com>
From: Daniel McDougall <daniel.mcdougall@liftoffsoftware.com>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQn/WZy3SWJVyFWT+epA5tyz34TRlUwSa38eiU7IX3q9z+1ZUaRD/2/9MVB+SkffxvIB1T1x
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [meta-oe][PATCH v2] python-numpy : Add missing dependencies.
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
X-List-Received-Date: Wed, 06 Jun 2012 15:26:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Ignore this.  Apparently my 'git commit --amend' didn't catch my fix.

On Wed, Jun 6, 2012 at 11:13 AM, Dan McDougall <
daniel.mcdougall@liftoffsoftware.com> wrote:

> Numpy was missing a number of dependencies in the .bb file without which
> it will
> not work. This v2 version of the patch fixes the difflib dependency.
>
> Signed-off-by: Dan McDougall <daniel.mcdougall@liftoffsoftware.com>
> ---
>  .../recipes-devtools/python/python-numpy_1.4.1.bb  |    5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/meta-oe/recipes-devtools/python/python-numpy_1.4.1.bbb/meta-=
oe/recipes-devtools/python/
> python-numpy_1.4.1.bb
> index 36ab622..bae624e 100644
> --- a/meta-oe/recipes-devtools/python/python-numpy_1.4.1.bb
> +++ b/meta-oe/recipes-devtools/python/python-numpy_1.4.1.bb
> @@ -24,3 +24,8 @@ do_compile_prepend() {
>
>  SRC_URI[md5sum] =3D "5c7b5349dc3161763f7f366ceb96516b"
>  SRC_URI[sha256sum] =3D
> "2e7bb84573e5123e07f3c919fd433bc09b78d606252b6b719e385c2a981d8e06"
> +
> +RDEPENDS_${PN} =3D "python-unittest \
> +                  python-diffutils \
> +                  python-pprint \
> +                 "
> --
> 1.7.9.5
>
>


--=20
Dan McDougall - Chief Executive Officer and Developer
Liftoff Software =E2=9C=88 Your flight to the cloud is now boarding.
904-446-8323

