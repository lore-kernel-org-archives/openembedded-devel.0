Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id A0720734DA
	for <Openembedded-devel@lists.openembedded.org>;
	Sat, 14 Feb 2015 08:42:02 +0000 (UTC)
Received: from [192.168.178.14] (chello062178118086.5.14.vie.surfer.at
	[62.178.118.86]) by ptmx.org (Postfix) with ESMTPSA id 3528E26FA2
	for <Openembedded-devel@lists.openembedded.org>;
	Sat, 14 Feb 2015 09:42:01 +0100 (CET)
Message-ID: <54DF0A5A.80700@pseudoterminal.org>
Date: Sat, 14 Feb 2015 09:42:02 +0100
From: Carlos Rafael Giani <dv@pseudoterminal.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: openembeded-devel <Openembedded-devel@lists.openembedded.org>
Subject: Question about RDEPENDS and RRECOMMENDS
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
X-List-Received-Date: Sat, 14 Feb 2015 08:42:03 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

I am updating the gstreamer1.0-plugins-imx recipe from meta-fsl-arm, and 
want to improve one aspect of it.
This recipe produces several packages. Among them are an audio and a 
video decoder plugin for GStreamer. In order to use the audio decoder at 
runtime, the "audioparsers" package from the gstreamer1.0-plugins-good 
recipe is required. Likewise, the video decoder needs video parsers from 
the gstreamer1.0-plugins-bad-videoparsersbad package.
It is possible to install gstreamer1.0-plugins-imx packages without 
these other packages. However, GStreamer will then be unable to 
automatically use these decoders.

So, it would make sense to establish some sort of dependency. But how 
exactly? I thought of something like this:

   RDEPENDS_gstreamer1.0-plugins-imx-imxaudio = 
"gstreamer1.0-plugins-good-audioparsers"
   RDEPENDS_gstreamer1.0-plugins-imx-imxvpu = 
"gstreamer1.0-plugins-bad-videoparsersbad"

but then I also need to add gstreamer1.0-plugins-good and 
gstreamer1.0-plugins-bad to the DEPENDS list, otherwise I get a warning 
like:

   QA Issue: gstreamer1.0-plugins-imx-imxaudio rdepends on 
gstreamer1.0-plugins-good-audioparsers, but it isn't a build dependency? 
[build-deps]

But if I add these recipes to the DEPENDS variable, then the RDEPENDS 
spec is pointless, isn't it?
Another option would be to use RRECOMMENDS instead of RDEPENDS, but I am 
not sure if this is such a good idea.

Any thoughts?

