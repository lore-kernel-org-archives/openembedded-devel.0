Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0B42178243
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Sep 2017 14:17:21 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id d8so3505037pgt.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Sep 2017 07:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=EWohHRXS4JBpagzXdj76Wqw6dA8/J8cBMENwG5ole/Y=;
	b=VhjwCylgF8Fjk6erROb2CzKIz+DkXY+NnojqKa+80kjx9nvmZXq9Uo71XuS9su0RRY
	hSJjfF2sG5Ogwgxd6bHK/iNJktzg+gH2xAalFl4gb2vQX+HNvCJAqjRLDTJfjFOoWPQW
	iU4QQnjgdd0PnnTE1zdMEQeL86ozXDNV1wdSp9vB23T8aym1NcMvn3It1fXeAEuSnM66
	HDPvAyEmFaEe17t3kdq7dp85wnEI702IuXftvQmLRmAmWnQCA4kd3qIQFic3Jg523hBI
	qP7l4H7ZRISpr5y20IAiz5KBjvixfNaLEmQXODsVeXJ+1V/CWwkk19dm/aR9KL2nqJTp
	XMEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=EWohHRXS4JBpagzXdj76Wqw6dA8/J8cBMENwG5ole/Y=;
	b=pEIOPz2aCebNJ/z8SDK9NWcshaUi4pix/ZBl6Fo/svYlmjfHp0rbiUJBobq/gmn+wa
	sSKIS2eEh0IXaf8lP6TdSku6XBxPT/6sn1P0Q4757WpZLYETvJMD7rJ4nHjljhb/GpWz
	K+M5DuH+bre7QU6PJ7eRstfHuxMi2ju7D2FYqzbpnXlhpBeemJptWIts+Uw7sJyjpfv7
	GXZTeVP3DwLv6rkXuICBLj+btQiS0a2ZtVVa+KxaZQZo3Y8VorBoidcz4j+J8acTguF0
	54ThuF5H2sfdCRV9VMo8NS3YZCXAaqUGvXPgjVdn34JG2TPENIuaLEbyGUnuEibis91L
	X5Ag==
X-Gm-Message-State: AHPjjUiPsANmPqFN2IWgDgDSGj3oTqPK0oU/VU6cE+2Fo7GijoRX5yUh
	+ayy6dPXL1dwcLEocpCX8iWUdzSg/13igMhS8VA=
X-Google-Smtp-Source: AOwi7QALWvtrdDhv3uJ2O9KHaEU29e0L86BNiSB+jBE0LGAm3Hc5GGXhMhD9gVQYLn7unMOPG26y/oE8p1oxcyhcRlQ=
X-Received: by 10.98.157.74 with SMTP id i71mr5958370pfd.168.1506003443029;
	Thu, 21 Sep 2017 07:17:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.149.73 with HTTP; Thu, 21 Sep 2017 07:16:52 -0700 (PDT)
In-Reply-To: <20170921064721.17250-2-kai.kang@windriver.com>
References: <20170921064721.17250-1-kai.kang@windriver.com>
	<20170921064721.17250-2-kai.kang@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 21 Sep 2017 07:16:52 -0700
Message-ID: <CAMKF1sps70RNgvw+nRdp9uSh8Rx16Eisa+Jh5agVcXAH5ctPZw@mail.gmail.com>
To: Kang Kai <kai.kang@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 1/1] lvm2: disable thin provisioning support if GPLv3 incompatible
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
X-List-Received-Date: Thu, 21 Sep 2017 14:17:22 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 20, 2017 at 11:47 PM,  <kai.kang@windriver.com> wrote:
> From: Kai Kang <kai.kang@windriver.com>
>
> Disable thin provisioning support for lvm2 if it is set GPLv3
> incompatible.
>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  meta-oe/recipes-support/lvm2/lvm2.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc b/meta-oe/recipes-support/lvm2/lvm2.inc
> index ab8db9cba..9791554a9 100644
> --- a/meta-oe/recipes-support/lvm2/lvm2.inc
> +++ b/meta-oe/recipes-support/lvm2/lvm2.inc
> @@ -23,7 +23,7 @@ inherit autotools-brokensep pkgconfig systemd
>  LVM2_PACKAGECONFIG = "dmeventd lvmetad"
>  LVM2_PACKAGECONFIG_append_class-target = " \
>      ${@bb.utils.filter('DISTRO_FEATURES', 'selinux', d)} \
> -    thin-provisioning-tools \
> +    ${@bb.utils.contains('INCOMPATIBLE_LICENSE', 'GPLv3', '', 'thin-provisioning-tools', d)} \
>      udev \
>  "
there are other strings like GPL-3.0, as well as other types of GPL 3
derivative licenses, I wonder if this will work for all

