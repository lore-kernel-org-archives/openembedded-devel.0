Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PN07r-0006Pq-I7
	for openembedded-devel@lists.openembedded.org;
	Mon, 29 Nov 2010 10:34:25 +0100
Received: by iwn8 with SMTP id 8so2945488iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Nov 2010 01:33:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=Umn58yoewOONmpgfkURUiqK6LExkeDzlMkkM6f814rQ=;
	b=wRgmzg42wVMD6JJi/G7VOBPsLgBrQf+Z/N8T8QsAvGAiSlgKfuNUblFy5y7pPMRIYk
	ocOxtPRixOf5BWHTufHzlNirnCvpIKDqbdN3o+RoES6jk+pPF0aGZsKynMVn3UwzX08W
	MGhEQX2E/FCqFlRYPGIaLWf9uF0a9N/3G4+Hk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=cLNu6RFuNI8pBiPxWu6MkbkHeq6rogNzGugTAq7yHcrlbQJEW1ZpkS5/4uQmft1fy7
	B3CrDlhynOqo55kD/Vgk16CKUf1HDQfk6XTw3MF43JVyNFDeCsT0G9E+dRunEpjORr2D
	2vNXU1SGWzlvZwb4ESz7KEcCW6hIjWVyhHvzA=
MIME-Version: 1.0
Received: by 10.231.20.65 with SMTP id e1mr2086576ibb.32.1291023184139; Mon,
	29 Nov 2010 01:33:04 -0800 (PST)
Received: by 10.231.200.140 with HTTP; Mon, 29 Nov 2010 01:33:04 -0800 (PST)
Date: Mon, 29 Nov 2010 10:33:04 +0100
Message-ID: <AANLkTinuAXEvP8wMWyr2udp7RGDW=J=Ct8C3F31=hEj0@mail.gmail.com>
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
Subject: git-native and libz
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
X-List-Received-Date: Mon, 29 Nov 2010 09:34:25 -0000
Content-Type: text/plain; charset=ISO-8859-1

Since we got git-native I am getting this warning on every git command
I execute:

git: /.../tmp/staging/x86_64-linux/lib/libz.so.1: no version
information available (required by git)

How do I get around this ..

(guess the best way is to just uninstall it then say that git-native
is provided, but I think this is a more generic issue with git-native)

Frans


