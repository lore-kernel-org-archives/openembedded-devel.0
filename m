Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1P2w8P-0006TI-6r
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Oct 2010 03:16:05 +0200
Received: by iwn2 with SMTP id 2so7591477iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Oct 2010 18:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=3FEoWDIbyQB1myaI0vm/VpmH6uMedej8K9EBErnsg2w=;
	b=F8pUVDdlcnw1/qhGRz8H1zl9H++3PqJWCdlQNF9ZXfxqbS6U4V8/nTcaMDA3mkRIqq
	ZxNTdEe+Z7D3UgaQ6+eEto1TqEj2y4UH1WMAC5FuV5fTqjwinXkATw3VBdwOXZz8v8hQ
	xp0T0drtLxaq+pVxHgYZIuOytHvCe4eRLIZfY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=NamGLOGn80NYY4d0iKO/Omx+EJlDutkBjqchrLTouHURZXPP8BgPa2pt79z8R1R2M4
	SQY5QQ0QuK9S4TWiEKfm2hSdA08VGWlJDKqBe2tHF+CAcylfDhXTkwlPyP5GtEGfbztV
	/cPeqjZohuJrknPANtqyFfYpVosCgJEhPAqG0=
Received: by 10.231.182.204 with SMTP id cd12mr11140827ibb.101.1286241342055; 
	Mon, 04 Oct 2010 18:15:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.199.1 with HTTP; Mon, 4 Oct 2010 18:15:21 -0700 (PDT)
In-Reply-To: <AANLkTikU775A=kCNE3wkvvJPvc_E=3=8P-fycL9st1HR@mail.gmail.com>
References: <AANLkTinpLXC9tZ0viEHhYPzjBt=0+nG6eRdrw2Ur1ey7@mail.gmail.com>
	<AANLkTinhhE8HU-aheVO_-DojZ5PoondyL3whd-4whM7w@mail.gmail.com>
	<AANLkTikU775A=kCNE3wkvvJPvc_E=3=8P-fycL9st1HR@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 4 Oct 2010 18:15:21 -0700
Message-ID: <AANLkTi=V3e7PnSgd4CXZHMXucQnN9Dokr7ooewT1rSzz@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: trouble building gcc-cross-initial first time
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
X-List-Received-Date: Tue, 05 Oct 2010 01:16:07 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Oct 4, 2010 at 5:29 PM, Graham Gower <graham.gower@gmail.com> wrote:
> On 5 October 2010 08:53, Graham Gower <graham.gower@gmail.com> wrote:
>> On 4 October 2010 19:43, Jan Paesmans <jan.paesmans@gmail.com> wrote:
>>> Hello all,
>>>
>>> When building an image for one of my devices for the first time,
>>> bitbake always seems to have a problem with building
>>> gcc-cross-initial. It has the following error:
>>>
>>> | In file included from
>>> /home/jan/src/prodata_openembedded/build/tmp/armv5te/work/armv5te-angstrom-linux-gnueabi/gcc-cross-initial-4.3.3-r13.1/gcc-4.3.3/gcc/sparseset.c:22:
>>> | /home/jan/src/prodata_openembedded/build/tmp/armv5te/work/armv5te-angstrom-linux-gnueabi/gcc-cross-initial-4.3.3-r13.1/gcc-4.3.3/gcc/system.h:418:
>>> error: conflicting types for 'strsignal'
>>> | /usr/include/string.h:564: note: previous declaration of 'strsignal' was here
>>>
>>> However, when I restart the exact same bitbake command, the build
>>> continues without a problem.
>>>
>>> I run massive parallel builds with 8 bitbake threads and make -j 8, so
>>> I suspect that this has something to do with it. One of the tasks the
>>> is started before is linux-libc-headers_2.6.31.bb, do_package_stage.
>>> Could it be that this task hasn't finished yet while the
>>> gcc-cross-initial needs it?
>>>
>>> Regards,
>>>
>>> Jan
>>>
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>>
>>
>> I've seen this with gcc 4.3.3 also. I've not seen it with 4.4.4 or 4.5.
>>
>> -Graham
>>
>
> Fix here. http://lists.o-hand.com/poky/1917.html
>
> A related bug with the relevant fix has made it in to gcc 4.3.5.
> http://gcc.gnu.org/bugzilla/show_bug.cgi?id=38591
>
> Is there interest in applying this to the gcc 4.3.3/4.3.4 recipes, or
> would folks be happier with adding gcc 4.3.5? (And can the earlier
> 4.3.x recipes then be removed?)

Just apply this patch to existing 4.3.3 recipes which is deployed by
distros other 4.3.x recipes are not used infact
they can be removed. As far as 4.3.5 is concerned we can backport
fixed into 4.3.3 someday when I have time I will
do it but it needs testing.

>
> -Graham
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


