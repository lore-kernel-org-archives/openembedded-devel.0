Return-Path: <ticotimo@gmail.com>
Received: from mail-la0-f53.google.com (mail-la0-f53.google.com
	[209.85.215.53])
	by mail.openembedded.org (Postfix) with ESMTP id C85C065CED
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Nov 2014 15:06:30 +0000 (UTC)
Received: by mail-la0-f53.google.com with SMTP id mc6so9823487lab.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Nov 2014 07:06:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=XMfwsq6qK8Mtk9UIO+XPEmpBjDxp6ZE6hvfSnKMB8lw=;
	b=k7EfNjpREgOqAelsupbTKwvqKfjelWz0PioGvVrHWLyt5ar5SfelknM3QyYiw2SBnp
	M/colnAHpVeVupqJxCfQQWJU3I2p8PCrUMa2gl9Wi2fXPW0o8kqBByC7elfjW4tPnhAq
	hP+PcCgnTAa7kkIrW1tFi289ChfZ2OXq0lWkO8RNwMm/TywyE2wZoxNkyohy94uFkgf7
	iOKQDSJLK2bCoo9dgDLby/bYpRPT7tUkVKRQ1MOLCTrJfOh2H+yNmSoGQzW7mqcPkKf9
	sJRZ9q8GKl2jcb/wufvm6reet21nUNVe+1uwWOp9JuickNBkecg6/4LlVkupn6KSJCJQ
	Brjg==
MIME-Version: 1.0
X-Received: by 10.152.204.230 with SMTP id lb6mr24049003lac.35.1415718390239; 
	Tue, 11 Nov 2014 07:06:30 -0800 (PST)
Received: by 10.25.79.208 with HTTP; Tue, 11 Nov 2014 07:06:30 -0800 (PST)
In-Reply-To: <1415661548-16364-1-git-send-email-derek@minotaurinc.com>
References: <1415661548-16364-1-git-send-email-derek@minotaurinc.com>
Date: Tue, 11 Nov 2014 07:06:30 -0800
Message-ID: <CANx9H-AJfk=0WyR4hzHdAJQ+2u55h3WkBHSX5auPs7hD-M2msw@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Derek Straka <derek@minotaurinc.com>
Subject: Re: [meta-python][PATCH] python-flufl-enum: add recipe for 4.0.1
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
X-List-Received-Date: Tue, 11 Nov 2014 15:06:35 -0000
Content-Type: text/plain; charset=UTF-8

Acked-by: Tim Orling <TicoTimo@gmail.com>

On Mon, Nov 10, 2014 at 3:19 PM, Derek Straka <derek@minotaurinc.com> wrote:

> Signed-off-by: Derek Straka <derek@minotaurinc.com>
> ---
>  .../python/python-flufl-enum_4.0.1.bb              |   33
> ++++++++++++++++++++
>  1 file changed, 33 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/
> python-flufl-enum_4.0.1.bb
>
> diff --git a/meta-python/recipes-devtools/python/
> python-flufl-enum_4.0.1.bb b/meta-python/recipes-devtools/python/
> python-flufl-enum_4.0.1.bb
> new file mode 100644
> index 0000000..a7376db
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python-flufl-enum_4.0.1.bb
> @@ -0,0 +1,33 @@
> +SUMMARY  = "A Python enumeration package."
> +DESCRIPTION = "The flufl.enum library is a Python enumeration package.
> Its goal is to provide simple, \
> +specific, concise semantics in an easy to read and write syntax.
> flufl.enum has just enough of the \
> +features needed to make enumerations useful, but without a lot of extra
> baggage to weigh them down. "
> +HOMEPAGE = "https://pypi.python.org/pypi/flufl.enum"
> +SECTION = "devel/python"
> +
> +LICENSE = "LGPLv3"
> +LIC_FILES_CHKSUM = "file://PKG-INFO;md5=1fa25baed15d3be23c902636379438e8"
> +
> +SRCNAME = "flufl.enum"
> +
> +SRC_URI = " \
> +
> http://pypi.python.org/packages/source/f/${SRCNAME}/${SRCNAME}-${PV}.tar.gz
> \
> +"
> +
> +SRC_URI[md5sum] = "b3ad23761a78232bc78499ced7cb85d9"
> +SRC_URI[sha256sum] =
> "4af7e7cf2dcc7517251570c7ef9ad194e30ee4b6f860eba500c03954ae95f9d8"
> +
> +inherit setuptools
> +
> +S = "${WORKDIR}/${SRCNAME}-${PV}"
> +
> +PACKAGES =+ "\
> +    ${PN}-test \
> +"
> +
> +FILES_${PN}-doc += "\
> +    ${libdir}/${PYTHON_DIR}/site-packages/flufl/enum/*.rst \
> +    ${libdir}/${PYTHON_DIR}/site-packages/flufl/enum/docs \
> +"
> +
> +FILES_${PN}-test +=
> "${libdir}/${PYTHON_DIR}/site-packages/flufl/enum/tests"
> --
> 1.7.9.5
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

