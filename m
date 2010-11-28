Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PMnV8-0005lv-0e
	for openembedded-devel@lists.openembedded.org;
	Sun, 28 Nov 2010 21:05:34 +0100
Received: by iwn8 with SMTP id 8so2248499iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 28 Nov 2010 12:04:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=VfAgnk+LaP5f+77iJ9b51gLYHJl5p6l81MvPVxmEbXE=;
	b=xblMO+XxXEvojHYylGbX6tzL2yb8pmzFfnQ/cIy3asbRwcl3POMrnedoShF4NjnXkJ
	qE+3XFX16lKNLDOZnFxg4AeN8ytx89BbeMg4EP1o0HcyHXLjsqUrGDgv+GwnKYCXLDgt
	uxrOx0rXBbBU7cydJo2j2xWiONTZkG3Z15INA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=Rd2gBYbeyhD5m7EaR/MHjx7FJLWd3JcW4BUDGpnw0FMuKZVC/X3MnXLmXnxsa2wfhK
	gEskmx07JTrsFE+uSrkzD+MBHCVxIlC4R3sepB8fMHSn9yY5D/Pi8Ly9yDsdgrSaUpvx
	DqRq1Ze3z7gEREzm51GCTJIoj2hpcDNSwKrxU=
MIME-Version: 1.0
Received: by 10.231.35.5 with SMTP id n5mr4065255ibd.182.1290974654537; Sun,
	28 Nov 2010 12:04:14 -0800 (PST)
Received: by 10.231.200.140 with HTTP; Sun, 28 Nov 2010 12:04:14 -0800 (PST)
Date: Sun, 28 Nov 2010 21:04:14 +0100
Message-ID: <AANLkTi=CZBGsEXOAHT_eW54EQ2KMn1e4mCNcMK1GB7ga@mail.gmail.com>
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
Subject: php build issue
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
X-List-Received-Date: Sun, 28 Nov 2010 20:05:34 -0000
Content-Type: text/plain; charset=ISO-8859-1

I had a very weird issue today.

php - 5.2.13 - r7.2 does build locally, but refuses to build on our
autobuilder as configure says fork is not found!

TInderbox log is at
http://tinderbox.openembedded.net/public/logs/task/11550106.txt

I'm especially confused/worried by some of the autotools messages in
the log, but unfortunately my autoconf knowledge is not good enough to
fix this.

Anyone a suggestion?

Thanks alot! Frans


