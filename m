Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sakoman@gmail.com>) id 1PAPRS-0000B9-4W
	for openembedded-devel@openembedded.org; Mon, 25 Oct 2010 17:58:37 +0200
Received: by ewy2 with SMTP id 2so1572986ewy.6
	for <openembedded-devel@openembedded.org>;
	Mon, 25 Oct 2010 08:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=flbRalCUqg3MGaWP9vw8goUBGX2jempong1QbYi9dQo=;
	b=qWcXhULWxxx2q5NBthNfwqY93SeYOhtv6TmnDhlKslKQiS9l00QQpXAAXdnrU4FNOo
	O56t22cXOC9bwncH31B3H1OTZDWcBTCCXYN3ehnHisuAMr58JUaEIuqAFsL7DoBqP8SJ
	OR0VN2pT8sGZOZWnmc5wvpafoxAcS/mAdgrwk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=pt4MUUiCsoVNpOn4U4a6yNUyMxJoVc5OJSC634Lmsjc6kufqXtGJpT6nfz9ca/GlvF
	WhWANJHNAegOq354nU1H1NP8/0ONCwLatY3WP0Cim9TCq3G6bwAhImlxXM3Cc9rY7PhC
	ekk/rRRjmpZKTdjeRfe7OUky/luqcs9DceNjk=
MIME-Version: 1.0
Received: by 10.216.11.129 with SMTP id 1mr515551wex.90.1288022273057; Mon, 25
	Oct 2010 08:57:53 -0700 (PDT)
Received: by 10.216.23.13 with HTTP; Mon, 25 Oct 2010 08:57:52 -0700 (PDT)
Date: Mon, 25 Oct 2010 08:57:52 -0700
Message-ID: <AANLkTinhVFqdS1XQ1OmhSHVwr0MS9pZgMMR9cqBoFxYM@mail.gmail.com>
From: Steve Sakoman <sakoman@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.215.47
X-SA-Exim-Mail-From: sakoman@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Python.h LONG_BIT definition error on 64 bit build machine
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
X-List-Received-Date: Mon, 25 Oct 2010 15:58:37 -0000
Content-Type: text/plain; charset=ISO-8859-1

I'm working on a recipe for a new version of hplip (it depends on
python).  It builds just fine on my 32 bit Ubuntu development machine,
but when I attempt the build on my 64 bit Ubuntu machines the build
fails with the following error:

In file included from
/home/steve/source/sakoman-oe/tmp/sysroots/x86_64-linux/usr/include/python2.6/Python.h:58,
                 from io/mudext/hpmudext.c:27:
/home/steve/source/sakoman-oe/tmp/sysroots/x86_64-linux/usr/include/python2.6/pyport.h:685:2:
error: #error "LONG_BIT definition appears wrong for platform (bad
gcc/glibc config?)."

I seem to recall seeing this error in the distant past.

Is this a known issue with python on 64 bit machines?

Any advice?

Steve


