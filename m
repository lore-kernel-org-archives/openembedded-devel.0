Return-Path: <ticotimo@gmail.com>
Received: from mail-lf0-f67.google.com (mail-lf0-f67.google.com
	[209.85.215.67])
	by mail.openembedded.org (Postfix) with ESMTP id F39E960119
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Jul 2016 17:09:19 +0000 (UTC)
Received: by mail-lf0-f67.google.com with SMTP id a2so8242474lfe.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Jul 2016 10:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=cPljf6PagOfSDi2pZdvAYMHxD09xyFdXBpHXSJ9Uxuc=;
	b=s4GhdM1IEa5Ahff1eTXTTuUKIKi3ldSl4OqoUtsIrs+US0ialVvStBogqajFxSxHdE
	sCRsRdQYhcQpASnBBzg+n6+qbdQOD31aLNB1i8Bgy0qpZdeCO9ncHb+XE1GwYw4Abp8Y
	5gAuIyHfEpGONSEsGKPTELTc+CJN1s3DtOMpkTYhJ4RAugj4/lSdsNMEe7VyeWjC8d3g
	yAnzZlu4r9xVc2BvXzRSZRgm12HSMxyZicL1Kej+OxD43XdNMAQfarJC3H042UHkNZAd
	ZlygIbw/SOcV5yIJAXUUEIE/CKD17B0/sLg7xTctXY+36qXFkeM1Ds2Jz45TMD2b6U0B
	js6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=cPljf6PagOfSDi2pZdvAYMHxD09xyFdXBpHXSJ9Uxuc=;
	b=VHOdK02LTlQ7gy+oWGWwEs45pRAZAgOnZ/1+GNqda1stEp/wkC0mkG3vABx4XezZwM
	6+HKbO5oIZp0tgBDY/plm81rTGlB4X246/55RumTwpch9Vms1v1HSl6knt6TVnu71a6D
	27vxZiGpGct4+kC8SlyugE1y97yMHRmigvoxQRFi6jX6m7h36a7nZZa7ro3zRYmEwNxK
	3FCkaRXWr5y5Ld+lgroanz4cN5WJyfsMFkbXYVOMzZI4dp5q3BguyPH3ZNktRtBZ2kso
	ZJXyNYM+tjJhhcSUwv/2yfj8uivmRO3Jguz2OPJITYaCxVlf7NDdrM2iLkI5qZz9h8tr
	t56w==
X-Gm-Message-State: ALyK8tIgmiIE6lJUqD6B0k4oqf3S3otR3VVL6jEFE3VVNXYdYMy142vXCtiy4r89cb31KijvOfCO4s7UO8r1mw==
X-Received: by 10.25.4.202 with SMTP id 193mr1959833lfe.204.1467997759890;
	Fri, 08 Jul 2016 10:09:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.10.10 with HTTP; Fri, 8 Jul 2016 10:09:19 -0700 (PDT)
In-Reply-To: <1467619576-13899-6-git-send-email-mingli.yu@windriver.com>
References: <1467619576-13899-1-git-send-email-mingli.yu@windriver.com>
	<1467619576-13899-6-git-send-email-mingli.yu@windriver.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Fri, 8 Jul 2016 10:09:19 -0700
Message-ID: <CANx9H-DVRsHZGBJVkc2k1p4fTdWOchBhQBnm3Y8HuhTtiuzwMA@mail.gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-python][PATCH v2 5/5] python-setuptools-scm: Add python-setuptools-scm bb
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
X-List-Received-Date: Fri, 08 Jul 2016 17:09:20 -0000
Content-Type: text/plain; charset=UTF-8

Built ok for beaglebone.

NOTE: SRC_URI probably not required with Derek's pypi.bbclass patch
https://patchwork.openembedded.org/patch/125551/ but I did not test for
that.


Acked-by: Tim Orling (Intel OpenSource Technology Center) <
ticotimo@gmail.com>

On Mon, Jul 4, 2016 at 1:06 AM, <mingli.yu@windriver.com> wrote:

> From: Mingli Yu <mingli.yu@windriver.com>
>
> * Add python-setuptools-scm bb as python-pytest-runner depends
>   on python-setuptools-scm
>
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  .../python/python-setuptools-scm_1.11.1.bb             | 18
> ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/
> python-setuptools-scm_1.11.1.bb
>
> diff --git a/meta-python/recipes-devtools/python/
> python-setuptools-scm_1.11.1.bb b/meta-python/recipes-devtools/python/
> python-setuptools-scm_1.11.1.bb
> new file mode 100644
> index 0000000..2a3b97d
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python-setuptools-scm_1.11.1.bb
> @@ -0,0 +1,18 @@
> +SUMMARY = "the blessed package to manage your versions by scm tags"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=838c366f69b72c5df05c96dff79b35f2"
> +
> +inherit pypi setuptools
> +
> +SRCNAME = "setuptools_scm"
> +
> +SRC_URI = "
> https://pypi.python.org/packages/84/aa/c693b5d41da513fed3f0ee27f1bf02a303caa75bbdfa5c8cc233a1d778c4/${SRCNAME}-${PV}.tar.gz
> "
> +
> +SRC_URI[md5sum] = "4d19b2bc9580016d991f665ac20e2e8f"
> +SRC_URI[sha256sum] =
> "8c45f738a23410c5276b0ed9294af607f491e4260589f1eb90df8312e23819bf"
> +
> +S = "${WORKDIR}/${SRCNAME}-${PV}"
> +
> +RDEPENDS_${PN} = "python-py python-setuptools python-argparse
> python-debugger python-json"
> +
> +
> --
> 2.8.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

