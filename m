Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Ovr1m-0006GS-EF
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Sep 2010 14:23:55 +0200
Received: by iwn2 with SMTP id 2so118865iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Sep 2010 05:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=Ld1qKn08jLirvfwoj66E7d4UmnWtqsYvtuayWABqLHQ=;
	b=u/Yo8l8cd/2eOyz1m6RqxFuhnl9aELfXAHblFQB8h+KUTBJwpG5thrWSPuVXkykzKZ
	VzGulCd/b5lgTGaRV+oDel3jYJfpq2Ugh2WWODQeNEtFjVfK+ODuLHv6oYbe2DIemDuf
	wSyCif5AHMxUDSYTXWmVWOv1/9h3O/J3BctEM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=AJDuqsETC2wS9IpA0FJKb97BN3iMA+iPYnD1m0yte0sslk9pcDig5YI+SX13i3hjtE
	FIBUZMGuQWnsZuyKJUd040ODqJpkjSiT37u86rgpeTwKV1KPPB+kGdC/7q+rzKpQ/AlW
	8hrRPDUCQbcYDpnydcWzAQHBxOQ+gpoyzi4SY=
MIME-Version: 1.0
Received: by 10.231.11.65 with SMTP id s1mr1566119ibs.134.1284553386786; Wed,
	15 Sep 2010 05:23:06 -0700 (PDT)
Received: by 10.231.205.204 with HTTP; Wed, 15 Sep 2010 05:23:06 -0700 (PDT)
In-Reply-To: <4C90B5E6.1070402@balister.org>
References: <4C90130C.3040303@gmail.com>
	<AANLkTi=ZF3uT1Y6=yy_+wAizh64KYv0nRjq9BoFZN6E2@mail.gmail.com>
	<4C90B5E6.1070402@balister.org>
Date: Wed, 15 Sep 2010 14:23:06 +0200
Message-ID: <AANLkTi=gOD1tRZp3nCTfOQCzU+KbKo07kGFDQMCupTDw@mail.gmail.com>
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
Subject: Re: [PATCH] p4: remove broken and 4 years old recipes.
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
X-List-Received-Date: Wed, 15 Sep 2010 12:23:55 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/9/15 Philip Balister <philip@balister.org>:
> On 09/15/2010 02:32 AM, Frans Meulenbroeks wrote:
>>
>> 2010/9/15 Graham Gower<graham.gower@gmail.com>:
>>>
>>> Recipes are broken for all architectures except one (probably arm)
>>> because the files in the SRC_URI depend on TARGET_ARCH and the md5/sha256
>>> are presumably valid only for one of these.
>>>
>>> Anyone wanting perforce should submit new recipes for new perforce
>>> versions.
>>>
>>> Signed-off-by: Graham Gower<graham.gower@gmail.com>
>>
>> Agree with the reasoning of Graham, so:
>>
>> Acked-by: Frans Meulenbroeks<fransmeulenbroeks@gmail.com>
>>
>> Actually I am not too keen on having recipes that just "install" an
>> externally downloaded binary blob
>> (and functionally speaking this does not seem to be something for an
>> embedded system either)
>
> I will have a need for a recipe to install binary blobs (fpga bin files)
> into a file system at some point. So this class recipes are needed.
>
> Philip

I'm not saying it should be made technically impossible or so.
Actually I do have recipes that install fpga images too, but these
live in an overlay.
As I do actual product development with oe I am just not too keen on
pulling binary stuff from elsewhere.

And rereading my message I can imagine some misunderstanding.

I wrote
>> (and functionally speaking this does not seem to be something for an
>> embedded system either)
and with this, I wanted to refer to the functionality provided by P4
(a high end SCM if I grasp it right), not to binary recipes in
general.

Apologies for the confusion.

Frans


