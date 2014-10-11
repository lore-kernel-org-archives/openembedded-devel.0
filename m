Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0EDF865DA3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Oct 2014 09:55:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s9B9tokm024239
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Oct 2014 02:55:51 -0700 (PDT)
Received: from [128.224.162.159] (128.224.162.159) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.174.1;
	Sat, 11 Oct 2014 02:55:50 -0700
Message-ID: <5438FEA5.7000301@windriver.com>
Date: Sat, 11 Oct 2014 17:55:49 +0800
From: wenzong fan <wenzong.fan@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <cover.1412910727.git.wenzong.fan@windriver.com>
	<5437C139.1050809@pabigot.com>
In-Reply-To: <5437C139.1050809@pabigot.com>
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
X-List-Received-Date: Sat, 11 Oct 2014 09:55:51 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 10/10/2014 07:21 PM, Peter A. Bigot wrote:
> On 10/09/2014 10:22 PM, wenzong.fan@windriver.com wrote:
>> From: Wenzong Fan <wenzong.fan@windriver.com>
>>
>> Default path to driftfile is "/etc/ntp.drift", that doesn't work since
>> ntp daemon is always started with "ntp" user. It should be created at
>> the home directory of "ntp" which is "/var/lib/ntp/".
>
> The patch in the git repository also adds tmpfile support, which I
> believe should at least be described in the commit message, and
> preferably done in a separate commit since it's not related to the
> location of ntp.drift AFAICT.
>

Creating tmpfile is for the location changes, so I put them to the same 
commit.

Thanks for your suggestions, I'll update the commit log and send out V2 
patch.

Thanks
Wenzong

> Peter
>
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

