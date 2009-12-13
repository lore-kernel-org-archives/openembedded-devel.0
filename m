Received: from mail-gx0-f215.google.com ([209.85.217.215])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1NJpmN-0003A9-75
	for openembedded-devel@lists.openembedded.org;
	Sun, 13 Dec 2009 15:50:38 +0100
Received: by gxk7 with SMTP id 7so3597991gxk.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Dec 2009 06:48:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type;
	bh=oj+vIOHjgT+4TJfUTKCUhYvA1d41yWGabLzKPEssjZs=;
	b=us+iQSLg58b4e/q0/xjtcTnAGNreZUr/3IMKqGGrp4BLFs/DMuEEnAzQFrBlTPFUIa
	BIogTSPEdpQ169AUXloyf/ZSSw0yoUmG+vkymV43FQSR5IzDkBQ+xZwnL4lLPO3VRxPG
	0UAZMJ/5z38Ss9WweomjpsUK+JaG74fo9eGFA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=ENYaFVBCt+gd+MSfqRi1pxRiI9yuswu7ONNs9ksyby5Uu7VoaRGdl8bbZlgym4iY6k
	e9pk6MV86z2WWXcolmoFCFhSjKGARsr7KMTsEOTMF3hW9XdMY18INgeg7dc1gigMHlsi
	uGEHZ74AvG2yrL361w8y+RAt2xL5M7ZmjLl7Q=
MIME-Version: 1.0
Received: by 10.101.7.20 with SMTP id k20mr5524388ani.35.1260715730180; Sun, 
	13 Dec 2009 06:48:50 -0800 (PST)
Date: Sun, 13 Dec 2009 15:48:50 +0100
Message-ID: <ac9c93b10912130648q6fd4e04ax3b1a24edf523688a@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.217.215
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: pcre staging (was: Re: new staging breaks apache2)
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
X-List-Received-Date: Sun, 13 Dec 2009 14:50:38 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

I've dived into this problem.
The root cause is that pcre-config is not staged properly for package pcre
No idea why, maybe because it is part of the -dev package.
I tried to dive into this and peeked at classes/autotools.bbclass but
didn't manage to find the cause
(or maybe I did, but in that case I didn't find the fix).

What I saw were three references to STAGE_TEMP_PREFIX . However a grep
-r on my openembedded dir did not deliver an indication on where this
var is set.
so either this is the problem, or I am totally lost wrt this issue.

Anyway, I've fixed things for now by re-adding do_stage and explicitly
stage pcre-config.
This works and solves the breakage I had introduced by this.
Apache2 builds fine with this fix.

Looking for an expert opinion on how to really fix this

Frans.

PS: probably I would prefer it if the STAGE_TEMP dir remains and is
not removed. This could help diagnosing things.


2009/12/13 Frans Meulenbroeks <fransmeulenbroeks@gmail.com>:
> Hi,
>
> I changed apache to use libpcre and also moved libpcre to the new
> staging. (effectively removing do_stage)
> However, apparently things do not work as the should.
>
> apparently things seemed to work so I committed my work.
> However after changing one more thing in apache, it does not build any more.
> I get an error in configure stating:
> configure: error: Did not find pcre-config script at
> /home/frans/oe/tmp_angstrom/staging/armv7a-angstrom-linux-gnueabi/usr/bin/..
>
> In the libpcre work dir it creates:
> ./package/usr/bin/pcre-config
>
> would expect this to end up in staging too with the new staging.
>
> However, if I run a find for pcre-config in staging I get:
> ./i686-linux/usr/bin/armv5te-angstrom-linux-gnueabi/pcre-config
> ./i686-linux/usr/bin/armv7a-angstrom-linux-gnueabi/pcre-config
> ./armv7a-angstrom-linux-gnueabi/usr/share/doc/pcre/pcre-config.txt
> ./armv7a-angstrom-linux-gnueabi/usr/share/doc/pcre/html/pcre-config.html
>
> no ./armv7a-angstrom-linux-gnueabi/usr/bin/pcre-config
>
> What did I do wrong/what went wrong?????
>
> Totally puzzled.
> Will dig into this tomorrow (it is now 1 am here so little chance I
> can find a decent solution, need some sleep first).
> Any suggestions/help is appreciated (and apologies for breaking the
> apache2 build (and yes, I could revert but actually the old version
> was not really sound either).
>
> Frans
>


