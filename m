Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OWl03-00041B-Ah
	for openembedded-devel@lists.openembedded.org;
	Thu, 08 Jul 2010 08:54:25 +0200
Received: by bwz10 with SMTP id 10so279639bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Jul 2010 23:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=wx0fZkzl1yahFM9dNyrAkvpkhEEFN8HYzVa0sAJdIjM=;
	b=iD7sbZl0U9Rsm7Nzl3R0wKKJC/0zdmbNkWIZ/0ICE5WXpWnLTAyp0RcJGy100IRiXq
	FPG0xg5g91LIuPKP+PzcdmqmY62+YNICV+ftakJY4DnYuMvexTS/hWAIUrWDfcpG+nZg
	aYBYdGbldDvFnR8YS+tYkddV2CIwU6DlZFCzU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=Xsu6rFyDtbqd0a7pjQCoxvPGlt/9mOwGxZQiN6bcMpeiAq1diQwUXnxHxF0BeuMKz2
	G92jiicx6Q8yLIntIK95mU1WS5at+V6/rudO6l2eeyPdh7rZHFhKIPXzXzUSCCWsvaQZ
	RaMuPJibGXLGxowtVNNsTNJBYJIjtPqmrRgrY=
MIME-Version: 1.0
Received: by 10.204.71.8 with SMTP id f8mr1513057bkj.81.1278571766942; Wed, 07 
	Jul 2010 23:49:26 -0700 (PDT)
Received: by 10.204.66.68 with HTTP; Wed, 7 Jul 2010 23:49:26 -0700 (PDT)
In-Reply-To: <1278531880.4413.70.camel@lenovo.internal.reciva.com>
References: <1278527926-5065-1-git-send-email-fransmeulenbroeks@gmail.com>
	<AANLkTikso9BfJHslU0Ss6nQ5SfnOdgy8RIU0WF383jXX@mail.gmail.com>
	<1278529036.4413.67.camel@lenovo.internal.reciva.com>
	<AANLkTil6ZzCLdFEKksqKwjzCj_DV2DT7eifCJakP1HhR@mail.gmail.com>
	<1278531880.4413.70.camel@lenovo.internal.reciva.com>
Date: Thu, 8 Jul 2010 08:49:26 +0200
Message-ID: <AANLkTilH4HHsk0ftnGdTN43qWb70aDZvYt1o6557tAH4@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] classes/base.bbclass: add INCOMPATIBLE_MACHINE
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
X-List-Received-Date: Thu, 08 Jul 2010 06:54:25 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/7/7 Phil Blundell <philb@gnu.org>:
> On Wed, 2010-07-07 at 21:11 +0200, Frans Meulenbroeks wrote:
>> COMPATIBLE_ARCH does not exist at the moment.
>> Is there interest in it? (or in other words, do I have a chance I get
>> acks for it, if not I'd rather save myself the effort writing a patch
>
> Sorry, you're right, I had remembered it wrong. =A0It's ${COMPATIBLE_HOST=
}
> that I was thinking of, and I guess that doesn't do what you need in the
> specific case of cross packages.
>
> I guess I would be happy enough to see support for ${COMPATIBLE_TARGET}
> added to cross.bbclass if such a thing doesn't already exist.

I feel this is a good plan. Are there other supporters for this as
well (before I start working on it)?

The only concern I have is the name COMPATIBLE_TARGET
for me TARGET is the board so COMPATIBLE_TARGET for me more or less
equates to COMPATIBLE_MACHINE.
What about COMPATIBLE_ARCH or COMPATIBLE_ARCHITECTURE?

Frans


