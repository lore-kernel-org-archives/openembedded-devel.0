Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
	[209.85.128.50])
	by mail.openembedded.org (Postfix) with ESMTP id A92216C3B2
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  5 May 2019 09:43:29 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id b10so12177727wmj.4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 05 May 2019 02:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=EPeJWtU7zqlsBe2fQ+8JHXwYO7yDLoTQn5EFby5umSU=;
	b=J0twZolUATPVEM9WHg6AiM6jPF9+miRYxEiKxi3Q4pp3KiV5SPhxmWLTtgHaUIGiRm
	gIfScGDYsdDKy9t4NPtLvWOWmKNNLx4nqZWpX4D+Ea2YjWoU40EJyauu643beSQAop8b
	5hoY49saVzyl49NXNnLDUAiuRCFuQx5pdiRXeTWIusxMlSPY4qflEKtLjew9kkaawudY
	T7En2NJEFPYz6Ypy1+LbTWvnHowXBFSY9XgUpWyrovq8mGhMU0ucJeUA0Cy5u3LC4OuY
	5rmbAgUg9OVZEYQbBgPrGEWYDPhMnTT5M4E+MtUkNMAxUcZBCb5WUZer6RD1U282/ifc
	eLEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=EPeJWtU7zqlsBe2fQ+8JHXwYO7yDLoTQn5EFby5umSU=;
	b=Zv2ULtybwPu95uaM5E2S7o9yQLcpQCy03S/ts3Tby42HDsG7gaKmdSTb22A1tErD9d
	Sz+x0yMQSPjcuo7veayzlEduRv/HHQpzeYNAt2bECO4LqjPHzOB9V6JpTP4x75q+7vxn
	6jPaHvEGEWwHfjYE/91TC5FFSko3/Kyf2m5N72FXs9XKvVaGWzFuWvNYH+CD4glvxz/6
	6344ZdcZbgn1qtT8e48WfywfK/8Gf+viWXhlHEbIA689egznAiGY0R9etPZdfpj9c6gW
	nKmfdpbwoUL+Tx2ILGHmt/Z/X25elcQHjc1XT8tX2ip0dZJI5K8NiJVUS1gReKQ4l8tS
	85uw==
X-Gm-Message-State: APjAAAXc32A7luQyNQiNq5tOYP6th6IhI75qqLpOCIyR1mPsmlvN2s96
	nE4NUmiEoAKT6jTWBxzREbenZdUXZuCTDaKuXGDToA==
X-Google-Smtp-Source: APXvYqwXCclvI3e7bkTLX/ZUZKXtWY71nZIti605l8jBHmD7X9lcCgywn0+tHqZGjBvzLcFFygnjCOYRv0jzEcmKryo=
X-Received: by 2002:a05:600c:48a:: with SMTP id
	d10mr13013073wme.141.1557049410195; 
	Sun, 05 May 2019 02:43:30 -0700 (PDT)
MIME-Version: 1.0
References: <20190505091521.6598-1-open.source@oleksandr-kravchuk.com>
In-Reply-To: <20190505091521.6598-1-open.source@oleksandr-kravchuk.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sun, 5 May 2019 11:43:22 +0200
Message-ID: <CA+chaQd6uoMEG9XVPSDENm6Dx13zRrahRQyYja62uVtsZF+SMQ@mail.gmail.com>
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH][meta-networking] arno-iptables-firewall: update to 2.0.3
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
X-List-Received-Date: Sun, 05 May 2019 09:43:29 -0000
Content-Type: text/plain; charset="UTF-8"

Don't use github archives which are regenerated from time to time with
different checksums.

On Sun, May 5, 2019 at 11:18 AM Oleksandr Kravchuk <
open.source@oleksandr-kravchuk.com> wrote:

> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> ---
>  ...irewall_2.0.1g.bb => arno-iptables-firewall_2.0.3.bb} | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
>  rename meta-networking/recipes-filter/arno-iptables-firewall/{
> arno-iptables-firewall_2.0.1g.bb => arno-iptables-firewall_2.0.3.bb} (86%)
>
> diff --git a/meta-networking/recipes-filter/arno-iptables-firewall/
> arno-iptables-firewall_2.0.1g.bb
> b/meta-networking/recipes-filter/arno-iptables-firewall/
> arno-iptables-firewall_2.0.3.bb
> similarity index 86%
> rename from meta-networking/recipes-filter/arno-iptables-firewall/
> arno-iptables-firewall_2.0.1g.bb
> rename to meta-networking/recipes-filter/arno-iptables-firewall/
> arno-iptables-firewall_2.0.3.bb
> index 6fd0affdf..040c53f5c 100644
> --- a/meta-networking/recipes-filter/arno-iptables-firewall/
> arno-iptables-firewall_2.0.1g.bb
> +++ b/meta-networking/recipes-filter/arno-iptables-firewall/
> arno-iptables-firewall_2.0.3.bb
> @@ -4,12 +4,11 @@ HOMEPAGE = "
> http://rocky.eld.leidenuniv.nl/joomla/index.php?option=com_content&v
>  LICENSE = "GPLv2"
>  LIC_FILES_CHKSUM =
> "file://gpl_license.txt;md5=11c7b65c4a4acb9d5175f7e9bf99c403"
>
> -SRC_URI = "
> http://rocky.eld.leidenuniv.nl/arno-iptables-firewall/${BPN}_${PV}.tar.gz
> \
> -          "
> -SRC_URI[md5sum] = "77eba7f148bf2840a3e35a6f50c9c353"
> -SRC_URI[sha256sum] =
> "0bafd85ddc235752250eaec0c7fdb21e530912483f6807a97f86158ed2d301f7"
> +SRC_URI = "
> https://github.com/arno-iptables-firewall/aif/archive/${PV}.tar.gz"
> +SRC_URI[md5sum] = "71271c08299aacd45ceb9c9400082d03"
> +SRC_URI[sha256sum] =
> "e2c4fb88a25f0cae8308a3b2bb922b5e2f52f24d8309b24e15a527a6b326e703"
>
> -S = "${WORKDIR}/${BPN}_${PV}"
> +S = "${WORKDIR}/aif-${PV}"
>
>  inherit systemd
>
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

