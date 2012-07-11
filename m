Received: from mail-gg0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1Sp6aS-0002rB-NP
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Jul 2012 01:44:52 +0200
Received: by ggnp4 with SMTP id p4so1738585ggn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Jul 2012 16:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=gbUuq9dO6WzgG7Zq1lUKnH0zH2eEyuTA3hUKnmgDSD8=;
	b=xv+3bJDTnEq1qE4zly5v/XwHQ+VbFAiD51SsWTAcul3LaqXJvmrWWNil2Gxatuys56
	iDozWoFnMRK2nKmgURS0HbRx1vxCrSwntviz1Q23oPjnpL9Z8jAk7o8EORHgPNElfrOC
	G8cVVdELq7+B8nYlh/qnAVu0rDPTIPJDwXbDGs2YV3zwXQFC9qvacVHtTPhPmooGqTHf
	IscLNw6AScovcuYmgK1iFK4znMnp8agagFkdkQOEzLnUcGIFV8UJHyRNYbymkpykBBMg
	WNivBUwZ9sSRgFpDJqRj/QI01cMUZ0Q2L0nS6d5eWdiyZKhUkmo4h7dOddzS1ydbmNZ+
	6aSQ==
MIME-Version: 1.0
Received: by 10.50.154.225 with SMTP id vr1mr15676259igb.70.1342049619452;
	Wed, 11 Jul 2012 16:33:39 -0700 (PDT)
Received: by 10.64.35.109 with HTTP; Wed, 11 Jul 2012 16:33:39 -0700 (PDT)
In-Reply-To: <1342045981-29287-1-git-send-email-andrea.adami@gmail.com>
References: <1342045981-29287-1-git-send-email-andrea.adami@gmail.com>
Date: Thu, 12 Jul 2012 01:33:39 +0200
Message-ID: <CAAQYJAszgKa_Lu5cqWWaNLje1ai_pWPdNrt53_Tk+OESf+fBfA@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-handheld][PATCH] formfactor: fix sed expression
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
X-List-Received-Date: Wed, 11 Jul 2012 23:44:52 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Jul 12, 2012 at 12:33 AM, Andrea Adami <andrea.adami@gmail.com> wrote:
> * a last-minute check was added...with a missing '*'
>
> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> ---
>  recipes-bsp/formfactor/formfactor_0.0.bbappend |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/recipes-bsp/formfactor/formfactor_0.0.bbappend b/recipes-bsp/formfactor/formfactor_0.0.bbappend
> index e888ec1..22fd9db 100644
> --- a/recipes-bsp/formfactor/formfactor_0.0.bbappend
> +++ b/recipes-bsp/formfactor/formfactor_0.0.bbappend
> @@ -1,10 +1,10 @@
> -PRINC := "${@int(PRINC) + 2}"
> +PRINC := "${@int(PRINC) + 3}"
>
>  FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
>
>  do_install_prepend () {
>         # provide machine-specific /etc/rotation for psplash
> -       sed -n 's/^[ \t]DISPLAY_ORIENTATION[ \t]*//p' ${S}/machconfig | tr -dc '[0-9]' > ${S}/rotation
> +       sed -n 's/^[ \t]*DISPLAY_ORIENTATION[ \t]*//p' ${S}/machconfig | tr -dc '[0-9]' > ${S}/rotation
>         printf "\n" >> ${S}/rotation
>  }
>
> --
> 1.7.8.6
>

Please withdraw this patch, v2 is following.

Andrea


