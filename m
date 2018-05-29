Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
	[66.111.4.25])
	by mail.openembedded.org (Postfix) with ESMTP id 19D2D60574
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 May 2018 11:48:14 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 6E00421A7B;
	Tue, 29 May 2018 07:48:15 -0400 (EDT)
Received: from web6 ([10.202.2.216])
	by compute4.internal (MEProxy); Tue, 29 May 2018 07:48:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; bh=zZFCZKTT7X6tfu8U5UFauSPyRLvWj
	1eJ9tU8cHKk2FE=; b=rRS7B02Q8/OPqwVCrF4VPmFwj4bRLXYDRqeknHsPRM+Pw
	cnjLhawCHbcz5CddJ48EyGId1u8IovKeSfKeg8EFCnHdLqleh9WcGc5SKVgIbhVz
	tujDgdyxq5UqXvbcL/8EUI834F2J2v+5DZUvYAhHtVZN8O2l7qhRuwesV/OxZzc3
	DYM3W7kSi2ihrwZW0AWsN1MQH4/rZmb8qAawHOk4mOyr7sUwmnCbU6+CX/4lKua/
	LgbAblVhSIi4sciIgIrWMs7lk2jlnE1r3A5ToV+RcmHYrJK6yTXwDLMcxp4zKiwF
	k9Dexmm41uZdeqnEtQ/uQ8QxvGHFTGofnTSXIBgSQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=zZFCZK
	TT7X6tfu8U5UFauSPyRLvWj1eJ9tU8cHKk2FE=; b=isniP9O6NhwMM09b85A0+z
	rKozAtZSOMm6bezBUfjmKnuQtCjWsJoXFsO88ckgmORr29ZKhJ2GLrsk3G+5pQYP
	GVewDnlGDzEDtRrRHQf9v3TMPALhbkAsnCMh8zdpeLs/9JMUC4GKXvQNzZwr2yIs
	/R5ZONBpwKc6GxxtKH+Yi5gzbelRSfHTL85sURpgKkkJmyU1V6KjfwRHL1aGNr7i
	VJy1wJ0Bb6xPO17apMNnUGbBxH29WLwlVH9M94sg93zyIL1TizONB/LA6KCc9asx
	hX36codsK5ujFEGmUbYB2QcZSHZRnfBa9B8bGell17Ig3rcXzVmLTV5JLd8tOIYw
	==
X-ME-Proxy: <xmx:_z0NWy_FmdZRY9Rb722W30lX78iBY2IH_oWp2kUnl_RxRBMVwib0wA>
X-ME-Proxy: <xmx:_z0NW-4c8P7LF0OyRnHcY7VufMkplCNfQnljTJvHU1F6D7mWeCfzbg>
X-ME-Proxy: <xmx:_z0NW67bQNC8o_oZjHiZCWNaS--XsjcR9sS5UUKd0cKsjJyjT5Gc7g>
X-ME-Proxy: <xmx:_z0NW5HfZzU0tSBegEkz1zXrnSURLm8Gl-8GrG3rTthizgfUl_cT2A>
X-ME-Proxy: <xmx:_z0NW50Biio4xE11Rfg9lSgKmsCfd_Ow5mARVQICFgG6KW9vtPHaLw>
X-ME-Proxy: <xmx:_z0NW_RPArGJDrLHX5zA2DVl9bjiR5vKVcuYNjUX85jqveSqLPE0lg>
X-ME-Sender: <xms:_z0NW9qlgx1A6q15LC6Wzg6GP1ks0_2ukcSpqOxmMqHD7BJg1tT8TA>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
	id E7AF5410C; Tue, 29 May 2018 07:48:14 -0400 (EDT)
Message-Id: <1527594494.687641.1388974752.4113AC8F@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: Andrew Jeffery <andrew@aj.id.au>, openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
X-Mailer: MessagingEngine.com Webmail Interface - ajax-397f98d6
References: <20180510063718.16913-1-andrew@aj.id.au>
Date: Tue, 29 May 2018 21:18:14 +0930
In-Reply-To: <20180510063718.16913-1-andrew@aj.id.au>
Cc: openbmc@lists.ozlabs.org
Subject: Re: [meta-python][PATCH v2 1/3] meta-python: Add python-pyflame recipe
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
X-List-Received-Date: Tue, 29 May 2018 11:48:15 -0000
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"

On Thu, 10 May 2018, at 16:07, Andrew Jeffery wrote:
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Ping - is there anything I need to revise for this patch or the following two?

Cheers,

Andrew

> ---
>  meta-python/recipes-devtools/python/python-pyflame.inc      | 12 ++++++++++++
>  meta-python/recipes-devtools/python/python-pyflame_1.6.6.bb |  1 +
>  2 files changed, 13 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/python-pyflame.inc
>  create mode 100644 meta-python/recipes-devtools/python/python-pyflame_1.6.6.bb
> 
> diff --git a/meta-python/recipes-devtools/python/python-pyflame.inc b/
> meta-python/recipes-devtools/python/python-pyflame.inc
> new file mode 100644
> index 000000000000..3b84a7e8f8e3
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python-pyflame.inc
> @@ -0,0 +1,12 @@
> +SUMMARY = "Pyflame: A Ptracing Profiler For Python"
> +HOMEPAGE = "https://github.com/uber/pyflame"
> +SECTION = "devel/python"
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://${S}/
> LICENSE;md5=2ee41112a44fe7014dce33e26468ba93"
> +DEPENDS = "python"
> +
> +SRC_URI = "git://github.com/uber/pyflame.git;protocol=https;tag=v${PV}"
> +S = "${WORKDIR}/git"
> +
> +inherit pkgconfig autotools
> +
> diff --git a/meta-python/recipes-devtools/python/python-pyflame_1.6.6.bb 
> b/meta-python/recipes-devtools/python/python-pyflame_1.6.6.bb
> new file mode 100644
> index 000000000000..96f03305f883
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python-pyflame_1.6.6.bb
> @@ -0,0 +1 @@
> +require python-pyflame.inc
> -- 
> 2.14.1
> 

