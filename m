Received: from mail-yx0-f171.google.com ([209.85.210.171])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Nh4Kw-0001QE-2m
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Feb 2010 18:02:21 +0100
Received: by yxe1 with SMTP id 1so4354764yxe.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Feb 2010 08:59:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=TmXGisgQdpRDUUhw+vDraSQlIwJuH9gsLDy4KlNc0Rw=;
	b=G3adFamVz9tIQUz4k9sp0xJpVwX1fNSde6UxtgOjlF1Itk54RsCdlJxbZbcWi3XrVf
	vFqMlKq516u1NMP2utq5xGTmBUHNzRz50ds2WpmYE4ibNP7RmSsCIPOGS7OhdKY9A2qm
	6yYBLncLpro2PuN2IXfUab/ElU1zfwXqItCVQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=QNtcjyDkxZj9Qril8GVIwDG+FO8DsCr7AU4QH2QkoIcbQPDmJ8hU+5nQjWlNmaqueq
	8gSOP7c3iGlOpS2OsCYobipvZ9CIVKl/GHrmfc7neqi89Z4MGzZ2ZCodIdT1AaFjLSRh
	wub9Qn3BvEcNk/6DtSKAF/bMdRxyPKeUXaBu4=
MIME-Version: 1.0
Received: by 10.150.55.17 with SMTP id d17mr2669634yba.155.1266253179435; Mon, 
	15 Feb 2010 08:59:39 -0800 (PST)
In-Reply-To: <4B79673B.50108@balister.org>
References: <20100214135613.GF5364@jama> <4B79673B.50108@balister.org>
Date: Mon, 15 Feb 2010 17:59:39 +0100
Message-ID: <ac9c93b11002150859i4aa5ee7eid6a648d95fa25d6c@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.210.171
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Using bitbake in minimal chroot environment
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
X-List-Received-Date: Mon, 15 Feb 2010 17:02:21 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/2/15 Philip Balister <philip@balister.org>:
> On 02/14/2010 05:56 AM, Martin Jansa wrote:
>>
>> Hi,
>>
>> I'm just thinking about using bitbake only in minimalistic chroot.
>>
>> What are advantages/disadvantages?
>>
>> How I see it:
>>
>> Advantages:
>> 1) more secure (I started to use separate user for bitbake, when I
>> =A0 =A0started to play with bitbake master instead release - because tha=
t
>> =A0 =A0warning it said), but chroot is even better.
>> 2) less problems when autotools pick some header or lib from buildhost
>> =A0 =A0instead of staging
>> 3) easier to check, that -native package is missing for some important
>> =A0 =A0lib
>>
>> Disadvantages:
>> 1) Few more MB for building environment (extra libc, gcc, binutils, git,
>> =A0 =A0svn, sh, etc. installed in chroot

If they are on the same filesystem you could use hard links and save those =
MBs.

>> 2) More administrative to keep chroot system updated
>> 3) harder to check, that autotools won't pick something from buildhost
>> =A0 =A0in normal environment before pushing new version/recipe (ie I won=
't
>> =A0 =A0have SDL libs installed in chroot, but everybody else will and ma=
ybe
>> =A0 =A0build will fail for them after I push some recipe.
>
> I see this as a good thing :)
>
> Philip
>
>
>>
>> If nobody points some big disadvantage I didn't think about, I'll give
>> it a try (with precompilled gentoo stage tarball it's task for half an
>> hour using cp :)).
>>
>> Using some sofisticated sandbox setting (as gentoo ebuilds do) would be
>> also good alternative, is someone trying that?
>>

Seems a good plan to me, please keep us posted.
(actually I've been considering building in a minimalistic VM)

FM


