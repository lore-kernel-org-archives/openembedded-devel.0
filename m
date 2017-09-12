Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f169.google.com (mail-pf0-f169.google.com
	[209.85.192.169])
	by mail.openembedded.org (Postfix) with ESMTP id 1C15478416
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Sep 2017 14:55:14 +0000 (UTC)
Received: by mail-pf0-f169.google.com with SMTP id y29so18291127pff.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Sep 2017 07:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=qTQEj+8YpDZ3cem0l7ocbrpOQeHFVvN0CzQv7RYUzaY=;
	b=E82I4EUSUn6rR7ZATjLZQd419n5mXiJ6kxkROtE4VXSJK9/sN7XD/brnRq49r+DNQK
	5qqnLGLay9vupkl52UdlEHu4GMvY+dyclfrxarqvIkeCQHOpKYAuIAf8dfN98dK08r0V
	lXDsyjeDvr1WhKyBEQpFE1mmBxWTnYypAVW4OmgtaNotqpsiTIU0lJcZwvL3TtDiVN0t
	p2B4dVD+HqTdSk5gL/d1WIqknSwthQUjWNVcOgK4mESoeUWwjFWhNTZIE7CO/QnotknN
	Pw6C+ouiBEu2SzYEI6/eAUUolf2Y7joe1XnmPxyQGgsa+/GV6w466aes5VJLFPQIHIX/
	1xTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=qTQEj+8YpDZ3cem0l7ocbrpOQeHFVvN0CzQv7RYUzaY=;
	b=OGVDvQlCoAeCQHpbEg5vvEi1CaGlUA48VCiWkJockwnflK0tseWsvKuYyU5NMaJohx
	FSHrUm4Z01hxhI0Otv6/XAUgsbKl96ylpT3S6EVaq2126pIl6xNzTp/+uyS4kn6jTGZQ
	LiUFqch4/3/jQRhtgTauy+7mlyUEDGrleFlVajIxUqoS8IsubTqA+gJnANRgaYiF8Bxb
	ScIHnpFmlhftT5oYB5AX9/y93rN7lJL14mIz28ZNxJ42C7eVe13qTMUZ/6iyqrxHiuYK
	jp4ro8t+Nn8n401AuZC+u/D3zazW3Go9CK+bv1pVaVREjOjlGdCQXvXT1ike/TlqaSaH
	z7KQ==
X-Gm-Message-State: AHPjjUjOT+A/FGba/pQc8W58Mn+OTIT8SwS+tCuiAlgB4OYfriU1A0ZI
	91lJPM4d7aHobAn9
X-Google-Smtp-Source: ADKCNb4AFTqNefr/cYOjClpeGQpZk5tsnsMvXresiVcLzG/AJuigLe0kBMK7Ioe0EobgmeJcLqKe7Q==
X-Received: by 10.84.240.196 with SMTP id l4mr11803383plt.395.1505228115855;
	Tue, 12 Sep 2017 07:55:15 -0700 (PDT)
Received: from ?IPv6:2601:202:4001:9ea0:d402:d3c9:ca3b:9b54?
	([2601:202:4001:9ea0:d402:d3c9:ca3b:9b54])
	by smtp.gmail.com with ESMTPSA id
	w9sm18844017pfg.129.2017.09.12.07.55.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Sep 2017 07:55:15 -0700 (PDT)
To: Martin Jansa <martin.jansa@gmail.com>
References: <cover.1505143034.git.akuster808@gmail.com>
	<20170911220704.GA4102@jama>
From: akuster808 <akuster808@gmail.com>
Message-ID: <92fd35f1-193c-bd01-6266-3d85a6237f77@gmail.com>
Date: Tue, 12 Sep 2017 07:55:14 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170911220704.GA4102@jama>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 000/126] Pyro-next pull request
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
X-List-Received-Date: Tue, 12 Sep 2017 14:55:15 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 09/11/2017 03:07 PM, Martin Jansa wrote:
> On Mon, Sep 11, 2017 at 08:21:02AM -0700, Armin Kuster wrote:
>> Please concider these changes for pyro
>>
>> The following changes since commit 5e82995148a2844c6f483ae5ddd1438d87ea9fb7:
>>
>>    opencv: disable broken Intel FP16 detection (2017-05-09 16:00:31 +0200)
>>
>> are available in the git repository at:
>>
>>    git://git.openembedded.org/meta-openembedded-contrib akuster/pyro-next
>>    http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=akuster/pyro-next
>>
>> Kai Kang (3):
>>    snort: enable static daq
> This one adds daq-native which depends on libpcap-native, but without
> this commit in oe-core/pyro:
> commit 12373003cc3753421321d558813b1de95667c192
> Author: Kai Kang <kai.kang@windriver.com>
> Date:   Wed May 24 17:33:58 2017 +0800
>
>      libpcap: add native package
>
>      Add package libpcap-native required by recipe daq-native in layer
>      meta-networking. And daq-native is added to fix snort start error.
>
> it fails with:
> ERROR: Nothing PROVIDES 'libpcap-native' (but virtual:native:meta-oe/meta-networking/recipes-connectivity/daq/daq_2.0.6.bb DEPENDS on or otherwise requires it). Close matches:
I never saw this message during any of my  builds. That commit has been 
sitting my queue for over a month. How are you building this? Maybe I 
need to tweak my env.

>
> Is there oe-core/pyro pull request with libpcap-native?
nope. that support has been in before pyro released and came in as part 
of the 2.25 update. I do build with what gets queued in oe-core/pyro.

http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/meta/recipes-support/libcap/libcap_2.25.bb?h=pyro&id=e5043dbbccd05e27d0a020215c38de2be4829187

>
> Why is this snort change needed in pyro?
To fix the issue noted in the commit message.

- Armin

