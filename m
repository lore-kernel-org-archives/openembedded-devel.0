Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 7F4D26AFB5
	for <Openembedded-devel@lists.openembedded.org>;
	Tue, 16 Sep 2014 09:11:46 +0000 (UTC)
Received: from [192.168.178.14] (chello062178118086.5.14.vie.surfer.at
	[62.178.118.86]) by ptmx.org (Postfix) with ESMTPSA id 9E05E26902;
	Tue, 16 Sep 2014 11:11:46 +0200 (CEST)
Message-ID: <5417FED2.1030106@pseudoterminal.org>
Date: Tue, 16 Sep 2014 11:11:46 +0200
From: Carlos Rafael Giani <dv@pseudoterminal.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.1
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>, 
	openembeded-devel <Openembedded-devel@lists.openembedded.org>
References: <CAMKF1srKjh-imfCPMTW9EiZNRFVydO71LSMPzhnAFuoUWtocZg@mail.gmail.com>
In-Reply-To: <CAMKF1srKjh-imfCPMTW9EiZNRFVydO71LSMPzhnAFuoUWtocZg@mail.gmail.com>
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
X-List-Received-Date: Tue, 16 Sep 2014 09:11:48 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2014-09-16 07:43, Khem Raj wrote:
> Hi Carlos/All
>
> I want to understand why LICENSE_FLAGS = "commercial" was added to
>
> meta-multimedia/recipes-multimedia/mpg123/mpg123_1.15.3.bb
>
> in initial commit and has been carried over upgrades ever since
>
> The license seems to be LGPL 2.0 and is explained in greater detail here
>
> http://mpg123.org/cgi-bin/scm/mpg123/trunk/doc/ROAD_TO_LGPL?revision=2607
>
> So what portions of it are having different terms for commercial distribution ?
>
> Thanks
>
> -Khem

It's because MPEG audio is subject to royalties. This is also the reason 
why gst-plugins-ugly and gstreamer1.0-plugins-ugly have this flag.

Carlos

