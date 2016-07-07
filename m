Return-Path: <piotr.lewicki@elfin.de>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id C39F66013D
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Jul 2016 08:50:18 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id n127so7317242wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Jul 2016 01:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elfin.de; s=google;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=0FeiIOxe+aHs83PuuIZQE5nBIhgRGgjhJAcAV5MiVno=;
	b=R8Fbh5KcKhKqpe9r0XXk69u2MvmoxTQ2BmUrqVR5s93mp0vJUe4LtyKKJPGZ62hfOf
	HxWWr5AsI1ei5YZtcabE408VdcwjpARjbqNhvMOI/LXwwG5GAypGUlhFsqylEEpP5CJC
	xDOP71OwQLicgBAOW8KbaWe3N4sElf/GM0i46IeRVQbrh+cMRlYvUrLIkoJOjf45DxwJ
	KNx31z6oGS64ng7ZExmED10ONNIaOvWSJQzwZmvb4rdunSgBSZsKXlmJkgjhNoKzzCVE
	KGBI0yDEmBfpqg8R+qaRWHWdrHipYvguvBA/mxuEO7HlWSOZOe/yh85upQG75fAk66Pm
	GLeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=0FeiIOxe+aHs83PuuIZQE5nBIhgRGgjhJAcAV5MiVno=;
	b=e47Nt+eOPQ2pEOjKRcSxnizUYRjGqY9RXmSzntzCTBhRo2CmuGaUlxykyEkG7YlkXd
	8v73oHy7PW4D0pCEy5WCZAxqN2Uk3v7Hp/RfmyswhRZ8MzGHO4VuUT7Bh/zDAq/1TOuh
	7SVLGS8DJqzUDWSIp890b+jY5/cczi5KZhtXc7z08y/cf0zbDvL7F4auX1fTmKBcN+Gf
	uzQ3GeNcSQoiORHgh2pKzFcMoRvVFoeOQ3QV0JhjL/pz5ldDDSI3o3H09W9R2aDBuyzi
	5nrtMlwFq/LFKP/DecsROb0uu0KFCs6fgJ92CTFoivcpC6Ro7q8Xg5F82MDz8FwnpshO
	/0oQ==
X-Gm-Message-State: ALyK8tKz4mL3ZJzoXGWi42zcYFyLrtimgSoMsi3smzIU53Q27XQ/eUByPxVZ3fBQA9NtSw==
X-Received: by 10.28.156.87 with SMTP id f84mr17399680wme.86.1467881418135;
	Thu, 07 Jul 2016 01:50:18 -0700 (PDT)
Received: from [192.168.2.170] (b2b-94-79-174-114.unitymedia.biz.
	[94.79.174.114]) by smtp.gmail.com with ESMTPSA id
	u145sm2343788wmu.4.2016.07.07.01.50.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Jul 2016 01:50:17 -0700 (PDT)
To: "Davis, Michael" <michael.davis@essvote.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	openembedded-core@list.openembedded.org
References: <1467360339-10236-1-git-send-email-ed.bartosh@linux.intel.com>
	<577D1D64.8080604@elfin.de> <2476892.ILE9ZpP5Yr@localhost.localdomain>
From: "piotr.lewicki" <piotr.lewicki@elfin.de>
Message-ID: <577E17C8.1050105@elfin.de>
Date: Thu, 7 Jul 2016 10:50:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <2476892.ILE9ZpP5Yr@localhost.localdomain>
Subject: Re: [OE-core] problem with blacklisted packages
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
X-List-Received-Date: Thu, 07 Jul 2016 08:50:19 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Awesome.
Then maybe some comment should be added to 
meta/classes/blacklist.bbclass for clarity.
Like this:

# * Package can be unblacklisted by setting:
#   PNBLACKLIST[pn] = ""
#


Thanks,
Piotr Lewicki


On 06.07.2016 17:35, Davis, Michael wrote:
> You can override the blacklist to off.  That is what I have been doing.
> Put the following in your local.conf or distro conf file.
> PNBLACKLIST[crda] = ""
>
> On Wednesday, July 06, 2016 05:01:56 PM piotr. lewicki wrote:
>> Hi,
>> I'm having problem with some of the recipes which are blacklisted due to
>> problems with compilation using GCC-6.
>>
>> I wonder if there is a way to "whitelist" those packages without
>> changing content of original recipe?
>>
>> For now I have:
>>
>> GCCVERSION = "5.%"
>>
>> in my distro.conf so if a recipe is not building due to problems with
>> gcc6 I simply edit the recipe and remove the line with PNBLACKLIST.
>>
>> Is there a better way to deal with those problems?
>> Can this blacklisting depend on "GCCVERSION" ?
>>
>> Example of problematic recipe : crda (from crda_3.18.bb)
>>
>>
>>
>> Thanks,
>> Piotr Lewicki


