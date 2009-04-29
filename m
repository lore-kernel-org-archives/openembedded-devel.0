Received: from [209.85.218.171] (helo=mail-bw0-f171.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <matthieu.poullet@gmail.com>) id 1Lz5Za-0002Sa-Aj
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Apr 2009 10:55:27 +0200
Received: by bwz19 with SMTP id 19so1173913bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Apr 2009 01:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:from:date:message-id:subject:to:content-type;
	bh=6E+soD5YfzmwRoM6PwqXXAzuHxT+zDWBcmOjZJnN5QA=;
	b=ltQXHJ5D0AW/3N7UFUEIYV7p8J4OG11g7z0yeFgsKtR0aAEyFFAHS2cm/BihQnQvHw
	96pS4bztT3EipBN6rxONxijgzI5/CG5e0Ux5LqK5j5DJM9AGndq3cCe8FwABkQmBKQcj
	cg6VTcrz2e7QweuCRgJoT36qHTEv4iDKjFXDU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=YE8IGzDvboIwC9KX/F/MdtinPVzvtYzNpbot+VWLpqd6hoGEtsyb0uxTwU4TA0gcJV
	eVBnvXwmxxxQWVyyt5qVByIH3pH5ZCFWyTjQPRwhB5HnEmLcRK1i0aIBH9xEnYP8/tzR
	RwIdjW/Wh62/eynvbnKar3WMMdxDoS73yoNFY=
MIME-Version: 1.0
Received: by 10.204.63.209 with SMTP id c17mr92633bki.47.1240995006092; Wed, 
	29 Apr 2009 01:50:06 -0700 (PDT)
In-Reply-To: <80a0c20d0904290145p41042612m976c066baf001133@mail.gmail.com>
References: <80a0c20d0904290145p41042612m976c066baf001133@mail.gmail.com>
From: Matthieu Poullet <matthieu.poullet@gmail.com>
Date: Wed, 29 Apr 2009 10:49:46 +0200
Message-ID: <80a0c20d0904290149v7e3035b4td382ae1b5015791f@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH] dsplink: change path to the XDC tools directory
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
X-List-Received-Date: Wed, 29 Apr 2009 08:55:36 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On Wed, Apr 29, 2009 at 10:45 AM, Matthieu Poullet <
matthieu.poullet@gmail.com> wrote:

> This way the naming convention is more coherent:
> TIBIOSDIR -> BIOS_INSTALL_DIR
> TIXDCTOOLSDIR  -> XDC_INSTALL_DIR
>
> Signed-off-by: Matthieu Poullet <m.poullet@avm.de>
> ---
>  recipes/dsplink/ti-paths.inc |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/recipes/dsplink/ti-paths.inc b/recipes/dsplink/ti-paths.inc
> index 2f1a0e5..b403732 100644
> --- a/recipes/dsplink/ti-paths.inc
> +++ b/recipes/dsplink/ti-paths.inc
> @@ -9,7 +9,7 @@
>  TITOOLSDIR ?= "/OE/TI"
>  # Path under TITOOLSDIR where dspbios is unpacked
>  TIBIOSDIR ?= "bios_5_33_02"
> -TIXDCTOOLSDIR ?= "${TITOOLSDIR}/xdctools_3_10_03"
> +TIXDCTOOLSDIR ?= "xdctools_3_10_03"
>  # Path under TITOOLSDIR where the dsp toolchain is unpacked
>  TICGTOOLSDIR ?= "cg6x_6_0_16"
>
> @@ -20,7 +20,7 @@ TICGTOOLSDIR ?= "cg6x_6_0_16"
>  # export some more variable to point to external TI tools
>  # information is duplicated between the js and make based tools
>  export CE_INSTALL_DIR=${S}
> -export XDC_INSTALL_DIR=${TIXDCTOOLSDIR}
> +export XDC_INSTALL_DIR=${TITOOLSDIR}/{TIXDCTOOLSDIR}
>  export BIOS_INSTALL_DIR=${TITOOLSDIR}/${TIBIOSDIR}
>  # needed for configuro:
>  export CGTOOLS_V5T="${CROSS_DIR}"
> --
> 1.6.0.4
>

NACK, syntax error, sorry

Matthieu.

