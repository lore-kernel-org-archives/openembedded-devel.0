Received: from [209.85.220.172] (helo=mail-fx0-f172.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1LmOrD-0004Jr-Ee
	for openembedded-devel@lists.openembedded.org;
	Wed, 25 Mar 2009 09:53:07 +0100
Received: by fxm20 with SMTP id 20so2441724fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Mar 2009 01:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=wHEY2Jo016NXE+xp5hZnAstkdsJDi5thZ9ZUw7C6qAA=;
	b=YBugyNg4U6lO/RYNHCewb1dInZCYUZmgHqsFbKwetKjpCWEaLZo+ZZ6isQFo7n3hvH
	dKx7N6YKJm+tYHd9zS7mtSqqCIo8p/Ygax40IvTmFlOSPW+x/hx1nkmDA9JwfhsU5I10
	ZCMHSUtmhN9wGXs5eRip1TyAHiPEpuF/taVkc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=DHman0m6hKvLZKwvVjYSHVFHQOd8i2KgnFmeiUwoXFaz4DcUi2Fdh3EVeGOxWlC4Fj
	hYwiuWoNITE/5TGVMtp+/qFHgamDxbVw9qqV1/dN0uEM87GwWvAUtzstBHWe2enl6m7g
	Ignxs/Kn1YIxqsLn6hwS9QZmOb3hUxvO6ZU7M=
MIME-Version: 1.0
Received: by 10.223.125.144 with SMTP id y16mr902963far.93.1237971091433; Wed, 
	25 Mar 2009 01:51:31 -0700 (PDT)
In-Reply-To: <49C94647.2040401@gmail.com>
References: <b6ebd0a50903171218i7f5716afifd99177982b6df5b@mail.gmail.com>
	<ac9c93b10903241136q779fe115sa595c31200b707c6@mail.gmail.com>
	<49C92CC7.2080801@gmail.com>
	<b6ebd0a50903241205h6813f898i87351aaad17b6775@mail.gmail.com>
	<49C93237.7010205@gmail.com> <49C9347C.7010309@balister.org>
	<FA1C2D98-DEF3-4694-A757-7C137F667CE3@ngndg.com>
	<b6ebd0a50903241301r5b8972b4s59df7be41052ab7a@mail.gmail.com>
	<dc6682e90903241330m1191395j478ee4180a969cfb@mail.gmail.com>
	<49C94647.2040401@gmail.com>
Date: Wed, 25 Mar 2009 09:51:31 +0100
Message-ID: <ac9c93b10903250151v6ea0586bv461debbe36f42ac7@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Package Maintenance
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
X-List-Received-Date: Wed, 25 Mar 2009 08:53:07 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Having read all of the responses let me explain the (admittedly
chaotic) way I work.

My interest is mostly in application packages. I added several recipes
for them in the past.
Also I've been using several packages that were already present (e.g.
for the beagleboard james project).
If I start doing so, I typically check whether the package is more or
less current. If the package is at 1.3 and the src is already at 2.4
I've updated the package if possible (as I felt it was probably
orphaned). Mainly I did so because I needed a newer version of that
package, but I do not desire to take ownership of all those packages.

If I find a trivial problem in a package that can be repaired easily
and with a low risk I also tend to fix it (e.g. a missing DEPENDS).
This is mostly independent of the package.
Not sure if that is the right way though.

Generally my attitude is: if you need something and detect that is
broken, don't whine about it, but fix it if possible (probably asking
advice on #oe or the mailing list)
And of course in due time I learned who to consult/contact/push for
specific packages.

Wrt the statistics to get a (proposed) maintainer. Good idea.
And if there is a (near) draw: As far as I am concerned it would be
perfectly ok if a package has two maintainers.

One last note. sometimes I created packages just because another
package needed them. My interest in that package is then a little bit
secondary. E.g.if I want package A and it does not exist I create it,
and if A needs B I probably need to create that one too, but keeping B
up to date might be less interesting if A does not need the newer B.

and a last last thing: about the vetting: not sure whether I fully
understand the idea, but is a lot of this info on what builds on what
not already present in tinderbox?

Frans


