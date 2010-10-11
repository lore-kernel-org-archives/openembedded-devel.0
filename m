Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P5PJZ-0002jd-GA
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Oct 2010 22:49:46 +0200
Received: by iwn2 with SMTP id 2so143478iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Oct 2010 13:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=kMzcoud891okdiLkBBp0rym98FYFRX7sSskabYiw45s=;
	b=noBcMqqnsUk5bx+jejFqvAPXFpZ7EWIBGLzlVIyMf89sRKJGoLEYkw/PRz5bUIvFdl
	qO83dtS2MFgf/VUm5UFEbqp1jtXsYV1rJvgH5RLiaXZfOJUAoSDUmcmRTcWLtNQAj557
	L4uqXj0gp0ZXVh7xaRcJ+bMStdjTw00l67TOM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=UyI+UBiESmYKlNi1g5tTfxm9nZGTPTz3doy3C2PA5QMgm7ia4+ly3NibIfWytBczQN
	mKW4uGLX41VIAxIRhc9Ri3jyM301lwE4oDANp00Vay6VbnhFQR6eEUSL3Pi+oVg+HavL
	qiBhIOafoBwB/5yK4gN0fNrY15nNvTpw8M3OU=
MIME-Version: 1.0
Received: by 10.42.115.69 with SMTP id j5mr1437798icq.296.1286830156279; Mon,
	11 Oct 2010 13:49:16 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Mon, 11 Oct 2010 13:49:15 -0700 (PDT)
In-Reply-To: <AANLkTinmyJX7LneT73aoG9u3rFtj=hj383BJGyuaskuV@mail.gmail.com>
References: <AANLkTimXc3kLFR1m1uXM6OXZQn3idnbiDcEHPU0wpwEC@mail.gmail.com>
	<AANLkTikd-_vDny=kJKeS+NVWeYyfxiE_yXdUE+t1ac48@mail.gmail.com>
	<AANLkTi=s9gHBx_uPgiPGhu9b7D10JGytQaxyd-SZ+sfQ@mail.gmail.com>
	<AANLkTinWXK-HZHOLv2b2ApdPQ+LW22bvwsOO5TGOc1kx@mail.gmail.com>
	<AANLkTim9n1JsDc+bmYN5g20kBtobi5Ti-60Joq1U_rQZ@mail.gmail.com>
	<AANLkTi=r1NxVPeRVSSP24YXJSRDxUBwvLQo4PH6_iRxj@mail.gmail.com>
	<AANLkTimkhhnmDTWH3=Vx5hVN=Hpy5WXpnUX-E5QfRobb@mail.gmail.com>
	<4C8E9653.2020601@balister.org>
	<AANLkTiko_vEXjjW+SUrvb=V+R-Vu0p3AvN7hcdD+Ghjg@mail.gmail.com>
	<4C928DF9.2050405@mentor.com>
	<AANLkTimqMudTsuLKDyQKUBen7H4ZUoOCAxKDXVL7Utcp@mail.gmail.com>
	<4C938713.2000201@mentor.com>
	<AANLkTimQ7ZhhhM+9gAbikjfZ-zRA=UE52=qvkf33zqwD@mail.gmail.com>
	<AANLkTinmyJX7LneT73aoG9u3rFtj=hj383BJGyuaskuV@mail.gmail.com>
Date: Mon, 11 Oct 2010 22:49:15 +0200
Message-ID: <AANLkTimQPQ4L5+JvcYQXe8FEdmYEeOLKVPBQL0s3uhEe@mail.gmail.com>
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
Subject: Re: script to remove orphaned files
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
X-List-Received-Date: Mon, 11 Oct 2010 20:49:46 -0000
Content-Type: text/plain; charset=ISO-8859-1

Dear all,

I just pushed the last batch of changes.
All recipes dirs have been cleaned except for boost (someone
explicitly asked not to clean it; if I recall correctly because he was
working on that recipe and that patch).
Should something have been moved that should not be moved, feel free
to revert the patch or restore the missing file from obsolete.

I would appreciate it if people would check every once-in-a-while if
they do not leave stale files behind.
A maintainer of a recipe is in a much better position to judge this than I am.

Also please note that I am not saying that there are no unused files left.
A few recipes used things like ${PV} in the patches. I did not process
these dirs.

Furthermore I did not analyse file paths or so. I've taken a cautious
approach, so if a patch file was referenced in any bb or inc file from
that recipe it was kept as it was too hard to reliably judge if *that*
copy was actually used.
So e.g. if you have v1/patch and v2/patch both files are still there
even though maybe only v2/patch was used.
Doing that kind of cleanup would require a recipe parser that marks
all files that it uses.
(and if someone can create such a thing, that would be nice).

Best regards, Frans.


