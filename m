Received: from mail-ia0-f182.google.com ([209.85.210.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UeSa5-0001dc-8D
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 May 2013 18:05:02 +0200
Received: by mail-ia0-f182.google.com with SMTP id z3so7733393iad.41
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 May 2013 08:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=oicvgsgmhVRUKtlaFQrlElog4nE3+oa7nE1LnQEW2TM=;
	b=zmu3i/WBhlNplom+fkBgZ1kboAhAj4fQHm0cQcekC09sviLFhrFipQIIB/F7pohZJl
	iSZ5iJ3N+cUeSAlzR/Sb898CodR/gQCIo0TS5U/ulzl357Yni3eQvWkAmHxsXdtYNW8H
	5GmKM6K1ec6LY6inaOheoBxS3L2M8ChVdjF8uKvgl3Vv4MWTzxxnGt4DLaBmx0OjEOB+
	SCdnxAYPlR6bjfH1ZyAEo5NiT9bpboLCijBIHeyUSv7MNTuERYWeOpLSqRC6Qf175ubg
	LQg5+zqs8mutbC/1CdtiaPWoIt2PES8crnzR+4Jq1uTqHdq7hU1hTcKnNot5li7ft8U3
	5t5A==
X-Received: by 10.50.130.11 with SMTP id oa11mr5644814igb.108.1369064800181;
	Mon, 20 May 2013 08:46:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.109.133 with HTTP; Mon, 20 May 2013 08:46:10 -0700 (PDT)
In-Reply-To: <CAJTo0LZrgjBH4m=mp2rdN-PYowynu0_vqQ0HJ7RL5GFQMEo+Qw@mail.gmail.com>
References: <1368895167-6841-1-git-send-email-raj.khem@gmail.com>
	<CAJTo0LYDp-wfrSqkswLdj32keLtyV62oCZm5cuX4QXtUGyEG1A@mail.gmail.com>
	<CAMKF1sre8J9DyME66wKjvoEVB9pqQ4TEjpUQZeaLae6kh+KuRw@mail.gmail.com>
	<CAJTo0LZrgjBH4m=mp2rdN-PYowynu0_vqQ0HJ7RL5GFQMEo+Qw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 20 May 2013 08:46:10 -0700
Message-ID: <CAMKF1sqKkWsLQFFeZ3hv=J3pa=oD-6Fuo9S3LFJgUN_5QgpBQw@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	=?UTF-8?B?RXJpYyBCw6luYXJk?= <eric@eukrea.com>
Subject: Re: [meta-browser][PATCH] libxi: Match the bbappend to OE-Core
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 20 May 2013 16:05:14 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, May 20, 2013 at 8:30 AM, Burton, Ross <ross.burton@intel.com> wrote:
> On 20 May 2013 16:25, Khem Raj <raj.khem@gmail.com> wrote:
>> On Mon, May 20, 2013 at 2:18 AM, Burton, Ross <ross.burton@intel.com> wrote:
>>> On 18 May 2013 17:39, Khem Raj <raj.khem@gmail.com> wrote:
>>>> +BBCLASSEXTEND += "native"
>>>
>>> Why don't you submit a patch to oe-core's libxi, or even
>>> xorg-lib-common.inc, to add this?
>>
>> yeah that should be in OE-Core.
>
> I also noticed that it's only used by one of the three chrome recipes,
> so is it even needed at all?

the version which uses it is the default version for all architectures
for sometime
24.0.1312 is latest and may be used widely now but unless 19.0.1049 recipes are
in there this is needed. I will send a cleanup patch and see what folks think.


