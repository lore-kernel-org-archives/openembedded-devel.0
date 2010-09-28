Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P0UAD-00080L-Cl
	for openembedded-devel@lists.openembedded.org;
	Tue, 28 Sep 2010 08:59:46 +0200
Received: by iwn2 with SMTP id 2so3784495iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Sep 2010 23:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=NdQrRqRhfOpOf9s1ub2nj9MuHlP2AQm+sC037+zObek=;
	b=IdUEhcl2Gr0YmPM5rgCv05tpSi46+n5m78e7hoQ/2BYyXicjTDB4ODfpeHu+q+1Yzn
	yyQaCLq+yDXrXjuz6bKTwZc49WZybX0iXDXiQ4095BWWEDaB2g3f3yCrnuNdjxBLYukL
	RL9pKBCLSI7I9y46+r3OXsLvQ1dwtxa6L14WQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=h7VIQ4k7qJvjaDy1sBv+/mPOSXogyMtRD20HtOUtRpEw2ILZEX5EXN0Gj/hqV9+BL0
	pbm23/q98tSqBFftEnvFslqM+CUPfjOsP9acdznrdGf5Mu9GUrArSDPHMa9MC2o/3J3z
	exJ4DkoUrHjQwixY+IbdYoCFLYj6+BgqqoAE4=
MIME-Version: 1.0
Received: by 10.231.191.136 with SMTP id dm8mr10331217ibb.75.1285657172582;
	Mon, 27 Sep 2010 23:59:32 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Mon, 27 Sep 2010 23:59:32 -0700 (PDT)
In-Reply-To: <20100928030206.GA7753@gmail.com>
References: <AANLkTikCbjnRFr=E4t0MXcH8+Cap2KNWKyS2vZpp+Xdq@mail.gmail.com>
	<20100928030206.GA7753@gmail.com>
Date: Tue, 28 Sep 2010 08:59:32 +0200
Message-ID: <AANLkTimmZg-EEg3fNpZDKXsbLC2kALfsbweD35H8=Oeh@mail.gmail.com>
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
Subject: Re: packages
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
X-List-Received-Date: Tue, 28 Sep 2010 06:59:46 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/9/28 Khem Raj <raj.khem@gmail.com>:
> On (26/08/10 10:36), C Michael Sundius wrote:
>> I'm trying to understand how package feeds work. From the documentation it
>> seems
>> that you can use a package feed to install prebuilt packages onto a running
>> taget.
>> but what I'd like to do is to have OE look to see if a pre built package
>> exists before it
>> goes and builds one. Sort of like a packaged staging, but distributed, so
>> anyone could
>> pick up the package it needs from a single server, rather than having to
>> build it first
>
> hmm interesting. I dont think anything like that exist in OE although it
> seems interesting

what about running opkg natively, retrieve index, then check if the
package is there and if not bitbake the recipe.

rough skets for a oneliner (untested)
opkg update; opkg whatprovides -A mypackage >/dev/null 2>&1 || bitbake
mypackage

if you want to fetch from remote it becomes a liitle bit more complex.

Note though that what you get from the external feed might be
different from what you get when you build things yourself as there
are sometimes dependencies on what has been build before.
(e.g. a configure enabling additional functionality because it finds
libXYZ because it happened to be build before, but is not listed as
explicit dependency)

frans


