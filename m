Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by mail.openembedded.org (Postfix) with ESMTP id 9898672D3C
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Jan 2015 23:37:53 +0000 (UTC)
Received: by mail-pa0-f48.google.com with SMTP id ey11so210383pad.7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Jan 2015 15:37:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=5yX06cv58xeDCZqITeJVyWnyZm7+fsTNBwmFDnXB4es=;
	b=fLcQt2CsSXhVWJYcVqCAbY8JPuiN0d926YcwCfRbRR1X3rWRXbPiEqZM+8/BhW5q6C
	KnS81lVrHpybNZ4PIsQxPdzBsxTp2uSXVZMftvRL1K/Ur7sZCkQ2peDuw4T8DhEpda8x
	Irco/UuBFx2e/UMnImZsRJSsmN1VRpI1zBMWauXXllWuALCpn45IVGClxACjrUfynt1L
	D7BX9PW4AnnWPFeAM11Z/STXH6nPnVCWWI37ik8yLPVmnnBmq0Z4s2hiRliLL5CRRWh5
	hCgY8acLCTl1DBF5rEozsWb4hD571ilwhaugSzB4DRPOlkTETb1cEYM6zAjw7zHN86TT
	myLw==
X-Received: by 10.68.57.225 with SMTP id l1mr15383631pbq.114.1422056274169;
	Fri, 23 Jan 2015 15:37:54 -0800 (PST)
Received: from ?IPv6:2601:c:a700:272f:c86a:c1a:2910:546?
	([2601:c:a700:272f:c86a:c1a:2910:546])
	by mx.google.com with ESMTPSA id nn7sm3012470pdb.4.2015.01.23.15.37.52
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 23 Jan 2015 15:37:53 -0800 (PST)
Message-ID: <54C2DB4E.4090808@gmail.com>
Date: Fri, 23 Jan 2015 15:37:50 -0800
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>, 
	openembedded-devel@lists.openembedded.org, 
	Bian Naimeng <biannm@cn.fujitsu.com>
References: <54A97D15.4080801@gmail.com>
	<B851B2EA-9E81-40E6-A1E9-B8C30DD9E194@gmail.com>
	<2220709.jFTZT0BvCv@peggleto-mobl5.ger.corp.intel.com>
In-Reply-To: <2220709.jFTZT0BvCv@peggleto-mobl5.ger.corp.intel.com>
Subject: Re: recent addition of libgxim depends issue
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
X-List-Received-Date: Fri, 23 Jan 2015 23:37:57 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 01/07/2015 01:27 AM, Paul Eggleton wrote:
> On Tuesday 06 January 2015 16:41:52 Khem Raj wrote:
>>> On Jan 4, 2015, at 9:49 AM, akuster808 <akuster808@gmail.com> wrote:
>>> While building world I found and issue with libgxim.
>>>
>>> libgxim depends on ruby-native. meta-ruby is not a layer depends for
>>> meta-oe.
>>>
>>> Can meta-oe have layer depends other then 'core' ? if so, this is an easy
>>> fix.
>>
>> I would not like to have such a dependency. May be move this recipe to
>> meta-ruby
>
> If it's not specifically a ruby-related piece of software (which it doesn't
> seem to be, at a glance) then that wouldn't seem right. Can the ruby
> dependency be disabled by default using PACKAGECONFIG perhaps?

I did not see any configure option. The issue is
"libgxim/mkacc.rb", it is used in the build process.

- Armin

> Cheers,
> Paul
>

