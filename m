Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OMLZb-0000Ro-Hh
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Jun 2010 15:44:06 +0200
Received: by fxm9 with SMTP id 9so3752542fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Jun 2010 06:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=qzQiYohE3RlF31aI9tP7IqdYVtcxh57kViuMsKnpwMM=;
	b=tpZdQVIjIdLci3ss4gKIqaCjCiFbOHJWOpLXrPBB2hfqFxC9KPAotUPxJwnRdX/Exp
	MibwAfG7zIjDPZOgeVw4O8wQ60ay0LyX/IFo6RxAk24uIqPrWax8zArRuE1O5E9RJI1l
	z+sgR6qovCg+cH6XJ7NvTAzmyN9UGj0LWBzc8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=HHADwjvaoRxjcteT9oXXv44xaVeh5UffkKs56e4v+3jSFwHXOrD5Y00ITg/B3ICVRt
	FKIQ25eCEUyPpgmR45zKspeU9mQU0A+RBBItbd/xEZlzFB5zRmeEshQanEMzGLhHgUN+
	aYMaV+jlMIueORZAn3dD/u2PNr9KuDwz/u5Vo=
MIME-Version: 1.0
Received: by 10.223.29.135 with SMTP id q7mr2609582fac.30.1276090779147; Wed, 
	09 Jun 2010 06:39:39 -0700 (PDT)
Received: by 10.223.106.138 with HTTP; Wed, 9 Jun 2010 06:39:39 -0700 (PDT)
In-Reply-To: <1276082253-26496-1-git-send-email-Martin.Jansa@gmail.com>
References: <1276082253-26496-1-git-send-email-Martin.Jansa@gmail.com>
Date: Wed, 9 Jun 2010 15:39:39 +0200
Message-ID: <AANLkTilS9Zi6OOcwKRSxkqTUlKB3WQZVkhwoDezzzNXw@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] gcc: target gcc should include all libexec binaries, ie 	lto-wrapper
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
X-List-Received-Date: Wed, 09 Jun 2010 13:44:06 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 9, 2010 at 1:17 PM, Martin Jansa <martin.jansa@gmail.com> wrote=
:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
> =A0recipes/gcc/gcc-package-target.inc | =A0 =A02 +-
> =A01 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/recipes/gcc/gcc-package-target.inc b/recipes/gcc/gcc-package=
-target.inc
> index 0676b53..32b0a48 100644
> --- a/recipes/gcc/gcc-package-target.inc
> +++ b/recipes/gcc/gcc-package-target.inc
> @@ -17,7 +17,7 @@ PACKAGES =3D "\
> =A0FILES_${PN} =3D "\
> =A0 ${bindir}/${TARGET_PREFIX}gcc \
> =A0 ${bindir}/${TARGET_PREFIX}gccbug \
> - =A0${libexecdir}/gcc/${TARGET_SYS}/${BINV}/collect2 \
> + =A0${libexecdir}/gcc/${TARGET_SYS}/${BINV}/* \

I was wrong to include * here, because it steals ie cpp from cpp
package, but you get the idea.

Please comment if gcc package is right place to put lto binaries

./usr/libexec/gcc/arm-angstrom-linux-gnueabi/4.5.1/lto1
./usr/libexec/gcc/arm-angstrom-linux-gnueabi/4.5.1/collect2
./usr/libexec/gcc/arm-angstrom-linux-gnueabi/4.5.1/lto-wrapper
is probably enough

Regards


