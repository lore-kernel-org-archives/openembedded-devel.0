Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 007827458B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Sep 2018 01:41:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w8I1fffv019646
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 17 Sep 2018 18:41:41 -0700 (PDT)
Received: from [128.224.162.202] (128.224.162.202) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.408.0;
	Mon, 17 Sep 2018 18:41:40 -0700
To: =?UTF-8?Q?Andreas_M=c3=bcller?= <schnitzeltony@gmail.com>
References: <cover.1537199591.git.hongxu.jia@windriver.com>
	<CA+chaQdzPyhGSR=2yr6y6OvC8yKMq80nOX=WWnqdgqZkeN4Pow@mail.gmail.com>
	<362229a8-d5aa-e0eb-a1b6-fa3d71ff68c4@windriver.com>
	<CALbNGRQNttTSCKZokeJ==i-kyrreQquRK7AE4ezsGY5=DZjLSg@mail.gmail.com>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <72350b64-9160-f1bd-992b-ffbf3c18d5b3@windriver.com>
Date: Tue, 18 Sep 2018 09:41:38 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CALbNGRQNttTSCKZokeJ==i-kyrreQquRK7AE4ezsGY5=DZjLSg@mail.gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 00/19] 19 recipes to split one dpg package only
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
X-List-Received-Date: Tue, 18 Sep 2018 01:41:44 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2018年09月18日 02:40, Andreas Müller wrote:
> You know that this explodes image size - because dbg package RDEPENDS
> on all non debug packages now - or did I miss something.
>
> E.G fontforge: We need all the python-dbg in the iamge now
>
> With this images with dbg-packages turn into non usable.
>
> Haven't got the point what gets better by doing so

Sorry, I didn't get your point :(

First, do you mean one dbg package take more image size than sub
dbg packages? I am afraid the sub dbg package could not work correctly
(see my comments above)

Especially only one hardlink of separated debug info file in each
directory (see commits `d4eaf42 package.bbclass: only one hardlink
of separated debug info file in each directory' in oe-core)

Second, does this fix cause dbp package RDEPENDS issue? Or already
existed issue? If the former, please paste a reproduce steps, if the latter,
as I mentioned above, RP rethinks to improve debug package dependency
handling in 2.7 (its too late for 2.6 now.),

//Hongxu

> Andreas



