Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A1C037FBB9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2019 17:50:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id x9PHolx1024885
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 25 Oct 2019 10:50:47 -0700 (PDT)
Received: from [172.25.44.8] (172.25.44.8) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Fri, 25 Oct 2019 10:50:46 -0700
To: =?UTF-8?Q?Andreas_M=c3=bcller?= <schnitzeltony@gmail.com>, Adrian Bunk
	<bunk@stusta.de>
References: <20191025072113.11172-1-schnitzeltony@gmail.com>
	<20191025072113.11172-10-schnitzeltony@gmail.com>
	<20191025114506.GA24586@localhost>
	<CALbNGRQTdYJd4BgyEDuNr1KwtScJZR-0KZR6U___Ut7uW47GPg@mail.gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <6c4be1ae-5625-1a59-b071-ba0ae2e10f1d@windriver.com>
Date: Fri, 25 Oct 2019 13:50:45 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <CALbNGRQTdYJd4BgyEDuNr1KwtScJZR-0KZR6U___Ut7uW47GPg@mail.gmail.com>
X-Originating-IP: [172.25.44.8]
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 09/15] zenity: pretify recipe a bit
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
X-List-Received-Date: Fri, 25 Oct 2019 17:50:53 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: 8bit

On 10/25/19 8:07 AM, Andreas Müller wrote:
> On Fri, Oct 25, 2019 at 1:45 PM Adrian Bunk <bunk@stusta.de> wrote:
>>
>> On Fri, Oct 25, 2019 at 09:21:07AM +0200, Andreas Müller wrote:
>>> ...
>>> -SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@gnome_verdir("${PV}")}/${GNOMEBN}-${PV}.tar.${GNOME_COMPRESS_TYPE};name=archive \
>>> +SRC_URI = " \
>>> +    ${GNOME_MIRROR}/${GNOMEBN}/${@gnome_verdir("${PV}")}/${GNOMEBN}-${PV}.tar.${GNOME_COMPRESS_TYPE};name=archive \
>>>       file://0001-build-don-t-generate-manual.patch \
>>>   "
>>> ...
>>
>> This should also stop overwriting the gnomebase SRC_URI, replace with:
>>
>> SRC_URI += " \
>>      file://0001-build-don-t-generate-manual.patch \
>> "
>>
>> cu
>> Adrian
> LOL - V2 will come

Since you're doing a V2: s/pretify/prettify/ in the subject please.
../Randy

> 
> Andreas
> 


-- 
# Randy MacLeod
# Wind River Linux

