Return-Path: <maciej.pijanowski@3mdeb.com>
Received: from cloudserver096301.home.net.pl (cloudserver096301.home.net.pl
	[79.96.179.35])
	by mail.openembedded.org (Postfix) with SMTP id D065471B2B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Oct 2016 06:59:09 +0000 (UTC)
Received: from 89-74-54-83.dynamic.chello.pl (89.74.54.83) (HELO
	[192.168.0.29])
	by serwer1539010.home.pl (79.96.179.35) with SMTP (IdeaSmtpServer
	v0.80.3) id d3109dfe7a62c5e0; Fri, 28 Oct 2016 08:59:09 +0200
To: openembedded-devel@lists.openembedded.org
From: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
Message-ID: <fab9e87e-d2b6-414c-c3fc-eb8652657e63@3mdeb.com>
Date: Fri, 28 Oct 2016 08:59:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: [meta-browser] i.MX6DL + mainline + yocto: EGL_NOT_INITIALIZED
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
X-List-Received-Date: Fri, 28 Oct 2016 06:59:12 -0000
Content-Type: multipart/mixed; boundary="------------207BC10A399B76E6DF25F262"

--------------207BC10A399B76E6DF25F262
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

I'm trying to run chromium on Hummingboard i2 using custom BSP layer. I'm
mostly based on meta-etnaviv (libdrm, mesa_etnaviv) for GPU support and
meta-browser for chromium recipe. I'm using mainline 4.7.10 kernel atm.

I have hw accelerated video decoding with gstreamer and coda. Mesa demos 
(glxgears) as
well as qt examples (meta-qt5) run smoothly on X11, without engaging CPU 
too much.

part of glxinfo output: (full at: http://pastebin.com/qS7zEZxA)

OpenGL renderer string: Gallium 0.4 on /dev/dri/card1-Vivante GC880 rev 5106
OpenGL version string: 1.4 Mesa 12.0.0-rc3 (git-e1ac825bd067)
OpenGL ES profile version string: OpenGL ES 2.0 Mesa 12.0.0-rc3 
(git-e1ac825bd067)

I've tried compiling chromium 48.0.2548.0 and 52.0.2743.76 and they both 
fail to run GPU process.
Logs presented below.
chrome://gpu photos in attachments

chromium 48: http://pastebin.com/1qhvvLKh
chromium 52: http://pastebin.com/dMK3PgH7

Do you have any idea what may be the cause of this fail? Are there any 
chromium-specific actions that need to be done in order to properly 
initialize GPU ? Or maybe you have some experience with chromium on 
i.MX6 (not legacy kernel) ?

--------------207BC10A399B76E6DF25F262--
