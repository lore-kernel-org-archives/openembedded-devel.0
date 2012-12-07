Received: from mail.mlbassoc.com ([65.100.170.105] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1Th4lE-0000g0-KZ
	for openembedded-devel@lists.openembedded.org;
	Fri, 07 Dec 2012 21:43:04 +0100
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id A84E1F81214; Fri,  7 Dec 2012 13:28:38 -0700 (MST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 2DE20F81211;
	Fri,  7 Dec 2012 13:28:37 -0700 (MST)
Message-ID: <50C2517E.5060903@mlbassoc.com>
Date: Fri, 07 Dec 2012 13:28:46 -0700
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <50C228F8.6060805@mlbassoc.com> <20121207191516.072c6bf1@eb-e6520>
	<50C23C92.4020101@mlbassoc.com>
In-Reply-To: <50C23C92.4020101@mlbassoc.com>
Subject: Re: modphp
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
X-List-Received-Date: Fri, 07 Dec 2012 20:43:04 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

On 2012-12-07 11:59, Gary Thomas wrote:
> On 2012-12-07 11:15, Eric B=E9nard wrote:
>> Hi,
>>
>> Le Fri, 07 Dec 2012 10:35:52 -0700,
>> Gary Thomas <gary@mlbassoc.com> a =E9crit :
>>
>>> I just tried to build modphp_5.3.19.bb for my ARM target.
>>>
>>> It seems that the make is using the wrong tools (or libraries),
>>> as it fails with this error:
>>>     | /usr/lib/libbz2.so: could not read symbols: File in wrong forma=
t
>>>     | collect2: error: ld returned 1 exit status
>>>     | make: *** [libphp5.la] Error 1
>>>
>>> Any ideas how to make this work?  Has it ever been built/tested
>>> for a cross target?  I can see that the cross paths for libz and libb=
z2
>>> are being passed to the configure step, but they don't seem to be ref=
lected
>>> in the actual link step when making the modphp.so library.
>>>
>> it was build and run tested here on an ARM target before sending the
>> patches.
>
> So why did it not work for me?  What can I do to diagnose this?

I found that there was a libbz2.la installed in the sysroot/usr/lib
This is what was causing the problem.  I deleted it manually and reran
the build and now the modphp package builds.

I'll continue to look to see how that libbz2.la file got there..

--=20
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


