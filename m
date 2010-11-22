Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PKSMF-00083h-7O
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Nov 2010 10:06:45 +0100
Received: by iwn38 with SMTP id 38so3021950iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Nov 2010 01:05:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=sryRbN8hf8+3QUCecoSegNSAel3EGTU/noZripbJa5s=;
	b=qS+vFf4vCbzN7J4QzmlJhE0x/6U898RqvnMM3TMICh7G9gGgs/q7phsFRXkwG5LnIC
	1wQO5oJmpocIV3F/PtZHQ8i1/ZhsIADCcwhyf6VzOmgTWs9f75qh98Vn76P3REF7GrR1
	LlwYbgzbkPohUkNvPFhEGKmd29vaJbEJYGIiY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=fpY3uJvpj5VMSN4Sac+GhkOOAb+pmVDY08awNgzxleE63GnXB2edefgITAL4SqsVmF
	4kuP/ayPPoY91dDT0TJldwTCg5cySKar4s9CmKLAWLouhoF978Lt2HSZLaTcjAmyMd8s
	lcWnmRh2M+c/SjyWstchpshnmsQ2dXRhlM26s=
MIME-Version: 1.0
Received: by 10.231.144.21 with SMTP id x21mr6537132ibu.126.1290416733138;
	Mon, 22 Nov 2010 01:05:33 -0800 (PST)
Received: by 10.231.33.4 with HTTP; Mon, 22 Nov 2010 01:05:33 -0800 (PST)
In-Reply-To: <icdase$jgd$1@dough.gmane.org>
References: <1290284795-7824-1-git-send-email-fransmeulenbroeks@gmail.com>
	<icdase$jgd$1@dough.gmane.org>
Date: Mon, 22 Nov 2010 10:05:33 +0100
Message-ID: <AANLkTin81-gZjjVY-7ObKDZUksz-V=uNtxLWu=Ag7owX@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
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
X-List-Received-Date: Mon, 22 Nov 2010 09:06:46 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/11/22 Koen Kooi <k.kooi@student.utwente.nl>:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 20-11-10 21:26, Frans Meulenbroeks wrote:
>> the recipe did not build any more as handhelds.org is gone.
>> Since this one is fairly crucial as lots of recipes depend on it
>> I decided to put the update-rc.d file in update-rc.d/ instead of
>> fetching it.
>
> If it's local, why are you still patching it in the recipe?
>

I've been in doubt on this.
With the patch the original file is retained as is, but of course we
can also apply the patch directly.
I've no real preference and went for minimal change.
But if people feel getting rid of the patch is preferred, I'll happily
submit a new patch.
Or is it preferred to use a mirror of the original tarball?

Anyway I feel this is something that needs to be resolved before a
release is made.
Same holds for the php SRC_URI patch. Guess we also need to tackle the
multiple providers for depmod and mysqlclient (but that is a different
topic).

Frans


