Received: from [64.233.162.227] (helo=nz-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <pmiscml@gmail.com>) id 1HW7Np-0006w8-PR
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Mar 2007 10:50:26 +0200
Received: by nz-out-0506.google.com with SMTP id m22so1478317nzf
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Mar 2007 01:50:24 -0700 (PDT)
Received: by 10.65.103.17 with SMTP id f17mr15057797qbm.1174985423949;
	Tue, 27 Mar 2007 01:50:23 -0700 (PDT)
Received: from cube ( [82.193.98.7])
	by mx.google.com with ESMTP id 36sm12561297nzk.2007.03.27.01.50.21;
	Tue, 27 Mar 2007 01:50:22 -0700 (PDT)
Date: Tue, 27 Mar 2007 11:50:21 +0300
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Priority: 3 (Normal)
Message-ID: <1109720343.20070327115021@gmail.com>
To: "Mark Gollahon" <golly@stellarwerx.com>
In-Reply-To: <1174943520.1151@gatekeeper.stellarwerx.com>
References: <1848684762.20070325211238@gmail.com>
	<1174943520.1151@gatekeeper.stellarwerx.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [RFC] Allow to limit generated binary locales topredefined list
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 27 Mar 2007 08:50:32 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Mark,

Tuesday, March 27, 2007, 12:12:00 AM, you wrote:

> Paul:

> This doesn't seem to be working for me.  I've tried:

> GLIBC_GENERATE_LOCALES = "en_US en_US.UTF-8"

> GLIBC_GENERATE_LOCALES = "en_US,ISO-8859-1 en_US.UTF-8,UTF-8"

> GLIBC_GENERATE_LOCALES = "en_US ISO-8859-1,en_US.UTF-8 UTF-8"

[]

> Do I need to use bitbake 1.8.x to get this to work??

  No, just to read docs/description for things you want to use
carefully. In this respect, I made sure that it can be read in
several places:

1. In this thread, and even in message you quoted below.
2. In the original ticket, #1966.
3. In the commit message.
4. And of course in conf/local.conf.sample in OE tree.


> Regards,
> -Mark Gollahon


> Paul Sokolovsky wrote ..
>> Hello,
>> 
>> >  Binary locale generation for the entire locate set provided by GLIBC
>> > takes noticeable amount of time (several hours).
>> [...]
>> >   The solution would be to allow to optionally constrain set of
>> > generated locales to a predefined list.
>> 
>> > GLIBC_GENERATE_LOCALES = "en_GB.UTF-8 de_DE.UTF-8"
>> 
>>   Committed.
>> 
>> 
>> []
>> 
>> -- 
>> Best regards,
>>  Paul                            mailto:pmiscml@gmail.com
>> 
>> 
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



