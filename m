Return-Path: <sledz@dresearch-fe.de>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id 1A9B372A23
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Apr 2015 08:35:24 +0000 (UTC)
Received: by wiaa2 with SMTP id a2so9251332wia.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Apr 2015 01:35:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=plM3VxzeM7EXesRXAhjVHfS5z+1KRx5dVvKUzybnqz4=;
	b=XpRBvd1Dx1SI0C6jGOvzwXyZZa8xkfrmpqVgXqXrpU7z8eorpdYHoR5YwKWdVEQBe5
	VglOmo857NlRQKY9GxI2UiZpnWl/zmR7OZ9wVjTloEKs46BWfxWpHmIoenGV8i9IqBHe
	KY2LUdpJRbCI2A4qIzuJN2lTYyVtkOHWqn1lDYEzEnH3l5AqNGs1RH5ep8h+BahWTMO9
	bGusWiQaA175cRBK1Zh2pzpc/c/bzmOge2LOS3HJ3XwRBklVsp5oE98n5atR314PSud8
	2jbMSe0IHbU3pfP8u+nopr94nwwPbyjVYr50ChZ9ERJB3zG7/OJYRvXqBj5xLEJs6lNt
	yn7A==
X-Gm-Message-State: ALoCoQlX3jOL7sMW7qMvtqXDcmDliZc3qcJU69S+chA2SX4TwJEANQV4uXBnkpR1zRw4PC4LPs+O
X-Received: by 10.194.60.203 with SMTP id j11mr38417331wjr.5.1428395725126;
	Tue, 07 Apr 2015 01:35:25 -0700 (PDT)
Received: from ?IPv6:2001:bf0:c080:403:3ca1:db9f:ae2e:51cc?
	([2001:bf0:c080:403:3ca1:db9f:ae2e:51cc])
	by mx.google.com with ESMTPSA id e2sm9865831wjy.46.2015.04.07.01.35.23
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 07 Apr 2015 01:35:24 -0700 (PDT)
Message-ID: <552396CA.7060806@dresearch-fe.de>
Date: Tue, 07 Apr 2015 10:35:22 +0200
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <551143C5.90207@dresearch-fe.de>
	<1427195564.14020.31.camel@linuxfoundation.org>
In-Reply-To: <1427195564.14020.31.camel@linuxfoundation.org>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] fetch race problem
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
X-List-Received-Date: Tue, 07 Apr 2015 08:35:27 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Am 24.03.2015 um 12:12 schrieb Richard Purdie:
> On Tue, 2015-03-24 at 12:00 +0100, Steffen Sledz wrote:
>> We hit the following problem in oe-classic. And we're not sure if this problem may occur in current oe too, or if it is fixed there.
>>
>> They are two or more recipes (may be in different layers) for packages with sources from the same (git) repository. If the fetching from the repo needs some time we see "file changed as we read it" errors in all likelihood.
>>
>> ------------------> snip <-------------------
>> ERROR: Error evaluating '${PF}:${P}:${PN}:${BP}:${BPN}:files:.'
>> Traceback (most recent call last):
>>   File "/CACHE/jenkins-workspace/foo/bitbake/lib/bb/data_smart.py", line 116, in expandWithRefs
>>     s = __expand_var_regexp__.sub(varparse.var_sub, s)
>>   File "/CACHE/jenkins-workspace/foo/bitbake/lib/bb/data_smart.py", line 60, in var_sub
>>     var = self.d.getVar(key, 1)
>>   File "/CACHE/jenkins-workspace/foo/bitbake/lib/bb/data_smart.py", line 260, in getVar
>>     return self.expand(value, var)
>>   File "/CACHE/jenkins-workspace/foo/bitbake/lib/bb/data_smart.py", line 132, in expand
>>     return self.expandWithRefs(s, varname).value
>>   File "/CACHE/jenkins-workspace/foo/bitbake/lib/bb/data_smart.py", line 116, in expandWithRefs
>>     s = __expand_var_regexp__.sub(varparse.var_sub, s)
>> FetchError: Fetch command export HOME="/var/lib/jenkins"; export PATH="/CACHE/jenkins-workspace/foo/OE//bin:/CACHE/jenkins-workspace/foo/openembedded/bin:/CACHE/jenkins-workspace/foo/OE/tmp.7/sysroots/x86_64-linux/usr/armv5te/bin:/CACHE/jenkins-workspace/foo/OE/tmp.7/sysroots/x86_64-linux/usr/sbin:/CACHE/jenkins-workspace/foo/OE/tmp.7/sysroots/x86_64-linux/usr/bin:/CACHE/jenkins-workspace/foo/OE/tmp.7/sysroots/x86_64-linux/sbin:/CACHE/jenkins-workspace/foo/OE/tmp.7/sysroots/x86_64-linux//bin:/CACHE/jenkins-workspace/foo/OE/bin-HYP-6339:/CACHE/jenkins-workspace/foo/bitbake/bin:/sbin:/usr/sbin:/bin:/usr/bin"; tar -czf /var/lib/jenkins/sources/git_bitbucket.org.dresearchfe.drconfig.git.tar.gz ./.git/* failed with signal 1, output:
>> /bin/tar: ./.git/objects/pack/tmp_pack_BwThcc: File removed before we read it
>> /bin/tar: ./.git/objects/pack/tmp_pack_Ans7xK: File removed before we read it
>> /bin/tar: ./.git/objects/pack: file changed as we read it
>> ------------------> snap <-------------------
>>
>> Is this a problem in oe-core too (or oe-classic only)?
>>
>> Any ideas how to avoid such errors?
> 
> In theory bitbake has locks on files in DL_DIR, even for git
> repositories so it should only touch the repo with one fetch process at
> a time even if multiple recipes reference the same thing.
> 
> There were some big fetcher reworks in more recent versions of bitbake.
> For OE-Classic, I'm guessing you're using an older version. You could
> try transplanting the modern fetcher core onto your older bitbake I
> guess.

I do not feel competent enough to try this.

Is it possible (in oe-classic) to mark two or more recipes (or single stages) to run exclusive?



