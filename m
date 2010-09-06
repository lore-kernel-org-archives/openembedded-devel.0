Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OsYJ2-0006h0-RM
	for openembedded-devel@lists.openembedded.org;
	Mon, 06 Sep 2010 11:48:07 +0200
Received: by iwn2 with SMTP id 2so4005581iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Sep 2010 02:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=ZzKiTb+EMK7g19SV55qXdRTxlLfviqPM160iS48Ib8k=;
	b=k03eBEtmcgPY6Y5ibbJEIq4a9nFq417RqSIDtDHq1FnGAKFafSqv1Ih21Ov12B8SGg
	aZtHIxlDzAb/NNI3bu3n0LO6o2jj3gpoFwIGiUP2h54R6my1FqKfkWNbzEJcfP4SB9TX
	dnr/wmT0cZKqLBOFBzycjeh6CSmFZiE9efMts=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=ItYO3YtvFE4DVU2jXwfYMjrWEzg6c+YCr8uZy9wfg7Wv4UNEVaICPvUsM4IDHZh9OI
	7PA+cjhka4IoxiWKCFukcQcUnPcej/lw0dbSjjRC24IqdkN0M6VF5jVcVoQvRf0Xw4Dy
	MJrQHFxsXY6UtGt6FYjPXMqiTh0X5bltuvXOE=
MIME-Version: 1.0
Received: by 10.231.174.196 with SMTP id u4mr5951077ibz.19.1283766446138; Mon,
	06 Sep 2010 02:47:26 -0700 (PDT)
Received: by 10.231.208.17 with HTTP; Mon, 6 Sep 2010 02:47:26 -0700 (PDT)
In-Reply-To: <AANLkTik6Rdr4wMxLJpf1ijBeOctWaO+VEFja3ytnmPAx@mail.gmail.com>
References: <AANLkTinuQnnOAh62GF+v0TzU8mRj1F+m1YGi6DdohNmr@mail.gmail.com>
	<AANLkTim=Bb_yWWuKOd=JMQ9GGL5aoxAyaO7oJnXO+zyK@mail.gmail.com>
	<i5m4sn$l1b$3@dough.gmane.org>
	<AANLkTimttxo+X6DaN8SatwXbKYJWoTJQ27D3bhW9FEq5@mail.gmail.com>
	<AANLkTikPjmgPn3d7xSwxFt8Po2+vJ8JsnG1nQ=Zms0Sz@mail.gmail.com>
	<AANLkTi=b+gi7YZj5ZfhErXFkUfR1qrp1VUCvW2UQC3R9@mail.gmail.com>
	<AANLkTik6Rdr4wMxLJpf1ijBeOctWaO+VEFja3ytnmPAx@mail.gmail.com>
Date: Mon, 6 Sep 2010 11:47:26 +0200
Message-ID: <AANLkTimYgg9=dNc5AeK=Vigw5FFMQvg+=mCwaLotSfEV@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: testing branch 2010-08-30
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
X-List-Received-Date: Mon, 06 Sep 2010 09:48:16 -0000
Content-Type: text/plain; charset=ISO-8859-1

Short report:

managed to set things up on the autobuilder.
I did a test run building minimal/console-image for neek (nios2).
It failed in os2Stubs.c
Haven't peeked into it, nios2 is probably not something you want to
run X on anyway.

I'll retest with todays version and more formally report back and
report my findings in the wiki.

Frans


