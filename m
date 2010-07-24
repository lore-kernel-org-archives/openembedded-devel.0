Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OcUXP-0004zC-5x
	for openembedded-devel@lists.openembedded.org;
	Sat, 24 Jul 2010 04:32:31 +0200
Received: by iwn34 with SMTP id 34so840728iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Jul 2010 19:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=r0VR6R2RWFX7CpaoGZ2NBwdnfEj/31Ejcrgn+WTvkpU=;
	b=XfGT6p4jHshYGhFWVbQAgDnKaHpT473Qv7E6VpMVV0oEPQymSM7h6rNSlkamcQvL0R
	7qGfyt/HnglQ068aXYElY7FS7Daw68/uw1It9/yFN2/JXzau4Moa0Zcgvmrf5AuWeWcu
	r6nfKnBHecILnUbLKBO1mT+Uz9YdrliWTIy6s=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=rKedvjDyJmmx1ywstnVmWMy2azg1arFqI5dz/7O7iB2HM1sJ2hM/kPAOErWKm0Lbj0
	OhOWgbGwi78iXLPPqZzIjbDiZ9QXcwj3wNGS0hRygv+d2kDF/y/c8pb2WyMe7wX+Z1uF
	trqKGMELvW8AFGU/vWxZQabRQaZR0PEUvRuGg=
Received: by 10.231.33.205 with SMTP id i13mr4587744ibd.179.1279938738197; 
	Fri, 23 Jul 2010 19:32:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.186.88 with HTTP; Fri, 23 Jul 2010 19:31:57 -0700 (PDT)
In-Reply-To: <AANLkTinkzu3RtD_vcc+tpPHME=vgHKWuwGFYTcVnoa3=@mail.gmail.com>
References: <1279735486-7050-1-git-send-email-raj.khem@gmail.com> 
	<i2bg5t$mvp$1@dough.gmane.org>
	<1279872152.21888.149.camel@lenovo.internal.reciva.com> 
	<i2bir6$un3$1@dough.gmane.org> <1279875548.13006.32.camel@rex> 
	<AANLkTi=XnYtiTtUke0aiPgvFao3De6-xxb1cWt3hr7=X@mail.gmail.com> 
	<AANLkTinkzu3RtD_vcc+tpPHME=vgHKWuwGFYTcVnoa3=@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 23 Jul 2010 19:31:57 -0700
Message-ID: <AANLkTinCEFFn6bQ4qe3+s0GXL8fbMc8txwVcxo+L9VvH@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 0/4][RFC] Remove CROSS_DIR, install cross-packages 	into native sysroot
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
X-List-Received-Date: Sat, 24 Jul 2010 02:32:32 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Jul 23, 2010 at 1:44 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Fri, Jul 23, 2010 at 2:18 AM, Frans Meulenbroeks
> <fransmeulenbroeks@gmail.com> wrote:
>> 2010/7/23 Richard Purdie <rpurdie@rpsys.net>
>>
>>> On Fri, 2010-07-23 at 10:11 +0200, Koen Kooi wrote:
>>> > -----BEGIN PGP SIGNED MESSAGE-----
>>> > Hash: SHA1
>>> >
>>> > On 23-07-10 10:02, Phil Blundell wrote:
>>> > > On Fri, 2010-07-23 at 09:25 +0200, Koen Kooi wrote:
>>> > >> There is a BIG problem with these patches, they break multimachine
>>> builds.
>>> > >>
>>> > >> The previous situation had:
>>> > >>
>>> > >> cross/armv7a-angstrom-foo/usr/bin/
>>> > >> cross/armv5te-angstrom-foo/usr/bin/
>>> > >> etc
>>> > >>
>>> > >> The new situation has:
>>> > >>
>>> > >> x86_64-linux/usr/bin
>>> > >>
>>> > >> So all the toolchains get dropped into the *same* directory, which
>>> > >> breaks horribly.

I have a half baked patch to get the above semantics like what poky
did its not working
and its getting uglier. I dont feel good about it.
IMO having a new var like TARGET_SUB_ARCH point to sub-family (armv5te
etc.) and later
use it to form all prefixes etc would be cleaner and easier to
implement and maintain.
the limitation would be that you wont be able to have different
version of toolchain components
for two different machines based on same sub-arch e.g. (qemuarm and
omap5912osk both are based on
armv5te so one has to use same version of toolchain components for
these kind of scenarios in a
multimachine build setup.

Therefore I would propose either we backout these patches for now or
do single machine builds
in meantime we develop the solution.

-Khem


