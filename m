Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PYvvV-00063P-GS
	for openembedded-devel@lists.openembedded.org;
	Sat, 01 Jan 2011 08:30:57 +0100
Received: by gwaa12 with SMTP id a12so2628862gwa.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Dec 2010 23:30:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=Co0RpNqfj9qaEl8MNNPacRs5ppTM+LK6F0SrI1C/IBA=;
	b=P+++CiTsotJUOKx0u/b44Q0k/3nB1Ww9wvXYhMHPvsz+idYQNKV/u4cJgax6LXS5AF
	C1cRGMDUJZHbQIQxo4olMo09pgmFkXv0tBzVKXuZ0h1DEeRj892E5oDi0prnocepRMQi
	h/c0voeJNF5QutXfFkDS0KwhyYxpesf0KtZoU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=X7yB8KR/arvgB1OD5d/pUhtBGp6p3fZwEaHNe48lEKLsm0vkhDio+G674KFclpjBWj
	V1Uj9kY0c/SIaChPkcjUJyG2qlqg1djAj46aSRLZoZ3dnLOVH21coGiNiNpjAX+xs2mU
	q6Nry3DJhJq75qA/9aVID0KpUmy96dwy6HrGw=
Received: by 10.90.10.21 with SMTP id 21mr9687050agj.112.1293867034886; Fri,
	31 Dec 2010 23:30:34 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.86.4 with HTTP; Fri, 31 Dec 2010 23:30:13 -0800 (PST)
In-Reply-To: <1293835744-10837-2-git-send-email-eric@eukrea.com>
References: <1293835744-10837-1-git-send-email-eric@eukrea.com>
	<1293835744-10837-2-git-send-email-eric@eukrea.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 31 Dec 2010 23:30:13 -0800
Message-ID: <AANLkTik+hx2nV7OyKDRvHYVPhFZOM524HYCEUtqOZF2o@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 2/3] busybox-1.18.1 is stable so can be the default
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
X-List-Received-Date: Sat, 01 Jan 2011 07:30:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 31, 2010 at 2:49 PM, Eric B=C3=A9nard <eric@eukrea.com> wrote:
> so remove DP=3D-1
>
> Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>
Acked-by: Khem Raj <raj.khem@gmail.com>

> ---
> =C2=A0recipes/busybox/busybox_1.18.1.bb | =C2=A0 =C2=A02 --
> =C2=A01 files changed, 0 insertions(+), 2 deletions(-)
>
> diff --git a/recipes/busybox/busybox_1.18.1.bb b/recipes/busybox/busybox_=
1.18.1.bb
> index e41f46d..2f78be9 100644
> --- a/recipes/busybox/busybox_1.18.1.bb
> +++ b/recipes/busybox/busybox_1.18.1.bb
> @@ -1,8 +1,6 @@
> =C2=A0require busybox_1.1x.inc
> =C2=A0PR =3D "${INC_PR}.1"
>
> -DEFAULT_PREFERENCE =3D "-1"
> -
> =C2=A0SRC_URI +=3D " \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0file://busybox-1.18.1-hush.patch \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0file://busybox-1.18.1-cpio.patch \
> --
> 1.6.3.3
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


