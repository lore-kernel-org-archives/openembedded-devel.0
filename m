Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Oobh4-00032i-1d
	for openembedded-devel@lists.openembedded.org;
	Thu, 26 Aug 2010 14:36:34 +0200
Received: by ywa8 with SMTP id 8so685873ywa.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Aug 2010 05:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=SBdXVGYreFdWWoCqmwx531eGQbMfwOynYdz/8KU71t8=;
	b=ChWLe5olgLNBFRQNuRSlfamKzw7pUET6cRzoROWmkTc1jddHsp+MFbc6R+3FOFFNZG
	YD1Tgi4n+dB6SEMG/jcHZAu9oxauNWmmdPaJdMLxZDd+hVUiVMQF78HCwM4fFu/I+Hk2
	dqJ7TVIOvYVhi0PunU4ma1/X9Mbx7liqUtf5U=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=SNZs4ee7nHDj/GE8xABp8/q86SXi+8RabMwWCQvQs1UoZSq2jKEcTDPeWHVqdY2VAS
	7K1PsgxeesehceZAtpTrHC5ZUXKKqzpgUMvIYTtJa32CiaZqGvDDHxdtaNh5c0Z+KCb1
	4KKhZTNobpT/4E/zKINAs/NtCK1sTxEvxDOxA=
MIME-Version: 1.0
Received: by 10.150.177.19 with SMTP id z19mr103680ybe.161.1282826165687; Thu,
	26 Aug 2010 05:36:05 -0700 (PDT)
Received: by 10.231.205.138 with HTTP; Thu, 26 Aug 2010 05:36:05 -0700 (PDT)
Date: Thu, 26 Aug 2010 14:36:05 +0200
Message-ID: <AANLkTimT-Bwj8mnJk8uHhXFXhauHv0PO0P2eZic9bMbD@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: remove cdrtools ?
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
X-List-Received-Date: Thu, 26 Aug 2010 12:36:34 -0000
Content-Type: text/plain; charset=ISO-8859-1

While browsing through our recipes I found this:
cdrtools/cdrtools-native_2.01.01_alpha77.bb

This was added in 2006 by Raymond Danks, I did some cleaning 1.5 year
ago, Holger moved it to the latest version last march.

When I wanted to attack this device to remove legacy staging, I
suddenly asked myself: why do we have this recipe in the first place?

Facts:
There is no target recipe for it
no one pins it
no recipe depends on it

I can imagine having a cd recording app could be useful, but do we
within oe really want to support and maintain recording apps?
I guess any decent dev system has cdrtools and at least 5 other
recording apps, so I consider this recipe to be out of scope for OE.

My proposal: remove this recipe

Can I have an ack for this (or if you feel this should be kept can you
please explain why this would be useful to keep and would you then
please also convert the recipe from legacy staging (and probably move
to 3.0)?

Frans.


