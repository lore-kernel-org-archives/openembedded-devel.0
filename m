Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C60E96FEF5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Jun 2014 14:41:28 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s5GEfTIg015053
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Jun 2014 07:41:29 -0700 (PDT)
Received: from [128.224.162.181] (128.224.162.181) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 16 Jun 2014 07:41:29 -0700
Message-ID: <539F0218.80401@windriver.com>
Date: Mon, 16 Jun 2014 22:41:28 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <20140616122805.79FDD50297@opal.openembedded.org>
	<20140616141945.GQ2428@jama>
In-Reply-To: <20140616141945.GQ2428@jama>
Subject: Re: [oe-commits] Robert Yang : tftp-hpa: inherit autotools-brokensep
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
X-List-Received-Date: Mon, 16 Jun 2014 14:41:32 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 06/16/2014 10:19 PM, Martin Jansa wrote:
> On Mon, Jun 16, 2014 at 12:28:05PM +0000, git@git.openembedded.org wrote:
>> Module: meta-openembedded.git
>> Branch: master
>> Commit: 8e689bb7a154143c1bdfda5ec7a7e8c79bb1381b
>> URL:    http://git.openembedded.org/?p=meta-openembedded.git&a=commit;h=8e689bb7a154143c1bdfda5ec7a7e8c79bb1381b
>>
>> Author: Robert Yang <liezhi.yang@windriver.com>
>> Date:   Fri Jun 13 08:46:24 2014 +0800
>>
>> tftp-hpa: inherit autotools-brokensep
>>
>> It needs autotools-brokensep, otherwise do_install error:
>>
>> make: *** No rule to make target `install'.  Stop.
>>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
>>
>> ---
>>
>>   '                                                   | 21 +++++++++++++++++++++
>
> Joe: please remove this file ^

Sorry, oops, seemed that it was caused by a wrong typo of vim.

// Robert

>
>>   .../recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb        |  2 +-
>>   2 files changed, 22 insertions(+), 1 deletion(-)
>>
>> diff --git a/' b/'
>> new file mode 100644
>> index 0000000..244cc72
>> --- /dev/null
>> +++ b/'
>> @@ -0,0 +1,21 @@
>> +radvd: inherit autotools-brokensep
>> +
>> +It needs autotools-brokensep, otherwise do_install error:
>> +
>> +install: cannot stat `radvd.conf.example': No such file or directory
>> +
>> +(LOCAL REV: NOT UPSTREAM) -- Waiting for updating upstream-master
>> +
>> +Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> +
>> +# Please enter the commit message for your changes. Lines starting
>> +# with '#' will be ignored, and an empty message aborts the commit.
>> +# On branch wr-7.0-20140426
>> +# Your branch is ahead of 'origin/wr-7.0-20140426' by 10 commits.
>> +#   (use "git push" to publish your local commits)
>> +#
>> +# Changes to be committed:
>> +#   (use "git reset HEAD <file>..." to unstage)
>> +#
>> +#	modified:   recipes-daemons/radvd/radvd.inc
>> +#
>> diff --git a/meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb b/meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb
>> index 6978e06..5baa61b 100644
>> --- a/meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb
>> +++ b/meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb
>> @@ -29,7 +29,7 @@ SRC_URI = "http://kernel.org/pub/software/network/tftp/tftp-hpa/tftp-hpa-${PV}.t
>>   SRC_URI[md5sum] = "46c9bd20bbffa62f79c958c7b99aac21"
>>   SRC_URI[sha256sum] = "0a9f88d4c1c02687b4853b02ab5dd8779d4de4ffdb9b2e5c9332841304d1a269"
>>
>> -inherit autotools update-rc.d update-alternatives
>> +inherit autotools-brokensep update-rc.d update-alternatives
>>
>>   EXTRA_OECONF += "--disable-option-checking"
>>
>>
>> --
>> _______________________________________________
>> Openembedded-commits mailing list
>> Openembedded-commits@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-commits
>
>
>

