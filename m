Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PKXJZ-00029y-4N
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Nov 2010 15:26:02 +0100
Received: by gxk2 with SMTP id 2so4321509gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Nov 2010 06:23:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=Z6rH6spyYmHXwrzZ55ouFDc9Xpb11hZTHLDVRU449Eo=;
	b=m0n2O7tcxaZpe4joDk3il4ZJgukaBquE+kTm0uelaL6kTdNq3rVim+B1i+qV9c/F3U
	ggAykSbDOPMsO3KLT+XIKRfPmdfe/ls0UwiJCyovhd9E5f+EfLtRpOBZyZDB4wZunncQ
	efScqwDv2Xwi/ma3BwXnFhRszXIh2sWqP7p7g=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=f2BhKHBgqD/gr1J3h/z6cthWyQTlAUvLTF3kAiQSjD7JmGOcYWdMVO/cNcGdHAonjL
	sORNFL5BcDLS7dCRKgypJfS5PE/w+pDzyHVNgcVgxc3b9QsbXAqdyFUjvGxN95JdXVWF
	LK0HknVF6HRc86aKiFZkYIeR8O8QyWV9V7t8o=
MIME-Version: 1.0
Received: by 10.231.144.21 with SMTP id x21mr6829415ibu.126.1290435783157;
	Mon, 22 Nov 2010 06:23:03 -0800 (PST)
Received: by 10.231.33.4 with HTTP; Mon, 22 Nov 2010 06:23:03 -0800 (PST)
In-Reply-To: <AANLkTin81-gZjjVY-7ObKDZUksz-V=uNtxLWu=Ag7owX@mail.gmail.com>
References: <1290284795-7824-1-git-send-email-fransmeulenbroeks@gmail.com>
	<icdase$jgd$1@dough.gmane.org>
	<AANLkTin81-gZjjVY-7ObKDZUksz-V=uNtxLWu=Ag7owX@mail.gmail.com>
Date: Mon, 22 Nov 2010 15:23:03 +0100
Message-ID: <AANLkTinq+rRaXahzk4JagU4jvLimaqh_Ajtp5O0-KTO4@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] update-rc.d: make update-rc.d local
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
X-List-Received-Date: Mon, 22 Nov 2010 14:26:10 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/11/22 Frans Meulenbroeks <fransmeulenbroeks@gmail.com>:
> 2010/11/22 Koen Kooi <k.kooi@student.utwente.nl>:
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> On 20-11-10 21:26, Frans Meulenbroeks wrote:
>>> the recipe did not build any more as handhelds.org is gone.
>>> Since this one is fairly crucial as lots of recipes depend on it
>>> I decided to put the update-rc.d file in update-rc.d/ instead of
>>> fetching it.
>>
>> If it's local, why are you still patching it in the recipe?
>>
>
> I've been in doubt on this.
> With the patch the original file is retained as is, but of course we
> can also apply the patch directly.
> I've no real preference and went for minimal change.
> But if people feel getting rid of the patch is preferred, I'll happily
> submit a new patch.
> Or is it preferred to use a mirror of the original tarball?
>
> Anyway I feel this is something that needs to be resolved before a
> release is made.
> Same holds for the php SRC_URI patch. Guess we also need to tackle the
> multiple providers for depmod and mysqlclient (but that is a different
> topic).
>
> Frans
>
For the record.

Discussed this with Phil Blundell on irc. He is the maintainer of the
file and (on irc) has acked my patch.
His preference was not to apply the patch.
"because the OE convention is to keep local patchsets separate from
the upstream source files".

I don't have the patch handy here and it is not on patchwork, but I
will push it tonight. Suggest to add it to the release branch too.

Have fun!
Frans.


