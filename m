Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <leonid.titov@gmail.com>) id 1RtQP7-0000Ta-EC
	for openembedded-devel@lists.openembedded.org;
	Fri, 03 Feb 2012 22:10:45 +0100
Received: by bke17 with SMTP id 17so3614137bke.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 Feb 2012 13:02:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=WpZNoLPR32B3MiW1y0usSHZzhAz6IUzRINmrtbGaZa4=;
	b=ZmDFVrFCH/Lx0T8AZQu31U8OzdlGRIHETPBxFzNzgV9P4HltF6ys+GmoHVlUzulv7i
	leRhPAI2HCfcu+E1KLfeG0gYrQTebCyrgbcHoZp3pX/l7vFD9ZJRDM4Ec8J08AIz7EqW
	a9+4weEEafkxS9LVjegon5q5hw5YPcw+qml0Q=
Received: by 10.205.132.138 with SMTP id hu10mr4111660bkc.117.1328302967571;
	Fri, 03 Feb 2012 13:02:47 -0800 (PST)
Received: from [192.168.0.178] ([188.227.12.162])
	by mx.google.com with ESMTPS id z15sm19819147bkd.7.2012.02.03.13.02.42
	(version=SSLv3 cipher=OTHER); Fri, 03 Feb 2012 13:02:44 -0800 (PST)
Message-ID: <4F2C4B6A.7000504@gmail.com>
Date: Sat, 04 Feb 2012 01:02:34 +0400
From: =?UTF-8?B?0JvQtdC+0L3QuNC0INCi0LjRgtC+0LI=?=
 <leonid.titov@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.0;
	rv:10.0) Gecko/20120129 Thunderbird/10.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4F291A06.4000406@gmail.com>
	<CAMKF1so7cMo0qiOPLuJrpk7kNuyk3dYEEZpM8nSGFKXMuUdoGQ@mail.gmail.com>
	<CANLRtZyE_ctYhoJmZd5KUJt70SG=ZU7T1TJCF12viQQgSM063Q@mail.gmail.com>
	<CAMKF1spUMxnuVGb8zw8LM3m5bdUq1tTV74SwjUD8yL0FXysGdg@mail.gmail.com>
In-Reply-To: <CAMKF1spUMxnuVGb8zw8LM3m5bdUq1tTV74SwjUD8yL0FXysGdg@mail.gmail.com>
Subject: Re: Can't build openembedded: fail in picosam9_git.bb
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
X-List-Received-Date: Fri, 03 Feb 2012 21:10:46 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

That's helped. Thanks a lot, Khem!

01.02.2012 23:46, Khem Raj пишет:
> 2012/2/1 Leonid Titov<leonid.titov@gmail.com>:
>> I do have a conf/machine/picosam9.conf. It and recipe are exact as in
>> repo (http://cgit.openembedded.org/openembedded/tree/conf/machine/picosam9.conf
>> and http://cgit.openembedded.org/openembedded/tree/recipes/linux/picosam9_git.bb).
>>
> in picosam9_git.bb you have
>
>
> COMPATIBLE_HOST = "arm.*-linux"
>
> make it
>
> COMPATIBLE_HOST = "arm.*-linux*"
>
> that said your problem is with fetching and I have seen
> problems with fetching from gitorious using bitbake
> It happens for efikamx kernel which was also hosted on
> gitorious. Is there any other place this repo is mirrored ?
> if yes use that.
>
>> 2012/2/1, Khem Raj<raj.khem@gmail.com>:
>>> 2012/2/1 Leonid Titov<leonid.titov@gmail.com>:
>>>> I've got a problem with building console-image for MACHINE=picosam9. It
>>>> fails while processing picosam9_git.bb with these messages:
>>> do you have machine conf file for picosam9 ?
>>> recipes and machine confs  are different files.
>>> you have to show us both files here. That said
>>> your error is a fetching error which means something
>>> is wrong with either your SRC_URI or the remote server
>>> which is feeding the sources of this recipe
>>>
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>>
>>
>> --
>> С уважением,
>>   Леонид.
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



