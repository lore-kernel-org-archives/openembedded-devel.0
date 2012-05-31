Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <aalonso00@gmail.com>) id 1Sa7CY-0001VQ-Gm
	for openembedded-devel@lists.openembedded.org;
	Thu, 31 May 2012 17:22:14 +0200
Received: by yenl13 with SMTP id l13so908019yen.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 May 2012 08:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=wwbRd2fVABDws0voaqVqP9BVIHVJeHD0zlqQaELJ9Fw=;
	b=DGhcskWeh3Q13k4LXHMVnyEk2wOt8v+aPTD0zxlnrWf+ceNOnBvoBzuuSIMLGO1bzZ
	PmbJPJr9ik2+O3uXCTGdBPHbI98kJ1i5lXvqURH8MBc1YPsg7st0VVkJQ7paZRpXxbbD
	1vSmUF8N2JnIC7JD4heUq+vGokNjHWmyOhWFJDi4j39MXfDY0ABmsN03vEzZwnEwcJ9e
	aBMlj85zHdRSIxbIZ8tObD+Bf8v45rfnRZ3bcuoQfo8cCueWeStWYxMVvcsboB0JO3p8
	OKB35D6Xu+zWeDPp/BDDjnBLUCshuvk57bvohFLwaAX9NVCuvAJmgj9jp5M7JNBFW7ED
	AWaQ==
MIME-Version: 1.0
Received: by 10.50.6.197 with SMTP id d5mr13787105iga.44.1338477113130; Thu,
	31 May 2012 08:11:53 -0700 (PDT)
Received: by 10.64.0.77 with HTTP; Thu, 31 May 2012 08:11:53 -0700 (PDT)
In-Reply-To: <1338450469-22322-1-git-send-email-elvis.dowson@gmail.com>
References: <1338450469-22322-1-git-send-email-elvis.dowson@gmail.com>
Date: Thu, 31 May 2012 10:11:53 -0500
Message-ID: <CAAB-1yyjKYe6bWj5Y+HNo2tZXjMvPbzJYjsGLrUMVm-BL3=AYw@mail.gmail.com>
From: Adrian Alonso <aalonso00@gmail.com>
To: Elvis Dowson <elvis.dowson@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-xilinx] util-linux_2.21.bbappend: Rename to util-linux_2.21.1.bbappend.
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
X-List-Received-Date: Thu, 31 May 2012 15:22:14 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Elvis,

I believe that you haven't update your meta-xilinx layer
commit: 025c37f927debff683c29d047bbf812ec82b3a69

Does the same thing as your proposed patch

Is a good practice to rebase your local repo before you send
a patch in order to ensure that your patchs applies..

git fetch
git rebase origin/master

Regards
Adrian Alonso

On Thu, May 31, 2012 at 2:47 AM, Elvis Dowson <elvis.dowson@gmail.com> wrot=
e:
> This commit renames util-linux_2.21.bbappend to util-linux_2.21.1.bbappen=
d
> to match the corresponding change in version to the
> poky/meta/recipes-core/util-linux/util-linux_2.21.1.bb recipe.
>
> Signed-off-by: Elvis Dowson <elvis.dowson@gmail.com>
> ---
> =A0recipes-core/util-linux/util-linux_2.21.1.bbappend | =A0 =A03 +++
> =A0recipes-core/util-linux/util-linux_2.21.bbappend =A0 | =A0 =A03 ---
> =A02 files changed, 3 insertions(+), 3 deletions(-)
> =A0create mode 100644 recipes-core/util-linux/util-linux_2.21.1.bbappend
> =A0delete mode 100644 recipes-core/util-linux/util-linux_2.21.bbappend
>
> diff --git a/recipes-core/util-linux/util-linux_2.21.1.bbappend b/recipes=
-core/util-linux/util-linux_2.21.1.bbappend
> new file mode 100644
> index 0000000..5199eb2
> --- /dev/null
> +++ b/recipes-core/util-linux/util-linux_2.21.1.bbappend
> @@ -0,0 +1,3 @@
> +FILESEXTRAPATHS :=3D "${THISDIR}/${PN}"
> +# Disable microblaze ncurses support
> +EXTRA_OECONF_microblaze +=3D " --without-ncurses "
> diff --git a/recipes-core/util-linux/util-linux_2.21.bbappend b/recipes-c=
ore/util-linux/util-linux_2.21.bbappend
> deleted file mode 100644
> index 5199eb2..0000000
> --- a/recipes-core/util-linux/util-linux_2.21.bbappend
> +++ /dev/null
> @@ -1,3 +0,0 @@
> -FILESEXTRAPATHS :=3D "${THISDIR}/${PN}"
> -# Disable microblaze ncurses support
> -EXTRA_OECONF_microblaze +=3D " --without-ncurses "
> --
> 1.7.9.5
>



--=20
Saludos
Adrian Alonso
http://aalonso.wordpress.com


