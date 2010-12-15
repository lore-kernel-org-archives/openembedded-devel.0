Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PSmAA-0001rK-SC
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Dec 2010 08:52:40 +0100
Received: by iwn8 with SMTP id 8so1845179iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Dec 2010 23:51:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=K2skXSD/9GYYFPDkZFxozHPfAZG6Uqood7egVk8eiTY=;
	b=M32i0p0ZRAf9M1femZF2NAo1BdZqFqZk1iZGLTUFUeOXuLi7ETIGHEW/+gXhHYF851
	sL2sF7uv5bp4M/8Sh+CrQhhvnnn6nh7Lk11xErz4o+ifnjUa20jYVVbMGSBafZdQF0z7
	r07auoyocykrAhp1FCu57WDysM9Akasu4bapM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=rDoJEb8Z1SeVsl8Muy1ec7xIciJkcIEgnLEQhw5J/DBf0ufBOh4ZJdqVTtQ1eYQhA6
	ZOCOwhl/Oi03OVnyDHgLparekH4CEWp8CmbHYPHTKf9XeFA5DpjOnY2Qn1MxEbfrnU0c
	Dq2WrI10we+j44ZnjE+X85dfM0apojILZm79o=
MIME-Version: 1.0
Received: by 10.231.182.13 with SMTP id ca13mr4525821ibb.57.1292399462839;
	Tue, 14 Dec 2010 23:51:02 -0800 (PST)
Received: by 10.231.200.140 with HTTP; Tue, 14 Dec 2010 23:51:02 -0800 (PST)
Date: Wed, 15 Dec 2010 08:51:02 +0100
Message-ID: <AANLkTimTaZyPywc_B8g4k4QO+gTJq67K=OgcoSe6BpJh@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: testing 2010-12-10 (wiki, results, bluez-libs)
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
X-List-Received-Date: Wed, 15 Dec 2010 07:52:40 -0000
Content-Type: text/plain; charset=ISO-8859-1

Dear all,

I just wanted to update the testing table with my entries and I
noticed two (possibly related) things.
- no other entries for 2010-12-10 are there yet (and it is already wednesday)
- when I tried to save my data the wiki gave me an error (which is
reported in a separate mail, but which might be the cause that no
other entries are there).

So here my results:
neek: fails in udev:
nslu2le, nslu2be, calamari, mpc8313e, sheevaplug: build.

Remark:
The last three still give me this error:

ERROR: Multiple .bb files are due to be built which each provide
bluez-libs (/home/hudson/jobs/OE_test/workspace/openembedded/recipes/bluez/bluez4_4.42.bb
/home/hudson/jobs/OE_test/workspace/openembedded/recipes/bluez/bluez-libs_3.36.bb).
 This usually means one provides something the other doesn't and should.
NOTE: Preparing runqueue
ERROR: Multiple .bb files are due to be built which each provide
bluez-libs (/home/hudson/jobs/OE_test/workspace/openembedded/recipes/bluez/bluez4_4.42.bb
/home/hudson/jobs/OE_test/workspace/openembedded/recipes/bluez/bluez-libs_3.36.bb).
 This usually means one provides something the other doesn't and should.

First of all I get it twice (where once would suffice).
Secondly I'd like to get rid of this. I tried pinning in the past, but
that did not help.
Not sure if the 3.36 stuff is still used/useful. Or should we go (or
have gone) for bluez4-libs?
Or do we need a virtual/bluez-libs ?

Suggestions are appreciated.

Frans


