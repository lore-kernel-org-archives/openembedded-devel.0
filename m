Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 212757F3B3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Aug 2019 08:19:52 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x7U8IN5R005149
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 30 Aug 2019 01:18:55 -0700
Received: from [128.224.162.157] (128.224.162.157) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.468.0;
	Fri, 30 Aug 2019 01:18:41 -0700
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, Alejandro Enedino
	Hernandez Samaniego <alejandro.enedino.hernandez-samaniego@xilinx.com>, 
	"raj.khem@gmail.com" <raj.khem@gmail.com>
References: <1566955456-20194-1-git-send-email-hongxu.jia@windriver.com>
	<1567094248-9489-1-git-send-email-hongxu.jia@windriver.com>
	<7246b4cb-1358-8afc-eb4c-a80788bead19@xilinx.com>
	<99b98099-6aa3-33c1-0168-6def305be825@windriver.com>
	<0dce6aadbb574a01892cb847bada6523@XBOX04.axis.com>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <09945c3b-b28a-b4e3-eea1-ea1fa0616040@windriver.com>
Date: Fri, 30 Aug 2019 16:18:39 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <0dce6aadbb574a01892cb847bada6523@XBOX04.axis.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH V3] cryptsetup: add libdevmapper to RDEPENDS
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
X-List-Received-Date: Fri, 30 Aug 2019 08:19:53 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 8/30/19 12:07 PM, Peter Kjellerstedt wrote:
>>> Alejandro
> Well, the error should be obvious given that after the latest changes
> to libdevmapper and lvm2, the libdevmapper recipe no longer builds a
> libdevmapper package, it is built by lvm2, but cryptsetup only depends
> on libdevmapper and so there is nothing to tell bitbake that it needs
> to build lvm2. I believe the correct solution is to add:
>
> PREFERRED_RPROVIDER_libdevmapper = "lvm2"

Yes, you are right, I know why I could not reproduce the QA issue,

I set PREFERRED_RPROVIDER_libdevmapper = "lvm2" in my project

Sorry for the repeated rework which brought troubles for others,

I indeed to start a community build when I could not reproduce it

on my company project


Now, I could reproduce it on the community build to prove you are right

sorry for V4 incoming

//Hongxu


> to meta-oe/conf/layer.conf. With that added and the explicit RDEPENDS
> on libdevmapper in cryptsetup, I do not think you need to skip neither
> build-deps nor file-rdeps in the cryptsetup recipe anymore.
>
> //Peter
>


