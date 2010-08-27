Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Op5PM-000736-TP
	for openembedded-devel@lists.openembedded.org;
	Fri, 27 Aug 2010 22:20:25 +0200
Received: by iwn2 with SMTP id 2so2797628iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Aug 2010 13:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=JawAwYeSb87FK7Uq+NkcCCyAWlwVEnu3pFn48ZI/+EY=;
	b=VIqUYkbeXTNVSOywrw7tlnrppM4YUxeba+heBORFHqanqjdrkdMBQdi392DyE0lNTX
	qpKvpeUY3so5aSBLO3DTAUChBtKDToufyfRZpBuv3j5fzrJzMwvSG2hMUjD6VC60y1r4
	XbIXBHDkLw+/EILnB0xMpYILQrZ0Fwf9qQ99k=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=DqO6TyUVp9gu9+NQQnH/bR/oo9WlYJ4V1bR9brpSW5bZEYwgF4ebSuAlbHVhMPwkY2
	qEbxbEudTgcI15HDADNqr4qyUzN+eP5VhokcnI304x0RCyVRmuPyqy+lUB/GKMOkKJwH
	ZezpdjACBgARjYDvZCFrysf9BGHvEccF9+Eow=
Received: by 10.231.191.74 with SMTP id dl10mr1585604ibb.157.1282940389357;
	Fri, 27 Aug 2010 13:19:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.207.8 with HTTP; Fri, 27 Aug 2010 13:19:29 -0700 (PDT)
In-Reply-To: <1282924252-22046-1-git-send-email-chase.maupin@ti.com>
References: <1282924252-22046-1-git-send-email-chase.maupin@ti.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 27 Aug 2010 13:19:29 -0700
Message-ID: <AANLkTik_1G5-zR7CXWnho4nfkFJAap4OkRp10iKphL2t@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] jpeg_8b: Allow using older versions of automake
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
X-List-Received-Date: Fri, 27 Aug 2010 20:20:25 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 27, 2010 at 8:50 AM, Chase Maupin <chasemaupin03@gmail.com> wro=
te:
>
>
> Signed-off-by: Chase Maupin <chase.maupin@ti.com>

patch looks ok. I would suggest to regenerate configure and also
include in the patch. If we use autotools class do_configure
then configure is regenerated so that may not be needed but it does
not hurt to have it patched

> ---
> =A0...igure-make-jpeg-work-with-older-autotools.patch | =A0 30 ++++++++++=
++++++++++
> =A0recipes/jpeg/jpeg_8b.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0| =A0 =A07 +++-
> =A02 files changed, 35 insertions(+), 2 deletions(-)
> =A0create mode 100644 recipes/jpeg/jpeg-8b/0001-configure-make-jpeg-work-=
with-older-autotools.patch
>
> diff --git a/recipes/jpeg/jpeg-8b/0001-configure-make-jpeg-work-with-olde=
r-autotools.patch b/recipes/jpeg/jpeg-8b/0001-configure-make-jpeg-work-with=
-older-autotools.patch
> new file mode 100644
> index 0000000..dd6fd52
> --- /dev/null
> +++ b/recipes/jpeg/jpeg-8b/0001-configure-make-jpeg-work-with-older-autot=
ools.patch
> @@ -0,0 +1,30 @@


