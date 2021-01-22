Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
 by mx.groups.io with SMTP id smtpd.web08.5139.1611292068075769807
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Jan 2021 21:07:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@aj.id.au header.s=fm1 header.b=k1gQMhli;
 spf=pass (domain: aj.id.au, ip: 66.111.4.29, mailfrom: andrew@aj.id.au)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 712D95C00A6;
	Fri, 22 Jan 2021 00:07:47 -0500 (EST)
Received: from imap2 ([10.202.2.52])
  by compute3.internal (MEProxy); Fri, 22 Jan 2021 00:07:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
	mime-version:message-id:in-reply-to:references:date:from:to:cc
	:subject:content-type; s=fm1; bh=3GccD5azpfE1iqdGMpU1h+/FYyu9pON
	qXqs9sL6O52I=; b=k1gQMhliDOxwJ0IjSpt4e1wg6ggR4Y6xHAWZEIXbkkBgujW
	yzJXO5aX10s5QTuA4MzZmw/h4rzRdJxX98+qIir0RbNoUvqvzmDWqeasYcr6I33K
	8kBmSlJeCbmainBxGU54aBhP9+OyTc/MA2fgyt5N/SB1cIvOXu/4VS+jZ5eZGuOH
	It9IpPH0UoKG+PoXOfiv9zEnT0TzwiGtb+Klx5pr7cp34hWFXl3tGz5X7zEwfMqS
	T+PoDOYY3mexdbyrw40VrpQeqQWqoyqLY7f38UF93QjIT3bpT/rFoll99F8MLKmY
	t97f5tdt4kPjwLZjOdQfUHAeWzPAc9mwZu5tJpA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=3GccD5
	azpfE1iqdGMpU1h+/FYyu9pONqXqs9sL6O52I=; b=eWJsYR7pUnxinV/YWcojcM
	YHacpoDxS7nDeEnDBn7FDyU7g/52lu9NSghd3kMYPok3tURHHnEKW69kHRjl8PUp
	IrKtKFU3iAygjnJUioXL92W4Z3P2o99erMGHIaDvgSKU8RQwTrVQBj3RMYRudyaB
	nnnOCXH/FWMv9YMZPFZ9fuFkii4Z2PHpo0jw8EX56Hz/7XCF4w8Noe1vX72VTeYR
	mIGuTVwbC6CKZ+rTJzXBtL5G6LgXHGlY8JuCDBYjUA/jw8MbqI5grIW+c+FQraAp
	NE+mm/DlnUTrgVeSDrkQrHmSgTAjoeVyFuKCCZ3H0TMzx+eXWC+V2GJdzc7aG0aw
	==
X-ME-Sender: <xms:ol0KYAT3UZrlLc-XIzh71ZI1__M3twqcEmY6mQW1EUPT-7CJlq8QyA>
    <xme:ol0KYNzgedC9Z4kFYsFy52E2kbY3OCGsyWQaX2N-CVkONWeYrnA1P6vd0_dSjsuX7
    xPuI1zBrqnIuaB45g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudehgdejlecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
    vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
    htthgvrhhnpedvvdeugeduuddvkeeljeekvdduueevgfetheefkeejgfdvhfduudevieeu
    geegvdenucffohhmrghinhephihotghtohhprhhojhgvtghtrdhorhhgpdgsihhtsghutg
    hkvghtrdhorhhgpdhphihpihdrohhrghdpohhpvghnvghmsggvugguvggurdhorhhgnecu
    vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvg
    ifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:ol0KYN29Gk4sceFiY--nheNpdfywkiQc8RT-3XILTd5v8HGm0LED3w>
    <xmx:ol0KYEDRljpYkdA-iXFCm0sWpWlK5s4Wp1KTo_DVSI3N7oPkJgh2yg>
    <xmx:ol0KYJhcehUubHdhQ9ywhVrNMV2NYyMhjv7YXVb_FWdZPocx8la-DQ>
    <xmx:o10KYDfT7iWF9gjzfX81FzNHoYA6WQi27bJN1HT_IU-eFoagJnuUmg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id E0905A0005D; Fri, 22 Jan 2021 00:07:46 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-78-g36b56e88ef-fm-20210120.001-g36b56e88
Mime-Version: 1.0
Message-Id: <199f0aba-ef5d-48ff-969c-ab4cac2e9275@www.fastmail.com>
In-Reply-To: 
 <CAMKF1spPBxUOFbzdv7Hx7xX9XXS5Z16A0=xA20nF07qVrEtR-g@mail.gmail.com>
References: <20210113031744.2245509-1-andrew@aj.id.au>
 <CAMKF1spY5Q-q15JUrVmdz28cQqncynzOWEfE=17dKt2ZRvPk1w@mail.gmail.com>
 <CAMKF1spPBxUOFbzdv7Hx7xX9XXS5Z16A0=xA20nF07qVrEtR-g@mail.gmail.com>
Date: Fri, 22 Jan 2021 15:37:21 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Khem Raj" <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-python][PATCH] meta-python: Add hexdump package
Content-Type: text/plain

Sorry Khem, I just realised my mail filters had hidden your reply from me.

I'll send a v2 shortly!

Andrew

On Thu, 14 Jan 2021, at 04:46, Khem Raj wrote:
> also fails in package task
> https://errors.yoctoproject.org/Errors/Details/540931/
> 
> On Tue, Jan 12, 2021 at 7:34 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > Please add it in packagegroup-meta-python as well
> >
> > On Tue, Jan 12, 2021 at 7:18 PM Andrew Jeffery <andrew@aj.id.au> wrote:
> >>
> >> The hexdump package appears to be abandoned, but it's used as the
> >> dependency of another project I'm packaging.
> >>
> >> Change-Id: Id90d770fb48fa502f3abeb541b7febef42799b21
> >> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> >> ---
> >>  .../python/python3-hexdump_3.3.bb             | 20 +++++++++++++++++++
> >>  1 file changed, 20 insertions(+)
> >>  create mode 100644 meta-python/recipes-devtools/python/python3-hexdump_3.3.bb
> >>
> >> diff --git a/meta-python/recipes-devtools/python/python3-hexdump_3.3.bb b/meta-python/recipes-devtools/python/python3-hexdump_3.3.bb
> >> new file mode 100644
> >> index 000000000000..eb4bf994d4f4
> >> --- /dev/null
> >> +++ b/meta-python/recipes-devtools/python/python3-hexdump_3.3.bb
> >> @@ -0,0 +1,20 @@
> >> +SUMMARY = "view/edit your binary with any text editor"
> >> +
> >> +# The homepage listed on pypi is [1] but the repository has been removed.
> >> +# Instead, set the homepage to pypi.
> >> +#
> >> +# [1] https://bitbucket.org/techtonik/hexdump/
> >> +HOMEPAGE = "https://pypi.org/project/hexdump/"
> >> +
> >> +LICENSE = "PD"
> >> +LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/PD;md5=b3597d12946881e13cb3b548d1173851"
> >> +
> >> +PYPI_PACKAGE_EXT = "zip"
> >> +
> >> +inherit pypi distutils3
> >> +
> >> +SRC_URI[sha256sum] = "d781a43b0c16ace3f9366aade73e8ad3a7bd5137d58f0b45ab2d3f54876f20db"
> >> +
> >> +S = "${WORKDIR}"
> >> +
> >> +BBCLASSEXTEND = "native nativesdk"
> >> --
> >> 2.27.0
> >>
> >>
> >> 
> >>
>
