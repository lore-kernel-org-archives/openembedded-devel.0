Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id 8B4C26067C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jul 2016 18:52:39 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id n202so1675780qke.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jul 2016 11:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=0IkouTH+erVJOKDNy7DLIBABtJKuzptf6zmxl8MIKVk=;
	b=ZO+oc7yLzpy2jY5tsNo6Z0/VV6kGkhUoQRMDuzpgGPEGP/KguQe9DbV2UZA+InvL9S
	Dwe3dPdlNq0NWML6g1tu2XrBhKFWpaEzus95qPEhs2/YPB3uqwu+mH31Cjw3xf/1q81o
	mK46Tal5s12rizpnTuetDekbDIPsuvbRzm8/ctihzSd58ybAbyreqdX92pIPgkTexbdr
	/wsSH4dweIRfktvgLccLCdhrlH5toKnN4K8K9kgKAet9EjPsMoungoVtTJC0/ndwX3HC
	S0FfdRvF68gXe4/v7vKCFrWiyhPLFAvmT4aAsCiNfV+fHEeXGr98wtSOL5Ep6ehMXkzf
	LNKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=0IkouTH+erVJOKDNy7DLIBABtJKuzptf6zmxl8MIKVk=;
	b=UAt0qiLS5aINMct8Ji0+iwHCebKxDT1a0U2XeTBzan7duVxp/7jO5lUIqYNlAiOu36
	mAcGH5PtBbpDeE3YEqf5Fz4U0MhCpwmgJf9tneXOxByPq11Mqg/PEJYf129viANBVnhz
	KunKTZgFX7ODVeXaVbWlUAN3K/+DcnIe2e2YsZtNGoJwr7XrqeXkhkO3J8kvwthRqVoF
	+QMGIuLTd4xGq/3RXSCdK+0lZDaGujQMqbVovvXg5XOaLhn1jgeYzt+oBUrRbc9Pfxw1
	6jIi26qhybW+IoWDen4YBWKXuw7vcRtzahebLqHtMPMa19ZLt3x4pvAOZPGgw9Tuzbjv
	UDIQ==
X-Gm-Message-State: ALyK8tL9xoDTYLmH0aQcFvdBRRzMNYFyWzsD7nMIz70ite2A3b6A2zSgwM3KHh0wKdIqBV/OOL83P7LXj/x0rw==
X-Received: by 10.55.74.138 with SMTP id x132mr12433128qka.26.1468435959738;
	Wed, 13 Jul 2016 11:52:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.214.83 with HTTP; Wed, 13 Jul 2016 11:52:10 -0700 (PDT)
In-Reply-To: <1468435374-24039-1-git-send-email-philip@balister.org>
References: <1468435374-24039-1-git-send-email-philip@balister.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 13 Jul 2016 11:52:10 -0700
Message-ID: <CAMKF1sptBvZH9qOpdrrSz0UsQdetKF9Y-p=eD_DyYqsBpbzHEw@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCHv2] libsodium: Update to 1.0.10.
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
X-List-Received-Date: Wed, 13 Jul 2016 18:52:41 -0000
Content-Type: text/plain; charset=UTF-8

OK send a v2 with this info in commit header

On Wed, Jul 13, 2016 at 11:42 AM, Philip Balister <philip@balister.org> wrote:
> The LICENSE file checksum changed due to copyright year update. See:
> https://github.com/jedisct1/libsodium/commit/78d07701229d94ce48c74048f47e378937582ba5#diff-9879d6db96fd29134fc802214163b95a
>
> Signed-off-by: Philip Balister <philip@balister.org>
> ---
>  meta-oe/recipes-support/libsodium/libsodium_1.0.10.bb | 10 ++++++++++
>  meta-oe/recipes-support/libsodium/libsodium_1.0.8.bb  | 11 -----------
>  2 files changed, 10 insertions(+), 11 deletions(-)
>  create mode 100644 meta-oe/recipes-support/libsodium/libsodium_1.0.10.bb
>  delete mode 100644 meta-oe/recipes-support/libsodium/libsodium_1.0.8.bb
>
> diff --git a/meta-oe/recipes-support/libsodium/libsodium_1.0.10.bb b/meta-oe/recipes-support/libsodium/libsodium_1.0.10.bb
> new file mode 100644
> index 0000000..370f553
> --- /dev/null
> +++ b/meta-oe/recipes-support/libsodium/libsodium_1.0.10.bb
> @@ -0,0 +1,10 @@
> +SUMMARY = "The Sodium crypto library"
> +HOMEPAGE = "http://libsodium.org/"
> +LICENSE = "ISC"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=2278eb2755b451372dde7ffeae8cde98"
> +
> +SRC_URI = "https://download.libsodium.org/libsodium/releases/${BPN}-${PV}.tar.gz"
> +SRC_URI[md5sum] = "ea89dcbbda0b2b6ff6a1c476231870dd"
> +SRC_URI[sha256sum] = "71b786a96dd03693672b0ca3eb77f4fb08430df307051c0d45df5353d22bc4be"
> +
> +inherit autotools
> diff --git a/meta-oe/recipes-support/libsodium/libsodium_1.0.8.bb b/meta-oe/recipes-support/libsodium/libsodium_1.0.8.bb
> deleted file mode 100644
> index a2eef4b..0000000
> --- a/meta-oe/recipes-support/libsodium/libsodium_1.0.8.bb
> +++ /dev/null
> @@ -1,11 +0,0 @@
> -SUMMARY = "The Sodium crypto library"
> -HOMEPAGE = "http://libsodium.org/"
> -LICENSE = "ISC"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=092a09b78c3be486fac807435bf17b7a"
> -
> -SRC_URI = "https://download.libsodium.org/libsodium/releases/${BPN}-${PV}.tar.gz"
> -
> -SRC_URI[md5sum] = "0a66b86fd3aab3fe4c858edcd2772760"
> -SRC_URI[sha256sum] = "c0f191d2527852641e0a996b7b106d2e04cbc76ea50731b2d0babd3409301926"
> -
> -inherit autotools
> --
> 2.5.5
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

