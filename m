Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P7vTj-0006xe-Pj
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Oct 2010 21:34:41 +0200
Received: by gxk19 with SMTP id 19so741645gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Oct 2010 12:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=atA3CjyPRgWjBvxeSKZn7GuR7DEY6LeW3aIPwsiyOkI=;
	b=PdTZb8n6BWX3Go263+81104AQ9ST0Wn0IWy2NYPYIrJGP7q0NOrriR2toIt1EKzuW6
	A9gNAOl63/uhkxk/aWPLerGd4W2b3Gm3czbdYPYbuJG4QmTA/zams0AOB1opSSz3k5ar
	znLxGQBxa/dzbnaaHOS47q3hR53UHypEd2AsY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=W4THwCgV25GLSiDb3pKulE49QmcVKL/8ybhvPubsYkiCdhkQO0wfxFT0lOZHuA1Xgd
	Tjl5SjU/xjLfe1mySDb5daRRZksN2jwOqQoK0/J8ZPidKAh3Se1KMyg2rjtvdbfxoXxh
	bnNz86IC7Na5dDv2AA2WdJufB5IUsUikXVMvk=
MIME-Version: 1.0
Received: by 10.42.39.77 with SMTP id g13mr2988136ice.460.1287430442726; Mon,
	18 Oct 2010 12:34:02 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Mon, 18 Oct 2010 12:34:00 -0700 (PDT)
Date: Mon, 18 Oct 2010 21:34:00 +0200
Message-ID: <AANLkTi=BDSYEAntW8M+i1_VS8Bi_MdPxk=QfHDtORq4U@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: postinst dependencies
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
X-List-Received-Date: Mon, 18 Oct 2010 19:34:41 -0000
Content-Type: text/plain; charset=ISO-8859-1

HI,

I was wondering how to deal with postinst dependencies.
I'm using sed in a postinst, so I added sed to RDEPENDS_${PN} but at
hindsight I am not too sure if that is the proper way as sed could
also come from busybox.
What is the preferred solution here?

Actually I have examined a few recipes and if things like sed or grep
are needed in postinst, they seem to be ignored.

Your suggestion is appreciated

Frans


