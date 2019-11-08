Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9CFED7FAAD
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Nov 2019 01:42:51 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id xA81gh6p026020
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 7 Nov 2019 17:42:43 -0800
Received: from [128.224.158.209] (128.224.158.209) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.468.0;
	Thu, 7 Nov 2019 17:42:42 -0800
To: Adrian Bunk <bunk@stusta.de>
References: <20191106074935.46751-1-hongxu.jia@windriver.com>
	<CALbNGRSyJYthd3zWWXfVBCzTNXhdNBA9K-MKAGFqHYVEuLNWYg@mail.gmail.com>
	<620c7105-97cf-0595-0c72-fb6bcc660348@windriver.com>
	<20191107161829.GA31984@localhost>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <c8687700-81fa-df75-2e55-9c6af1087675@windriver.com>
Date: Fri, 8 Nov 2019 09:42:38 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191107161829.GA31984@localhost>
Cc: Yuan Chao <yuanc.fnst@cn.fujitsu.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCH 1/8] python-more-itertools: downgrade 7.2.0 -> 5.0.0
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
X-List-Received-Date: Fri, 08 Nov 2019 01:42:51 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 11/8/19 12:18 AM, Adrian Bunk wrote:
> On Wed, Nov 06, 2019 at 05:30:29PM +0800, Hongxu Jia wrote:
>> ...
>> Should we clarify that we do not support python2? If yes, we could clean up
>> them.
>>
>> In this case, if we do not support python2 more-itertools, we should also
>>
>> clean up these python2 recipes (python-pytest,python-pluggy,python-zipp)
>>
>> that runtime depends on more-itertools.
>>
>>
>> As above upstream commits [1] said, the old version 5.0.0 is the last
>> version
>>
>> to support python2. Two choice: going backwards or cleaning up,
>> ...
> python-more-itertools was added to master less than 2 months ago,
> and the inital add was version 7.2.0.
>
> What you write implies that the Python2 version was never working,
> and should be removed with all reverse dependencies from both master
> and zeus.

A lots of recipe should be clean up, with a simple search,

a serial of dependencies should be affected

meta-python/recipes-devtools/python/python-pytest.inc:19: 
${PYTHON_PN}-pluggy \

meta-python/recipes-devtools/python/python-inflection.inc:12:RDEPENDS_${PN} 
+= "${PYTHON_PN}-pytest"

meta-python/recipes-devtools/python/python-importlib-metadata.inc:12:RDEPENDS_${PN} 
+= "${PYTHON_PN}-zipp ${PYTHON_PN}-pathlib2"


I think the original purpose to add python-more-itertools is to fix the

missing dependency issue, but the contributor does not test on python2

...

commit 5b98315d1955adcaf30c6d8589d6f39692e45a69
Author: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
Date:   Thu Sep 19 12:23:01 2019 +0900

     python-more-itertools: new recipe

     Add new recipe python-more-itertools as it is RDEPEND of 
python-zipp and python-pytest.

...

//Hongxu

>> //Hongxu
> cu
> Adrian
>


