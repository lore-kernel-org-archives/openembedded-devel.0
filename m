Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f177.google.com (mail-ig0-f177.google.com
	[209.85.213.177])
	by mail.openembedded.org (Postfix) with ESMTP id 581B9758F5
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Jun 2015 15:03:55 +0000 (UTC)
Received: by igbpi8 with SMTP id pi8so28484210igb.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Jun 2015 08:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=thIvQvFJUUWPoQBW/+Ok3k0QB87J8SkdcB6/vB8y6a4=;
	b=YItBR7cX3rwwcfhm7WO7EUg5tJJJRfLFA/68k8Bc5yVMee3axqzyMIVDWu8An8KRBq
	MujF4hINTCtcoS3ng0mQfq/gZcDZZa45GgRuWcobbNroby24dL4gnngSNs4Uhy2fkJJY
	+G13LB6dPMaSXfluZi5eP0CcUu5UYY8emB8sHT2WEwKjuuLwqNj173evJ9m7lOhlbLYp
	EPJ1rzlCRbKe5itX3y6ZsQosZ955ZCDho+ljaroYcWTqAatPN1DrIu+eJ/TwHjxm0yH5
	XjXbN/BPDzf4+meTtWwZjUbgu97PaNF2RzjzUlB5qXcom64lHua1HixZ+PQDMSWZA71z
	AGEg==
X-Received: by 10.42.83.212 with SMTP id i20mr21610173icl.91.1434207837172;
	Sat, 13 Jun 2015 08:03:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.20.83 with HTTP; Sat, 13 Jun 2015 08:03:26 -0700 (PDT)
In-Reply-To: <1434178975-21236-1-git-send-email-schnitzeltony@googlemail.com>
References: <1434178975-21236-1-git-send-email-schnitzeltony@googlemail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 13 Jun 2015 11:03:26 -0400
Message-ID: <CAMKF1sqveso9QHJQTAj6ia_CWwKsuy6zYcCQqKyU3QyhXwEDPw@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH] qt5-opengles2-test: update to last commit
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 13 Jun 2015 15:03:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 13, 2015 at 3:02 AM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> * don't segfault in case qtsensors does not find accelerometer values
>

looks ok

> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> ---
>  recipes-qt/examples/qt5-opengles2-test_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-qt/examples/qt5-opengles2-test_git.bb b/recipes-qt/e=
xamples/qt5-opengles2-test_git.bb
> index f763912..10c0aed 100644
> --- a/recipes-qt/examples/qt5-opengles2-test_git.bb
> +++ b/recipes-qt/examples/qt5-opengles2-test_git.bb
> @@ -13,7 +13,7 @@ DEPENDS =3D "qtbase qtsensors"
>  EXCLUDE_FROM_WORLD =3D "1"
>
>  SRC_URI =3D "git://github.com/thp/qt5-opengles2-test.git"
> -SRCREV =3D "3fa3789c28658b6f0bbddc3105f575f1074e87f2"
> +SRCREV =3D "938390507054ed1258345f70ed55770d2fe56176"
>  S =3D "${WORKDIR}/git"
>
>  inherit qmake5
> --
> 1.9.3
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

