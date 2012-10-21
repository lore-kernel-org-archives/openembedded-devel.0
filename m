Received: from mail-ie0-f175.google.com ([209.85.223.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TQ0Pw-0006EX-5W
	for openembedded-devel@lists.openembedded.org;
	Sun, 21 Oct 2012 20:38:32 +0200
Received: by mail-ie0-f175.google.com with SMTP id c13so2642449ieb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Oct 2012 11:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=JLZyW+aexJ4uYvuK66Lp13QU7znugob617s/hPxDSH0=;
	b=kz/SwVm0InKEDKDz3sIQps9vlEEb3eMhhm3hfOqefqenZD21MyPHL60GbInZCziaX0
	qfpiEn0Nb5aBelNsEUwYMwKy+DmRmEr5NfpoA4QIfdmT/q2o7wovqtJRex+XRXG+wQgG
	AtdWYYoNQkoKrGw93kOsvqug0b9dWDkVzXogkmp89s/4p9c8Dpyxdr1bZU15JeW/aIO+
	OeHcZzR2EUwDLbAVfUoLP1vZv9yGaweiZ1AaNMJJJykXpzUFRWLXRxH5vHmGdS0Ecsy0
	mZpeMnobw0oFxmFZnKZBH7G2wBwX3k3HMdMqW3EF7n7JmZCo/PQuNLxvgou4SMhj8cjC
	1b9w==
MIME-Version: 1.0
Received: by 10.50.53.170 with SMTP id c10mr7229710igp.45.1350843907878; Sun,
	21 Oct 2012 11:25:07 -0700 (PDT)
Received: by 10.64.20.113 with HTTP; Sun, 21 Oct 2012 11:25:07 -0700 (PDT)
In-Reply-To: <1350131492-742-1-git-send-email-schnitzeltony@googlemail.com>
References: <1350131492-742-1-git-send-email-schnitzeltony@googlemail.com>
Date: Sun, 21 Oct 2012 20:25:07 +0200
Message-ID: <CALbNGRT1teBLRFakFHUxQ+LM8ACsgk4B-dNeL4yzpkgEgtcgrA@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-gnome] gvfs: fix build
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
X-List-Received-Date: Sun, 21 Oct 2012 18:38:32 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 13, 2012 at 2:31 PM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> error message was for build from scratch and latest heads:
>
> | ERROR: This autoconf log indicates errors, it looked at host include an=
d/or library paths while determining system capabilities.
> | Rerun configure task after fixing this. The path was '/home/Superandy/t=
mp/oe-core-eglibc/work/armv7a-vfp-neon-angstrom-linux-gnueabi/gvfs-1.8.2-r7=
.0/gvfs-1.8.2'
> | ERROR: Function failed: do_qa_configure
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> ---
>  meta-gnome/recipes-gnome/gvfs/gvfs.inc |    3 ++-
>  1 files changed, 2 insertions(+), 1 deletions(-)
>
> diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs.inc b/meta-gnome/recipes-=
gnome/gvfs/gvfs.inc
> index 903a8ba..e86c93f 100644
> --- a/meta-gnome/recipes-gnome/gvfs/gvfs.inc
> +++ b/meta-gnome/recipes-gnome/gvfs/gvfs.inc
> @@ -4,7 +4,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D3bf50002aefd00=
2f49e7bb854063f7e7"
>
>  inherit gnome
>
> -INC_PR =3D "r7"
> +INC_PR =3D "r8"
>
>  SRC_URI[archive.md5sum] =3D "402f94b187b197b403d25c85caeb9562"
>  SRC_URI[archive.sha256sum] =3D "0895ac8f6d416e1b15433b6b6b68eb119c6e8b04=
fdb66db665d684355ef89345"
> @@ -14,6 +14,7 @@ EXTRA_OECONF =3D "--disable-samba \
>                  --with-samba-includes=3D${STAGING_INCDIR} \
>                  --with-samba-libs=3D${STAGING_LIBDIR} \
>                  --with-archive-includes=3D${STAGING_INCDIR} \
> +                --with-archive-libs=3D${STAGING_LIBDIR} \
>                 "
>
>  FILES_${PN} +=3D "${datadir}/dbus-1/services/*"
> --
> 1.7.4.4
>
ping


