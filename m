Return-Path: <raj.khem@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 67B8077D04
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Apr 2017 15:28:36 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id o21so4730063wrb.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Apr 2017 08:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=TuMHPns3ixtCHd56zPqK88jEDRjQrXU5bzWr3O+Dbmk=;
	b=MpZK8AHBp9cQbzD23YK97p4LEtBh0m4I3UrhGT35ZtH0BY98+bvJqIh1sBDwvCE4kB
	x4Ah48bmyYpgv5h4YFDVcisRSp6mq13W5Lgh01r0djjx4+wK6hY0gA6tqcLrCDhOovKc
	d4snXGkAVpcPOoI1+NfkxhsRmIiBLyYy88p69qoxDRdoq0yYS4dLbHZHxl9wpdlqZKSy
	K2Z+gHS1gUExitt0jSydcubJlg20R6n1WdEo6VqSSJGcyC30+eagM1kIIykLEjFh/aTR
	IwRE8DnOrVqa//gBndYmIDS157e2Kjy8FpqdJ3Uc4O7dVkhTQf+KkWIlU/wzCKzgZSCJ
	FRlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=TuMHPns3ixtCHd56zPqK88jEDRjQrXU5bzWr3O+Dbmk=;
	b=lTEnQWttcVssVtz++Res6vtxR19sePgTkA+RwR0MHjsZx4kB7QHiopK5X68ax3PwrE
	0qXOCn+VJBtUqnHTab4LWsWdRtsoAm5V8zDjzf5fjAd3VNbB1EjKnh0UBCmEvzb0JYy7
	irUKzzn1nTyL2wvd4hfy4KRQakRl6V5r8sH/BkLBSAF0A0eBB1t/2qNdeZc9spwC8aLn
	Tge+6FPAisDaViALPAjcb/JHLTCoG+HI1dkTyrClV7l6WQoi01tvy+tpZC76zVK1m8MI
	hqZ3GFRVLUGJcCGRlA5qDU6B0gaGaCVqIEix/UdI24TgpM+3SR0ST/A2UGAdiA7qS+rF
	h5pA==
X-Gm-Message-State: AN3rC/7Gl1oAvu+97MofXaS6XDEq+B3b71fXYbStrvHjxXIDgL7DtnlSAQJiky5m4Xs+BiMJ0C1CdiMW/i7/9Q==
X-Received: by 10.223.179.24 with SMTP id j24mr3759650wrd.172.1492010918126;
	Wed, 12 Apr 2017 08:28:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.180.141 with HTTP; Wed, 12 Apr 2017 08:28:07 -0700 (PDT)
In-Reply-To: <1492003558-8647-1-git-send-email-gizero@gmail.com>
References: <1492003558-8647-1-git-send-email-gizero@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 12 Apr 2017 08:28:07 -0700
Message-ID: <CAMKF1sqLquD6GkV+4sTxdsL7ccypCdGtcUEnrQDK+y=Nz7JEhg@mail.gmail.com>
To: Andrea Galbusera <gizero@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH 1/3] openvpn: ensure ${sysconfdir}/tmpfiles.d is packaged
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
X-List-Received-Date: Wed, 12 Apr 2017 15:28:39 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Apr 12, 2017 at 6:25 AM, Andrea Galbusera <gizero@gmail.com> wrote:
> The file was installed but never packaged, ending up in no systemd-tmpfiles
> configuration on the final rootfs.
>
> Signed-off-by: Andrea Galbusera <gizero@gmail.com>
> ---
>  meta-networking/recipes-support/openvpn/openvpn_2.3.9.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta-networking/recipes-support/openvpn/openvpn_2.3.9.bb b/meta-networking/recipes-support/openvpn/openvpn_2.3.9.bb
> index a3ef765..5fd714a 100644
> --- a/meta-networking/recipes-support/openvpn/openvpn_2.3.9.bb
> +++ b/meta-networking/recipes-support/openvpn/openvpn_2.3.9.bb
> @@ -61,6 +61,7 @@ RRECOMMENDS_${PN} = "kernel-module-tun"
>
>  FILES_${PN}-dbg += "${libdir}/openvpn/plugins/.debug"
>  FILES_${PN} += "${systemd_unitdir}/system/openvpn@.service \
> +                ${sysconfdir}/tmpfiles.d \
>                  /run"

This change is fine but packaging /run seems suspicious to me.

>  FILES_${PN}-sample += "${systemd_unitdir}/system/openvpn@loopback-server.service \
>                         ${systemd_unitdir}/system/openvpn@loopback-client.service \
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

