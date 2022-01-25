Return-Path: <jlu@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41637C433F5
	for <webhook@archiver.kernel.org>; Tue, 25 Jan 2022 12:25:39 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web11.6263.1643113537819048809
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jan 2022 04:25:38 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: jlu@pengutronix.de)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <jlu@pengutronix.de>)
	id 1nCKtC-0008Bb-Iq; Tue, 25 Jan 2022 13:25:34 +0100
Received: from localhost ([127.0.0.1])
	by ptx.hi.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <jlu@pengutronix.de>)
	id 1nCKtB-00026P-5b; Tue, 25 Jan 2022 13:25:33 +0100
Message-ID: <fc07f2df1f07b73a902be4377c65b70952db4500.camel@pengutronix.de>
Subject: Re: [oe] [meta-gnome][PATCH 1/2] geary: initial add recipe
From: Jan =?ISO-8859-1?Q?L=FCbbe?= <jlu@pengutronix.de>
To: Markus Volk <f_l_k@t-online.de>,
	openembedded-devel@lists.openembedded.org
Date: Tue, 25 Jan 2022 13:25:32 +0100
In-Reply-To: <20220120202643.3827177-1-f_l_k@t-online.de>
References: <20220120202643.3827177-1-f_l_k@t-online.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.3 (flatpak git) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: jlu@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-devel@lists.openembedded.org
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Jan 2022 12:25:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95056

Hi Markus,

On Thu, 2022-01-20 at 21:26 +0100, Markus Volk wrote:

...
> +inherit meson pkgconfig mime-xdg gtk-icon-cache gobject-introspection vala
> +
> +SRC_URI = " \
> +	git://github.com/GNOME/geary.git;nobranch=1;protocol=https \
> +"
> +
> +S = "${WORKDIR}/git"
> +SRCREV = "gnome-${PV}"

perhaps I'm missing something, but shouldn't this be a git commit hash?

Regards,
Jan
-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

