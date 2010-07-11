Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OXqqz-0002Ac-Sm
	for openembedded-devel@lists.openembedded.org;
	Sun, 11 Jul 2010 09:21:39 +0200
Received: by bwz10 with SMTP id 10so2258645bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Jul 2010 00:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=pQ42CRpv41A8BNZdjs+tiaT4soULDHHDludJgMNNzXc=;
	b=gwn+71UaiqlFViclRW4hLlRqOO4mp7LDAL3/lXbz+Cjo2B4cQgMl5WmeMzd6aUYftT
	uhut94D6sE4vwbREizseyEF4mL4Bskn+XPG8SC2YpNCl2xMFLU5tYjHGxNazgMKzu8AQ
	juUTCOwjYitIpuR3SQSsQjrkNOvFS68eZOK2g=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=HuMX7JlxvfSfEp0Ev25IbljvQvjZaKDEDG9en+Lgj8DodlZkFQ7hgfSyJkVGfGXPkx
	64gQnTqJXmV3nkQK+oOo9FZDVUIogtpzjEGsFY1ZTd7weUoUuWltYEhCkwJyyZQPhndy
	DJRtU9D5lgo0C1SDbz6l8c0ncH19agNyoXTZ0=
MIME-Version: 1.0
Received: by 10.204.48.75 with SMTP id q11mr9468588bkf.0.1278832600744; Sun, 
	11 Jul 2010 00:16:40 -0700 (PDT)
Received: by 10.204.66.68 with HTTP; Sun, 11 Jul 2010 00:16:40 -0700 (PDT)
In-Reply-To: <AANLkTilo-z4ZlJoNCgFhcEnu1YA6vQaTbug9b9VslcEQ@mail.gmail.com>
References: <1278577398.15825.1.camel@lenovo.internal.reciva.com>
	<1278778757-31330-1-git-send-email-fransmeulenbroeks@gmail.com>
	<1278801398.15825.40.camel@lenovo.internal.reciva.com>
	<AANLkTilo-z4ZlJoNCgFhcEnu1YA6vQaTbug9b9VslcEQ@mail.gmail.com>
Date: Sun, 11 Jul 2010 09:16:40 +0200
Message-ID: <AANLkTin-XFFlkOFj5TAdpyx9pnvKofaPFzjI09Uv6E9M@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] base.bbclass: introduce COMPATIBLE_TARGET_SYS
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
X-List-Received-Date: Sun, 11 Jul 2010 07:21:40 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/7/11 Frans Meulenbroeks <fransmeulenbroeks@gmail.com>:
> 2010/7/11 Phil Blundell <philb@gnu.org>:
>> On Sat, 2010-07-10 at 18:19 +0200, Frans Meulenbroeks wrote:
>>> This patch introduces COMPATIBLE_TARGET_SYS
>>> It is similar to COMPATIBLE_MACHINE but where COMPATIBLE_MACHINE
>>> is used to specify that a certain recipe is for a certain machine
>>> COMPATIBLE_TARGET_SYS can be used to specify that a certain recipe
>>> is for a certain architecture.
>>>
>>> Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
>>
>> I think this should go in cross.bbclass, not base.bbclass. =A0Other than
>> that it looks fine.
>>
>
> I have no real preference for location. The only reason for putting it
> in base.bbclass is because that file also contains the tests for
> COMPATIBLE_MACHINE and COMPATIBLE_HOST.
> (as my pythonese is not that good I just copied/pasted/edited/tested ther=
e)
> Please advice

Thinking about it again, base.bbclass seems a better place to me.
This test could also apply at compiling non-cross stuff (e.g. if a
recipe contains inline asm that is not ported)
and of course for recipes like gcc, if the arch or sys is not
supported, it'll be for cross and target.
I'm not too good at the build system internals, but I expect that gcc
(not gcc-cross) does not use cross.bbclass. (and I guess we want to
say for gcc too that it is not compatible)
So I feel base.bbclass look like a better place.

Frans.
>
> Wrt the clarification of khem in the other thread:
> What about adding a COMPATIBLE_TARGET_ARCH test =A0too ? (actually I
> think that that is the one I would like to use at one place (although
> ofc it is quite possible to use COMPATIBLE_TARGET_SYS).
> (e.g. gblic has arch specific sysdeps, I would like to specify if a
> version of glibc does not specify my arch).
>
> Frans
>


