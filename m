Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by mail.openembedded.org (Postfix) with ESMTP id 1D0AA726E7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Dec 2014 18:57:52 +0000 (UTC)
Received: by mail-pa0-f48.google.com with SMTP id rd3so16929457pab.21
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Dec 2014 10:57:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=uQ36mZOf/3HdrWLehe6Op2+mARaas5QoUjpCLrqsOFQ=;
	b=oQhvKCP1O/oPMcSnXjK6oMc/9JeWYyovvQipcGfF+SWzx72vYvqHelzEzp23CVnnxs
	hB9qOl0TN0p9GcVj/oEmsFyffwQDVbqQmaoUqWx/oKytSD7gjkPkS7IZF24TKLsgvFAw
	jgz3AmbGE5u5V2RkyClCc3XD5TH+kYF1nkyVmgPROH2ZJ1R0guGMoPPQhAuXt+Ey0eAS
	z3ndlkQatD+/kJb7MlsQUmxAPSMWlDvvUUfMRZQ4mFvIwpfTFe4jI2DuziehL8ReVGGC
	SAzR6gprEim8lbJoRr1gaOCYif3BKpozaYbAMBkFEuUQmCLfUgjNSAqY3bO7mTfq/AP0
	IARw==
X-Received: by 10.68.97.131 with SMTP id ea3mr72075780pbb.144.1418842672883;
	Wed, 17 Dec 2014 10:57:52 -0800 (PST)
Received: from ?IPv6:2601:c:a700:272f:bd7f:d1ec:52c9:778f?
	([2601:c:a700:272f:bd7f:d1ec:52c9:778f])
	by mx.google.com with ESMTPSA id fu17sm4677441pdb.5.2014.12.17.10.57.50
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 17 Dec 2014 10:57:51 -0800 (PST)
Message-ID: <5491D22B.5080209@gmail.com>
Date: Wed, 17 Dec 2014 10:57:47 -0800
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1418662550-13436-1-git-send-email-akuster808@gmail.com>	<548F8C66.5080005@windriver.com>
	<5490A9D4.8040806@gmail.com>	<20141217185113.GP18828@axis.com>
	<20141217185403.GQ18828@axis.com>
In-Reply-To: <20141217185403.GQ18828@axis.com>
Subject: Re: [meta-perl][PATCH 1/4] lib-perl: move package from meta-security to meta-perl
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
X-List-Received-Date: Wed, 17 Dec 2014 18:58:00 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 12/17/2014 10:54 AM, Olof Johansson wrote:
> On 14-12-17 19:51 +0100, Olof Johansson wrote:
>> On 14-12-16 22:53 +0100, akuster808 wrote:
>>> It looks like on cpan.org it is refereed to a just 'lib'.
>>>
>>> I can rename it to that.
>>
>> Even if it looks ugly, the consistent name would be liblib-perl
>> (lib${lower cased module namespace with - instead of ::}-perl)
>> and it would have my vote.
>
> Also,
>
> $ corelist lib
> lib was first released with perl 5.001
>
> What's the reason for this recipe?
>

Not sure. I inherited with meta-security.  Sounds like I have some 
homework ; )

- Armin

