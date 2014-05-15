Return-Path: <net147@gmail.com>
X-Greylist: delayed 458 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 15 May 2014 11:30:45 UTC
Received: from mail-pb0-f41.google.com (unknown [209.85.160.41])
	by mail.openembedded.org (Postfix) with ESMTP id 5176065DBF
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 May 2014 11:30:45 +0000 (UTC)
Received: by mail-pb0-f41.google.com with SMTP id uo5so983411pbc.14
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 May 2014 04:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=fi7v3CMK6kHer9/fMfNdcU2s5XJi3B7GfcG4bk7es00=;
	b=L0ldrmYtn5krAKOaum94fwkEs2Qe7MQdy2F15M19vlmcSCEagAeM8wlUYDNp8pGd+8
	CnjIkf7CmTGdrn0LfRhmsNcXZRw3kqQeSilcU3pEO5t95xXpZ4pDUSRF2buxmxYHqHbk
	vKlEGdsNRyQpyJ+eGt5f8zIOepSjYuXrhQNjlRBhEHm9VK0/B2zNwp1GCdpltXu3aHDL
	YvyudpnAd4TSj5HoQazYAkysiw9LwG+uB5ezEi+i8NcCW7WfMGtAmBzGb0PzCjIKEbUC
	GqXCzN5j5tkW6EIppeJ7/DT86kDjlz32foaS6PENfacmS2F6KjVLBr9KSjhD9vn2Yxav
	KnPQ==
X-Received: by 10.68.132.42 with SMTP id or10mr11581866pbb.80.1400152988571;
	Thu, 15 May 2014 04:23:08 -0700 (PDT)
Received: from [192.168.0.2] (60-242-179-244.static.tpgi.com.au.
	[60.242.179.244]) by mx.google.com with ESMTPSA id
	cj1sm20074763pac.40.2014.05.15.04.23.06 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 15 May 2014 04:23:07 -0700 (PDT)
Message-ID: <5374A37A.1090405@gmail.com>
Date: Thu, 15 May 2014 21:22:34 +1000
From: Jonathan Liu <net147@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: Otavio Salvador <otavio@ossystems.com.br>, 
	Martin Jansa <martin.jansa@gmail.com>
References: <1398698859-15011-1-git-send-email-otavio@ossystems.com.br>	<20140504214712.GG2486@jama>	<CAP9ODKpL+SMvus2o_kY_-gYgxu95E3ahiBsKwFQxQGn93f69ug@mail.gmail.com>
	<CAP9ODKo43jUETHixm0_wBjL=zwJcb+BdgQV2MLKnte2FdCe5Mg@mail.gmail.com>
In-Reply-To: <CAP9ODKo43jUETHixm0_wBjL=zwJcb+BdgQV2MLKnte2FdCe5Mg@mail.gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH] qtbase.inc: Enable accessibility by default
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
X-List-Received-Date: Thu, 15 May 2014 11:30:46 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15/05/2014 5:04 AM, Otavio Salvador wrote:
> Hello folks,
>
> On Mon, May 5, 2014 at 9:21 AM, Otavio Salvador <otavio@ossystems.com.br> wrote:
>> On Sun, May 4, 2014 at 6:47 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
>>> On Mon, Apr 28, 2014 at 12:27:39PM -0300, Otavio Salvador wrote:
>>>> qtdeclarative requires accessibility to be enabled and it is added by
>>>> default to the toolchain so we ought to have it enabled to ensure the
>>>> default toolchain generation works.
>>>>
>>>> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>> ...
>>> As I told you on gtalk, I would prefer default to stay as minimal as
>>> posible, why don't you change packagegroup-qt5-toolchain-target.bb to
>>> use RRECOMMENDS instead of RDEPENDS so that missing
>>> qtquickcontrols-qmlplugins package doesn't break it when it's not
>>> available (because it's empty)?
>> I don't have a strong opinion for either case however I think we ought
>> to know what other meta-qt5 users think about it.
>>
>> In support to this patch addition I think we ought to provide the most
>> used features of Qt5 working out of box to users have a good first
>> use. Special cases can customize it per need basis. I think QML is
>> common enough for us to provide full support for it by default.
>
> Martin and I have different views on this topic and I'd like to merge
> or drop this patch. Could people comment on this one?
>
If changing to RRECOMMENDS resolves the issue I vote for that option.
It's better to start minimal and add only what you need when creating an 
image.

Regards,
Jonathan

