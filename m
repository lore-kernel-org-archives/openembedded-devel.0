Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f175.google.com (mail-ie0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id 41C396D001
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Nov 2013 17:55:29 +0000 (UTC)
Received: by mail-ie0-f175.google.com with SMTP id u16so992504iet.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Nov 2013 09:55:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=k4m2x45dGJ+SyDA5EM29GseVdMcyDrCRIH8rNFzBTlw=;
	b=XtYbPy6q9AyOyC//n9g0ELZaULcaZ254CT69NNcbXdLZwfi9msaXTGl21daimdbLzi
	xH2sKjQiwA8vawfuWNHBHLU07oM7W46ePPfcOCk3Wdb/yvL5h9pN5ElB07UcDqgA7x7G
	NdhySLPK6sMD3l0AyzmDpIQ0zZKQhKob/NTJV6Cub1sjqQ/Zev8KiYuN89xESogqRtIu
	JGP+GeKpFikEA/8Q/Cz7ohp4W3dnOKCZLkOZzYxObPvyQkFbX/d2L93ba7SMgLEqZ2z9
	mdFS1ys6E5rQv5Jd2jbP/qj++47QkgQ8is37VTRPGEW/C2LyT+YWiKs49Z2UsubzpNkp
	5AHw==
MIME-Version: 1.0
X-Received: by 10.50.92.8 with SMTP id ci8mr6657425igb.23.1384365329807; Wed,
	13 Nov 2013 09:55:29 -0800 (PST)
Received: by 10.50.79.167 with HTTP; Wed, 13 Nov 2013 09:55:29 -0800 (PST)
In-Reply-To: <1384364398-26192-1-git-send-email-ml@communistcode.co.uk>
References: <1384364398-26192-1-git-send-email-ml@communistcode.co.uk>
Date: Wed, 13 Nov 2013 09:55:29 -0800
Message-ID: <CAMKF1spQpqHiVsxey-Y+RkjE=phpeyFte_-YJVwP0b9ExWyT+g@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Jack Mitchell <jmitchell@cbnl.com>
Subject: Re: [meta-oe][PATCH] libsmi: initial add 0.4.8
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
X-List-Received-Date: Wed, 13 Nov 2013 17:55:30 -0000
Content-Type: text/plain; charset=UTF-8

On Wednesday, November 13, 2013, Jack Mitchell wrote:

> From: Jack Mitchell <jmitchell@cbnl.com <javascript:;>>
>
> Signed-off-by: Jack Mitchell <jmitchell@cbnl.com <javascript:;>>
> ---
>  meta-oe/recipes-support/libsmi/libsmi_0.4.8.bb | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>  create mode 100644 meta-oe/recipes-support/libsmi/libsmi_0.4.8.bb
>
> diff --git a/meta-oe/recipes-support/libsmi/libsmi_0.4.8.bbb/meta-oe/recipes-support/libsmi/
> libsmi_0.4.8.bb
> new file mode 100644
> index 0000000..30af2b0
> --- /dev/null
> +++ b/meta-oe/recipes-support/libsmi/libsmi_0.4.8.bb
> @@ -0,0 +1,16 @@
> +SUMMARY = "A Library to Access SMI MIB Information"
> +
> +LICENSE = "BSD"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=3ad3076f9332343a21636cfd351f05b7"
> +
> +SRC_URI = "ftp://ftp.ibr.cs.tu-bs.de/pub/local/libsmi/libsmi-0.4.8.tar.gz
> "
> +


may be use PV instead of hardcoding 0.4.8 makes it easier to upgrade


> +SRC_URI[md5sum] = "760b6b1070738158708649ed2c63425e"
> +SRC_URI[sha256sum] =
> "f048a5270f41bc88b0c3b0a8fe70ca4d716a46b531a0ecaaa87c462f49d74849"
> +
> +inherit autotools
> +
> +PACKAGES += "${PN}-mibs ${PN}-pibs"
> +
> +FILES_${PN}-mibs += "${datadir}/mibs"
> +FILES_${PN}-pibs += "${datadir}/pibs"
> --
> 1.8.4.2
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org <javascript:;>
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

