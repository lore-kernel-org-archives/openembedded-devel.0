Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Nu0Wu-000228-FS
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Mar 2010 10:36:08 +0100
Received: by gwaa20 with SMTP id a20so452507gwa.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Mar 2010 02:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=huymbf2F2qVT+7y3JqcWiR2CekPpqu0SdvBfiZqumoo=;
	b=IhRnBfpqDtHFMs7tStDwmNyr7+Wm7NxSFAVYNPO0gmu7xQbzUcb7NOiEaJgad+n7Vk
	5B7pfkxGaFr/Rkx0ZEmgVBILP8pVTVI632m2gJklETAg0oteJzgfuSfKvBeXUA7JbT92
	sb2PpHpjuW6NKM6+2XEIcvXZB1aay6cM7Hs0Y=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=Hdt1hsUR2u2MPtMCRxCgzkUIAXewO17yWRvDBwxTnq3LO6J4eaD6/qwEMVXQC3eDUZ
	o86gcGQW5HM3ste7917V6p07EdA06pjHHfQXruXmYW4/rA00Vu0x+t7NphKs+0WcHP3J
	VZi2/t6b+fC9vGplaN8PAAZQyBcBKAGLk+3xc=
MIME-Version: 1.0
Received: by 10.101.27.34 with SMTP id e34mr5100607anj.118.1269336779282; Tue, 
	23 Mar 2010 02:32:59 -0700 (PDT)
In-Reply-To: <b6ebd0a51003221526y7c47c57esd7bc14cc5e85f893@mail.gmail.com>
References: <b6ebd0a51003221526y7c47c57esd7bc14cc5e85f893@mail.gmail.com>
Date: Tue, 23 Mar 2010 10:32:59 +0100
Message-ID: <ac9c93b11003230232y2b556dc3t19813973d7c01b46@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: BBVERSIONS
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
X-List-Received-Date: Tue, 23 Mar 2010 09:36:09 -0000
Content-Type: text/plain; charset=ISO-8859-1

Chris, while this is a nice idea it conflicts with having checksums in
the recipe, as that makes the recipes unique.
Unless of course there is (or we create) a way to have multiple
checksums in a recipe and pick the one that is for the version we are
building.

Then again I feel it is in most cases better to move forward. E.g. for
your nano example: why would people want to build say nano 1.0.2 if
there is also a working 1.0.6 recipe (or even a 2.2.3 one or whatever
version it is at). I feel it is better to spent time to
fix/improve/add/repair the latest version than spend time fixing old
code.
(generally speaking that is)

Frans.


