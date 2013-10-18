Return-Path: <david.turgeon@gmail.com>
Received: from mail-we0-f179.google.com (mail-we0-f179.google.com
	[74.125.82.179])
	by mail.openembedded.org (Postfix) with ESMTP id B9BA660F06
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Oct 2013 03:43:48 +0000 (UTC)
Received: by mail-we0-f179.google.com with SMTP id w61so3084904wes.38
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Oct 2013 20:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=PJRpfV6UGuaa/rtQ1fa6h8k49k0LIlhlKNsI/ooAAgg=;
	b=0Z5Sm4Zwyr7x/Q+8gSvEGcX919SbO9JV14Gnva+SmzwwkDzU4HIVgu5I4QYZ/IfyRc
	WHAaxfyXJmC9wliX2z9U6dkrKChMAGGm1xba6pA2IZnGRG7gqumM4AblV5ubB78Km9+/
	P2FzZN089dQhrUG0tIers0P15WcSf0quRAUrWBXVs42ptYZykq42NpLpBgX+fUZHdHei
	KVAKKSp4ygWMLdwCCilzxTkCbesODNV6tD4S64vP95tsLdZUqHdUfDnaJUj92dorqkUk
	sZIomS/asDbF/uWC8XYFlidPS2+jjeDsdcwdB6m0V8lwZqcYjihmp5Dwzrtymr+BvF+G
	VhzA==
MIME-Version: 1.0
X-Received: by 10.180.78.167 with SMTP id c7mr349734wix.25.1382067829810; Thu,
	17 Oct 2013 20:43:49 -0700 (PDT)
Received: by 10.217.114.3 with HTTP; Thu, 17 Oct 2013 20:43:49 -0700 (PDT)
In-Reply-To: <1381586640-32671-1-git-send-email-david.turgeon@gmail.com>
References: <1381586640-32671-1-git-send-email-david.turgeon@gmail.com>
Date: Thu, 17 Oct 2013 21:43:49 -0600
Message-ID: <CAN+SogKeO6OoVs_PD2DiOXARj7d8hCDKR6t2q06DpemsM6fYeA@mail.gmail.com>
From: David Turgeon <david.turgeon@gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH] tftpd-hpa: fix premature exit
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 18 Oct 2013 03:43:50 -0000
Content-Type: text/plain; charset=ISO-8859-1

ping


On 12 October 2013 08:04, David Turgeon <david.turgeon@gmail.com> wrote:

> standalone daemon exits as recipe installs file as tftpd-hpa
>
> * Changed script so it can consult /etc/default, as daemon name may be
>  subject to change.
> * Changed the default name to match the recipe
>
> Signed-off-by: David Turgeon <david.turgeon@gmail.com>
> ---
>  .../recipes-daemons/tftp-hpa/files/init            |   13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
>
> diff --git a/meta-networking/recipes-daemons/tftp-hpa/files/init
> b/meta-networking/recipes-daemons/tftp-hpa/files/init
> index 5ad8c52..9e18436 100644
> --- a/meta-networking/recipes-daemons/tftp-hpa/files/init
> +++ b/meta-networking/recipes-daemons/tftp-hpa/files/init
> @@ -18,20 +18,21 @@ set -e
>
>  PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
>  DESC="HPA's tftpd"
> -NAME=in.tftpd
> -DAEMON=/usr/sbin/$NAME
> -PIDFILE=/var/run/$NAME.pid
> +NAME=in.tftpd-hpa
>  SCRIPTNAME=/etc/init.d/tftpd-hpa
>
> -# Gracefully exit if the package has been removed.
> -test -x $DAEMON || exit 0
> -
>  # Read config file if it is present.
>  if [ -r /etc/default/tftpd-hpa ]
>  then
>         . /etc/default/tftpd-hpa
>  fi
>
> +DAEMON=/usr/sbin/$NAME
> +PIDFILE=/var/run/$NAME.pid
> +
> +# Gracefully exit if the package has been removed.
> +test -x $DAEMON || exit 0
> +
>  if [ "$RUN_DAEMON" != "yes" ] ; then
>           echo "tftpd-hpa disabled in /etc/default/tftpd-hpa"
>          exit 0
> --
> 1.7.9.5
>
>


-- 
Dave

