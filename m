Return-Path: <j.zink@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C07B7C433FE
	for <webhook@archiver.kernel.org>; Fri,  4 Nov 2022 12:43:30 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web11.10639.1667565804770386725
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Nov 2022 05:43:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: j.zink@pengutronix.de)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=irc.pengutronix.de)
	by metis.ext.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <j.zink@pengutronix.de>)
	id 1oqw2c-00046i-Ir
	for openembedded-devel@lists.openembedded.org; Fri, 04 Nov 2022 13:43:22 +0100
Message-ID: <e49ef0831a34ab12b78f9fbb8c85036b82972c5a.camel@pengutronix.de>
Subject: Behaviour of bitbake vs devtool modify & devtool build
From: Johannes Zink <j.zink@pengutronix.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 04 Nov 2022 13:43:22 +0100
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: j.zink@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-devel@lists.openembedded.org
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 04 Nov 2022 12:43:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99428

Hi everyone,

I recently noticed a difference in behaviour between bitbake and 
devtool when building a cmake based recipe. Since I am not entirely
sure whether this happens on purpose or by accident, I wanted to ask
you to better understand why they behave differently:

While bitbake will inject a toolchain.cmake file between do_patch and
do_configure, devtool will not. I came across this issue, because the
project I work on provides a custom toolchain.cmake file, which is
silently overwritten when using bitbake to build the packet, while with
devtool the custom file is used and not overwritten.

As a short sidenote: the toolchain.cmake will set up the cross
compilation, compiler flags, sysroot etc. Afaik, this is not strictly
required if setting a bunch of Environment Vars, since building with
the eSDK uses a different mechanism.

I could imagine this actually a feature, because when working with
upstream repos, overwriting the toolchain file is something you would
definitely not want to see, since it might accidentially be committed
to the upstream project.

In my particular case, the main project depends against some settings
from the custom project-provided toolchain file (which is bad design, I
know...), this causes the compilation to fail with bitbake, while
devtool works fine.

TL;DR:
Is bitbake injecting the toolchain.cmake file and devtool not injecting
this file to the source directory done on purpose or by accident?

Best regards
Johannes

-- 
Pengutronix e.K.                | Johannes Zink                  |
Steuerwalder Str. 21            | https://www.pengutronix.de/    |
31137 Hildesheim, Germany       | Phone: +49-5121-206917-0       |
Amtsgericht Hildesheim, HRA 2686| Fax:   +49-5121-206917-5555    |


