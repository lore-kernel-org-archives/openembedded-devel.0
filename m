Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PfcPx-0008Ks-GS
	for openembedded-devel@lists.openembedded.org;
	Wed, 19 Jan 2011 19:06:01 +0100
Received: by yxd5 with SMTP id 5so432776yxd.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Jan 2011 10:05:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=Zu8girlnpS98VSmRagv8HV2PyrfVjVU3YHqErnKO2j4=;
	b=QiTMuxjhcoYkP8E1ZJ8ur1ZlVdjh4JJoQt5ibIFHnRufK7vZy0hlyp25qfKQghT4va
	pP1GEdac3pRM8ceCkl4dj5lPiVxm2boPZeESZUXJffO4QhOyJuX6ffpTkZnVtEa/Q53r
	0fmF7dw4ko74t39XC9IvJtNuXaaHa3cQvo2H4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=YvjE18xO+/E4wr4G3QKzjBzaHY9EHQJANMPI1M9aWNl38m3mXHcfxF6NNnE5x65o9t
	PIux2V11lYVB6TzplntVB4XYxyUPJQlD8SGA/emMjqvaGlmyC7+wl+X35edNDflNl/ua
	S9ixs2NkzLkH0wgOwHSYWYiJbpGGJEohR1yTw=
Received: by 10.90.1.2 with SMTP id 2mr1314008aga.58.1295460320809; Wed, 19
	Jan 2011 10:05:20 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.55.10 with HTTP; Wed, 19 Jan 2011 10:05:00 -0800 (PST)
In-Reply-To: <1295452649-28081-2-git-send-email-eric@eukrea.com>
References: <1295452649-28081-1-git-send-email-eric@eukrea.com>
	<1295452649-28081-2-git-send-email-eric@eukrea.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 19 Jan 2011 10:05:00 -0800
Message-ID: <AANLkTinx4zebhD4xn_EYd0U7w+1QKpjALn8cc2tBKqF9@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 2/2] busybox-1.18.2: add latest fixes
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
X-List-Received-Date: Wed, 19 Jan 2011 18:06:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 19, 2011 at 7:57 AM, Eric B=C3=A9nard <eric@eukrea.com> wrote:
> - hush: fix "cmd & <newline>" problem
> 98c46d10ee81f206f274da312086a3f0533582af
>
> - disable automatic selection of FEATURE_SUID
> 3b5acaa4323bd165077e60098af94ad9750d62fd
>
> Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>

Acked-by: Khem Raj <raj.khem@gmail.com>

> ---
> =C2=A0recipes/busybox/busybox_1.18.2.bb | =C2=A0 =C2=A08 +++++++-
> =C2=A01 files changed, 7 insertions(+), 1 deletions(-)
>
> diff --git a/recipes/busybox/busybox_1.18.2.bb b/recipes/busybox/busybox_=
1.18.2.bb
> index 71b50c8..e6d17d3 100644
> --- a/recipes/busybox/busybox_1.18.2.bb
> +++ b/recipes/busybox/busybox_1.18.2.bb
> @@ -1,11 +1,17 @@
> =C2=A0require busybox_1.1x.inc
> -PR =3D "${INC_PR}.1"
> +PR =3D "${INC_PR}.2"
>
> =C2=A0SRC_URI +=3D " \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0http://busybox.net/downloads/fixes-1.18.2/busy=
box-1.18.2-modprobe-small.patch;name=3Dpatch01 \
> + =C2=A0 =C2=A0 =C2=A0 http://busybox.net/downloads/fixes-1.18.2/busybox-=
1.18.2-buildsys.patch;name=3Dpatch02 \
> + =C2=A0 =C2=A0 =C2=A0 http://busybox.net/downloads/fixes-1.18.2/busybox-=
1.18.2-hush.patch;name=3Dpatch03 \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0"
>
> =C2=A0SRC_URI[md5sum] =3D "69a82091e5710b72db5ce0e14e7c0cd7"
> =C2=A0SRC_URI[sha256sum] =3D "aa7e1cec8cd9c7f4e56098b9e4bb2ab5d593d5a35f7=
66ad9e6a312289bf57080"
> =C2=A0SRC_URI[patch01.md5sum] =3D "dda72eaf33d19d6a0ac78e46e9411cfd"
> =C2=A0SRC_URI[patch01.sha256sum] =3D "ed5d83040414d035138bf484ccd51481734=
2b143baff43ffff6ba556952de7ed"
> +SRC_URI[patch02.md5sum] =3D "c7ae920c8adb767fc35b3a8ca3ad7351"
> +SRC_URI[patch02.sha256sum] =3D "d9398bc5e65b7eff261f20526b6e07d61bef64dd=
978c92e6317334bfaa135938"
> +SRC_URI[patch03.md5sum] =3D "854045f4b713df759b49945550843acf"
> +SRC_URI[patch03.sha256sum] =3D "b70c4406307942f38b2c8d94675b7ca7db8ba035=
1ae916f838d04856b5aad33f"
> --
> 1.6.3.3
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


