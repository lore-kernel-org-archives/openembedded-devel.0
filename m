Return-Path: <akuster808@gmail.com>
Received: from mail-ie0-f181.google.com (mail-ie0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id 2203673A59
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Mar 2015 20:53:11 +0000 (UTC)
Received: by iecsl2 with SMTP id sl2so30269081iec.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Mar 2015 13:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=gKIjsdKn6pobh/I2sh6gZ6gX+sLLuCynIoS+L5NOgx0=;
	b=Jo96aIQZCVh3bxA8sIUDMWc865unQbKJAvZa+y1RSi6w8V9NMNfhjkSLx5bs/G36wA
	aikIhjT8nIyhk8cYMJzkLc8w+BdjE5CZSn5jlQU6ePOhaV8U2RP85xQXQrbJZW/2xguU
	cEZObGsqoN7Ao6v3uqVJ+d2iafJYWQ5WzkO/d4WeqkvGjdPC4MH13UgGlSTfhgpVcqC6
	euaYg79wZJ6B1OgR2fFFJSR+RNxV9nQFBQoq3XINn6dyomBlr0xgj/+N/Ka6Tk/RxZMU
	eBMlI/db2cFfy4c/jyMariwohc0mt6kha45b/tQe74MYL1oVjqOJ3GPYzwEPtBpde/04
	uR4w==
X-Received: by 10.43.69.68 with SMTP id yb4mr25366761icb.96.1426020792313;
	Tue, 10 Mar 2015 13:53:12 -0700 (PDT)
Received: from [10.22.9.44] (64.2.3.194.ptr.us.xo.net. [64.2.3.194])
	by mx.google.com with ESMTPSA id qd2sm2233233igc.22.2015.03.10.13.53.10
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 10 Mar 2015 13:53:11 -0700 (PDT)
Message-ID: <54FF59B5.20900@gmail.com>
Date: Tue, 10 Mar 2015 13:53:09 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <54ED1B78.4040101@balister.org>	<20150227083113.GF2309@jama>
	<CAP9ODKqFPNyF4ZoXv0C1Jw==opnmrj+cWAEHUhr6nXbbXUKw6g@mail.gmail.com>
In-Reply-To: <CAP9ODKqFPNyF4ZoXv0C1Jw==opnmrj+cWAEHUhr6nXbbXUKw6g@mail.gmail.com>
Subject: Re: [meta-oe][dizzy]Update PyQt and related recipes
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
X-List-Received-Date: Tue, 10 Mar 2015 20:53:13 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 02/27/2015 05:41 AM, Otavio Salvador wrote:
> Hello Martin,
>
> On Fri, Feb 27, 2015 at 5:31 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
>> On Tue, Feb 24, 2015 at 04:46:48PM -0800, Philip Balister wrote:
>>> Please pull these three patches into meta-oe/dizzy.
>>>
>>> https://github.com/openembedded/meta-oe/pull/19
>>>
>>> These lead to a working PyQt4, which will reduce the number of questions
>>> I get about gnuradio-companion not working on dizzy.
>>
>> I'm not sure if we should do upgrades in release branch which should
>> receive only bug fixes, but I'll let daisy maintainers to decide.
>
> I agree with your concern but I also see the improvement
> (cross-compile support and like) of the new PyQt4.

Sorry I have head down for the last two weeks.

>
> At same time, I think this is not ready to be merged. Checking the
> code changes I think we need to:
>
> * split python-sip runtime package

So is this split being worked on ?

- armin
>
> This will fix the upgrade path.
>

