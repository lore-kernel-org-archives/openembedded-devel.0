Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id E34497F02F
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Aug 2019 15:57:38 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id q4so3397679qtp.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Aug 2019 08:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=8ezDLEuVICRRMxRlj0s9W8wdf0L8QLzeO5RgAJMA3Eg=;
	b=t+11MtxeUT/9qoT2S6E4bXNrYv9uvs7pTfW54Vxw4DGW9qgLyHpcWTytIcBv98W/An
	/hRdES8HcvS1C110Tnpv2iMS9KIufUrdjit5drI8hiurhdYdWQf/cS10BRvX6d7hWeD1
	RkcJ2o5zfA0b5MUQUzNrtKlkiOyPDws6hhsDpwY21SMvEmYoHOqgloVmsFSpu2lF5xK2
	HR2LQIgA5biZCIXzZrfiyVIYtdMdB+cAtzASWwj8kNYZE+8xvlfldEjjMBu4+juYCFoL
	Uq563FuEiAbFl5A9j3arOjrtbou95a6/QZtWjGRccvt0Hr/0Fo8a1CFriNCRGVAXA64j
	Pjsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=8ezDLEuVICRRMxRlj0s9W8wdf0L8QLzeO5RgAJMA3Eg=;
	b=jR50SXX76tITB69l45AkjgjgwiE8qDJEdoy0exKUtREBWHAVy14p8uH7f7ak1sR8h2
	cT4as2bgvhb3M6KRGMMkP3cEcdjwrrXd33tvpzt+5z6toZqXNA29hS53AbSM0SsTnvqz
	S/0OCOTKI3/sXMKRA3i3giia/j3sY6rqk9WD6Nrk3MwgJlu98tJCfybOwJFT7yLzzBiu
	UJGrmSNhRx9Ne15hQJyQfDMi4af0BWuKNUx6AH8FtgKj9kFJs43BQ7O1U6Z6fofsZ5fD
	+nmffzwimxvJmC88Okg0horr0OjW40kmGtUNvrtftTyHiYEajYv+3ozL7sf3cl2icwxE
	i+dg==
X-Gm-Message-State: APjAAAUn5LpHbf5klm0u9f36j/hdo2Bs4yBZOg7RdpR7tvcEMzY2OAxX
	kgDa7JGaXvsd4tSRk80azmmMGUCFVMh7bIajE2GmXNtUT90=
X-Google-Smtp-Source: APXvYqzSEnNe1sbUnMGL/EpJuJozHOmP687Par4HM8qzDopP1KALddwuUrrbxarJTwN98IuZzhda1NHWtP96cDyw+ec=
X-Received: by 2002:ac8:764f:: with SMTP id i15mr26222421qtr.194.1565539059379;
	Sun, 11 Aug 2019 08:57:39 -0700 (PDT)
MIME-Version: 1.0
References: <20190809060607.25725-1-zangrc.fnst@cn.fujitsu.com>
In-Reply-To: <20190809060607.25725-1-zangrc.fnst@cn.fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 11 Aug 2019 08:57:23 -0700
Message-ID: <CAMKF1srWb=tO7zHpX+0DRmFyeMBGC==Ez70oY+f675fKtchssg@mail.gmail.com>
To: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe] [PATCH] zabbix: upgrade 3.0.9 -> 4.2.5
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
X-List-Received-Date: Sun, 11 Aug 2019 15:57:39 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Zang

This fails to build seemingly its missing libpcre dependency
https://errors.yoctoproject.org/Errors/Details/260676/
https://errors.yoctoproject.org/Errors/Details/260726/

On Thu, Aug 8, 2019 at 11:07 PM Zang Ruochen <zangrc.fnst@cn.fujitsu.com> wrote:
>
> -The latest version needs to rely on libpcre.
>
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  .../zabbix/{zabbix_3.0.9.bb => zabbix_4.2.5.bb}                     | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>  rename meta-oe/recipes-connectivity/zabbix/{zabbix_3.0.9.bb => zabbix_4.2.5.bb} (93%)
>
> diff --git a/meta-oe/recipes-connectivity/zabbix/zabbix_3.0.9.bb b/meta-oe/recipes-connectivity/zabbix/zabbix_4.2.5.bb
> similarity index 93%
> rename from meta-oe/recipes-connectivity/zabbix/zabbix_3.0.9.bb
> rename to meta-oe/recipes-connectivity/zabbix/zabbix_4.2.5.bb
> index bab5a6a..80db999 100644
> --- a/meta-oe/recipes-connectivity/zabbix/zabbix_3.0.9.bb
> +++ b/meta-oe/recipes-connectivity/zabbix/zabbix_4.2.5.bb
> @@ -19,7 +19,7 @@ HOMEPAGE = "http://www.zabbix.com/"
>  SECTION = "Applications/Internet"
>  LICENSE = "GPLv2+"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=300e938ad303147fede2294ed78fe02e"
> -DEPENDS  = "openldap virtual/libiconv"
> +DEPENDS  = "openldap virtual/libiconv libpcre"
>
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>
> @@ -28,8 +28,8 @@ SRC_URI = "http://jaist.dl.sourceforge.net/project/zabbix/ZABBIX%20Latest%20Stab
>      file://zabbix-agent.service \
>  "
>
> -SRC_URI[md5sum] = "489d21b464277c0d412155c7e5611a8f"
> -SRC_URI[sha256sum] = "4445f26c025009681c29c9b350aa6c4ee7b124ddcaf1609ae36c55997bcb8cf2"
> +SRC_URI[md5sum] = "4dd3fe96a5da8598ba0caf181387a3f7"
> +SRC_URI[sha256sum] = "4dba94cc8c5f1d97b596e636ff9346c3bdea59ac04a97f1236a6d5e69d72ab8c"
>
>  inherit autotools-brokensep linux-kernel-base pkgconfig systemd useradd
>
> --
> 2.7.4
>
>
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

