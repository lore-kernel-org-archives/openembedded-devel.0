Return-Path: <ticotimo@gmail.com>
Received: from mail-lb0-f176.google.com (mail-lb0-f176.google.com
	[209.85.217.176])
	by mail.openembedded.org (Postfix) with ESMTP id 315CF601A8
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 23 Aug 2014 04:16:38 +0000 (UTC)
Received: by mail-lb0-f176.google.com with SMTP id u10so10032343lbd.7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Aug 2014 21:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=0c7C6JOy3Hcyse4OkE64iyftiJb7zpvbBWo9cTBm1Oc=;
	b=W6mCB6byXCNiwqXB28F4F1YyKu0kE5OV/EVMWXwhopKmXo/awOEu64hcJq+PUbgCei
	i0ggRY4ADQwdxp1DuzZVmdu0PykdUHLXxHyQMNRwwlADjd31D78j+/uWgUcz7WZBQTPp
	a5ObINb92rE201WWcowUTuTpW233zKOCQ0QOXwiQ7qJ1KS/X92KBbNwJZ8Wjro/S7xuA
	Sp/KauNpYNOaTUFMX1fDs7c4KuLJPsHim/bPm6F3czj3cJrgj2zC7j47rLaYAfsFQgIv
	RJehLCn4LBaLxRoVY9tG7hhCckVJVP6otHgzAkbnYv5b2LDj39hzbA1QdVk4dNxtrhwr
	LFjA==
MIME-Version: 1.0
X-Received: by 10.153.4.6 with SMTP id ca6mr8418413lad.32.1408767398718; Fri,
	22 Aug 2014 21:16:38 -0700 (PDT)
Received: by 10.25.209.81 with HTTP; Fri, 22 Aug 2014 21:16:38 -0700 (PDT)
In-Reply-To: <1408688705-20179-1-git-send-email-sujith.h@gmail.com>
References: <1408688705-20179-1-git-send-email-sujith.h@gmail.com>
Date: Fri, 22 Aug 2014 21:16:38 -0700
Message-ID: <CANx9H-CBuZxivRHxy23zLop1EU+XQOLKbqDcmt92QdvkkxKpqg@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-python][PATCH v3] python-pyparted: Add recipe
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
X-List-Received-Date: Sat, 23 Aug 2014 04:16:49 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Aug 21, 2014 at 11:25 PM, Sujith H <sujith.h@gmail.com> wrote:

> From: Sujith H <Sujith_Haridasan@mentor.com>
>
> This recipe will provide a set of Python modules that
> provide Python programmers an interface to libparted,
> the GNU parted library for disk partitioning and filesystem
> manipulation.
>
> Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> Signed-off-by: Sujith H <Sujith_Haridasan@mentor.com>
>

Acked-by and Tested-by: Tim Orling <TicoTimo@gmail.com>


> ---
>  .../python-pyparted/python-pyparted_3.9.bb          | 21
> +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>  create mode 100644 meta-python/recipes-extended/python-pyparted/
> python-pyparted_3.9.bb
>
> diff --git a/meta-python/recipes-extended/python-pyparted/
> python-pyparted_3.9.bb b/meta-python/recipes-extended/python-pyparted/
> python-pyparted_3.9.bb
> new file mode 100644
> index 0000000..919b301
> --- /dev/null
> +++ b/meta-python/recipes-extended/python-pyparted/python-pyparted_3.9.bb
> @@ -0,0 +1,21 @@
> +DESCRIPTION = "pyparted is a set of Python modules that provide Python
> programmers \
> +an interface to libparted, the GNU parted library for disk partitioning
> and \
> +filesystem manipulation."
> +SUMMARY = "Python bindings for libparted"
> +HOMEPAGE = "https://fedorahosted.org/pyparted/"
> +LICENSE = "GPL-2.0+"
> +LIC_FILES_CHKSUM = "\
> +    file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b \
> +
> file://src/_pedmodule.c;startline=10;endline=22;md5=70c62bd73782a03f56a0571a9f08ea46
> \
> +"
> +DEPENDS += "parted"
> +
> +SRC_URI = "
> https://fedorahosted.org/releases/p/y/pyparted/pyparted-${PV}.tar.gz"
> +SRC_URI[md5sum] = "f16c7ef7f5fa4a43fcb2a4654b487e39"
> +SRC_URI[sha256sum] =
> "a56712e3d058ce3d859c158236dbbf45224018919efd3d880ea80f9e0d0bebbb"
> +S = "${WORKDIR}/pyparted-${PV}"
> +
> +inherit distutils
> +
> +RDEPENDS_${PN} += "python-stringold python-codecs python-math"
> +BBCLASSEXTEND += "native"
> --
> 1.8.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

