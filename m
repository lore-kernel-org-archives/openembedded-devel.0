Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f169.google.com (mail-pd0-f169.google.com
	[209.85.192.169])
	by mail.openembedded.org (Postfix) with ESMTP id 4FCD160559
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Jul 2014 19:47:28 +0000 (UTC)
Received: by mail-pd0-f169.google.com with SMTP id g10so10592578pdj.14
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Jul 2014 12:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=9Y2GTK1/16d2yqWrLnXcBKTb/K0lYP2VhwunUcxeQzg=;
	b=EbJtvsFJCvo/1EeIB+hj7pBboVLyf4niB5B1xDZ7bGjHcKozfEFwUInD/K021E2Mvy
	qw20t4KHGoxRww/DFsxIC6KdGigh2wYxSqJXUz05FQpb7TTxVfm6TRxyC96T3rgIPSMl
	NKein+Yd3K/pPNPevof6cDDPQIDbfYwclPsiaubKM+8IvxLVhiSegQHRYIMQ5RpfP3q5
	geVe/eL1/Zsg7KLZOM16CndMA+1BHZhBhOPaBeRC5W54DUA+mebdHgPZb6wcHo6WRAoW
	HHXIph2P2ow8uAiXgTyF6Sowq1a0yBXOofyQhxwrroP6aFjEqSwhpJ8Qm7YIOZ6Mm44d
	6mhQ==
X-Received: by 10.68.111.193 with SMTP id ik1mr60298545pbb.145.1404244050316; 
	Tue, 01 Jul 2014 12:47:30 -0700 (PDT)
Received: from [10.7.100.231] (64.2.3.195.ptr.us.xo.net. [64.2.3.195])
	by mx.google.com with ESMTPSA id
	by1sm33886747pbb.75.2014.07.01.12.47.28 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 01 Jul 2014 12:47:29 -0700 (PDT)
Message-ID: <53B3104F.9050004@gmail.com>
Date: Tue, 01 Jul 2014 12:47:27 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org, cliff.brake@gmail.com
References: <CAOd_LFx-3ko_BrD_9VpPj-oairm8XQrfoWzq8JEWmcsFQuK_GQ@mail.gmail.com>
	<CAOd_LFxT6M-cCu4PJ9AwTZG6mTQihEJyS7mwRNonzBHZcyyq9Q@mail.gmail.com>
In-Reply-To: <CAOd_LFxT6M-cCu4PJ9AwTZG6mTQihEJyS7mwRNonzBHZcyyq9Q@mail.gmail.com>
Subject: Re: [meta-oe][meta-networking][daisy] pull request rng-tools, ptpd
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
X-List-Received-Date: Tue, 01 Jul 2014 19:47:36 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


Acked-by: Armin Kuster <akuster808@gmail.com>


On 07/01/2014 12:16 PM, Cliff Brake wrote:
> (added branch name)
>
> The following changes since commit a6dcf6265822ca1484d991d10a3042e04a960cdb:
>
>    live555: fix fetch problem (2014-06-23 12:58:31 +0200)
>
> are available in the git repository at:
>
>    https://github.com/cbrake/meta-openembedded.git daisy-to-merge-2014-07-01
>
> for you to fetch changes up to ee24939c4c70b63a9fb7e93a58889a3231d3d367:
>
>    rng-tools: Update rng-tools version to 4 (2014-07-01 15:08:41 -0400)
>
> ----------------------------------------------------------------
> Balasubramanian, Aparna (1):
>        rng-tools: Update rng-tools version to 4
>
> Franklin Cooper Jr (1):
>        ptpd: update to 2.3.0
>
>   meta-networking/recipes-daemons/ptpd/ptpd-2.2.0/ld-as-needed.patch
> | 37 -------------------------------------
>   meta-networking/recipes-daemons/ptpd/{ptpd_2.2.0.bb => ptpd_2.3.0.bb}
> | 21 +++++++++++----------
>   meta-oe/recipes-support/rng-tools/{rng-tools_2.bb => rng-tools_4.bb}  |  4 ++--
>   3 files changed, 13 insertions(+), 49 deletions(-)
>   delete mode 100644
> meta-networking/recipes-daemons/ptpd/ptpd-2.2.0/ld-as-needed.patch
>   rename meta-networking/recipes-daemons/ptpd/{ptpd_2.2.0.bb =>
> ptpd_2.3.0.bb} (56%)
>   rename meta-oe/recipes-support/rng-tools/{rng-tools_2.bb =>
> rng-tools_4.bb} (84%)
>
> On Tue, Jul 1, 2014 at 3:13 PM, Cliff Brake <cliff.brake@gmail.com> wrote:
>> The following changes since commit a6dcf6265822ca1484d991d10a3042e04a960cdb:
>>
>>    live555: fix fetch problem (2014-06-23 12:58:31 +0200)
>>
>> are available in the git repository at:
>>
>>    https://github.com/cbrake/meta-openembedded.git
>>
>> for you to fetch changes up to ee24939c4c70b63a9fb7e93a58889a3231d3d367:
>>
>>    rng-tools: Update rng-tools version to 4 (2014-07-01 15:08:41 -0400)
>>
>> ----------------------------------------------------------------
>> Balasubramanian, Aparna (1):
>>        rng-tools: Update rng-tools version to 4
>>
>> Franklin Cooper Jr (1):
>>        ptpd: update to 2.3.0
>>
>>   meta-networking/recipes-daemons/ptpd/ptpd-2.2.0/ld-as-needed.patch
>> | 37 -------------------------------------
>>   meta-networking/recipes-daemons/ptpd/{ptpd_2.2.0.bb => ptpd_2.3.0.bb}
>> | 21 +++++++++++----------
>>   meta-oe/recipes-support/rng-tools/{rng-tools_2.bb => rng-tools_4.bb}  |  4 ++--
>>   3 files changed, 13 insertions(+), 49 deletions(-)
>
>
>

