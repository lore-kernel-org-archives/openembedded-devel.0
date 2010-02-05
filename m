Received: from mail-yw0-f204.google.com ([209.85.211.204])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1NdLMo-0001hv-17
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Feb 2010 11:24:53 +0100
Received: by ywh42 with SMTP id 42so1186120ywh.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Feb 2010 02:22:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=p+QbkTjpXCLTA15Hd3McrWGun/RCHFjXTYCJFGkFSgs=;
	b=CIqcWCsDkP2VjoBUxV2PJJpFePoWJfECARHBYY1lffdn0xyaYtJlcItg0nRQmDNcDY
	YetTKB2kskDFXHoZr8eZ9bQbyERUtM/2iNsqW0eeCsWXYIsZ3oCzvGOpX0E8w9CMX+IB
	eaTGr0RY/KT7+NAG++1UGBBfyim/EKAqzVmBo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=JvVZyT4yVKlBWR+sJ22BnMXEKEK5A7hxFUcUA0C2rz0LOflTnNdnkBq0Qhq1xwuBa4
	cAEscR0WUmSzLCWaYVrlwXT37Bfh28TqRJIIWGc/d5dftYMIqYvOPCwDkWXscUOluD5X
	6z1c8cqbhcUeEyqJSuaRv9AMzXMaGcWV3uVNM=
MIME-Version: 1.0
Received: by 10.101.131.15 with SMTP id i15mr3400640ann.78.1265365340259; Fri, 
	05 Feb 2010 02:22:20 -0800 (PST)
In-Reply-To: <ac9c93b11001261347x7a5f5bc3h9651448f9e9b0b49@mail.gmail.com>
References: <ac9c93b11001230431s6a9dc637y370ad9999d82c83@mail.gmail.com>
	<d1b08f941001230513j5c017493s19838533588f33bc@mail.gmail.com>
	<ac9c93b11001261347x7a5f5bc3h9651448f9e9b0b49@mail.gmail.com>
Date: Fri, 5 Feb 2010 11:22:20 +0100
Message-ID: <ac9c93b11002050222t477c1397t156282bcfb1df756@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.211.204
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: packaged staging fails in do_deploy for kernel
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
X-List-Received-Date: Fri, 05 Feb 2010 10:24:54 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/1/26 Frans Meulenbroeks <fransmeulenbroeks@gmail.com>:
> 2010/1/23 Andrea Adami <andrea.adami@gmail.com>:
>>> I set the DEPLOY_DIR_PSTAGE to outside tmp. (packaged-staging is
>>> already inherited by default in Angstrom).
>> Then you incurr in that infamous issue:
>> http://blog.denix.org/2008/09/getting-even-more-dangerous-with-pstage.ht=
ml
>
> This seems like a good patch to me.
> Any particular reason why it is not applied?
>
>>
>>
>>> Not really an idea how to fix this. Any expert with an opinion?
>> See above link.
>>
>>> =A0* Package staging-strace-armv7a-angstrom-linux-gnueabi version
>>> 4.5.14-r9 has no architecture specified, defaulting to i686-linux.
>>> which also seem odd to me.
>> Yes, this leads to subsequent failures during rebuild from pstage.
>> See e.g. udev and machine-specific staging-packages have wrong arch too.
>
> Yes, but how to get rid of it?
>>
>>> That is where I gave up. Suggestions are welcome!
>> The good news are that RP, kergoth and Tartarus are aware of the issue :=
)
>> Still, it seems this is a low-priority task...
>>
>> Regards
>>
>> Andrea

Andrea, I saw your message on irc saying that last night you hit the same i=
ssue.

The odd thing is that I have not seen the issue any more.

I have a hunch that it is time-stamp-related. That is also why I post
here so others can share their $ 0.02.

My idea is that the granularityof the time stamps might not be good enough.
Packaged staging restores the time stamps and based upon that the
system decides that nothing has to be done after it.
However the stamp for packaged staging is generated shortly after do_deploy=
.
I believe the granularity of timestamps is one second. Not sure what
the build system does if both files have an identical time.

Any expert opinion?

Frans.


