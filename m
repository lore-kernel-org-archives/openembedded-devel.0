Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OoxQa-0008U8-0e
	for openembedded-devel@lists.openembedded.org;
	Fri, 27 Aug 2010 13:49:00 +0200
Received: by iwn2 with SMTP id 2so2458782iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Aug 2010 04:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=6Mf+njYlO+5hvRvGBDHKJ2y7W8F3cm3iI0z1d1MKhL0=;
	b=Cn0l0UjM+Srl0Xo8K62nKZALbXgcQdExCDy3FrLjg9IcheousoiU+LAmAeHcXql5i1
	BhXPZJfPXV7oVN1/BDfijx7FCg9Jipdh5zPEnci5GgOxK4zQMFp/aeWb6SiyuOyXZBpp
	/1AMAH6L6Z8GqN1bbW0wMLM8lbJwfgWrVXDGk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=cb9ETA6co287lSC3/wFLEAAPE2k47SKaCnzlkfQO01CF5YgUwq0pc3fFYDSzNyXg+V
	Cw+iX1fDED5V0AdRiF3pflBQx6c/0e80C8FgW6L+Ka2XVq8/fdY0bhYACCjDOHOOD3u/
	2AGCZGSid36DtFYGZCyQznHWCccoICvoWsFV0=
MIME-Version: 1.0
Received: by 10.231.149.12 with SMTP id r12mr959203ibv.185.1282909712564; Fri,
	27 Aug 2010 04:48:32 -0700 (PDT)
Received: by 10.231.205.138 with HTTP; Fri, 27 Aug 2010 04:48:32 -0700 (PDT)
Date: Fri, 27 Aug 2010 13:48:32 +0200
Message-ID: <AANLkTimHJqkoxBAhBo=HJDqC=joPovjO6joi2sXiLJHM@mail.gmail.com>
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
Subject: lemon install
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
X-List-Received-Date: Fri, 27 Aug 2010 11:49:00 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi all,

No idea who is responsible for lemon but triggered by Fasas I noticed this:

do_install() {
	install -d ${D}${bindir}
	install -m 0755 lemon ${D}${bindir}
	install -m 0644 lempar.c ${D}${bindir}
	install -d ${D}${mandir}/man1
	install -m 0644 ${WORKDIR}/lemon.1 ${D}${mandir}/man1/
}


A .c file that is copied to bindir?
I know this is a parser, but I would expect .c files to be placed in a
different location.
Can someone shed a light on this?
Or, even better: fix this?

Thanks!
Frans.


