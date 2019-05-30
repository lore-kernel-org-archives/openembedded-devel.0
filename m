Return-Path: <Fang.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7490D605B3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 May 2019 08:25:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x4U8Or6l016839
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 30 May 2019 01:25:04 -0700
Received: from [0.0.0.0] (147.11.105.121) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.439.0;
	Thu, 30 May 2019 01:24:42 -0700
To: Richard Leitner <richard.leitner@skidata.com>,
	<openembedded-devel@lists.openembedded.org>
References: <1550719388-9980-1-git-send-email-fang.jia@windriver.com>
	<cee583cc-c120-8198-8322-d917f6ae1266@skidata.com>
From: "Jia, Fang" <fang.jia@windriver.com>
Message-ID: <c7f24c27-2a09-5f80-86b6-40cf6cfb3423@windriver.com>
Date: Thu, 30 May 2019 16:33:13 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <cee583cc-c120-8198-8322-d917f6ae1266@skidata.com>
Subject: Re: [PATCH 1/2] Revert "base-files: Define JAVA_HOME by default"
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
X-List-Received-Date: Thu, 30 May 2019 08:25:24 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Hi Richard

How about the test for the two patches ? Is it fine to push to master branch ?

Thanks,
Fang

On 22/02/2019 16:52, Richard Leitner wrote:
> Hi,
> thanks for the patch. Looks good to me now.
> I'll add it to my tests and will give feedback.
> 
> Nonetheless things to improve for your next contribution:
>  a) Please add [meta-java] to the subject
>  b) Please version the patchset when it updates an existing one
>     on the mailinglist
> 
> Therefore the correct subject prefix for this patchset would have been:
>  [oe][meta-java][PATCH V2 1/2]
> 
> No problem for this one as I found it, but please keep an eye on that for the
> next time. Thanks.
> 
> regards;Richard.L
> 
> On 21/02/2019 04:23, Fang Jia wrote:
>> This reverts commit ada652564f09756a81f54495cbc2091125239625.
>>
>> When enable multilib on a 64-bit system, probably both base-file and
>> lib32-base-files are installed.
>> Then both packages want to modify the file "profile", there will be
>> an error like:
>> "
>> Error: Transaction check error:
>> file /etc/profile conflicts between attempted installs of
>> lib32-base-files-3.0.14-r148.gpb_virt and
>> base-files-3.0.14-r148.gpb_virt
>> "
>>
>> The task can be added by adding a file to ${sysconfdir}/profile.d/.
>>
>> Signed-off-by: Fang Jia <fang.jia@windriver.com>
>> ---
>>   recipes-core/base-files/base-files_3.0.14.bbappend | 13 -------------
>>   1 file changed, 13 deletions(-)
>>   delete mode 100644 recipes-core/base-files/base-files_3.0.14.bbappend
>>
>> diff --git a/recipes-core/base-files/base-files_3.0.14.bbappend
>> b/recipes-core/base-files/base-files_3.0.14.bbappend
>> deleted file mode 100644
>> index 4651185..0000000
>> --- a/recipes-core/base-files/base-files_3.0.14.bbappend
>> +++ /dev/null
>> @@ -1,13 +0,0 @@
>> -do_install_append() {
>> -    cat >> ${D}${sysconfdir}/profile << EOT
>> -JAVA_HOME=""
>> -for dir in ${libdir}/jvm/*; do
>> -    if [ -x "\${dir}/bin/java" ]; then
>> -        [ -z "\${JAVA_HOME}" ] && JAVA_HOME="\${dir}"
>> -    fi
>> -done
>> -if [ -n "\${JAVA_HOME}" ]; then
>> -    export JAVA_HOME=\${JAVA_HOME}
>> -fi
>> -EOT
>> -}
>>
> 

