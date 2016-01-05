Return-Path: <ticotimo@gmail.com>
Received: from mail-lb0-f177.google.com (mail-lb0-f177.google.com
	[209.85.217.177])
	by mail.openembedded.org (Postfix) with ESMTP id 4FB386010D
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Jan 2016 14:26:36 +0000 (UTC)
Received: by mail-lb0-f177.google.com with SMTP id pv2so190828629lbb.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Jan 2016 06:26:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=Ux8HbvymcLgLfF9bZw6+zZ+9CgB5KaMTQ2FFmzTKyQg=;
	b=ueZvWan0Rxa0sMRRsWQ9yg/kkOXkw9xpdtpS9Ahe90E7N6vAPolqVkW8Psaxcn7inY
	pBcbPqKShI0kLou/hNjuwITMKb8osrtIENXiRWTXFhkK+N35VJ0yojH0JcnMT0QBPBrK
	Pb11+OzoFoahnOaMrLfI/s2vZII+X/dcyKimuj5DnBY3K4MhGKYTI/VPge4qTdW/bFKs
	rVWadoqWfFUyOQBf105tFR2F1csHxTMzwrisd/4AP+WdFACOY3oZOZzXXxuk75i2eu3K
	xi3g8ViF8GJo5L/M9/QFKbNfh/+9Ac89pFJLSNsTGvD7DnVkSmOh0eZWtUf4/K2n9wNe
	WZUg==
MIME-Version: 1.0
X-Received: by 10.112.205.196 with SMTP id li4mr17798489lbc.143.1452003996934; 
	Tue, 05 Jan 2016 06:26:36 -0800 (PST)
Received: by 10.25.150.143 with HTTP; Tue, 5 Jan 2016 06:26:36 -0800 (PST)
In-Reply-To: <1451855721-13018-1-git-send-email-derek@asterius.io>
References: <1451855721-13018-1-git-send-email-derek@asterius.io>
Date: Tue, 5 Jan 2016 06:26:36 -0800
Message-ID: <CANx9H-CrqzdL_ZHjvCtXjUytePD03V8NSSGPV95SVKw-2CA-Uw@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Derek Straka <derek@asterius.io>
Subject: Re: [meta-python][PATCH] Add python-jsonpatch and python-jsonpointer recipes
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
X-List-Received-Date: Tue, 05 Jan 2016 14:26:37 -0000
Content-Type: text/plain; charset=UTF-8

python-jsonpointer has unmet dependencies (a quick look at setup.py shows
that you will need to add python-re to RDEPENDS).

Also, I would prefer to see two separate patches, one for each new recipe.

Regards,
Tim

On Sun, Jan 3, 2016 at 1:15 PM, Derek Straka <derek@asterius.io> wrote:

> Signed-off-by: Derek Straka <derek@asterius.io>
> ---
>  .../python/python-jsonpatch_1.12.bb                 | 21
> +++++++++++++++++++++
>  .../python/python-jsonpointer_1.10.bb               | 19
> +++++++++++++++++++
>  2 files changed, 40 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/
> python-jsonpatch_1.12.bb
>  create mode 100644 meta-python/recipes-devtools/python/
> python-jsonpointer_1.10.bb
>
> diff --git a/meta-python/recipes-devtools/python/python-jsonpatch_1.12.bb
> b/meta-python/recipes-devtools/python/python-jsonpatch_1.12.bb
> new file mode 100644
> index 0000000..4dc3bee
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python-jsonpatch_1.12.bb
> @@ -0,0 +1,21 @@
> +SUMMARY  = "Appling JSON patches in Python 2.6+ and 3.x"
> +HOMEPAGE = "https://github.com/stefankoegl/python-json-patch"
> +SECTION = "devel/python"
> +LICENSE = "BSD"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=32b15c843b7a329130f4e266a281ebb3"
> +
> +SRCNAME = "jsonpatch"
> +
> +SRC_URI = " \
> +
> https://pypi.python.org/packages/source/j/${SRCNAME}/${SRCNAME}-${PV}.tar.gz
> \
> +"
> +
> +inherit setuptools
> +
> +SRC_URI[md5sum] = "76ae3183db5f2a8f85dd7705e9b6f278"
> +SRC_URI[sha256sum] =
> "2e1eb457f9c8dd5dae837ca93c0fe5bd2522c9d44b9b380fb1aab2ab4dec04b1"
> +
> +RDEPENDS_${PN} += "python-jsonpointer"
> +
> +S = "${WORKDIR}/${SRCNAME}-${PV}"
> +
> diff --git a/meta-python/recipes-devtools/python/
> python-jsonpointer_1.10.bb b/meta-python/recipes-devtools/python/
> python-jsonpointer_1.10.bb
> new file mode 100644
> index 0000000..9c69688
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python-jsonpointer_1.10.bb
> @@ -0,0 +1,19 @@
> +DESCRIPTION = "Resolve JSON Pointers in Python"
> +HOMEPAGE = "https://github.com/stefankoegl/python-json-pointer"
> +SECTION = "devel/python"
> +LICENSE = "BSD"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=32b15c843b7a329130f4e266a281ebb3"
> +
> +SRCNAME = "jsonpointer"
> +
> +SRC_URI = " \
> +
> https://pypi.python.org/packages/source/j/${SRCNAME}/${SRCNAME}-${PV}.tar.gz
> \
> +"
> +
> +inherit setuptools
> +
> +SRC_URI[md5sum] = "d68c0c6ad6889e9c94ec0feba719e45e"
> +SRC_URI[sha256sum] =
> "9fa5dcac35eefd53e25d6cd4c310d963c9f0b897641772cd6e5e7b89df7ee0b1"
> +
> +S = "${WORKDIR}/${SRCNAME}-${PV}"
> +
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

