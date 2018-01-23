Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 150817873D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Jan 2018 15:48:43 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id u1so554080pgr.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Jan 2018 07:48:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=EmYpR3nG12WYAuJysBeh6jK5OOxmFNGsKiAs7R0B8YA=;
	b=NB7+ytEfW3fnlbQ0My6e8FH6YUIg8QEanLDVn1ejGLW9t5QNIp/viTOLzZ8d4GROOz
	r7TFaBZNJb/pMwmrO963yn2sBpsZVk+GXKUlKAHXeW4iKDEYq83DwS16nmU1XkC54kbH
	e8qPsq5d63zYIQyHl7UqY7I0YuFYkF1m1mS4cZBgcSy/4PypwLNeJJt2TwLwe0D99NDz
	K80j1aRmtOe2i0ytIpg9k5Zsdv+1wVC95h+OCYkZAFm1mR+uCysjIkiWRPlbim8m7mhS
	vZkA1AM4msTTaRYUEWlGWsMcqMJ4hztWbvrxYHD+WAfnVPgFfepOUFhV8y3ul+zjakeU
	pibQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=EmYpR3nG12WYAuJysBeh6jK5OOxmFNGsKiAs7R0B8YA=;
	b=M1jf9RIIHsjXNbz/kVNpMVxV/dVScZVdYiTtqd4LM4niwO+Otrj2N9QHzUYyrqFOBV
	BPzSbaWgQ3mlUIHzXwbypNAfmjJPZYN7Uo9NGwrYC2KzvPl+mhJy5WJDW9AraYK3RHbo
	K6hQL+eeJokYC9yMTQHzDqoVLyMz3q/8BO4a0/Uk5zoRHU1ZstuK9iR3Lh2QzRemTywi
	caYJZGpUbn/E+1Yhi255fZy4iwXSqcU3g1s7Y1rPrl1n/z3EE9MUu/JjFtrJT7xjBaQE
	b6eBYnVwLO+v09mWyngJ8ywFxfR0LyBVTgWB7cT74B1IcMScZ+nOntDge6GsydjNUdM1
	ucrQ==
X-Gm-Message-State: AKwxytez909w3CLBdOEYNwAUjWcEeenfH6w8dOLYAtfll5kW/8DrJmCz
	mXuK/lVsUA4X/3aAw0dcjugwOloh6ZBqztrGDtU=
X-Google-Smtp-Source: AH8x227Q3wbvpHYVlE/AhEUpe8snVYGxw3MlQdvoH4zyVmfDKwl/AbM9TTR05lbFPU/3MZrP2Kvjh3EzmnBUvfMyGyk=
X-Received: by 10.99.137.195 with SMTP id v186mr9275315pgd.25.1516722525109;
	Tue, 23 Jan 2018 07:48:45 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.161.170 with HTTP; Tue, 23 Jan 2018 07:48:14 -0800 (PST)
In-Reply-To: <1513002095-5152-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
References: <1513002095-5152-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 23 Jan 2018 09:48:14 -0600
Message-ID: <CAMKF1srSpv3GbrkHrLej6uEB0ikyE77LV4h4w-c0BoWaCfM0Kg@mail.gmail.com>
To: zhengrq <zhengrq.fnst@cn.fujitsu.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCHv2] samba: Add packagegroup
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
X-List-Received-Date: Tue, 23 Jan 2018 15:48:44 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Dec 11, 2017 at 8:21 AM, zhengrq <zhengrq.fnst@cn.fujitsu.com> wrote:
> Add packagegroup for samba, for there are too many rpms in samba and it's hard to manage.
>
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> ---
>  .../recipes-connectivity/samba/samba_4.6.7.bb         | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)
>
> diff --git a/meta-networking/recipes-connectivity/samba/samba_4.6.7.bb b/meta-networking/recipes-connectivity/samba/samba_4.6.7.bb
> index 2b227c9..0bacb02 100644
> --- a/meta-networking/recipes-connectivity/samba/samba_4.6.7.bb
> +++ b/meta-networking/recipes-connectivity/samba/samba_4.6.7.bb
> @@ -162,7 +162,7 @@ PACKAGES =+ "${PN}-python ${PN}-pidl \
>               ${PN}-dsdb-modules ${PN}-testsuite registry-tools \
>               winbind \
>               ${PN}-common ${PN}-base ${PN}-ctdb-tests \
> -             smbclient"
> +             smbclient ${PN}-client ${PN}-test"
>
>  python samba_populate_packages() {
>      def module_hook(file, pkg, pattern, format, basename):
> @@ -254,3 +254,20 @@ FILES_smbclient = "${bindir}/cifsdd \
>
>  RDEPENDS_${PN}-pidl_append = " perl"
>  FILES_${PN}-pidl = "${bindir}/pidl ${datadir}/perl5/Parse"
> +
> +SUMMARY_${PN}-client = "samba client"
> +RDEPENDS_${PN}-client = "\
> +    smbclient \
> +    winbind \
> +    registry-tools \
> +    ${PN}-pidl \
> +    "
> +
> +ALLOW_EMPTY_${PN}-client = "1"
> +
> +RDEPENDS_${PN}-test = "\
> +    ${PN}-ctdb-tests \
> +    ${PN}-testsuite \
> +    "
> +
> +ALLOW_EMPTY_${PN}-test = "1"

perhaps better to add a packagegroup recipe explicitly

