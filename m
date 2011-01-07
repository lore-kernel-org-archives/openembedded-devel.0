Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PbKdP-0008NL-Si
	for openembedded-devel@lists.openembedded.org;
	Fri, 07 Jan 2011 23:18:12 +0100
Received: by gwaa12 with SMTP id a12so4822385gwa.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 Jan 2011 14:17:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=N1+5Gt1dxV9n997k8nCRJXxeHR7YWnttIbamZavfL8U=;
	b=VRkSyslkqNNBC3+cT7j/VpIY/pryVXpqszvFv+t7/dJPkKdh7azEM3rbQsR+RR6Wu5
	msJVcsZS8ciskDNbIGsr0zdeKTtI4tbU7B6ZFPXfDKvHTNAnR/kqyA+W7wpw/JEwYsII
	p5JFcT4lKFLfVYJ11Ij5Ff6Xb/ZZAISk7AHOo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=t++xgI18cf9qOYm/hMzw3zXG7/LD3Kp5e93zMhFcaJgZkFFjwarDXuLR7Kb5BREfEG
	9IBkedMkmzVgcBxD2zTY7xJEizWPNuILDeC00H3DV8SaqrbNmLN1ozhDrJdW+tW6ePlo
	Vx+LRCScH/SFMkjFSQfFbQDGI4k1quLbqXqGg=
Received: by 10.90.97.19 with SMTP id u19mr3830702agb.166.1294438661663; Fri,
	07 Jan 2011 14:17:41 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.86.4 with HTTP; Fri, 7 Jan 2011 14:17:21 -0800 (PST)
In-Reply-To: <1294436836-28074-1-git-send-email-eric@eukrea.com>
References: <1294436836-28074-1-git-send-email-eric@eukrea.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 7 Jan 2011 14:17:21 -0800
Message-ID: <AANLkTinAVCwdqhZFVb1ktmwz=ZaPmhTu6RpzuoM2zXjD@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 1/3] e2fsprogs: update to latest 1.41.14
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
X-List-Received-Date: Fri, 07 Jan 2011 22:18:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 7, 2011 at 1:47 PM, Eric B=C3=A9nard <eric@eukrea.com> wrote:
> this new version brings many fixes and enhancements :
> http://e2fsprogs.sourceforge.net/e2fsprogs-release.html#1.41.14
>
> Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>

Acked-by: Khem Raj <raj.khem@gmail.com>
> ---
> =C2=A0recipes/e2fsprogs/e2fsprogs_1.41.12.bb | =C2=A0 12 ------------
> =C2=A0recipes/e2fsprogs/e2fsprogs_1.41.14.bb | =C2=A0 12 ++++++++++++
> =C2=A02 files changed, 12 insertions(+), 12 deletions(-)
> =C2=A0delete mode 100644 recipes/e2fsprogs/e2fsprogs_1.41.12.bb
> =C2=A0create mode 100644 recipes/e2fsprogs/e2fsprogs_1.41.14.bb
>
> diff --git a/recipes/e2fsprogs/e2fsprogs_1.41.12.bb b/recipes/e2fsprogs/e=
2fsprogs_1.41.12.bb
> deleted file mode 100644
> index 1667099..0000000
> --- a/recipes/e2fsprogs/e2fsprogs_1.41.12.bb
> +++ /dev/null
> @@ -1,12 +0,0 @@
> -require e2fsprogs.inc
> -
> -PR =3D "${INC_PR}"
> -
> -SRC_URI +=3D "file://llseek-uclibc.patch"
> -
> -do_configure() {
> - =C2=A0 =C2=A0 =C2=A0 oe_runconf
> -}
> -
> -SRC_URI[md5sum] =3D "1b24a21fc0c2381ef420961cbfec733f"
> -SRC_URI[sha256sum] =3D "9c26d0dc20bfdafd0f27f3564791d6121d1c1876549d4f2f=
f1e41955c9bb9f20"
> diff --git a/recipes/e2fsprogs/e2fsprogs_1.41.14.bb b/recipes/e2fsprogs/e=
2fsprogs_1.41.14.bb
> new file mode 100644
> index 0000000..db322d1
> --- /dev/null
> +++ b/recipes/e2fsprogs/e2fsprogs_1.41.14.bb
> @@ -0,0 +1,12 @@
> +require e2fsprogs.inc
> +
> +PR =3D "${INC_PR}"
> +
> +SRC_URI +=3D "file://llseek-uclibc.patch"
> +
> +do_configure() {
> + =C2=A0 =C2=A0 =C2=A0 oe_runconf
> +}
> +
> +SRC_URI[md5sum] =3D "05f70470aea2ef7efbb0845b2b116720"
> +SRC_URI[sha256sum] =3D "3f8ac1fedd7c4bec480afcbe4acabdd4ac59ec0446a0fd50=
c8975cd0aad7b176"
> --
> 1.6.3.3
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


