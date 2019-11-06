Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4F2726B96C
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Nov 2019 09:30:33 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id xA69UXZC023898
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 6 Nov 2019 01:30:33 -0800 (PST)
Received: from [128.224.158.209] (128.224.158.209) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.468.0;
	Wed, 6 Nov 2019 01:30:32 -0800
To: =?UTF-8?Q?Andreas_M=c3=bcller?= <schnitzeltony@gmail.com>
References: <20191106074935.46751-1-hongxu.jia@windriver.com>
	<CALbNGRSyJYthd3zWWXfVBCzTNXhdNBA9K-MKAGFqHYVEuLNWYg@mail.gmail.com>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <620c7105-97cf-0595-0c72-fb6bcc660348@windriver.com>
Date: Wed, 6 Nov 2019 17:30:29 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CALbNGRSyJYthd3zWWXfVBCzTNXhdNBA9K-MKAGFqHYVEuLNWYg@mail.gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Wed, 06 Nov 2019 09:30:34 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 11/6/19 5:07 PM, Andreas Müller wrote:
> On Wed, Nov 6, 2019 at 8:59 AM Hongxu Jia <hongxu.jia@windriver.com> wrote:
>> Python 2.7 is no longer supported. The 5.0.0 release will be the last
>> version targeting Python 2.7. [1]
>>
>> [1] https://github.com/erikrose/more-itertools/commit/560b045b430e8292c18cf5283de4fdc3e13e56f7
>>
>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> * Version going backwards
> * Such a patch at times python2 is eol - really?

All these patches just make python2 module work.

Should we clarify that we do not support python2? If yes, we could clean 
up them.

In this case, if we do not support python2 more-itertools, we should also

clean up these python2 recipes (python-pytest,python-pluggy,python-zipp)

that runtime depends on more-itertools.


As above upstream commits [1] said, the old version 5.0.0 is the last 
version

to support python2. Two choice: going backwards or cleaning up, it is 
impossible

to patch latest more-itertools to support python2


//Hongxu

> Andreas



