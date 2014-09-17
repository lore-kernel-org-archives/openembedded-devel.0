Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 547FE65CE7
	for <Openembedded-devel@lists.openembedded.org>;
	Wed, 17 Sep 2014 07:09:17 +0000 (UTC)
Received: from [192.168.178.14] (chello062178118086.5.14.vie.surfer.at
	[62.178.118.86]) by ptmx.org (Postfix) with ESMTPSA id 7DD0622EDE;
	Wed, 17 Sep 2014 09:09:18 +0200 (CEST)
Message-ID: <5419339D.5060807@pseudoterminal.org>
Date: Wed, 17 Sep 2014 09:09:17 +0200
From: Carlos Rafael Giani <dv@pseudoterminal.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.1
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <CAMKF1srKjh-imfCPMTW9EiZNRFVydO71LSMPzhnAFuoUWtocZg@mail.gmail.com>	<5417FED2.1030106@pseudoterminal.org>
	<CAMKF1src0wJ6vStvRp1sJdpRy_tf-=FDcz_LMdAoA-QsgrE_Gg@mail.gmail.com>
In-Reply-To: <CAMKF1src0wJ6vStvRp1sJdpRy_tf-=FDcz_LMdAoA-QsgrE_Gg@mail.gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <Openembedded-devel@lists.openembedded.org>
Subject: Re: mpg123 recipe LICENSE_FLAGS = "commercial" issue
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
X-List-Received-Date: Wed, 17 Sep 2014 07:09:19 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2014-09-17 02:20, Khem Raj wrote:
>
>
> On Tuesday, September 16, 2014, Carlos Rafael Giani 
> <dv@pseudoterminal.org <mailto:dv@pseudoterminal.org>> wrote:
>
>     On 2014-09-16 07:43, Khem Raj wrote:
>
>         Hi Carlos/All
>
>         I want to understand why LICENSE_FLAGS = "commercial" was added to
>
>         meta-multimedia/recipes-multimedia/mpg123/mpg123_1.15.3.bb
>         <http://mpg123_1.15.3.bb>
>
>         in initial commit and has been carried over upgrades ever since
>
>         The license seems to be LGPL 2.0 and is explained in greater
>         detail here
>
>         http://mpg123.org/cgi-bin/scm/mpg123/trunk/doc/ROAD_TO_LGPL?revision=2607
>
>         So what portions of it are having different terms for
>         commercial distribution ?
>
>         Thanks
>
>         -Khem
>
>
>     It's because MPEG audio is subject to royalties
>
>
> In what way where the component is lgpl I would like to understand
>
>      This is also the reason why gst-plugins-ugly and
>     gstreamer1.0-plugins-ugly have this flag.
>
>     Carlos
>

*mpg123* is LGPL. But mpg123 is an implementation of an MPEG 1 audio 
layer 1/2/3 and MPEG 2 audio. MPEG-1 layer 3 is what everybody calls 
mp3. (mp1 and mp2 are pretty much dead by now.) mp3 itself contains 
patents, and these are subject to royalties. Technicolor (formerly 
Thomson) does enforce these royalties. See 
http://mp3licensing.com/royalty/software.html for their price model.
MPEG-2 is controlled by the MPEG LA.

Note that these royalties cover the audio technology itself (say, mp3), 
*not* the implementations. Implementations themselves can be subject to 
any license, it's up to the authors of the implementations. But if you 
actually want to use these implementations in a commercial product, 
you'll have to pay the royalty fees.

This is part of the reason why Ogg Vorbis (and Opus) exist. They are an 
alternative that doesn't require such fees. Therefore, the Vorbis 
decoder isn't in gst-plugins-ugly, but in gst-plugins-good.

