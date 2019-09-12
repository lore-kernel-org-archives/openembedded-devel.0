Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id 69F1C6B5C5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Sep 2019 07:16:08 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id f13so23474578qkm.9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Sep 2019 00:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=VEwulj8bxifcwqJSX8rTgwevXpaDmKpZXo3WWRIx9XQ=;
	b=rLzXc0EmFOYGIg8SXwRY4/qkhk4CNV2vmyUeOtPRUUsKU6J3YaiTROzb9GvaNsA0we
	sdTyultQqKTUt++mypryBjDLqPvSFi2q8cjPE9fgbbfHCWeTZOUlxKGAQSy+agq3ymNw
	+FV97rxCqdc7CiRwBqKjf48F5fS+u40ErjbyEnLAWXsJShCEo4Achii3XLcfdF1diDz+
	kMxQ4B8ctEDqKSJZsedW5vgogM06Spku5nz9n7WF+/RqcvulblHhseq9K1ZGB+zt5X35
	ey2izPdeQ/hlD93swe1CBuGjZlih7otz+oMWLNFfbx5mNVVqTpx+n+qQCAL8IFXgXbqY
	BqZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=VEwulj8bxifcwqJSX8rTgwevXpaDmKpZXo3WWRIx9XQ=;
	b=sAUVnWh/Z904zKj+e9iPDyCDAcr/4Q+W4k6+G+VFbnMe0GHCFlkLMaoTMjp5IcFQKz
	uGQim0G3GQAqiuse12Pj2FAdcjljiUBMuFQszTElJ5LfxjBi18ojQMi69jcBKq88xDGN
	UNdS73ZWTFEzFdDs5mfIYu6+csE3T5L2EwKPNrOQe6SYpbpBEJzrD6lllbHRKK8AWlSr
	+rrCGa3b9VBOsQadim+r5L8AECkFpf8MTjYsmJqirffbnPvq2gwRtO7M9D+0Wjruo/gj
	c4rgAel6QJrfEO+XCzc2xuFRtPYwImBaVYs06ScM70NWQI/GKUi/h3gnWetapp5c6pJc
	nKKg==
X-Gm-Message-State: APjAAAUSVVL6iEtmAAe+JPHOwOHqKMd+pUvdWyFkHCrAk7EaxEjS5YGS
	+ukN3WAGSG3abMa66SVSDBCe8l3u0THbQyipDPUZcK8K
X-Google-Smtp-Source: APXvYqyl06UV1p7aQUElfvrc3iVdLdAY5x+0Xsp+UJETdUyKpWh8O6l2aCO9lxlnT673caIrkictSss7J6zlEBFg4jM=
X-Received: by 2002:ae9:edd8:: with SMTP id
	c207mr33797346qkg.337.1568272568756; 
	Thu, 12 Sep 2019 00:16:08 -0700 (PDT)
MIME-Version: 1.0
References: <20190912070050.4388-1-brgl@bgdev.pl>
In-Reply-To: <20190912070050.4388-1-brgl@bgdev.pl>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 12 Sep 2019 00:15:42 -0700
Message-ID: <CAMKF1so9rMwPvE=6jZqOhuisT+ZT-v6aePQMYCR7-0dOmWXzTg@mail.gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] yad: new package
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
X-List-Received-Date: Thu, 12 Sep 2019 07:16:08 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Bartosz

On Thu, Sep 12, 2019 at 12:00 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> This adds a recipe for yad (Yet Another Dialog) - a command-line utility
> allowing to display configurable dialog windows from shell scripts and
> parse the input from users.
>
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
>  meta-oe/recipes-graphics/yad/yad_4.1.bb | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>  create mode 100644 meta-oe/recipes-graphics/yad/yad_4.1.bb
>
> diff --git a/meta-oe/recipes-graphics/yad/yad_4.1.bb b/meta-oe/recipes-graphics/yad/yad_4.1.bb
> new file mode 100644
> index 000000000..cfb13c4b7
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/yad/yad_4.1.bb
> @@ -0,0 +1,18 @@
> +SUMMARY = "Yet Another Dialog"
> +DESCRIPTION = "Program allowing you to display GTK+ dialog boxes from command line or shell scripts."
> +AUTHOR = "Victor Ananjevsky"
> +
> +LICENSE = "GPLv3"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
> +
> +SRC_URI = "git://github.com/v1cont/yad.git"
> +SRCREV = "3857a0a8822fc0a7206e804f15cc17b85a5f8ce2"
> +PV = "4.1+git${SRCPV}"

Lets rename the recipe PV to 4.1 since the SRCREV is pointing to that
exact release.

> +
> +inherit autotools gsettings
> +
> +DEPENDS = "gtk+3 glib-2.0-native intltool-native"
> +
> +S = "${WORKDIR}/git"
> +
> +FILES_${PN} += "${datadir}/icons/"
> --
> 2.21.0
>

