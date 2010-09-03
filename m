Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1OrK45-0004tT-Aw
	for openembedded-devel@lists.openembedded.org;
	Fri, 03 Sep 2010 02:23:50 +0200
Received: by iwn2 with SMTP id 2so983931iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Sep 2010 17:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=LvMFBJaViO2dymWf4p0OODSsEHIZifgXtVplzQH+/tM=;
	b=drwJzO08vZGhrChun6zdBHqBzHg5LH7xrk/PZQI2GDDZNW72vjRrrSMn4Zv2uCjptU
	eiUargOitMZpENjoIPgNPlJ2VHZgCYrZeOvKKtMoAg8WKJtIWb21JTynDMp7rbLLbfW8
	JIu83QATuKJduW7j2eX/UC7OVKhR0wG0UlEvg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=Ne08+nZd/n5So5kfjaP45I2XHl5xA3A0KZ5xVrAxlC8emekRD4rgKL6ciNbPsz3W7R
	KISjU1lgKrm8GVV+0IZx5PwpLNzOy+T47+9vRIHg3sM3fNhQ+IyezHBz/LJf10lRG/HL
	3cTqIN+OU3TRNE/+b4cvyackvVssNyUYVVI/Y=
MIME-Version: 1.0
Received: by 10.231.153.76 with SMTP id j12mr11340482ibw.66.1283473374311;
	Thu, 02 Sep 2010 17:22:54 -0700 (PDT)
Received: by 10.231.167.79 with HTTP; Thu, 2 Sep 2010 17:22:54 -0700 (PDT)
In-Reply-To: <AANLkTikZuBMiU2H8m3M97xFwcQE2GCdQ_2Q=TSM4b23-@mail.gmail.com>
References: <AANLkTinU39HjKWb9=VMiSa=R2YA_9BxPDctiW1ire48C@mail.gmail.com>
	<AANLkTikk1sce-dOHW_uVOO3m+XPx1ZjapvcNAAHiXwnS@mail.gmail.com>
	<AANLkTikkJod_2MTGN4B+8Q4wS74v9Z=nEBqrucUrcYjv@mail.gmail.com>
	<AANLkTikZuBMiU2H8m3M97xFwcQE2GCdQ_2Q=TSM4b23-@mail.gmail.com>
Date: Fri, 3 Sep 2010 09:52:54 +0930
Message-ID: <AANLkTi=eX15FWkO+Fux8UpNv9tXkTVtkYrd=t3c_==2k@mail.gmail.com>
From: Graham Gower <graham.gower@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Perl modules I can not get to build, libdbd-sqlite-perl libversion-perl
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
X-List-Received-Date: Fri, 03 Sep 2010 00:23:50 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 3 September 2010 09:13, J. L. <vwyodapink@gmail.com> wrote:
> Also if it would help I can post the image recipe I have made that I
> am trying to build.
>
> In case this explains anymore about the overo branch for you this was
> posted by steve sakoman who I believe is the maintainer of the branch
> about the difference which to me reads as its just the configuration
> files. If I am wrong please correct me.
> http://old.nabble.com/Re%3A-Is-Overo-OE-branch-a-fork--p25065128.html
>
> The main reason I posted these recipes was due to the fact that I have
> tried everything that has been mentioned to me before about how to
> read the errors and from what the errors read I do not understand why
> installing the files on the build machine does not help with the one,

Its possible the recipe needs to depend on some foo-native package. If
this is the case, then it can fail even if you have installed the
things on your build host manually because they are not in OE's
staging area.

Sometimes dependencies are not listed in the recipe because the build
order has always caused the dependency to be present on those
configurations that have been tested. The following things may expose
missing dependencies in a recipe by altering the build order:

 * Increasing BB_NUMBER_THREADS.
 * Building on a host that no one else is using.
 * Variations in your machine/distro/local conf files as compared with
those that have been tested recently by developers.
 * Recent changes to recipes which your problematic recipe depends on.
 * Recent recipe changes to recipes that depend upon your problematic recipe.
 * Radioactive decay of a bismuth-210 atom 3km underneath the house of
your server manufacturer's CTO's Aunt Mavis' family home in Tuvalu.



> and the other is honestly above me at the moment as I do not grasp
> using devshell yet and how to work with in there, let alone properly
> lay out a program recipe and then patch it to work properly. Once I
> grasp things more I hope to be a help and not such a hindrance, I
> welcome any tips links or anything to point to how to fix either and I
> will try more on more with those pointers and if successful post the
> results and maybe a patch or post the failure.

Read the OE manual. Read the Bitbake manual. Read .bb files. Read
.conf files. Read .bbclass files. Read Bitbake sources. Send patches.
Add time. Repeat. == expert!

-Graham


