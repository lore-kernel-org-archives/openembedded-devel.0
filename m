Received: from mail-ie0-f175.google.com ([209.85.223.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1TRsTI-0001aY-IZ
	for openembedded-devel@lists.openembedded.org;
	Sat, 27 Oct 2012 00:33:44 +0200
Received: by mail-ie0-f175.google.com with SMTP id c13so4514771ieb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Oct 2012 15:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=djkTeVOe6FX2OBCIRcQKRRVFEauwpLzhMju+yD/PUk4=;
	b=q6Ruxx3L5bXMJO/8ElwpJ/cn81a3meiSwP4VWowLGEnXlnvTlsSV3yYSbSEtJyRfow
	DXZ02JEF+zQwx7qIh00ovh2Ffi9wz/ZFtYwoboRzZlpMMEqkrw85zOovspFqxRXygHXo
	kDeNVknRO113nHdhGULSlPRONa2eGRyF9mm+Uh3eiQ6l/QZ0t24otSBb8DC+R73nzykf
	5ux5BMx48Bij/XQ+UfWDQdg3BiWjzNeYwYoMYFZzKnEeLv51P9E9Pf9NjMczkCIDMQf5
	BVMbLyklbMKqS8Sy+ZMWhkKx+QMON6FBFFQUbzzNo4v6IWrlcriJNhNi0ovPP5zp+gnq
	ET0A==
MIME-Version: 1.0
Received: by 10.50.173.37 with SMTP id bh5mr3650875igc.45.1351290013488; Fri,
	26 Oct 2012 15:20:13 -0700 (PDT)
Received: by 10.64.99.226 with HTTP; Fri, 26 Oct 2012 15:20:13 -0700 (PDT)
In-Reply-To: <1351289773-25205-1-git-send-email-andrea.adami@gmail.com>
References: <1351289773-25205-1-git-send-email-andrea.adami@gmail.com>
Date: Sat, 27 Oct 2012 00:20:13 +0200
Message-ID: <CAAQYJAsoeAfYWa19sZWFdjap_mhaR4u3Vfo1spXSqNv+J7Gjvg@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-handheld][PATCH] udev_164: update .bbappend to 182 as in oe-core
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
X-List-Received-Date: Fri, 26 Oct 2012 22:33:44 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sat, Oct 27, 2012 at 12:16 AM, Andrea Adami <andrea.adami@gmail.com> wrote:
> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> ---
>  recipes-core/udev/udev_164.bbappend |    9 ---------
>  recipes-core/udev/udev_182.bbappend |    9 +++++++++
>  2 files changed, 9 insertions(+), 9 deletions(-)
>  delete mode 100644 recipes-core/udev/udev_164.bbappend
>  create mode 100644 recipes-core/udev/udev_182.bbappend
>
> diff --git a/recipes-core/udev/udev_164.bbappend b/recipes-core/udev/udev_164.bbappend
> deleted file mode 100644
> index 4d263b0..0000000
> --- a/recipes-core/udev/udev_164.bbappend
> +++ /dev/null
> @@ -1,9 +0,0 @@
> -
> -FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
> -
> -PRINC := "${@int(PRINC) + 2}"
> -
> -# check only for ABS_X (0x00) and ABS_Y (0x01), ignore ABS_PRESSURE (0x18)
> -do_configure_append () {
> -        sed -i -e 's/"input:*-e0*,3,*a0,1,*18,*"/"input:*-e0*,3,*a0,1,*"/' ${WORKDIR}/local.rules
> -}
> diff --git a/recipes-core/udev/udev_182.bbappend b/recipes-core/udev/udev_182.bbappend
> new file mode 100644
> index 0000000..4d263b0
> --- /dev/null
> +++ b/recipes-core/udev/udev_182.bbappend
> @@ -0,0 +1,9 @@
> +
> +FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
> +
> +PRINC := "${@int(PRINC) + 2}"
> +
> +# check only for ABS_X (0x00) and ABS_Y (0x01), ignore ABS_PRESSURE (0x18)
> +do_configure_append () {
> +        sed -i -e 's/"input:*-e0*,3,*a0,1,*18,*"/"input:*-e0*,3,*a0,1,*"/' ${WORKDIR}/local.rules
> +}
> --
> 1.7.8.6
>

Patch sent too soon just to unbreak parsing.
Please fix the beloved PR stuff :/

-> +PRINC := "${@int(PRINC) + 2}"
+> +PRINC := "${@int(PRINC) + 1}"

Andrea


