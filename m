Return-Path: <mark.hatle@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6347D78981
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Mar 2018 17:51:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w22HpHEQ015698
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Fri, 2 Mar 2018 09:51:17 -0800
Received: from soho-mhatle-m.local (172.25.36.227) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Fri, 2 Mar 2018 09:50:48 -0800
To: ZhangXiao <xiao.zhang@windriver.com>, Khem Raj <raj.khem@gmail.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
References: <5A9676C2.9030208@windriver.com>
	<52061e9a-5cbf-57c4-5a13-1f83394a54b2@gmail.com>
	<5A9905F4.2030304@windriver.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <c4923cd2-8cca-8739-c4dd-6ab6fc1adfa5@windriver.com>
Date: Fri, 2 Mar 2018 11:51:15 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:52.0)
	Gecko/20100101 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <5A9905F4.2030304@windriver.com>
Subject: Re: multilib SDK issue
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
X-List-Received-Date: Fri, 02 Mar 2018 17:51:17 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 3/2/18 2:06 AM, ZhangXiao wrote:
> For the conflict of the config file, how about use "update-alternatives"
> to avoid it?

This is my recommendation.  Rename the conflicting scripts to append the
'base_libdir' value, and then use the update-alternatives to install them.

--Mark

> Thanks
> Xiao
> 
> 在 2018年03月01日 10:13, Khem Raj 写道:
>> On 2/28/18 1:30 AM, ZhangXiao wrote:
>>> Hi All,
>>>
>>> With below settings on my local.conf, I get several errors when
>>> extracting SDK:
>>>
>>> Modify local.conf as the example of section 4.10.2.2 of
>>> http://www.yoctoproject.org/docs/2.4.1/mega-manual/mega-manual.html#combining-multiple-versions-library-files-into-one-image
>>>
>>> ...
>>> MACHINE = "qemux86-64"
>>> require conf/multilib.conf
>>> MULTILIBS = "multilib:lib32"
>>> DEFAULTTUNE_virtclass-multilib-lib32 = "x86"
>>> IMAGE_INSTALL_append = " lib32-glib-2.0"
>>> ..
>>>
>>> # bitbake core-image-minimal -c populate_sdk
>>>
>>> ...
>>> Transaction Summary
>>> ================================================================================
>>> Install  416 Packages
>>>
>>> Total size: 57 M
>>> Installed size: 276 M
>>> Downloading Packages:
>>> Running transaction check
>>> Transaction check succeeded.
>>> Running transaction test
>>> Error: Transaction check error:
>>>   file /usr/include/gmp.h conflicts between attempted installs of
>>> libgmp-dev-6.1.2-r0.core2_64 and lib32-libgmp-dev-6.1.2-r0.x86
>>
>> this means we need to install gmp.h as multilib header during do_install
>> in recipe
>>
>> e.g.
>>
>> oe_multilib_header gmp.h
>>
>>>   file /usr/bin/python3.5m-config conflicts between attempted installs
>>> of python3-dev-3.5.4-r1.0.core2_64 and lib32-python3-dev-3.5.4-r1.0.x86
>>>   file /usr/share/pkgconfig/xtrans.pc conflicts between attempted
>>> installs of lib32-xtrans-dev-1:1.3.5-r0.x86 and
>>> xtrans-dev-1:1.3.5-r0.core2_64
>>>
>>> Error Summary
>>> -------------
>>>
>>> Any advices?
>>>
>>> Thanks a lot!
>>> Xiao
>>>
>>
>>


