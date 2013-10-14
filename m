Return-Path: <net147@gmail.com>
Received: from mail-pa0-f54.google.com (mail-pa0-f54.google.com
	[209.85.220.54])
	by mail.openembedded.org (Postfix) with ESMTP id D80F16CBAC
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Oct 2013 12:56:24 +0000 (UTC)
Received: by mail-pa0-f54.google.com with SMTP id kx10so7496521pab.13
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Oct 2013 05:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=qWiDa2UwRD+4ggpgpRiTGxY/fhSZfx1iO/b/SlD93XE=;
	b=CgVG/Fy3+Q/dzSF6RK9K4wSOAcRXQOZACxevjB0viRs2L2QotLcbq9A00aHRrgBp6+
	pxPeeQH4tjAvxewDuAPfu7+oUOj/mWjntyX3SKYOQzIlJrh04BwN4uL2dQ0MxqArk08Z
	Rq3Tadikq/Ib1bYrhjJ97wf9PeBW9fcGKYTxzG4GQlqcuGPBW84NxKtcbClQIwvZfsDJ
	yqZSFj83BWuAakcpUPIhmXvoJEZtjODdN8aUzmwjgj8Kg+cREYqRVbYM33oNzWFdxGdI
	M6/uHmone6wAvUGowQh1LXdCrACaEJgkZRtgHYPUtCDQnYK6i6yKBCjy+uX6S6wHt6Oi
	N02Q==
X-Received: by 10.66.141.144 with SMTP id ro16mr1363530pab.173.1381755386653; 
	Mon, 14 Oct 2013 05:56:26 -0700 (PDT)
Received: from [192.168.0.2] (60-242-179-244.static.tpgi.com.au.
	[60.242.179.244])
	by mx.google.com with ESMTPSA id y5sm77920103pbs.18.1969.12.31.16.00.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 14 Oct 2013 05:56:25 -0700 (PDT)
Message-ID: <525BE8BF.3060705@gmail.com>
Date: Mon, 14 Oct 2013 23:51:11 +1100
From: Jonathan Liu <net147@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1381738170-28131-1-git-send-email-koen@dominion.thruhere.net>
In-Reply-To: <1381738170-28131-1-git-send-email-koen@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [meta-oe][PATCHv2] python-pip: add 1.3.1
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
X-List-Received-Date: Mon, 14 Oct 2013 12:56:26 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 14/10/2013 7:09 PM, Koen Kooi wrote:
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
>   meta-oe/recipes-devtools/python/python-pip_1.3.1.bb | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
>   create mode 100644 meta-oe/recipes-devtools/python/python-pip_1.3.1.bb
>
> diff --git a/meta-oe/recipes-devtools/python/python-pip_1.3.1.bb b/meta-oe/recipes-devtools/python/python-pip_1.3.1.bb
> new file mode 100644
> index 0000000..c812913
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/python/python-pip_1.3.1.bb
> @@ -0,0 +1,14 @@
> +DESCRIPTION = "Python-pip is a tool for installing and managing Python packages."
It is called pip. python-pip is the recipe name.

Regards,
Jonathan
> +LICENSE = "MIT & GPL"
> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=cd00425a3465a0e4c81929b94241d3de"
> +
> +SRC_URI = "https://pypi.python.org/packages/source/p/pip/pip-${PV}.tar.gz"
> +SRC_URI[md5sum] = "cbb27a191cebc58997c4da8513863153"
> +SRC_URI[sha256sum] = "145eaa5d1ea1b062663da1f3a97780d7edea4c63c68a37c463b1deedf7bb4957"
> +
> +S = "${WORKDIR}/pip-${PV}"
> +
> +inherit setuptools
> +
> +# Since PIP is like CPAN for PERL we need to drag in all python modules to ensure everything works
> +RDEPENDS_${PN} = "python-modules"


