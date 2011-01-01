Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PYvuT-00061t-MY
	for openembedded-devel@lists.openembedded.org;
	Sat, 01 Jan 2011 08:29:53 +0100
Received: by gxk20 with SMTP id 20so5387881gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Dec 2010 23:29:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=+2umPfR97sqHXfM7nLrJe0Cj9ZJwtv7g7Huu/FxacjU=;
	b=jk/DWdh68b9ZM5WgVkgDbHb7ihqw7e833q8/VIMe1AqgQASYNIyfBuatLV971xjZ06
	YTCJV3bhKvdRGOr1k6mAhZqgZfw4cyUYHNpKaj7uN+7jf8tLBjdUDemvgVZMKoG1ErH2
	uWphnIe1Bile7YuddZVvcK2fWO1J5w4LiSD/E=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=gPhaD8HdFXBBU8AtwriDo6doA9mrhwxHn/tCKCzZrF9c+Vyx2wTyeOirU6/qtaKn0h
	sEx7I4s805H0QSR9donq0id/5MAPgE0Xz4EKWC2zhtMuVCmv/12fpBxMtrjwC6YlTyS6
	o+KRR1jb8s7BNvMuTVzr9VxwkOOzfhO20Nkw4=
Received: by 10.91.163.27 with SMTP id q27mr9671279ago.139.1293866971896; Fri,
	31 Dec 2010 23:29:31 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.86.4 with HTTP; Fri, 31 Dec 2010 23:29:11 -0800 (PST)
In-Reply-To: <1293835744-10837-1-git-send-email-eric@eukrea.com>
References: <1293835744-10837-1-git-send-email-eric@eukrea.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 31 Dec 2010 23:29:11 -0800
Message-ID: <AANLkTim9B_OOxgOqQZUiHgme6d8VvMd0PTsvBGBuv=9_@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 1/3] busybox-1.18.1: add latest fix
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
X-List-Received-Date: Sat, 01 Jan 2011 07:29:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 31, 2010 at 2:49 PM, Eric B=C3=A9nard <eric@eukrea.com> wrote:
> * patch comes from :
> =C2=A0 =C2=A0 =C2=A0 =C2=A0http://busybox.net/downloads/fixes-1.18.1/
> * original commit in bb's git :
> =C2=A0 =C2=A0 =C2=A0 =C2=A0bzip2: plug memory leak on every processed fil=
e
>
> Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>

Acked-by: Khem Raj <raj.khem@gmail.com>
> ---
> =C2=A0.../busybox-1.18.1/busybox-1.18.1-bzip2.patch =C2=A0 =C2=A0 =C2=A0|=
 =C2=A0 40 ++++++++++++++++++++
> =C2=A0recipes/busybox/busybox_1.18.1.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A03 +-
> =C2=A02 files changed, 42 insertions(+), 1 deletions(-)
> =C2=A0create mode 100644 recipes/busybox/busybox-1.18.1/busybox-1.18.1-bz=
ip2.patch
>
> diff --git a/recipes/busybox/busybox-1.18.1/busybox-1.18.1-bzip2.patch b/=
recipes/busybox/busybox-1.18.1/busybox-1.18.1-bzip2.patch
> new file mode 100644
> index 0000000..cffa194
> --- /dev/null
> +++ b/recipes/busybox/busybox-1.18.1/busybox-1.18.1-bzip2.patch
> @@ -0,0 +1,40 @@
> +diff -urpN busybox-1.18.1/archival/bzip2.c busybox-1.18.1-bzip2/archival=
/bzip2.c
> +--- busybox-1.18.1/archival/bzip2.c =C2=A0 =C2=A02010-12-20 01:41:26.000=
000000 +0100
> ++++ busybox-1.18.1-bzip2/archival/bzip2.c =C2=A0 =C2=A0 =C2=A02010-12-30=
 04:43:11.000000000 +0100
> +@@ -128,10 +128,12 @@ IF_DESKTOP(long long) int FAST_FUNC comp
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 break;
> + =C2=A0 =C2=A0 =C2=A0 }
> +
> +-#if ENABLE_FEATURE_CLEAN_UP
> ++ =C2=A0 =C2=A0 =C2=A0/* Can't be conditional on ENABLE_FEATURE_CLEAN_UP=
 -
> ++ =C2=A0 =C2=A0 =C2=A0 * we are called repeatedly
> ++ =C2=A0 =C2=A0 =C2=A0 */
> + =C2=A0 =C2=A0 =C2=A0 BZ2_bzCompressEnd(strm);
> + =C2=A0 =C2=A0 =C2=A0 free(iobuf);
> +-#endif
> ++
> + =C2=A0 =C2=A0 =C2=A0 return total;
> + }
> +
> +diff -urpN busybox-1.18.1/archival/libarchive/bz/bzlib.c busybox-1.18.1-=
bzip2/archival/libarchive/bz/bzlib.c
> +--- busybox-1.18.1/archival/libarchive/bz/bzlib.c =C2=A0 =C2=A0 =C2=A020=
10-12-20 01:41:26.000000000 +0100
> ++++ busybox-1.18.1-bzip2/archival/libarchive/bz/bzlib.c =C2=A0 =C2=A0 =
=C2=A0 =C2=A02010-12-30 04:43:11.000000000 +0100
> +@@ -361,7 +361,6 @@ int BZ2_bzCompress(bz_stream *strm, int
> +
> +
> + /*---------------------------------------------------*/
> +-#if ENABLE_FEATURE_CLEAN_UP
> + static
> + void BZ2_bzCompressEnd(bz_stream *strm)
> + {
> +@@ -372,9 +371,8 @@ void BZ2_bzCompressEnd(bz_stream *strm)
> + =C2=A0 =C2=A0 =C2=A0 free(s->arr2);
> + =C2=A0 =C2=A0 =C2=A0 free(s->ftab);
> + =C2=A0 =C2=A0 =C2=A0 free(s->crc32table);
> +- =C2=A0 =C2=A0 =C2=A0free(strm->state);
> ++ =C2=A0 =C2=A0 =C2=A0free(s);
> + }
> +-#endif
> +
> +
> + /*---------------------------------------------------*/
> diff --git a/recipes/busybox/busybox_1.18.1.bb b/recipes/busybox/busybox_=
1.18.1.bb
> index 8fe1210..e41f46d 100644
> --- a/recipes/busybox/busybox_1.18.1.bb
> +++ b/recipes/busybox/busybox_1.18.1.bb
> @@ -1,11 +1,12 @@
> =C2=A0require busybox_1.1x.inc
> -PR =3D "${INC_PR}.0"
> +PR =3D "${INC_PR}.1"
>
> =C2=A0DEFAULT_PREFERENCE =3D "-1"
>
> =C2=A0SRC_URI +=3D " \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0file://busybox-1.18.1-hush.patch \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0file://busybox-1.18.1-cpio.patch \
> + =C2=A0 =C2=A0 =C2=A0 file://busybox-1.18.1-bzip2.patch \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0"
>
> =C2=A0SRC_URI[md5sum] =3D "f15fe752d8b7012aa5e59f83b88ccb1c"
> --
> 1.6.3.3
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


