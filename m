Received: from blath.larsmichelsen.com ([78.46.117.178] helo=larsmichelsen.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lm@larsmichelsen.com>) id 1Pghrs-00016v-Fv
	for openembedded-devel@lists.openembedded.org;
	Sat, 22 Jan 2011 19:07:20 +0100
Received: from localhost (localhost.localdomain [127.0.0.1])
	by larsmichelsen.com (Postfix) with ESMTP id 8E3C59544015
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Jan 2011 19:06:39 +0100 (CET)
Received: from larsmichelsen.com ([127.0.0.1])
	by localhost (blath.larsmichelsen.com [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id rwzcblT4eHXo
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Jan 2011 19:06:39 +0100 (CET)
Received: from [192.168.4.106] (g229015111.adsl.alicedsl.de [92.229.15.111])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested) (Authenticated sender: lm)
	by larsmichelsen.com (Postfix) with ESMTPSA id 1E92F9544005
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Jan 2011 19:06:39 +0100 (CET)
Message-ID: <4D3B1CB3.1090209@larsmichelsen.com>
Date: Sat, 22 Jan 2011 19:06:43 +0100
From: Lars Michelsen <lm@larsmichelsen.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2.104i Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1295710776-10995-1-git-send-email-lm@larsmichelsen.com>
	<1295711967.3850.221.camel@mattotaupa>
In-Reply-To: <1295711967.3850.221.camel@mattotaupa>
Subject: Re: [PATCH] python-caldav: New reciep - CalDAV rfc4791 client
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
X-List-Received-Date: Sat, 22 Jan 2011 18:07:20 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello Paul,

thanks for your review.

On 22/01/11 16:59, Paul Menzel wrote:
> Am Samstag, den 22.01.2011, 16:39 +0100 schrieb Lars Michelsen:
>> This patch adds a new reciep for the python caldav client library module.
>
> s/reciep/recipe/ (also in commit summary)
>
> It is not policy, but I like also to have a note in the commit message,
> what distribution and architecture this recipe was build tested with.
> And if it was tested.

Ok, will add those notes in the next patches.

> I did not know of `${SRCNAME}` before. I think `${PN}` is more common
> (since it is shorter?). Now I see that you defined it in the beginning.
> You can use `${PN}`.

I just copied most parts from other python-* recipes. The most of them 
seem to use SRCNAME.

PN containes the whole package name, right? Means 'python-caldav' in 
this case while SRCNAME only contains the module name 'caldav'.

>
>> +inherit setuptools
>> +
>> +SRC_URI[md5sum] = "e5eace7a3b6b7f511a1929a539e6a15d"
>> +SRC_URI[sha256sum] = "4a3b1855000feb8023ab05f8c9e0cfa1648a9abab9ca65ad3e933c22bab61310"
>
> I think these are put right below the first occurrence of `SRC_URI`. But
> the style guide [1] does not mention it explicitly.

Same here. Seam a lot of python-* packages have it at the end of the 
file. While creating/editing such a file it is more intuitive to have 
these definitions right below SRC_URI. So I aggree with you and will 
move these lines.

I just posted a 2nd version of the patch.

Thanks & Regards,
Lars


