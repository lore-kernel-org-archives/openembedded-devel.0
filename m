Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E79187185E
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Oct 2014 09:19:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s9B9JeNJ010172
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sat, 11 Oct 2014 02:19:40 -0700 (PDT)
Received: from [128.224.162.159] (128.224.162.159) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.174.1;
	Sat, 11 Oct 2014 02:19:40 -0700
Message-ID: <5438F62A.8060601@windriver.com>
Date: Sat, 11 Oct 2014 17:19:38 +0800
From: wenzong fan <wenzong.fan@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: "Peter A. Bigot" <pab@pabigot.com>,
	<openembedded-devel@lists.openembedded.org>
References: <cover.1412910727.git.wenzong.fan@windriver.com>
	<5437BF2B.9060909@pabigot.com>
In-Reply-To: <5437BF2B.9060909@pabigot.com>
Subject: Re: [PATCH 0/1][meta-networking] ntp: fix path to driftfile
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
X-List-Received-Date: Sat, 11 Oct 2014 09:19:49 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 10/10/2014 07:12 PM, Peter A. Bigot wrote:
> On 10/09/2014 10:22 PM, wenzong.fan@windriver.com wrote:
>> From: Wenzong Fan <wenzong.fan@windriver.com>
>>
>> Default path to driftfile is "/etc/ntp.drift", that doesn't work since
>> ntp daemon is always started with "ntp" user. It should be created at
>> the home directory of "ntp" which is "/var/lib/ntp/".
>
> Could you provide a bit more detail on why this "doesn't work"? Does it
> violate the FHS, or complicate securing an image, or...?
>
> I see that Debian apparently puts the file in /var/lib/ntp.
>
> I certainly don't object to the change, but "doesn't work" suggests this
> patch fixes a functional bug, not an inconsistency with policy.  More
> detail in the commit message will help us occasional contributors
> understand how things are supposed to be done and why.

Sorry for the confusions, the "doesn't work" means ntp user can't create 
driftfile under "/etc".

The fix refer to other distributions, just move driftfile to "/var/lib/ntp".

Thanks
Wenzong

>
> Thanks.
>
> Peter
>
>>
>> The following changes since commit
>> 17ff23b4a4a0e5ed7efde107fb00296f1ebd5fdd:
>>
>>    xf86-video-geode: fix build with new glibc-2.20 (2014-10-06
>> 01:07:53 +0200)
>>
>> are available in the git repository at:
>>
>>    git://git.pokylinux.org/poky-contrib wenzong/ntp
>>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=wenzong/ntp
>>
>> Wenzong Fan (1):
>>    ntp: fix path to driftfile
>>
>>   meta-networking/recipes-support/ntp/ntp.inc |   15 +++++++++++++++
>>   1 file changed, 15 insertions(+)
>>
>
>

