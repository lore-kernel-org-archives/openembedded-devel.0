Return-Path: <dv@pseudoterminal.org>
X-Greylist: delayed 568 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 27 Apr 2016 14:10:20 UTC
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 87716736B6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Apr 2016 14:10:20 +0000 (UTC)
Received: from [10.1.14.248] (vpn.streamunlimited.com [91.114.0.140])
	by ptmx.org (Postfix) with ESMTPSA id 2281A38E5B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Apr 2016 16:00:51 +0200 (CEST)
To: openembedded-devel@lists.openembedded.org
From: Carlos Rafael Giani <dv@pseudoterminal.org>
Message-ID: <5720C612.1080009@pseudoterminal.org>
Date: Wed, 27 Apr 2016 16:00:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
Subject: chromium 40, gcc 5.3, and OE master problems
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
X-List-Received-Date: Wed, 27 Apr 2016 14:10:22 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Recently I did a build of chromium 40 with the current OE-core & meta-oe 
master, which means it was built with GCC 5.3.
Chromium was always crashing, the origin of the segmentation fault was 
somewhere deep inside the GCC std::map implementation.
I added GCCVERSION = "4.9%" to local.conf, rebuilt the image, and 
chromium worked.

Did anybody else observe the same? I built it for the nitrogen6x 
platform (imx6 SoC). I did not yet try it in QEMU.

Also, I have factored code out of the chromium .bb file into a 
chromium-browser.inc file. This way, the existing chromium.inc remains 
usable for cef3, and Chromium upgrades become easier.
(I will upgrade Chromium in a followup commit.)
Since the GCC issue is clearly something separate, I do not think this 
recipe cleanup should be blocked by it. So I will soon post the recipe 
upgrade here, and the GCC issue should be discussed in parallel.

