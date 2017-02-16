Return-Path: <daniel@zonque.org>
X-Greylist: delayed 387 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 16 Feb 2017 07:32:26 UTC
Received: from mail.zonque.de (svenfoo.org [82.94.215.22])
	by mail.openembedded.org (Postfix) with ESMTP id C71DF65CBF
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Feb 2017 07:32:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.zonque.de (Postfix) with ESMTP id 51C67C0093;
	Thu, 16 Feb 2017 08:25:59 +0100 (CET)
Received: from mail.zonque.de ([127.0.0.1])
	by localhost (rambrand.bugwerft.de [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id ACAGHTq665NW; Thu, 16 Feb 2017 08:25:59 +0100 (CET)
Received: from [192.168.178.170] (pD9F6BF3A.dip0.t-ipconnect.de
	[217.246.191.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.zonque.de (Postfix) with ESMTPSA id B401AC002A;
	Thu, 16 Feb 2017 08:25:58 +0100 (CET)
To: openembedded-devel@lists.openembedded.org, martin.jansa@gmail.com,
	samuli.piippo@gmail.com
From: Daniel Mack <daniel@zonque.org>
Message-ID: <23527d9e-d36f-e9ef-1742-0510074920fc@zonque.org>
Date: Thu, 16 Feb 2017 08:25:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
Subject: qt5: qtbase fails to populate SDK
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
X-List-Received-Date: Thu, 16 Feb 2017 07:32:28 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi,

I'm using poky from the morty branch and meta-qt5 layer from master-next
for Qt5.8 support. While the image creation works fine, 'bitbake myimage
-c populate_sdk' fails with

error: qtbase-mkspecs-5.8.0+git0+49dc9aa409-r0 conflicts with /usr/bin/perl

This is also the case after build/tmp was wiped out.

Any idea?


Thanks,
Daniel

