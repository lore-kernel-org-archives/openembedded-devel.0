Return-Path: <Mingli.Yu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 57D2873173
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Jun 2016 06:25:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u5T6PDAW020271
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Jun 2016 23:25:14 -0700 (PDT)
Received: from [128.224.163.140] (128.224.163.140) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.248.2;
	Tue, 28 Jun 2016 23:25:12 -0700
To: <openembedded-devel@lists.openembedded.org>
References: <1467102993-4925-1-git-send-email-mingli.yu@windriver.com>
	<CANx9H-BhTnCumkT2gyhLarvEyh+TsOLfOw9qdvne-XHw1FSL=Q@mail.gmail.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <57736973.1010000@windriver.com>
Date: Wed, 29 Jun 2016 14:23:47 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <CANx9H-BhTnCumkT2gyhLarvEyh+TsOLfOw9qdvne-XHw1FSL=Q@mail.gmail.com>
X-Originating-IP: [128.224.163.140]
Subject: Re: [meta-python][PATCH]: update some python packages bb
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
X-List-Received-Date: Wed, 29 Jun 2016 06:25:15 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2016年06月28日 22:50, Tim Orling wrote:
> The subject line is misleading, as you are actually adding recipes for
> python-pbr and python-mock, not updating them.
Thanks! will update the subject then.
> Also, please make sure that EACH patch has [meta-python] in the subject
> line, these patches are consumed by automated processes.
Thanks! Will make each patch has [meta-python] in the subject.
>
> On Tue, Jun 28, 2016 at 1:36 AM, <mingli.yu@windriver.com> wrote:
>
>> 1,
>>    Remove pytest for python-mccabe to avoid dependency
>>    on python-runner as only one file test_mccabe.py import
>>    pytest and this test_mccabe.py file not install on
>>    our target eventually.
>>
>> This is not the right direction to go in. If anything we need MORE testing
> of recipes, not less. The solution is to add a python-pytest-runner recipe
> to meet the dependency.
Thanks! Will add the dependency then.
>
>
>> 2, Add python-pbr bb file as python-mock depends on
>>    python-pbr-native
>>
>> 3, Add python-pbr-native dependency for python-mock
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>

