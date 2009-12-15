Received: from mail-yx0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <camelguo@gmail.com>) id 1NKQd8-0006qF-Kw
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Dec 2009 07:11:33 +0100
Received: by yxe5 with SMTP id 5so3505943yxe.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Dec 2009 22:09:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:content-type:to:subject
	:references:date:mime-version:content-transfer-encoding:from
	:organization:message-id:in-reply-to:user-agent;
	bh=VjGXZ3YgNmTLCvgJVM933xMnWMVVgPBtSLgLjmwXp1A=;
	b=DCg38YAcgbukPBpHSe8L7lyf2KBWqVdfHaIJv6fPrA+xMZpKFo0mhaa+ptOQBZHjr2
	9NctT6JY8SCNcXXmCAFi7RdLlQF9vHJKZOAwFhUXX/W/mJPw1/S6jrMDjCGVk/klPiGi
	w0QmKoeBMMXjIH5RZSW56NVcmzS+XLDhM2GBY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=content-type:to:subject:references:date:mime-version
	:content-transfer-encoding:from:organization:message-id:in-reply-to
	:user-agent;
	b=I3axfUqA28GR9tVGiX88sU2X8gCVmhkYyaYwc7FbowUQ8qn/wTvsM2OQgGJLLf8AAs
	mse6S5SBJbnGk8xiHH1LXMbOskfwxS1BS0HZX+VZiK9aEqbyEd2amOO3iF80bgIqMdcx
	npGQzVJKHox8n/171A/nSYc7QqR5pe/bqFRnM=
Received: by 10.151.20.8 with SMTP id x8mr8880962ybi.163.1260857384204;
	Mon, 14 Dec 2009 22:09:44 -0800 (PST)
Received: from guohr-laptop-ubuntu ([123.162.68.164])
	by mx.google.com with ESMTPS id 20sm4019531iwn.13.2009.12.14.22.09.36
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 14 Dec 2009 22:09:39 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <op.u4yom7zgmn1qzu@guohr-laptop-ubuntu>
	<200912150650.46475.holger+oe@freyther.de>
Date: Tue, 15 Dec 2009 14:09:29 +0800
MIME-Version: 1.0
From: "Guo Hongruan" <camelguo@gmail.com>
Organization: Gulessoft, Inc
Message-ID: <op.u4yt13aymn1qzu@guohr-laptop-ubuntu>
In-Reply-To: <200912150650.46475.holger+oe@freyther.de>
User-Agent: Opera Mail/10.10 (Linux)
X-SA-Exim-Connect-IP: 209.85.210.175
X-SA-Exim-Mail-From: camelguo@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Patch for bitbake to enable the --ignore-deps option accept regular expression
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
X-List-Received-Date: Tue, 15 Dec 2009 06:11:33 -0000
Content-Type: text/plain; charset=utf-8; format=flowed; delsp=yes
Content-Transfer-Encoding: Quoted-Printable

Hi,
    Sorry. I will recreate the patch using git as soon as possible.

> 2.) You have added the same code to 3 (or 4... I don't want to count) =
 =

> places,
> I think this warrants to create a new python helper function (feel fre=
e  =

> to ask
> me how to do it) to have some code sharing.
    In fact, this is my first python code. So you may need to pay more  =

attention on reviewing it. (I used to be a C programmer, everything seem=
  =

strange)


=E5=9C=A8 Tue, 15 Dec 2009 13:50:46 +0800=EF=BC=8CHolger Hans Peter Frey=
ther  =

<holger+oe@freyther.de> =E5=86=99=E9=81=93:

> On Tuesday 15 December 2009 05:12:41 Guo Hongruan wrote:
>> Hi guys,
>>     I modified the bitbake to enable it accept regular expression wit=
h  =

>> -I
>> option. Now I can generate dot file without any native packages, usin=
g  =

>> the
>> following command:
>>
>> bitbake -g helloworld-image -I "native$"
>>
>>     Hope it is useful for you
>>
>> Thanks a lot!
>>
>
> Awesome! Could you please do me three more favors?
>
> 1.) Use git commit and send us the result of git format-patch. This wa=
y  =

> you
> will be properly credited as the author of the change.
>
> 2.) You have added the same code to 3 (or 4... I don't want to count) =
 =

> places,
> I think this warrants to create a new python helper function (feel fre=
e  =

> to ask
> me how to do it) to have some code sharing.
>
> 3.) Once you have factored out the code into a method that returns  =

> True/False
> depending on if you filter it or not... You can directly return on the=
  =

> first
> match instead of doing the regexp on every other dependency as well.
>
>
> thanks a lot!
>
> 	z.
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel=



-- =

Guo Hongruan, Embedded Linux Consultant
Mobile: +86-0-13484056007
Skype: camelguo
Twitter: camelguo
http://www.gulessoft.com


