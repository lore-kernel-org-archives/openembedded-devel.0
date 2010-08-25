Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OoJWW-00043V-Gm
	for openembedded-devel@lists.openembedded.org;
	Wed, 25 Aug 2010 19:12:31 +0200
Received: by iwn2 with SMTP id 2so723233iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Aug 2010 10:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=XPceKvV7Lq43mZZLs1GJX7Yx9fjKMArFhBzFZi0TvB4=;
	b=lX5qWom716d6Bo7aUUqTV7p3hXNnUHEq1daqrzF4dzmcvXwJ7bpGwLAhj7wOjpuRzo
	agCafNbsacjxZoqAVK50pAGHhaXrbirX23CGHZOWhbCyJ9njq9QwcrxvhgosZkzWtzdq
	gxCW7cHvguHrJom6mOoUn/T28VMJkw2ig1Ga4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=XWmPISuvjR1EEPCDMhjkFxFG/4QhlyfrYPG2A8PeLYdgO98c3aJ1SKhB7Qf0VEJL0o
	UUgzch5BBwm9TQO7CaxrTztF7OF3r9zQt0Dm/R1dTEa+6ENAiwh6LzXVJVYa5HhulvA2
	gch1omB0/8IGIpzQ3QQhfYhhuVtgUYbQ4EYE0=
MIME-Version: 1.0
Received: by 10.231.15.8 with SMTP id i8mr9697760iba.12.1282756322917; Wed, 25
	Aug 2010 10:12:02 -0700 (PDT)
Received: by 10.231.205.138 with HTTP; Wed, 25 Aug 2010 10:12:02 -0700 (PDT)
Date: Wed, 25 Aug 2010 19:12:02 +0200
Message-ID: <AANLkTimd9f1LPJ8f7Bi1+8V7T8dJ-C+3m5NxgWGQ8Tuw@mail.gmail.com>
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
Subject: squid: remove 2.x versions
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
X-List-Received-Date: Wed, 25 Aug 2010 17:12:31 -0000
Content-Type: text/plain; charset=ISO-8859-1

Triggered by the recent commit from Roman:
http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=b0f0b3ab87cf85c76498b57f8300539d133efa6f
There are various DoS issues resolved in 3 that are not resolved in
2.x (http://www.squid-cache.org/Advisories/)

2.6 is not a recommended version any more. 2.7 is lagging a version
(latest is stable9).
I propose to remove the 2.x versions and keep only 3.1.7

Frans


