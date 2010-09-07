Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OsvDb-00040V-TC
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Sep 2010 12:16:14 +0200
Received: by iwn2 with SMTP id 2so5087067iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Sep 2010 03:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=bamW0EoVjxZ8r8IbvbrQ+3X/jlr/GDTbKgzLr5iFLwY=;
	b=GlhUqtooAWuHsCXD+fHa2LbwUmIRBPWePU4prBUeHgVNKLwZlT+7CmGi0KgRIbc1PM
	mpEdIYv4KdoRQHEcGi7N9uqSks+lUVV0M2OxoKjzgY7hII91mMQb3KSziVFx/KPAMInr
	bIOrbJYgVAlyLUEGNI3MLpTl4TYX+GrhY8q2A=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=AlM0wTbLOW2dIBI9YGA3fm7RYvAoL5g4cxiV35Urp/5GqrY8thqEq3EvgQUskIRxX2
	d/f3rKiF3ob8MhCW/4z0C1uNE1VrzLE9SPIXSISe3iJo2hycB01ufCIOPpIvz7ScEuzl
	VRistHU63QmN7PYimjMKb8bSPGPxq9Qa7V6s4=
MIME-Version: 1.0
Received: by 10.231.153.76 with SMTP id j12mr7825809ibw.66.1283854515004; Tue,
	07 Sep 2010 03:15:15 -0700 (PDT)
Received: by 10.231.208.17 with HTTP; Tue, 7 Sep 2010 03:15:14 -0700 (PDT)
Date: Tue, 7 Sep 2010 12:15:14 +0200
Message-ID: <AANLkTi=O6BT0FreCcesY95bFjTmfjF4a=XidQqgXrRHG@mail.gmail.com>
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
Subject: makedevs
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
X-List-Received-Date: Tue, 07 Sep 2010 10:16:14 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

I bumped upon the following with makedevs:
If /dev does not exist an error is created.
Should makedevs create intermediate paths if they do not exist yet
(especially /dev ?)

Also for block and char devices no error is given if the mknod fails.
For fifo's there is one.
Not sure what other error handling could be added.

Frans


