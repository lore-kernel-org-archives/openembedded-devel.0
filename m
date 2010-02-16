Received: from mail-ew0-f213.google.com ([209.85.219.213])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1NhJSy-0007CN-Vz
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Feb 2010 10:11:40 +0100
Received: by ewy5 with SMTP id 5so661511ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Feb 2010 01:08:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=yuAM6zBBqtAql7VveUwdZu/jhXIBzP5F6jZjJEN6cj8=;
	b=K8iEwPzbU95Luq3czQ3tOtIVv6z3GbR7qICTyIxMenAHknQtiMhDdnApDFS6OvFcsW
	PbvXPtfIkCDzcgM82+qH16H3C6ghkTGscnqYL66MS+0F+UxM2bomQMRUb0kER5ceCklI
	CFaS2O1CY5+wpp03yYB1Qo3H/uuzp1ZTBSviY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=R+GymCei+FXdnPPhLqzacxo4R7+YI64Lgu6RA4DVsLnnImX2XiYNejHvc5HhlHjc5q
	dAyx6kebIoAVAmxEGz8w1HYoyNDM3t1/yfIwOAQEQ+G0i5SIcVTQ90l6f0yQP4PKYdqR
	OE7ItMQdUgngJK8nARp1hgDS5Q1KgQs9zIqCg=
MIME-Version: 1.0
Received: by 10.213.96.212 with SMTP id i20mr3715217ebn.35.1266311338440; Tue, 
	16 Feb 2010 01:08:58 -0800 (PST)
In-Reply-To: <ac9c93b11002160039j717d1611wbdd1d2fac220dd55@mail.gmail.com>
References: <b6ebd0a51002151538o524cdf17s228535e93b28d4d4@mail.gmail.com>
	<hldk2b$5tt$2@ger.gmane.org>
	<ac9c93b11002160039j717d1611wbdd1d2fac220dd55@mail.gmail.com>
Date: Tue, 16 Feb 2010 10:08:58 +0100
Message-ID: <d1b08f941002160108p2e8a880atba367857e3552a22@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.219.213
X-SA-Exim-Mail-From: andrea.adami@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Cleanup / janitors
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
X-List-Received-Date: Tue, 16 Feb 2010 09:11:40 -0000
Content-Type: text/plain; charset=ISO-8859-1

> Problem is to do that reliable.
I would follow RP steps: starting in nov 2009
http://git.pokylinux.org/cgit.cgi/poky/log/

>It is easy to remove the do_stage section from a recipe, and it is
>easy to verify that it builds, but it is already becoming less trivial
>to verify that everything that depends on it builds too, and it
>becomes complicated if you want to verify that it actually works
>(especially if you have no clue what the package does).
That's the reason why I did not dare too

> The other thing that comes to mind is better describing the job. If it
I'd define it "Monkey-picking from Poky" for the most recipes.

How dangerous could it be? I have no idea about eventual subtle diffs
between Poky and OE.

Regards

Andrea


