Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1RqaYS-0001y7-IX
	for openembedded-devel@lists.openembedded.org;
	Fri, 27 Jan 2012 02:24:40 +0100
Received: by lahc1 with SMTP id c1so632627lah.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Jan 2012 17:16:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=wntRkzZyl4HI0APVQ1hx4FzRY3LTdnVneYoyNdqC0Hs=;
	b=bwabHp+qAZxS70nyF/etuy1PyJdM8tQWkngqAu3K5XcMY3Jy4MQ6NIWMOou9X/ETcL
	Q3477vqQRWp2/FYU0kzfuoD9RyyI+I6e+9uJqVyjwPSo18E/+VP2zMMYAGc1JaZNaPGK
	betVYRNMwZYFVUm9BubrFJ3H2dzO4vgULRTZ4=
MIME-Version: 1.0
Received: by 10.152.132.104 with SMTP id ot8mr2531222lab.17.1327627012110;
	Thu, 26 Jan 2012 17:16:52 -0800 (PST)
Received: by 10.112.102.165 with HTTP; Thu, 26 Jan 2012 17:16:52 -0800 (PST)
Date: Fri, 27 Jan 2012 02:16:52 +0100
Message-ID: <CALbNGRS-WsE45UakTV5VE2T5bAxb1C2iWgPeN+Ys+OTx-i48Rw@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: evince: who is responsible to pack all within usr/lib/evince/3/backends to ${PN}?
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
X-List-Received-Date: Fri, 27 Jan 2012 01:24:40 -0000
Content-Type: text/plain; charset=ISO-8859-1

Since the staticdev update of insane.bbclass in oe-core I get

WARNING: QA Issue: non -staticdev package contains static .a library:
evince path '/work/armv7a-angstrom-linux-gnueabi/evince-2.32.0-r1/packages-split/evince/usr/lib/evince/3/backends/libtiffdocument.a'
WARNING: QA Issue: non -staticdev package contains static .a library:
evince path '/work/armv7a-angstrom-linux-gnueabi/evince-2.32.0-r1/packages-split/evince/usr/lib/evince/3/backends/libpixbufdocument.a'
WARNING: QA Issue: non -staticdev package contains static .a library:
evince path '/work/armv7a-angstrom-linux-gnueabi/evince-2.32.0-r1/packages-split/evince/usr/lib/evince/3/backends/libcomicsdocument.a'
WARNING: QA Issue: non -staticdev package contains static .a library:
evince path '/work/armv7a-angstrom-linux-gnueabi/evince-2.32.0-r1/packages-split/evince/usr/lib/evince/3/backends/libpdfdocument.a'

I checked: the complete contents of /usr/lib/evince/3/backends go to
evince package and I would like to move *.a to ${PN}-staticdev and
*.la to ${PN}-dev but I don't understand: who is responsible for
adding all this to ${PN}?

Regards

Andreas


