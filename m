Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OcE96-0006lD-0l
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Jul 2010 11:02:20 +0200
Received: by bwz10 with SMTP id 10so1518872bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Jul 2010 02:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=sqMiEd4AoX8SB8h2a7Y5ufJrCqslXQJw+Gl0mBVm0/Y=;
	b=e2+5ap39uqKYqSOIQvBVvv3Bn5aMaARuPIZ+fOsO9PpFzqS9QJdQ2k9VoUARCApCLI
	6tbmECvu2cG2cjQ+0oV9BTDv58delDoA1+qPg22ji3QiAtM4hhrWQBrLNwuBhRlRlBkW
	vtkMIiGXqggy8PvNEJQeeKWaYTc0avy8XfwTs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=YWNZTSLQQlc+G31Jjsr+ubO+/zMhpKO4S4OQhYNuU8FJBaNLO0L0z8rbKxpj+2PVkH
	qQE+k2aVRAhFGvIieGRkhrK75NeKeTX3gCIl+YshGjLEZKp3uIQoWzj2fPpQGMAgDJgY
	XCB5ymMsgKvda025YuZc7fBQ9MFzqSlnhQt08=
MIME-Version: 1.0
Received: by 10.204.34.2 with SMTP id j2mr2449662bkd.21.1279875729398; Fri, 23 
	Jul 2010 02:02:09 -0700 (PDT)
Received: by 10.204.60.208 with HTTP; Fri, 23 Jul 2010 02:02:09 -0700 (PDT)
In-Reply-To: <4C495665.3060605@nedap.com>
References: <4C495665.3060605@nedap.com>
Date: Fri, 23 Jul 2010 11:02:09 +0200
Message-ID: <AANLkTikUv4ZX2tbfD1DCe2WM=_NBtZ2TnJYyUorpEjA1@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH] Introduce xc3sprog recipe
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
X-List-Received-Date: Fri, 23 Jul 2010 09:02:21 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/7/23 Jaap de Jong <jaap.dejong@nedap.com>

> Hi,
>
> below a recipe to build a great tool for programming Xilinx fpga's etc.
>
> thanks and best regards,
>
> Jaap
> ---
> diff --git a/recipes/xc3sprog/xc3sprog_461.bb b/recipes/xc3sprog/
> xc3sprog_461.bb
> new file mode 100644
> index 0000000..66775d4
> --- /dev/null
> +++ b/recipes/xc3sprog/xc3sprog_461.bb
> @@ -0,0 +1,18 @@
> +DESCRIPTION = "suite of utilities for programming Xilinx FPGAs, CPLDs, and
> EEPROMs"
> +LICENSE = "GPL"
> +HOMEPAGE = "http://sourceforge.net/projects/xc3sprog"
> +SECTION = "console/utils"
> +
> +DEPENDS += "libftdi libusb"
> +
> +SRC_URI = "svn://${PN}.
> svn.sourceforge.net/svnroot/${PN};module=trunk;proto=https<http://svn.sourceforge.net/svnroot/$%7BPN%7D;module=trunk;proto=https>
> "
> +SRCREV = ${PV}
> +
> +SRC_URI[md5sum] = "916f65fa68d154621fc0cf1f405f2726"
> +SRC_URI[sha256sum] =
> "5b6f3c3ee51c6aa24d3b87135e01762cf68821d1c3599d87d349fea4ede74c62"
> +
> +S = "${WORKDIR}/trunk"
> +PR = "r0"
> +
> +inherit cmake
> +
>
>
> Cool, looks good to me. Will try to test it later.
Thanks for your contribution.

Frans


> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

