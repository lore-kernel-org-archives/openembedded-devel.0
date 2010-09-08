Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OtOb9-0007iM-Tq
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Sep 2010 19:38:19 +0200
Received: by gwb1 with SMTP id 1so177116gwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Sep 2010 10:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=+QxH3ucNL5jC55IcPQTqN4IqnH6Ktz4G7iipzxzZzFM=;
	b=TuqJP+M7z8pr4uokTqh7joDUb/vyEqpfimjHwcs0Urd29/Bj7XaG4gvheJBE8EXU+J
	h5Vy+aQx+jAN3AkaP97hRJsoEW+t6QLRP36ipI+o04jHpEAGJ1QY7vHcMJ4sZ4fRtKt4
	sVAveeitqSQ7ltTSAkBop3AFoSxfaRgMQWxYU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=nqyHgAmZ9Mt+7JFX10+t1y/Zc2oLhOexUGYKVqtFvcB65NzkSSCUV29RUaDq97mwS+
	gQvfGgNG7l+sEcVFv3m3aKIOqT58zrRSqpxOCznH1GeS9f8E+3rfSNcdvHmnNMYo5xqz
	xOru8Aw6GkWB/0t/d2slc9dQUO8ARDt+QUFRE=
Received: by 10.101.152.40 with SMTP id e40mr227570ano.198.1283967443454; Wed,
	08 Sep 2010 10:37:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.205.134 with HTTP; Wed, 8 Sep 2010 10:37:02 -0700 (PDT)
In-Reply-To: <1283954503-25418-1-git-send-email-eric@eukrea.com>
References: <1283954503-25418-1-git-send-email-eric@eukrea.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 8 Sep 2010 10:37:02 -0700
Message-ID: <AANLkTin8rLFWXNpNHsxELiWCrh40iXbnib1V7DLh7sDu@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 1/3] rlpr 2.05: unbreak recipe
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
X-List-Received-Date: Wed, 08 Sep 2010 17:38:21 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 8, 2010 at 7:01 AM, Eric B=E9nard <eric@eukrea.com> wrote:
> * source URL is no more working so use debian mirrors
> * fix GNU_HASH issue
> * tested on armv5
>
> Signed-off-by: Eric B=E9nard <eric@eukrea.com>

Acked-by: Khem Raj <raj.khem@gmail.com>

> ---
> =A0recipes/rlpr/rlpr_2.05.bb | =A0 18 ++++++++++--------
> =A01 files changed, 10 insertions(+), 8 deletions(-)
>
> diff --git a/recipes/rlpr/rlpr_2.05.bb b/recipes/rlpr/rlpr_2.05.bb
> index 47ac9c3..2751b9f 100644
> --- a/recipes/rlpr/rlpr_2.05.bb
> +++ b/recipes/rlpr/rlpr_2.05.bb
> @@ -1,18 +1,20 @@
> -SECTION =3D "console/network"
> =A0DESCRIPTION =3D "rlpr makes it possible to print files on remote sites=
 to your networked printers"
> -HOMEPAGE =3D "http://truffula.com/rlpr/"
> +HOMEPAGE =3D "http://freshmeat.net/projects/rlpr/"
> +SECTION =3D "console/network"
> =A0LICENSE =3D "GPL"
> -SRC_URI =3D "ftp://www.truffula.com/pub/rlpr-2.05.tar.gz"
> +PR =3D "r1"
> +
> +SRC_URI =3D "${DEBIAN_MIRROR}/main/r/rlpr/rlpr_2.05.orig.tar.gz"
> +SRC_URI[md5sum] =3D "64ee8ccd94aabc90b9f40d0b2ad79e79"
> +SRC_URI[sha256sum] =3D "6b1261c8a23a58c8e174d8ee1ad53c138ed0b9211f7ea3f3=
efe22d16af14ba9a"
>
> =A0inherit autotools
>
> =A0do_configure() {
> - =A0 =A0 =A0 oe_runconf
> + =A0 =A0 =A0 =A0oe_runconf
> =A0}
> -
> =A0do_install() {
> - =A0 =A0 =A0 make install DESTDIR=3D${D}
> + =A0 =A0 =A0 =A0make install DESTDIR=3D${D}
> =A0}
>
> -SRC_URI[md5sum] =3D "64ee8ccd94aabc90b9f40d0b2ad79e79"
> -SRC_URI[sha256sum] =3D "6b1261c8a23a58c8e174d8ee1ad53c138ed0b9211f7ea3f3=
efe22d16af14ba9a"
> +TARGET_CC_ARCH +=3D " ${LDFLAGS}"
> --
> 1.6.3.3
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


