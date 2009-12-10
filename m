Received: from mail-pw0-f53.google.com ([209.85.160.53])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rk.raggit@gmail.com>) id 1NIgmo-0002eJ-JS
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Dec 2009 12:02:21 +0100
Received: by pwi18 with SMTP id 18so394802pwi.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Dec 2009 03:00:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=xBYIBAgrUpIXDfdHaA53UejiQmnvD7G/Z70m63rWITQ=;
	b=wYeZ7yQ97qtT9DExplBxvYKygG1BH26MlZxnBG3pxna2gjhC8nr1GThWtmGI2AjF0z
	OtUfTSGIXHv9dsekmGoBFAvt8nDEjVLpBXG/ipM3djRWOJi20ux+pJF9+QOsWFVkH14A
	2swnmPHN1ouxaRqFqq2sRMXwzNbo3IExODqtI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=QlMWChQO9UilRgZB9/Sl/C/vEt3MBaByuliWrsdRBHp/qhJIdNJCufIPnWIwnVIB5Q
	EtL/vO6x169IPlQZm7WCE9Tvi1D8dRjrFlJjwMgJEvv1LI1RDZ4ac3s65zULKJoR5jgt
	5Pc6ErYB3dOdid7hrM0OMeltHR9SXKCevF6NI=
MIME-Version: 1.0
Received: by 10.140.255.17 with SMTP id c17mr1170529rvi.137.1260442835680; 
	Thu, 10 Dec 2009 03:00:35 -0800 (PST)
In-Reply-To: <19c1b8a90912092118o54903eb4v4044e2c1191617c8@mail.gmail.com>
References: <ec1f3d400911270337wbbbcae8gab291075d242c9d9@mail.gmail.com>
	<19c1b8a90911301042t6ed432b2m1189c619772edf9c@mail.gmail.com>
	<ec1f3d400912072024u2ab3a98bg96665cd8457efcd9@mail.gmail.com>
	<19c1b8a90912081214u9abe04fm774bd7f54e7bf70a@mail.gmail.com>
	<ec1f3d400912090347w217d39d2jd64c9801f95e96e4@mail.gmail.com>
	<19c1b8a90912092118o54903eb4v4044e2c1191617c8@mail.gmail.com>
Date: Thu, 10 Dec 2009 16:30:35 +0530
Message-ID: <ec1f3d400912100300l42da9902wee299ca7bd27e6bb@mail.gmail.com>
From: RK Raggit <rk.raggit@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.53
X-SA-Exim-Mail-From: rk.raggit@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: cortex-a9 build failure at glibc
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
X-List-Received-Date: Thu, 10 Dec 2009 11:02:21 -0000
Content-Type: text/plain; charset=ISO-8859-1

> What version are you using for binutils ? I could not reproduce the
> issue with 2.20
>

I was using 2.18.50.0.7. I have just started a fresh build with the
following line-up -

***********
PREFERRED_VERSION_binutils               = "2.20"
PREFERRED_VERSION_binutils-cross         = "2.20"
PREFERRED_VERSION_binutils-cross-sdk     = "2.20"
PREFERRED_VERSION_gcc                    = "4.4.1"
PREFERRED_VERSION_gcc-cross              = "4.4.1"
PREFERRED_VERSION_gcc-cross-initial      = "4.4.1"
PREFERRED_VERSION_gcc-cross-intermediate = "4.4.1"
PREFERRED_VERSION_glibc                 = "2.6.1"
PREFERRED_VERSION_glibc-initial         = "2.6.1"
**********

Will let you know about my progress.

Thanks

--RK

