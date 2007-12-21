Received: from [72.14.220.156] (helo=fg-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <pmiscml@gmail.com>) id 1J5hYe-0004Hk-7b
	for openembedded-devel@lists.openembedded.org;
	Fri, 21 Dec 2007 14:04:56 +0100
Received: by fg-out-1718.google.com with SMTP id 22so144454fge.20
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Dec 2007 04:59:44 -0800 (PST)
Received: by 10.86.99.9 with SMTP id w9mr1114697fgb.58.1198241983916;
	Fri, 21 Dec 2007 04:59:43 -0800 (PST)
Received: from ?192.168.20.166? ( [194.79.8.34])
	by mx.google.com with ESMTPS id 28sm1383943fkx.11.2007.12.21.04.59.42
	(version=SSLv3 cipher=OTHER); Fri, 21 Dec 2007 04:59:43 -0800 (PST)
Date: Fri, 21 Dec 2007 15:04:59 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Mailer: The Bat! (v3.64.01 Christmas Edition) Professional
X-Priority: 3 (Normal)
Message-ID: <119574370.20071221150459@gmail.com>
To: Robert Schuster <theBohemian@gmx.net>
In-Reply-To: <476BAC9A.4070102@gmx.net>
References: <476B8D3A.7010703@gmx.net> <489984884.20071221133816@gmail.com>
	<476BAC9A.4070102@gmx.net>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: java recipe policy for OE
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
X-List-Received-Date: Fri, 21 Dec 2007 13:04:56 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Robert,

Friday, December 21, 2007, 2:07:54 PM, you wrote:

> Hi Paul.

> Paul Sokolovsky schrieb:
>> Hello Robert,
>> 
>> Friday, December 21, 2007, 11:54:02 AM, you wrote:
>> 
>>> Hi,
>>> the toolchain stuff has not been committed yet but I still want to start
>>> a little discussion about the future of java packages in OE.
>> 
>>> a) jar location
>>> The Debian java packages have the fine habit of placing all the jars
>>> (this is what resembles a shared library in java land) into
>>> /usr/share/java. Since Java (still) lacks an automated mechanism to look
>>> up those jars they have to be provided manually when starting an
>>> application (e.g. through a shell script) and putting them into a common
>>> directory saves people's nerves.
>> 
>>> Making the jar location variable is easy, making applications work can
>>> be hard (patching scripts etc). I don't see much value in making this
>>> configurable either.
>> 
>>   What you mean by "variable"? Packages represent finished software
>> bundles, are supposed to be installed in specific place, don't have
>> special requirement of being relocatable, and are not supposed to be
>> tweak by users besides some specially marked config files.
> Yes, I was only talking about being variable/configurable at build time.

>>   Another thing, you should not assume that every distro will *build*
>> packages to be installed to /usr. Instead, OE offers location
>> variables (based on standard GNU configure path vars) for packages to
>> use. So, please don't hardcode /usr or something into your recipes.
>> Default CLASSPATH is ${datadir}/java thus (worth defining datadir_java
>> for that, so it was further configurable).
> Yes, I am using ${datadir}/java everywhere. ${datadir_java} would be no
> problem either. Should that go into bitbake.conf?

  Well, better fits java.bbclass or how you have it, IMHO, or we'd
have bitbake.conf swamped soon ;-).

> And what about
> staging. Is using ${STAGING_DATADIR}/java and
> ${STAGING_DATADIR_NATIVE}/java OK?

  I don't know much about staging personally, but that doesn't sound
wrong.

>> 
>>   So, once again, please don't hardcode paths in *your*
>> .bb's/.bbclass'es. But of course, patching 3rd party code to fully
>> adhere to this is yet another "another task". But if you can check for
>> this at least core components, like standard java runtime,
>> that would be appreciated.
> That would be possible. Is there a nice way to preprocess a patch? I
> would like to run sed on it to replace the hard coded path.

  No OE AFAIK. How it is usually done currently:

1. For GNU configure packages, make them actually use $prefix and
friends where they use wrong assumptions.
2. For adhoc Makefiles, patch them to use some make vars, and pass those
from .bb - via env or directly.

  You may want to see if that would make sense for your cases.

[]

> Regards
> Robert




-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



