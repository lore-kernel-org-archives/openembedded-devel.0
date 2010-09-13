Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1OvIXX-0002Mz-U8
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 Sep 2010 01:34:46 +0200
Received: by iwn2 with SMTP id 2so5586912iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Sep 2010 16:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=0SkshY0B0CFsVBRFV2S+6P5RfGSL4kWFBmiLZ1U2DaI=;
	b=cZBWcu+JjgxLPnXZv0PMnayK/KEKSzc8mt2xmm7UWzmbAGCWI7JOHMejAAPWkUM+6t
	8G8YPf13xnkqCsvByvsA0fVMQUhFcYvf5K9XUBfaPsF4HVwNqXwJ+/fGKHYairRNHwfe
	cnSwHucPzaEipTATkVcXwIW6xGPKg6Ga6Ice0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=QVjAjvUiPNp37IHVfEtEOJ28f/2ZjSmvx0cMW8mvDXcf6uL4pFn2lPDYJSEskVleiM
	eK12aiu96HTxuurqjcEAkwKAM1/nL2X0czM5aTsUuFOK6/Yi+J4A6bLXlvHSBIq7yXxj
	eTxdXReWYkMHBVuxPw5418EvYyjPAvtjLmhks=
MIME-Version: 1.0
Received: by 10.231.130.145 with SMTP id t17mr6430965ibs.144.1284420817382;
	Mon, 13 Sep 2010 16:33:37 -0700 (PDT)
Received: by 10.231.161.1 with HTTP; Mon, 13 Sep 2010 16:33:37 -0700 (PDT)
In-Reply-To: <4C8E8FC5.4020507@balister.org>
References: <AANLkTi=6fss18KJvTBYf3oV1MXkgJwT7cqTRz4rK+aTx@mail.gmail.com>
	<4C8E8FC5.4020507@balister.org>
Date: Tue, 14 Sep 2010 09:03:37 +0930
Message-ID: <AANLkTi=fJWrPssjGvPENzuHsXaPmCZTJRRGmzoJxyx9u@mail.gmail.com>
From: Graham Gower <graham.gower@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
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
X-List-Received-Date: Mon, 13 Sep 2010 23:34:46 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 14 September 2010 06:25, Philip Balister <philip@balister.org> wrote:
> On 09/13/2010 02:21 PM, Cliff Brake wrote:
>>
>> last weeks testing cycle was a success.
>>
>> http://wiki.openembedded.net/index.php/Testing#Testing_Log
>>
>> Firefox is failing in some configurations if the same version of
>> firefox is installed on the host system -- it would be nice to get
>> this resolved this week.
>>
>> testing-next branch has been updated and is ready for clean builds.
>
> ERROR: Task 1046
> (virtual:native:/srv/oe-builds/testing/openembedded/recipes/qemu/qemu_0.12.5.bb,
> do_compile) failed with exit code '1'
> ERROR: __init__() takes at most 3 arguments (4 given)
>
> I see this building the testing branch on my F13 machine. Normally I disable
> binary locales, but left them enabled for the testing build. Anyone have any
> clue what is going on?
>
> Philip
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

Its not quite the same, and I'm not quite at testing-next
(b9bcb18a4435491bad5cd76ecf26a857b2f40800), but my bitbake -k world
halted like this (bitbake is
c07cc08f7fd503ac3013ccc43c79198c4c3b7b29):

ERROR: p4-05.2:
http://filehost.perforce.com/perforce/r05.2/bin.linuxmips/p4 cannot
check archive integrity
ERROR: Error executing python function in 'do_fetch'
Traceback (most recent call last):
  File "/home/grg/oe2/bitbake/lib/bb/utils.py", line 334, in better_exec
    exec(code, _context, context)
  File "do_fetch", line 4, in <module>
  File "do_fetch", line 2, in do_fetch
  File "/home/grg/oe2/bitbake/lib/bb/build.py", line 183, in exec_func
    exec_func_python(func, d, runfile, logfile)
  File "/home/grg/oe2/bitbake/lib/bb/build.py", line 234, in exec_func_python
    raise FuncFailed(func, d, logfile)
TypeError: __init__() takes at most 3 arguments (4 given)

ERROR: Printing the environment of the function
ERROR: __init__() takes at most 3 arguments (4 given)


