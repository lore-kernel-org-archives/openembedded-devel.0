Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1OvJ0R-0002BV-S3
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 Sep 2010 02:04:17 +0200
Received: by pwj1 with SMTP id 1so1874081pwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Sep 2010 17:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:references:in-reply-to
	:content-type:content-transfer-encoding;
	bh=gxOUCfgi8UA7FzzZXrXQYa78TcPfpmJHDCD3yJQFQcs=;
	b=W8PXeC+JH67QaBi+TSxPv1RGxrCR6UIsIXI93Lgmk+6woHqcNB26hat7qA+r6oQMe+
	/3u10GsBeI6n6Wd7swkYVR/B183emOsQ+2h5gbovV7trz7YTOyg0k/rDnCbrqu8x6yTG
	Igq3mhXWDIRJdy7ugVAlnS5bOtdABEFJN7OXc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=OlHRiKGnd4qu3hZiRARs98hO0/ZO7xTiG39J6D5wMWow2Q5TStWxhRl0k1cgTc1RiI
	a6ki80aahSLy9BOUwB0ygNgE1gp0ACyLNgrQ/lftgPMvGpqWMhW2lDyk6eMKWXeMPJaN
	pgGO3XU5vLjqEAmCO6tPGU6tWDfwpoNvKpBXs=
Received: by 10.142.185.12 with SMTP id i12mr40952wff.227.1284422607549;
	Mon, 13 Sep 2010 17:03:27 -0700 (PDT)
Received: from [10.0.0.5] (eth7090.sa.adsl.internode.on.net [150.101.58.177])
	by mx.google.com with ESMTPS id n34sm9371349wfa.2.2010.09.13.17.03.25
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 13 Sep 2010 17:03:26 -0700 (PDT)
Message-ID: <4C8EBBC8.1060605@gmail.com>
Date: Tue, 14 Sep 2010 09:33:20 +0930
From: Graham Gower <graham.gower@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.11) Gecko/20100721 Thunderbird/3.0.6
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org, 
 bitbake-dev@lists.berlios.de
References: <AANLkTi=6fss18KJvTBYf3oV1MXkgJwT7cqTRz4rK+aTx@mail.gmail.com>	<4C8E8FC5.4020507@balister.org>
	<AANLkTi=fJWrPssjGvPENzuHsXaPmCZTJRRGmzoJxyx9u@mail.gmail.com>
In-Reply-To: <AANLkTi=fJWrPssjGvPENzuHsXaPmCZTJRRGmzoJxyx9u@mail.gmail.com>
X-SA-Exim-Connect-IP: 209.85.160.47
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: testing branch 2010-09-13
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
X-List-Received-Date: Tue, 14 Sep 2010 00:04:17 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 09/14/2010 09:03 AM, Graham Gower wrote:
> On 14 September 2010 06:25, Philip Balister <philip@balister.org> wrote:
>> On 09/13/2010 02:21 PM, Cliff Brake wrote:
>>>
>>> last weeks testing cycle was a success.
>>>
>>> http://wiki.openembedded.net/index.php/Testing#Testing_Log
>>>
>>> Firefox is failing in some configurations if the same version of
>>> firefox is installed on the host system -- it would be nice to get
>>> this resolved this week.
>>>
>>> testing-next branch has been updated and is ready for clean builds.
>>
>> ERROR: Task 1046
>> (virtual:native:/srv/oe-builds/testing/openembedded/recipes/qemu/qemu_0.12.5.bb,
>> do_compile) failed with exit code '1'
>> ERROR: __init__() takes at most 3 arguments (4 given)
>>
>> I see this building the testing branch on my F13 machine. Normally I disable
>> binary locales, but left them enabled for the testing build. Anyone have any
>> clue what is going on?
>>
>> Philip
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
> 
> Its not quite the same, and I'm not quite at testing-next
> (b9bcb18a4435491bad5cd76ecf26a857b2f40800), but my bitbake -k world
> halted like this (bitbake is
> c07cc08f7fd503ac3013ccc43c79198c4c3b7b29):
> 
> ERROR: p4-05.2:
> http://filehost.perforce.com/perforce/r05.2/bin.linuxmips/p4 cannot
> check archive integrity
> ERROR: Error executing python function in 'do_fetch'
> Traceback (most recent call last):
>   File "/home/grg/oe2/bitbake/lib/bb/utils.py", line 334, in better_exec
>     exec(code, _context, context)
>   File "do_fetch", line 4, in <module>
>   File "do_fetch", line 2, in do_fetch
>   File "/home/grg/oe2/bitbake/lib/bb/build.py", line 183, in exec_func
>     exec_func_python(func, d, runfile, logfile)
>   File "/home/grg/oe2/bitbake/lib/bb/build.py", line 234, in exec_func_python
>     raise FuncFailed(func, d, logfile)
> TypeError: __init__() takes at most 3 arguments (4 given)
> 
> ERROR: Printing the environment of the function
> ERROR: __init__() takes at most 3 arguments (4 given)


Something like this, to fix the last commit?

diff --git a/lib/bb/build.py b/lib/bb/build.py
index b7c4472..70554f8 100644
--- a/lib/bb/build.py
+++ b/lib/bb/build.py
@@ -231,7 +231,7 @@ def exec_func_python(func, d, runfile, logfile):
         if sys.exc_info()[0] in (bb.parse.SkipPackage, bb.build.FuncFailed):
             raise
 
-        raise FuncFailed(func, d, logfile)
+        raise FuncFailed(func, logfile)
 
 def exec_func_shell(func, d, runfile, logfile, flags):
     """Execute a shell BB 'function' Returns true if execution was successful.
@@ -274,7 +274,7 @@ def exec_func_shell(func, d, runfile, logfile, flags):
     if ret == 0:
         return
 
-    raise FuncFailed(func, d, logfile)
+    raise FuncFailed(func, logfile)
 
 
 def exec_task(task, d):


