Return-Path: <Chong.Lu@windriver.com>
X-Greylist: delayed 8014 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 06 May 2014 05:09:00 UTC
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 687C465FBF
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 May 2014 05:09:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s46591Xu011169
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 5 May 2014 22:09:01 -0700 (PDT)
Received: from [128.224.162.204] (128.224.162.204) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.169.1;
	Mon, 5 May 2014 22:09:00 -0700
Message-ID: <53686E69.8060507@windriver.com>
Date: Tue, 6 May 2014 13:08:57 +0800
From: Chong Lu <Chong.Lu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Paul Barker <paul@paulbarker.me.uk>,
	<openembedded-devel@lists.openembedded.org>
References: <cover.1397816030.git.Chong.Lu@windriver.com>
	<deccbaa80823665caeaa2763f587303595cc6115.1397816030.git.Chong.Lu@windriver.com>
	<20140505214541.GB12987@gmail.com>
In-Reply-To: <20140505214541.GB12987@gmail.com>
X-Originating-IP: [128.224.162.204]
Subject: Re: [PATCH 1/3] vim: add dependency and selinux and acl support control
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
X-List-Received-Date: Tue, 06 May 2014 05:09:03 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit


On 05/06/2014 05:45 AM, Paul Barker wrote:
> On Fri, Apr 18, 2014 at 06:16:30PM +0800, Chong Lu wrote:
>>   FILES_${PN}-data = "${datadir}/${PN}"
>> +FILES_${PN}-common = " \
>> +    ${datadir}/${PN}/${VIMDIR}/*.vim \
>> +    ${datadir}/${PN}/${VIMDIR}/autoload \
>> +    ${datadir}/${PN}/${VIMDIR}/colors \
>> +    ${datadir}/${PN}/${VIMDIR}/compiler \
>> +    ${datadir}/${PN}/${VIMDIR}/ftplugin \
>> +    ${datadir}/${PN}/${VIMDIR}/indent \
>> +    ${datadir}/${PN}/${VIMDIR}/keymap \
>> +    ${datadir}/${PN}/${VIMDIR}/lang \
>> +    ${datadir}/${PN}/${VIMDIR}/macros \
>> +    ${datadir}/${PN}/${VIMDIR}/plugin \
>> +    ${datadir}/${PN}/${VIMDIR}/print \
>> +    ${datadir}/${PN}/${VIMDIR}/spell \
>> +    ${datadir}/${PN}/${VIMDIR}/tools \
>> +"
>>   
>>   # Recommend that runtime data is installed along with vim
>>   RRECOMMENDS_${PN} = "${PN}-syntax ${PN}-help ${PN}-tutor ${PN}-vimrc ${PN}-data"
> Sorry to reply to an old commit but this has broke things for me. Installing vim
> after this commit gives:
>
>      vim: unsatisfied recommendation for vim-data
>
> As everything that was in vim-data is now in vim-common. Your commit message
> says "Split binary file into vim package and put others in vim-common.", but
> this split was already in effect with everything in vim-data. It then got
> installed by default as vim-data is in RRECOMMENDS_vim, but could be disabled by
> adding things to BAD_RECOMMENDS.
>
> What is the benefit of moving things to vim-common? I'm probably just
> misunderstanding what this change is aiming to solve.
I just refer to Ubuntu splitting package policy.
> As vim-data is now left empty, can we remove it from PACKAGES and
> RRECOMMENDS_vim and instead add vim-common to RRECOMMENDS_vim? Just want to make
> sure that won't break anything for you before I send a patch.
Sorry for my mistake. We should remove vim-data from PACKAGES and 
RRECOMMENDS_vim and
add vim-common to RRECOMMENDS_vim.

Best Regards
Chong
>
> Thanks,
>


