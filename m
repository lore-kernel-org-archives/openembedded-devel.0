Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1P15AW-000328-RJ
	for openembedded-devel@lists.openembedded.org;
	Thu, 30 Sep 2010 00:30:33 +0200
Received: by iwn2 with SMTP id 2so1621457iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Sep 2010 15:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=V1xOQrPF9r1uXmc8ncdQ8T+w7xVVooTru08S4/ZS6Cs=;
	b=Pp2ru/3s/gIQZJifYfaGpKpwetI/2/NWIhr7jk0dixmztpAPTQBc6eTQThwWxQeBHj
	gh/QY9ixJ8f4Sf7NSeowrRpaJ1/bT4G2wRqOPDa6+tG1upDpK7ESm3vFebBb7MLqlTgm
	5cWACfaoTG56SqC8+Yan/M4tr8hzrlbQyoQaw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=rbzhi8wsIE5aT5R4FeRY6ybpshXC5iFadQyqJ6exj8bQ8/7/sXjcleqiql4vv7gKmG
	iV/fmbQi3yhQ0omaXJdLipcRM/yFcOf5ndtGFQJXwcDnqr6QeF8NSjMpnowFC1M8iBX2
	XWBDCYhavk5WSBXKnOHtG5J87C+Zr5/Vfv9hg=
MIME-Version: 1.0
Received: by 10.231.13.140 with SMTP id c12mr2552413iba.25.1285799420867; Wed,
	29 Sep 2010 15:30:20 -0700 (PDT)
Received: by 10.231.158.147 with HTTP; Wed, 29 Sep 2010 15:30:20 -0700 (PDT)
In-Reply-To: <4CA36166.1000003@cam.ac.uk>
References: <4CA34E00.8080106@cam.ac.uk> <4CA35464.5030007@freyther.de>
	<4CA36166.1000003@cam.ac.uk>
Date: Thu, 30 Sep 2010 08:00:20 +0930
Message-ID: <AANLkTinGN-95WnCdAfGZRTt0L+HvHB7H4L6OR-56neP+@mail.gmail.com>
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
Subject: Re: missing dependency on expat-native in gdb-cross-sdk-7.1-r7.0
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
X-List-Received-Date: Wed, 29 Sep 2010 22:30:33 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 30 September 2010 01:25, Jonathan Cameron <jic23@cam.ac.uk> wrote:
> On 09/29/10 15:59, Holger Freyther wrote:
>> On 09/29/2010 10:32 PM, Jonathan Cameron wrote:
>>> Hi all,
>>
>>>
>>> I'd suggest adding expat-native to gdb-cross-sdk.inc DEPENDS (which seems to fix the problem) No idea if it is needed
>>> for all versions though.
>>
>> At least GDB 7.x needs expat to parse the register definitions for the CPU.
>> E.g. this is important when using the gdb remote protocol.
>>
>> You should also pass --with-expat to it, right now I have a build issue with
>> the target gdb and this argument.
>>
> Ah, thanks for the heads up. I'll try that and see how I get on.
>
> As an aside there is also an issue with both binutils-cross-sdk and gdb-cross-sdk
> wanting to install libiberty.a
>

Yeah, I've run into this.
http://patchwork.openembedded.org/patch/2874/

But more is needed, as other gdb variants clobber other binutils libs too.


