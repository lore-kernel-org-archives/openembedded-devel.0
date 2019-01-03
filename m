Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id C23DD79CB1
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Jan 2019 18:59:22 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id p17so37985371qtl.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Jan 2019 10:59:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=aD7rjlhRZueoEC/wg6+4Qdwj4EBa6s64GOyY3nhhu8U=;
	b=lHsdID8hvJW7akyRwZOhP9OygRgQ/ppjAi0eBo4JSwSp5Z6LkMeMv5rj5RfsTZmWlb
	uTdjM7jcsfb/cTmBtIgNB4tIb9M0QWUqv4+idsO+qhNbz9yOY7lEZbzAjbu9hPdaoHAg
	7K8q4cjjQizsXNLq0B5In14PbgYnzYfnG28DLW4ZA5bQvlrvVMUhg7FrnbkZ1z37WXha
	pI8AYvSZ46DlAnCmUdgov4JI6SF6Ve1OMRm8e+52+cb2Pxq/xE3ET81F2NCfAo8truAW
	UgssFKhG2YuISC5ttTLUeXKBhcFWWCYt2w+mPiAm7/WIW6bdxBKxEPUyiP1o8LEpBBA1
	TfiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=aD7rjlhRZueoEC/wg6+4Qdwj4EBa6s64GOyY3nhhu8U=;
	b=jWtfwmKN6ghcXH1vTjf7PDwn+m08RlzSttcVdysF92J39ByEaKAvQpbrI5FYKLBldf
	0j1BxDPShu2dIVRIi6nybi80B0LiarRd9XFgKueTA/ugjUODz9tJTQIV1Q7Yw2TWrCEh
	HZyfbhiwLG9rk9yop0fXpJ7fC5BUiu2dIJO9Tool2AOcnoikBVNzEjziR9tf4hFtaom4
	o2T7ZSvMjFIWdlcNtO9keBwhU/VGJCS8DeTelgN2Gcn6jHnL6xyWcfnM9a3GQE7SoO2L
	id/9VQ5w97ilExEprA3odMIIlX5VqltBciUWbOM0mpix284pHnKgW2W+Yk/Vd8sHjVtC
	hKhg==
X-Gm-Message-State: AJcUukeuw503251iELkqNZ3WiN8m+yROH1NPHIXY2UH8Ku0wgsLZbdVN
	pnXE+dQiThLsIrPF2lPkso5utK9wFTZF3574Nqo=
X-Google-Smtp-Source: ALg8bN5oK8JBzrksX7D97tMjoxNCss2/Vtd1wTIpbtbiN7aThwLxlfAsHWwWEg3zbGxRYiAKHZ7bo90goMSRDXMzuC8=
X-Received: by 2002:a0c:a144:: with SMTP id d62mr48505475qva.50.1546541963295; 
	Thu, 03 Jan 2019 10:59:23 -0800 (PST)
MIME-Version: 1.0
References: <20190103184945.8601-1-ross.burton@intel.com>
In-Reply-To: <20190103184945.8601-1-ross.burton@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 3 Jan 2019 10:58:57 -0800
Message-ID: <CAMKF1sqLnyXOqrHE6Jv5uLfgKVvCf-cVMAFbEPsDPsXQeVOTkg@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] faad2: upgrade to 2.8.8
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 03 Jan 2019 18:59:22 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 3, 2019 at 10:50 AM Ross Burton <ross.burton@intel.com> wrote:
>
> Upgrade to the latest release, 2.8.8.
>
> Stop splitting the package up excessively, and use lib_package to put the
> binaries into PN-bin.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta-oe/recipes-multimedia/faad2/faad2_2.7.bb   | 31 -------------------------
>  meta-oe/recipes-multimedia/faad2/faad2_2.8.8.bb | 14 +++++++++++
>  2 files changed, 14 insertions(+), 31 deletions(-)
>  delete mode 100644 meta-oe/recipes-multimedia/faad2/faad2_2.7.bb
>  create mode 100644 meta-oe/recipes-multimedia/faad2/faad2_2.8.8.bb
>
> diff --git a/meta-oe/recipes-multimedia/faad2/faad2_2.7.bb b/meta-oe/recipes-multimedia/faad2/faad2_2.7.bb
> deleted file mode 100644
> index 9e5a3817aa..0000000000
> --- a/meta-oe/recipes-multimedia/faad2/faad2_2.7.bb
> +++ /dev/null
> @@ -1,31 +0,0 @@
> -SUMMARY = "An open source MPEG-4 and MPEG-2 AAC decoding library"
> -HOMEPAGE = "http://www.audiocoding.com/faad2.html"
> -SECTION = "libs"
> -LICENSE = "GPLv2"
> -
> -LIC_FILES_CHKSUM = "file://COPYING;md5=381c8cbe277a7bc1ee2ae6083a04c958"
> -
> -LICENSE_FLAGS = "commercial"
> -
> -PR = "r1"
> -
> -inherit autotools
> -
> -SRC_URI = "${SOURCEFORGE_MIRROR}/faac/faad2-src/faad2-${PV}/${BP}.tar.bz2;name=faad2 \
> -"
> -
> -SRC_URI[faad2.md5sum] = "4c332fa23febc0e4648064685a3d4332"
> -SRC_URI[faad2.sha256sum] = "14561b5d6bc457e825bfd3921ae50a6648f377a9396eaf16d4b057b39a3f63b5"
> -
> -PACKAGES =+ "libfaad libfaad-dev libmp4ff libmp4ff-dev"

Perhaps we need to add RPROVIDES to keep this upgradable

> -
> -FILES_${PN} = "${bindir}/faad"
> -
> -FILES_libfaad = "${libdir}/libfaad.so.*"
> -FILES_libfaad-dev = "${libdir}/libfaad.so ${libdir}/libfaad.la ${includedir}/faad.h"
> -FILES_libfaad-staticdev = "${libdir}/libfaad.a"
> -
> -FILES_libmp4ff = "${libdir}/libmp4ff.so.*"
> -FILES_libmp4ff-dev = "${libdir}/libmp4ff.so ${libdir}/libmp4ff.la ${includedir}/mp4ff.h"
> -FILES_libmp4ff-staticdev = "${libdir}/libmp4ff.a"
> -
> diff --git a/meta-oe/recipes-multimedia/faad2/faad2_2.8.8.bb b/meta-oe/recipes-multimedia/faad2/faad2_2.8.8.bb
> new file mode 100644
> index 0000000000..8b3aafc3b5
> --- /dev/null
> +++ b/meta-oe/recipes-multimedia/faad2/faad2_2.8.8.bb
> @@ -0,0 +1,14 @@
> +SUMMARY = "An open source MPEG-4 and MPEG-2 AAC decoding library"
> +HOMEPAGE = "http://www.audiocoding.com/faad2.html"
> +SECTION = "libs"
> +LICENSE = "GPLv2"
> +
> +LIC_FILES_CHKSUM = "file://COPYING;md5=381c8cbe277a7bc1ee2ae6083a04c958"
> +
> +LICENSE_FLAGS = "commercial"
> +
> +SRC_URI = "${SOURCEFORGE_MIRROR}/faac/faad2-src/faad2-2.8.0/${BP}.tar.gz"

may be this could be "${SOURCEFORGE_MIRROR}/faac/faad2-src/${BP}/${BP}.tar.gz"


> +SRC_URI[md5sum] = "28f6116efdbe9378269f8a6221767d1f"
> +SRC_URI[sha256sum] = "985c3fadb9789d2815e50f4ff714511c79c2710ac27a4aaaf5c0c2662141426d"
> +
> +inherit autotools lib_package
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

