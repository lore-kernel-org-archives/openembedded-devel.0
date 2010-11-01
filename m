Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <hvontres@gmail.com>) id 1PCxIX-0003WY-Rt
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Nov 2010 17:31:54 +0100
Received: by ewy2 with SMTP id 2so2741899ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Nov 2010 09:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=DM9Pd/bFfdEJbL73Y9P6M1Er6NQkC+okpjK1NOkYpzU=;
	b=oGa2MetLwdNmXcKH17JGhGgbCFpbMW+ueHTq9AwPXPGQufuDFot8lgi8dS6T2glRYK
	9EweLNazu1BwV2v36uYZurNCCiWlmqmTLo1j0NmlGGJfs3dGTmUn7lheGXtFQArkhCzX
	GNUWUiMM2jM9q8Rl/zdGQ9vqzc3Nr6ChyKPj4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=HG77w1QaN6WKVgU5bTFOcNJDH2HMPLQT9xraaWkMktzWi3eKV8N1RU0E/X0AFI9Vij
	3QwNYSQwBCfKHuD/7EqI6RAhjJd3vRAz5OLNvVX6/Xgg2oSwWBalowAe8oOYeNi5JjTU
	31cDWIdLToBUof/yTJytlA/pR9v15mOqpAfjQ=
MIME-Version: 1.0
Received: by 10.216.38.149 with SMTP id a21mr2937757web.35.1288629066886; Mon,
	01 Nov 2010 09:31:06 -0700 (PDT)
Received: by 10.216.3.130 with HTTP; Mon, 1 Nov 2010 09:31:06 -0700 (PDT)
Date: Mon, 1 Nov 2010 09:31:06 -0700
Message-ID: <AANLkTiksz3oEOdF6n14or=2Up18_bKYTCskYyuKR=zQ5@mail.gmail.com>
From: Hans Henry von Tresckow <hvontres@gmail.com>
To: oe-devel <openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 209.85.215.47
X-SA-Exim-Mail-From: hvontres@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Possible issue with sqlite3-native and tcl-native
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
X-List-Received-Date: Mon, 01 Nov 2010 16:31:54 -0000
Content-Type: text/plain; charset=ISO-8859-1

I ran into some strange build errors building sqlite3-native recently.
The build was failing on tclsh8.4 not being able to load
libtcl8.4.so.0 . This turned out to be an issue in my host
environment. It did point out however, that we now build and stage
tcl8.5-native instead of tcl8.4-native. Unfortunately I don't know
enough about the sqlite3 build system to offer a patch at this time.

Should I file a bug on this?

-- 
Henry von Tresckow (hvontres)


