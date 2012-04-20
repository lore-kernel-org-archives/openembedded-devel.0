Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <vwyodapink@gmail.com>) id 1SLIKJ-00083R-Fo
	for openembedded-devel@lists.openembedded.org;
	Fri, 20 Apr 2012 20:12:59 +0200
Received: by yhjj56 with SMTP id j56so5455701yhj.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Apr 2012 11:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=Mjtpv5Cf5nojlsDPMqaUn+T3ski/9yVYaJtf3Cj9pXA=;
	b=S0Yx8vC9kO/5kDpjEJ8j+nJYbtsoZCWqH0wc4Aa/eHMicmljvfhj10D7TONBJKxqTD
	HFVWkXGgv5vc+iQNQ4v4/HSTHh0H9+UVJoqoaz7/98fyon+lSXg8pPYJmSDLQ3i7qG9F
	xUDy0Kl7zByxiKfqLSdlonrkgaADRg+h1Mub548SKHq7eRLWxnnfkDm/b2O3xrAILZMV
	ciqZ7PtmI6kQ0llgVeg4c2jmTCoVi5G5VdBJgzJB/4SN7D+EmS/0KGPUqIFQR5yb5or4
	KLOlXOjGz9VlEZWetAJ1tsE42YQw0vFaltWiGG9AuNHXZjJ9agU2b3c3YLiP2RS5AGXI
	9rig==
Received: by 10.236.184.135 with SMTP id s7mr6292050yhm.29.1334945009112;
	Fri, 20 Apr 2012 11:03:29 -0700 (PDT)
Received: from [192.168.1.3] (dpc674485156.direcpc.com. [67.44.85.156])
	by mx.google.com with ESMTPS id u15sm4393965anb.9.2012.04.20.11.03.24
	(version=SSLv3 cipher=OTHER); Fri, 20 Apr 2012 11:03:28 -0700 (PDT)
Message-ID: <4F91A4E4.2090608@gmail.com>
Date: Fri, 20 Apr 2012 11:03:16 -0700
From: j <vwyodapink@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120406 Thunderbird/11.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4F88ACCE.1030202@gmail.com> <4F88ADA3.5030804@gmail.com>
	<4F8C9902.8020904@gmail.com> <4F8C9D26.9050500@mlbassoc.com>
	<4F8C9E68.9050106@gmail.com> <4F8CCAAA.6050406@gmail.com>
	<CAHJAAqeFgtzf1x934XB-2AP2bomie29g7Ns4Ztt51MLLaOA+hw@mail.gmail.com>
	<4F8D9245.3080908@mlbassoc.com>
	<CAHJAAqcf7O8i9tOegb=GeP9Da8z4Vgw5ohd1JgHLeQg8LTK3ig@mail.gmail.com>
	<4F8DBFF3.2060508@gmail.com> <4F8DC5B5.600@windriver.com>
	<4F8DC939.90208@gmail.com> <4F8DCFC4.9010508@gmail.com>
	<4F8DDDB7.5010605@gmail.com> <4F8E0CDF.6040401@gmail.com>
	<CAMKF1sqys83Vu1pv-_3r-RpUe894vQrwpJ1K7NCsyfHXb8vBYA@mail.gmail.com>
	<4F8E53DD.6060404@gmail.com>
	<CAMKF1spO2U+Va9pUnr9pABL9rw_Bc1GBZvrpggXNNfcUg7XrGA@mail.gmail.com>
	<4F8F8749.8000803@gmail.com>
	<CAMKF1spNs63FypJRj332WJzwL9M_eoMFqbiVYzM7BLCim6-9MQ@mail.gmail.com>
	<4F90B056.5020209@gmail.com> <4F9144BE.1070508@mlbassoc.com>
In-Reply-To: <4F9144BE.1070508@mlbassoc.com>
Subject: Re: [oe-core] ld segfault cant figure it out
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
X-List-Received-Date: Fri, 20 Apr 2012 18:12:59 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/20/2012 04:13 AM, Gary Thomas wrote:
> On 2012-04-19 18:39, j wrote:
>> On 04/18/2012 11:24 PM, Khem Raj wrote:
>>> On Wed, Apr 18, 2012 at 8:32 PM, j<vwyodapink@gmail.com> wrote:
>>>>> on ubuntu edit /etc/security/limits.conf on build host and then add
>>>>> * soft core unlimited
>>>
>>> btw. reboot your machine after this change is made
>>>
>>>>> that should generate core files. After this search for core* files in
>>>>> build tree
>>>>> and see if there are any then debug them with gdb to diagnose it 
>>>>> further
>>>>>
>>>>> Now I am not sure if those segfaults directly relate to 
>>>>> malfunction of
>>>>> image
>>>>> if thats the case but its likely. You should also try to explore the
>>>>> reasons why
>>>>> the image fails to behave as expected.
>>>> I will do as suggested as well as do a full image build again and 
>>>> see if I
>>>> can find out all that is not working. Thank you for the extra 
>>>> debugging info
>>>> and suggestions. Are there any keywords to search through all the 
>>>> files for
>>>> including the normal log files, it may help me track down things even
>>>> further.
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>> did the reboot went through the build but yet did not produce any 
>> core files. But I noticed ulimit was still 0 so changed it to 
>> unlimited now and building again, hopefully that
>> will get some core dumps. Will post back once I have more info and 
>> will separate anything by which machine as even the 2nd borrowed 
>> machine segfaults in the same way.
>
> Is your borrowed machine also running ArchLinux?  If so, have
> you tried anything else - Ubuntu, Fedora, etc?  As far as I can
> tell, you're the only one suffering these problems and also you
> seem to be the only one using ArchLinux.
>
> Note: I tried to duplicate your problems here, but I've never used
> ArchLinux and it's so primitive and hard to use (compared to what
> I use everyday) that I simply don't have the time to mess with it
> any more.
>
Also though not mentioned in my last email Gary THANK YOU!! 3rd machine 
has started build now. I installed 11.04 i386. This has intel graphics, 
where as the other 2 had nvidia. But this will be another slow build.


