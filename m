Received: from mail-iw0-f180.google.com ([209.85.223.180])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NbSKG-00057n-7L
	for openembedded-devel@lists.openembedded.org;
	Sun, 31 Jan 2010 06:26:27 +0100
Received: by iwn10 with SMTP id 10so1049438iwn.22
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Jan 2010 21:23:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=aMZajiGdmIGQZ/dWrCH93Qc2WdNggJGW7SVaddWIBTs=;
	b=euos3MUaHOU5s8Uwf6yqPHtQvG5xCfLqkuhhNYle8fS/3u5xFLaz+bo6kU8XqFNwQN
	0Pu81MLaW0TVcP4Kiac3fzSxhgPVD3MmpP0GtmKukWAFfWZlNu9ixGqxKwG+f2sq7sO5
	96/ybUiZONGCfOs9HW3hql0bpOP2kRGjq06hw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=nXt0oh2DEJ/tgocvwXUeeIVushTcmvaS2udiwFBZsUnm12jxTn22OZ5pCp24Yrwobp
	Udl1vZSUX/QI4UrXW05mU6Qmj9+OnXmGI6dgigEW8szG3DXuaA4aECfbJRrr1Z7XiPPQ
	YOhwSi37REBM4qPd978LD8JROFKUSHwcRrWSA=
MIME-Version: 1.0
Received: by 10.231.151.197 with SMTP id d5mr4298062ibw.73.1264915438738; Sat, 
	30 Jan 2010 21:23:58 -0800 (PST)
In-Reply-To: <201001310516.14421.holger+oe@freyther.de>
References: <op.u7dnj4v0mn1qzu@camelguo> <op.u7do2cw1mn1qzu@camelguo>
	<op.u7dpieeymn1qzu@camelguo>
	<201001310516.14421.holger+oe@freyther.de>
Date: Sat, 30 Jan 2010 21:23:58 -0800
Message-ID: <19c1b8a91001302123te743d1fna73e7d8cc666971c@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.180
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: building u-boot - git failed
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
X-List-Received-Date: Sun, 31 Jan 2010 05:26:27 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sat, Jan 30, 2010 at 8:16 PM, Holger Hans Peter Freyther
<holger+oe@freyther.de> wrote:
> On Sunday 31 January 2010 05:02:28 Guo Hongruan wrote:
>> I think I got the answer, see
>> http://git.denx.de/?p=u-boot.git;a=commitdiff;h=f865fcbbb35851e75fee9c3a3fa
>> 8e0f71d9e6463
>>
>> adding the following patch to u-boot recipe can solve this problem.
>
> Please create a patch that can be applied to the OE tree.

couple of months back I was hitting this error for beaglebord and had
the same patch in my local repo but never pushed it


>
> thanks
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


