Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P9zFr-0006OK-Pf
	for openembedded-devel@lists.openembedded.org;
	Sun, 24 Oct 2010 14:01:20 +0200
Received: by iwn5 with SMTP id 5so1736458iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Oct 2010 05:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=EF3Q2MnHzU5fKs1s9NC34Htlzu85VbdtU1eSTUrbY6s=;
	b=kkTvtA/oFh/vruHTZ3HsYit0iOXnRWAcFVpaZMEiUMPICTD+1y8iocvDJNMGQDhdDv
	y3BA3ByCItpb2zt1MV+r0LjutVKx9I+ShTvY/KFS3XhZLuJ3sZXO9xzHXgGFccjcOpZo
	qdyGgPmXGz8Vt9csFvH44t/HLOOBhoOjj/oCU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=Nl80WD7B0X1IGYtWhE8cdio1Iafj1yAoZmYhp/wF8X4OfvoIUDkOMJzF0hv9QH/cMy
	cwqn1RPDkjcIGbtOzJ5eJMJ90JNNDtxhN7URPnmwKat8fRQIh/DdL4ZOn2mTvyJpNkrY
	IY7BZUCqExde/OBL12OHnaZ00rb1lkJF227/U=
MIME-Version: 1.0
Received: by 10.42.228.202 with SMTP id jf10mr3631568icb.455.1287921608723;
	Sun, 24 Oct 2010 05:00:08 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Sun, 24 Oct 2010 05:00:08 -0700 (PDT)
Date: Sun, 24 Oct 2010 14:00:08 +0200
Message-ID: <AANLkTimyqP-aP=+poQSHFE=ePogb66en0BwNCYWwCkXk@mail.gmail.com>
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
Subject: sed dependency
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
X-List-Received-Date: Sun, 24 Oct 2010 12:01:20 -0000
Content-Type: text/plain; charset=ISO-8859-1

Triggered by this: http://patchwork.openembedded.org/patch/3099/
I was wondering whether we should have sed-native as always-required ?

If not lots of recipes might require an update like the one above:

frans@linux-suse:~/oe/openembedded/recipes> grep sed -l */* -w | wc
    776     776   20661
frans@linux-suse:~/oe/openembedded/recipes> grep sed-native */* | wc
      9      61     737

Guess despite the -w there will be some false hits in the first grep
(because it is in postinst or in a comment), but I expect some 700+
recipes remaining.

(actually thinking about it we could also do a scan on all added code
to see if there is a dep on e.g. sed or grep, but guess due to the
overhead then it is better to generically depend on sed-native).

Guess something similar holds for grep (gave 128 matches) and probably
some other tools).

Frans


