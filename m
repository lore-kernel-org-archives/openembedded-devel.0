Received: from mail-qy0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1OS9oe-0003TG-AS
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Jun 2010 16:23:52 +0200
Received: by qyk30 with SMTP id 30so34000qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Jun 2010 07:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=efQZo1CRzEVCHSEwCGATJl8XCJ1zQdZkvAu3DWZ0EVc=;
	b=TZA5cNERkBXpOa8MAYEVS8Hbv5xK7fRAZuYQ4W55p4eIBR83ND4KGiM094LkGj0Fq3
	0d69DVrCuVNESVnAlgdpXkbKLZ9RLYmcOwigjsRrCv05cfh9Cjl880+CuqAWI7mi7fd9
	K/QeK80aGLngxDSgIfYluktBb9FGpFU3bRYGw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=jcEzY3b/UEVSWCdq2tHkjAeVtD5RnHE4AuIHqgBmWHDbzm5rlDDKBkSUhLGYlLb9/j
	95DwYM5PkmYd08VQDsokJOPqUFEOVAINzQPBviQPCZb+Ylkv212Xs4um/ou2V/AX/b5I
	2sV9v0UI1MeSP9QBB16+L3eCf6lP0E2xr4lS8=
Received: by 10.224.107.138 with SMTP id b10mr596147qap.93.1277475537239; Fri, 
	25 Jun 2010 07:18:57 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.241.204 with HTTP; Fri, 25 Jun 2010 07:18:37 -0700 (PDT)
In-Reply-To: <4C24B3C7.2080704@mentor.com>
References: <AANLkTikjJzqog2Cla8H_JazzRw6QuSrSdllTOD7XwgBx@mail.gmail.com> 
	<1277152663-12051-1-git-send-email-fransmeulenbroeks@gmail.com> 
	<4C24B3C7.2080704@mentor.com>
From: Chris Larson <clarson@kergoth.com>
Date: Fri, 25 Jun 2010 07:18:37 -0700
X-Google-Sender-Auth: VK3KLqfduIEB41pAp5bejtPRJs8
Message-ID: <AANLkTilbKMff3QboYW7XeBuf0fOIhO6TYHxWNv2cIb2A@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.216.175
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH] linux-libc-headers: use kernel-arch.bbclass
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
X-List-Received-Date: Fri, 25 Jun 2010 14:23:52 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jun 25, 2010 at 6:48 AM, Tom Rini <tom_rini@mentor.com> wrote:

> Frans Meulenbroeks wrote:
>
>> linux-libc-headers recipes all have their own code to set ARCH.
>> However this same functionality is in kernel-arch.bbclass
>> This patch adds an inherit kernel-arch in linux-libc-headers.inc
>> and removes all arch calculation code from the recipes
>>
>> Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
>>
>
> Acked-by: Tom Rini <tom_rini@mentor.com>
>
>
Acked-by: Chris Larson <chris_larson@mentor.com>
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

