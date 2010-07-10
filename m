Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1OXU51-0000d3-UF
	for openembedded-devel@lists.openembedded.org;
	Sat, 10 Jul 2010 09:02:32 +0200
Received: by iwn34 with SMTP id 34so3063766iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Jul 2010 23:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=K/6JgtsPyBF6Ty8FgzNhd24SCnnUmCihai6oGZdAGOA=;
	b=u6eJGnoBY7o+tnqo7wYqjHVeG6vyv4qXXORbON7vJJM8Ykl1d8IWiEAKTU9XZpYuuG
	BJAY75aqtJXxDFZYw/CzAa3Ke4Hkj7KtnJDfdAx2H2wevWXta9vrncCB7k1FPpFcIZRP
	CJb86WzDQWPJ374E2TcJkwnyZXXePpUZaIoPs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=SzkNPLoSbNpPLPBH425lAOsUzXp0wpZtLRpTgju/QWZ8bvTehEcEL3Ck/nbluhd4Fw
	4AF+26j1MZxASpR3jB33PTW+TAyEgyyQiP9DGuAAh07JBH13Sl6ksuAtrdpf8J0r6xqr
	UNpvxLhCspy6R/Nbbrp94CsRPZIVmvt23Y5cM=
MIME-Version: 1.0
Received: by 10.231.35.199 with SMTP id q7mr10895812ibd.47.1278745057535; Fri, 
	09 Jul 2010 23:57:37 -0700 (PDT)
Received: by 10.231.157.196 with HTTP; Fri, 9 Jul 2010 23:57:37 -0700 (PDT)
In-Reply-To: <20100708172112.GD12383@denix.org>
References: <4C356475.2060208@gmail.com>
	<20100708172112.GD12383@denix.org>
Date: Sat, 10 Jul 2010 16:27:37 +0930
Message-ID: <AANLkTiki9XSxGPwAu-V2BiCa8h9eiFuQvCjO4kxF7N8Q@mail.gmail.com>
From: Graham Gower <graham.gower@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] Badness with -ibad, a replacement for 	zecke-no-host-includes.patch.
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
X-List-Received-Date: Sat, 10 Jul 2010 07:02:32 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 9 July 2010 02:51, Denys Dmytriyenko <denis@denix.org> wrote:
> On Thu, Jul 08, 2010 at 03:09:01PM +0930, Graham Gower wrote:
>> This patch introduces a new command line parameter to gcc (at
>> Zecke's suggestion), -ibad, which may be used to specify
>> blacklisted include prefixes. E.g.
>>
>> grg@eye7:/tmp$ ~/oe2/tmp/cross/mipsel/bin/mipsel-angstrom-linux-gcc -c test.c -ibad /usr/include -I /usr/include
>> CROSS COMPILE Badness: /usr/include in INCLUDEPATH: /usr/include
>>
>> This makes it much easier to add new blacklisted include paths,
>> with a trivial edit to bitbake.conf. No additional paths have
>> been added yet, but my motivation for this was to add
>> /usr/X11R6/include and /usr/X11/include.
>>
>> Please note that the bitbake.conf change will break builds with
>> versions of gcc that do not accept this -ibad parameter. I have
>
> Does it mean any external toolchain will be broken or require changes to the
> bitbake.conf?

Yes.


