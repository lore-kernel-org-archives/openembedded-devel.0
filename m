Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OohI3-0003V2-Ky
	for openembedded-devel@lists.openembedded.org;
	Thu, 26 Aug 2010 20:35:25 +0200
Received: by gxk2 with SMTP id 2so825947gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Aug 2010 11:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=o+yUl7eJVaMBBvaVcbGebF9om72h84zUYTHaTOzo56Y=;
	b=rkFtmhrcAd4+OmnVd+OzQuS5K+rIhQ8i2KErkl4o9FWtcqTlIW97Y97vg/QBf5ORxc
	DwAk4K5OEeUN1VBAw99Z698b4ffoz19vgofOyJDOaQPh9tsrbhczCp7JEhkVCPF7iULv
	yPugC3M3naCts9n+o4QEMXQKZTI1E0OrtEWAA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=hR/DTU8Adv97/T7APw69SezIaaXgGmUPt/S43NThm1ow0seh3x+xmzpGVHYcmu6zQl
	46CTOLXuvz0M90mEQV5KIshn6hF1bMi8QnaN920dcgyyB5rHQmwiIklAqNNEljzbgPam
	awmoTNAjm8iSMm3e933VEKBUpy+Di4pksBvyI=
MIME-Version: 1.0
Received: by 10.101.149.5 with SMTP id b5mr11378801ano.32.1282847673327; Thu,
	26 Aug 2010 11:34:33 -0700 (PDT)
Received: by 10.231.205.138 with HTTP; Thu, 26 Aug 2010 11:34:33 -0700 (PDT)
In-Reply-To: <4C768F22.5070204@mentor.com>
References: <AANLkTimT-Bwj8mnJk8uHhXFXhauHv0PO0P2eZic9bMbD@mail.gmail.com>
	<4C768EA4.70902@mentor.com> <4C768F22.5070204@mentor.com>
Date: Thu, 26 Aug 2010 20:34:33 +0200
Message-ID: <AANLkTi=Ps2ErLCCX1kMpsEUEHdsH9Yuv5vUgrwiehSg7@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: remove cdrtools ?
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
X-List-Received-Date: Thu, 26 Aug 2010 18:35:25 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/8/26 Tom Rini <tom_rini@mentor.com>:
> Tom Rini wrote:
>>
>> Frans Meulenbroeks wrote:
>>>
>>> While browsing through our recipes I found this:
>>> cdrtools/cdrtools-native_2.01.01_alpha77.bb
>>>
>>> This was added in 2006 by Raymond Danks, I did some cleaning 1.5 year
>>> ago, Holger moved it to the latest version last march.
>>>
>>> When I wanted to attack this device to remove legacy staging, I
>>> suddenly asked myself: why do we have this recipe in the first place?
>>
>> It's needed for making ISO images of which I thought we used to support
>> (boot CDs for x86 boards for example).
>
> See bootimg.bbclass

Ah, ok, didn't know that.
Actually it seems that bootimg.bbclass is not used, and a quick search
didn't show up a way to use it, but its existence is good enough to
keep cdrtools.
I'll see if I can update it.

Frans


