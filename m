Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1PKttD-000238-Eh
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Nov 2010 15:30:36 +0100
Received: by gxk2 with SMTP id 2so5125266gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Nov 2010 06:29:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=tQm1GjKbgaVDj3Vq80JuHeQzbdwn5CndNtsTHaJ5xrU=;
	b=XiOZKFNK2PXVwVMu0AG3KW1B/SNEPO5+LSWIkRdVAXOlG0Bls+TzQh2/ZYo0WPfukc
	sWDqnAeR0lq2vmmj/m4ZbUgPBeCi38Leey1Y4nP9fkpAn7GdROS18wHpF4/Eg2oqEJvA
	WOULsNIZ1NpN4i+PwfoF8wMq+IhKeSGroHra8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	b=HZLfrYPR6uUNcM+Q1pSG/VXJI2DTNZuuLNGCz8w3GgdEEN0TX/USOQoreaj7kucBg6
	clqGz4ZznGc9HNCbvQKVlhW+rFLZsXmZlG7zBEBYSYzDUf4mLSx4sYF7K12SjTU3oADn
	9y1N8WbD6TJeTFscIfgLr6ww0ezxWBX6paGO4=
Received: by 10.216.154.8 with SMTP id g8mr1090711wek.12.1290522560603; Tue,
	23 Nov 2010 06:29:20 -0800 (PST)
MIME-Version: 1.0
Received: by 10.216.67.67 with HTTP; Tue, 23 Nov 2010 06:29:00 -0800 (PST)
From: Chris Larson <kergoth@gmail.com>
Date: Tue, 23 Nov 2010 07:29:00 -0700
Message-ID: <AANLkTim3cKQRr0e1VQRiLf=95jOHC5=TGPQfXbDoZCmj@mail.gmail.com>
To: Openembedded Discussion <openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 209.85.161.175
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: BitBake parallel parsing testing
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
X-List-Received-Date: Tue, 23 Nov 2010 14:30:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Greetings all,
This is a request for further testers for the parallel parsing branch
of bitbake, as well as for review of the code. =C2=A0I'm fairly certain
that the last real issue with it was resolved yesterday, and I haven't
gotten any reports of problems from those testing it since last week,
so I'm opening it up to more public testing, so we can be absolutely
certain that we can merge it to master in the near future without
risking problems.

For code review:
Either follow the below steps, then git log master..parallel-parsing
or git diff master..parallel-parsing, or use the web interface at
https://github.com/kergoth/bitbake/commits/parallel-parsing.

For testing from scratch:

git clone git://github.com/kergoth/bitbake
cd bitbake
git checkout -b parallel-parsing origin/parallel-parsing

From an existing bitbake repository:

git remote add kergoth git://github.com/kergoth/bitbake
git remote update
git checkout -b parallel-parsing kergoth/parallel-parsing

Thanks for your time, and do let me know what you think, either of the
code, performance in general, or the new progress bar (shows an ETA),
or anything else :)

--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


