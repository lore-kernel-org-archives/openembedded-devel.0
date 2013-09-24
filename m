Return-Path: <s.stirtzel@googlemail.com>
Received: from mail-oa0-f54.google.com (mail-oa0-f54.google.com
	[209.85.219.54])
	by mail.openembedded.org (Postfix) with ESMTP id 3C559610FB
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Sep 2013 12:53:54 +0000 (UTC)
Received: by mail-oa0-f54.google.com with SMTP id n5so2054364oag.13
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Sep 2013 05:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=TIl+Lu77a4ueD6alkR9ceUpYVyQYT1iigbu73tYx5Wg=;
	b=X3ZL07Utd9tF9ELQxzETc0xTkfQxWe9HCdx1xNAcOxuEpx2kli8lEnwDPiZpvXbp0M
	/C08xM/jhlnORFS9FQd1jFO/pvTvKyjpi7tv6Ol+zCIobL/W2IR8znN0ZFdnPPgEPp3R
	Wiu5QQ/NfPA8hdOo7LK2IQdjZ6z53dB0AMLipdBc98VE5VAVJQ8IhG5PJg2gdsJ5Ldq5
	CSEHNszD8OD51VRSBHnz98ty5snVzPdB2Yta1C5FsnN+mc8cwhJoyMTXlEhJB+Jatwp+
	jsjUB2snTNUFYPSqvfUVOcRsxU1w1LZTrDyrelLCU2DXK0wETaVXY0UE8NDmFX7lYZHR
	lzBQ==
X-Received: by 10.182.242.11 with SMTP id wm11mr12172984obc.26.1380027235425; 
	Tue, 24 Sep 2013 05:53:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.60.44.66 with HTTP; Tue, 24 Sep 2013 05:53:35 -0700 (PDT)
In-Reply-To: <1379920720-7125-2-git-send-email-s.stirtzel@googlemail.com>
References: <1379920720-7125-2-git-send-email-s.stirtzel@googlemail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
Date: Tue, 24 Sep 2013 14:53:35 +0200
Message-ID: <CAGiJk9f8785DakJ77n_QErc4NmGh94eXxud2QLTa7h4JqjaLbQ@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v2 2/3] utouch-frame: Add initial recipe
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
X-List-Received-Date: Tue, 24 Sep 2013 12:53:55 -0000
Content-Type: text/plain; charset=UTF-8

2013/9/23 Samuel Stirtzel <s.stirtzel@googlemail.com>:
> used by utouch-mtview, a visual multitouch test application for X
>
> Signed-off-by: Samuel Stirtzel <s.stirtzel@googlemail.com>
> ---
>  meta-oe/recipes-support/utouch/utouch-frame_git.bb |   17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>  create mode 100644 meta-oe/recipes-support/utouch/utouch-frame_git.bb
>
> diff --git a/meta-oe/recipes-support/utouch/utouch-frame_git.bb b/meta-oe/recipes-support/utouch/utouch-frame_git.bb
> new file mode 100644
> index 0000000..c160543
> --- /dev/null
> +++ b/meta-oe/recipes-support/utouch/utouch-frame_git.bb
> @@ -0,0 +1,17 @@
> +SUMMARY = "Touch Frame Library"
> +DESCRIPTION = "The frame library and tools are used to handle touch frames, i.e., collections of tracked contacts. Bindings for mtdev and XI2.1."
> +HOMEPAGE = "http://bitmath.org/code/evemu/"
> +
> +LICENSE = "GPLv3"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=2f31b266d3440dd7ee50f92cf67d8e6c"
> +
> +DEPENDS += "mtdev utouch-evemu"
> +
> +inherit autotools
> +
> +SRC_URI = "git://bitmath.org/git/frame.git;protocol=http"
> +SRCREV = "95363d5a1f7394d71144bf3b408ef4e6db4350fc"
> +
> +PV = "1.1.2+git${SRCPV}"
> +
> +S = "${WORKDIR}/git/"
> --
> 1.7.9.5
>

Hi,

missed out that the HOMEPAGE is wrong here and in the utouch-evemu recipe,
v3 coming soon.


-- 
Regards
Samuel

