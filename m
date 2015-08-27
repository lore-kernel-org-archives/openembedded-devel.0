Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ig0-f181.google.com (mail-ig0-f181.google.com
	[209.85.213.181])
	by mail.openembedded.org (Postfix) with ESMTP id 313F560043;
	Thu, 27 Aug 2015 13:59:20 +0000 (UTC)
Received: by igui7 with SMTP id i7so61725594igu.1;
	Thu, 27 Aug 2015 06:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=vhS2TcYgA4rqRhrxRgHzVkX8M/FUiBqUrtke9toEqno=;
	b=Y0J9sT5amOtV29uTrssX2SjGFGivkrCwoLP2UZYOvAm/cY8eTg5S6lgfU4puMMYITz
	FLHgQKS2k4ugkX5neY93ebNagevG/iATJ5mFe9BncjSmT1tGZzyixtjdmOISG10pYAFl
	22ing0rP+s8fat5le59HTCvn5JL3sv9XqevAGi1uNLLQ1pE/F6znrFB4peILwbfgw43T
	4nc1g0d0ZbeKgfJpdhYx5yBHvYy3Auyp5C2HgYLeTNLbl2YfDIi2k2/z+OnjjsCfeQXX
	dBP2Ic0dQS3gjXFXey3RTHGSSEWtaAMgGzo4xQARkE6E8lzd9zUjOK5nRVd/GPkqKn5/
	zSEw==
MIME-Version: 1.0
X-Received: by 10.50.67.80 with SMTP id l16mr2622082igt.64.1440683960519; Thu,
	27 Aug 2015 06:59:20 -0700 (PDT)
Received: by 10.36.98.5 with HTTP; Thu, 27 Aug 2015 06:59:19 -0700 (PDT)
In-Reply-To: <20150827134340.8D83D504C8@opal.openembedded.org>
References: <20150827134340.8D83D504C8@opal.openembedded.org>
Date: Thu, 27 Aug 2015 15:59:19 +0200
Message-ID: <CALbNGRT0fxHMG3aDd_eEdnKMENPK-OnB1dfJQsQGYyKev=j__Q@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Li xin : networkmanager: disable service by default and WARNING Fix
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
X-List-Received-Date: Thu, 27 Aug 2015 13:59:23 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Aug 27, 2015 at 3:43 PM,  <git@git.openembedded.org> wrote:
> Module: meta-openembedded.git
> Branch: master-next
> Commit: 9b58c0218ac50d9707c302d452f01dcbdd39aca1
> URL:    http://git.openembedded.org/?p=meta-openembedded.git&a=commit;h=9b58c0218ac50d9707c302d452f01dcbdd39aca1
>
> Author: Li xin <lixin.fnst@cn.fujitsu.com>
> Date:   Thu Aug 27 17:26:13 2015 +0800
>
> networkmanager: disable service by default and WARNING Fix
>
> * Disable NetworkManager.service by default,otherwise,the
>   Root file system using the method of NFS mount can't boot successfully.
>   Also it is disabled on Fedora.
>
> * WARNING Fix:
>   WARNING: QA Issue: networkmanager: Files/directories were installed but not shipped in any package:
>   /run
>   /run/NetworkManager
>   Please set FILES such that these items are packaged. Alternatively if they are unneeded,
>   avoid installing them or delete them within do_install. [installed-vs-shipped]
>
> Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>
> ---
>
>  meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.4.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.4.bb b/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.4.bb
> index 62debe9..4e2ca28 100644
> --- a/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.4.bb
> +++ b/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.4.bb
> @@ -58,6 +58,7 @@ FILES_${PN} += " \
>      ${datadir}/dbus-1 \
>      ${base_libdir}/udev/* \
>      ${systemd_unitdir}/system \
> +    /run \
>  "
>
>  RRECOMMENDS_${PN} += "iptables dnsmasq"
> @@ -84,3 +85,4 @@ FILES_${PN}-tests = " \
>  FILES_${PN}-bash-completion = "${datadir}/bash-completion"
>
>  SYSTEMD_SERVICE_${PN} = "NetworkManager.service"
> +SYSTEMD_AUTO_ENABLE = "disable"
^ Please don't we fail 99% for 1% use case

Andreas

