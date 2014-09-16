Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 4C607714A0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Sep 2014 22:48:01 +0000 (UTC)
Received: from [192.168.178.14] (chello062178118086.5.14.vie.surfer.at
	[62.178.118.86]) by ptmx.org (Postfix) with ESMTPSA id A9BED2874B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Sep 2014 00:48:02 +0200 (CEST)
Message-ID: <5418BE22.9050300@pseudoterminal.org>
Date: Wed, 17 Sep 2014 00:48:02 +0200
From: Carlos Rafael Giani <dv@pseudoterminal.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <CAMKF1srKjh-imfCPMTW9EiZNRFVydO71LSMPzhnAFuoUWtocZg@mail.gmail.com>	<5417FED2.1030106@pseudoterminal.org>
	<20140916213343.GW2480@denix.org>
In-Reply-To: <20140916213343.GW2480@denix.org>
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
X-List-Received-Date: Tue, 16 Sep 2014 22:48:05 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 2014-09-16 23:33, Denys Dmytriyenko wrote:
> On Tue, Sep 16, 2014 at 11:11:46AM +0200, Carlos Rafael Giani wrote:
>> On 2014-09-16 07:43, Khem Raj wrote:
>>> Hi Carlos/All
>>>
>>> I want to understand why LICENSE_FLAGS = "commercial" was added to
>>>
>>> meta-multimedia/recipes-multimedia/mpg123/mpg123_1.15.3.bb
>>>
>>> in initial commit and has been carried over upgrades ever since
>>>
>>> The license seems to be LGPL 2.0 and is explained in greater detail here
>>>
>>> http://mpg123.org/cgi-bin/scm/mpg123/trunk/doc/ROAD_TO_LGPL?revision=2607
>>>
>>> So what portions of it are having different terms for commercial distribution ?
>>>
>>> Thanks
>>>
>>> -Khem
>> It's because MPEG audio is subject to royalties. This is also the
>> reason why gst-plugins-ugly and gstreamer1.0-plugins-ugly have this
>> flag.
> But does gst-plugins-ugly provide own codecs? It's mostly a collection of
> external plugins, so it shouldn't itself be marked as "commercial":
>
> http://thread.gmane.org/gmane.comp.handhelds.openembedded.core/51055
>

But the whole point of gst-plugins-ugly is to be a collection of tested 
high-quality plugins for formats and standards which are subject to 
royalties. Tested quality plugins without the royalty go to -good.

