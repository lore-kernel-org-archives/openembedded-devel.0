Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OdU9b-0008NB-Jc
	for openembedded-devel@lists.openembedded.org;
	Mon, 26 Jul 2010 22:20:04 +0200
Received: by iwn34 with SMTP id 34so3065061iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Jul 2010 13:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=IVNmRF+ku/InDXAYb3V/wbfguW1MO7SrXQI3b3Hr92Y=;
	b=VmDQx7nkvaOtYi0SEuPsenHk2mTQ6ZPuLjihsLu4rmkVt4axAwltTZbm8KFq6KE8IT
	yWLlamaK46YU2uOkQbYNedqugoX1keZXNDNeBFXynkM91a8lsEqrgU+28EN1rjwqugW5
	4lWOrZ1NAV1xCETHPmB+NLHA3jvVeZJafR/gU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=O8gsHLkRJm31D165B4JmBvKCWicbxqZzC9zPr9NiqZfiSnH5xfBbHr2C8Cfeo4tff+
	nvrDdV59aH72xUl/pm1MpcPmO4yiOz7yR97WWeGYP2A4R6w87IgnF9XtS6kuwz+wXFt8
	kfud5fsMy4K8TbSyFHG6JAknF3n9t9b23pGFU=
Received: by 10.231.130.145 with SMTP id t17mr8264384ibs.144.1280175588428; 
	Mon, 26 Jul 2010 13:19:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.186.88 with HTTP; Mon, 26 Jul 2010 13:19:28 -0700 (PDT)
In-Reply-To: <4C4DEC49.9050708@mentor.com>
References: <1280174528-27682-1-git-send-email-raj.khem@gmail.com> 
	<1280174528-27682-3-git-send-email-raj.khem@gmail.com>
	<4C4DEC49.9050708@mentor.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 26 Jul 2010 13:19:28 -0700
Message-ID: <AANLkTinQHGOgctBJRsWb2rEhW6+J9z2c7ExQFgdURi1N@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 2/7] binutils-cross.inc, binutils.inc: Overhaul for 	new cross dir structure.
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
X-List-Received-Date: Mon, 26 Jul 2010 20:20:04 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 26, 2010 at 1:12 PM, Tom Rini <tom_rini@mentor.com> wrote:
> Khem Raj wrote:
>>
>> * Install the symlinks instead of copied of tools.
>> * Dont build shared libopcodes
>
> Is that intended to fix the relocation issue with pstaging+relocatable? =
=A0If
> so I was just about to push a PREPROCESS_RELOCATE_DIRS to deal with that.
> =A0Or is there some other reason to disable shared versions of these
> libraries?

We might have different versions of libopcodes or libbfd depending
upon multiple versions
of binutils in multimachine environment. they will have version
differences so in theory
it should pick the right one always but its a change which can be done late=
r
and -with-shared has issues with gentoo binutils so it helps folks who
use gentoo as build host.

>
> --
> Tom Rini
> Mentor Graphics Corporation
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


