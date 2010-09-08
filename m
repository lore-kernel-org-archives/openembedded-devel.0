Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OtOf5-0000SV-O5
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Sep 2010 19:42:20 +0200
Received: by pvg6 with SMTP id 6so147498pvg.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Sep 2010 10:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=/rKf7whVY6MrqROCf+/FAIvluNJgt2WDXJljG10gXUk=;
	b=IG4gqLN03HQYnvRvF21oU5K70arT48wvra7I4E7hxKzcN0UTnlVaIEpAZr5krKX+Ff
	GK/ae/V3iSIBj9LieX9aqCdysAu4+5lBpy2CEtMoomKi5P9aM4dFxStWCsRirr/Cujhx
	AS0JzlEDi1NNIofmWHaj8O9WKw+hFRBzoZDTI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=GFAW6oTd4NaBQz326VwDj6sEzuoLXEtEVwiE/TKrzrlEeEpEzx8BUINfXLA24kvBqt
	O6HS0S6jqil9dNwzCEqwMZc/3uRoHYSCHMe95CuPpcEGvXNY8iWgIYWyAh05e4evQHuc
	1chch6jQFu6+VwI/H1ANwirLKCibXq3YX+PMg=
MIME-Version: 1.0
Received: by 10.114.131.8 with SMTP id e8mr68394wad.43.1283967696682; Wed, 08
	Sep 2010 10:41:36 -0700 (PDT)
Received: by 10.231.208.17 with HTTP; Wed, 8 Sep 2010 10:41:36 -0700 (PDT)
Date: Wed, 8 Sep 2010 19:41:36 +0200
Message-ID: <AANLkTi=3gKS1xKPCLJOg0vxpVSgxOwx9N-GmiQS1zO9g@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: recipe simplification questions
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
X-List-Received-Date: Wed, 08 Sep 2010 17:42:20 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi

While browsing through a recipe I stumbled upon the following two functions:

inherit autotools

do_configure() {
        oe_runconf
}

do_install() {
        make install DESTDIR=${D}
}

Two questions:

1) does a  do_configure like above have any use?
I would expect it to be the default case in case of autotools

2) the make install line I have seen on several places.
Isn't it more elegant/simpler to just say
EXTRA_OEMAKE = "DESTDIR=${D}" and remove the whole do_install function?

Frans


