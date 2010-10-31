Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jay@jay-tech.ru>) id 1PCgSk-0002Rt-Or
	for openembedded-devel@lists.openembedded.org;
	Sun, 31 Oct 2010 23:33:19 +0100
Received: by vws17 with SMTP id 17so2954609vws.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 31 Oct 2010 15:32:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.224.3.14 with SMTP id 14mr5695468qal.52.1288564350150; Sun, 31
	Oct 2010 15:32:30 -0700 (PDT)
Sender: jay@jay-tech.ru
Received: by 10.220.96.67 with HTTP; Sun, 31 Oct 2010 15:32:30 -0700 (PDT)
X-Originating-IP: [93.81.139.215]
In-Reply-To: <iakpd7$ja7$1@dough.gmane.org>
References: <AANLkTin70=KBJDjW8K6ViS5X03ZaE92680oR88hhy9eK@mail.gmail.com>
	<AANLkTimEKL_6r_DZmq_W2i9eqHPgbRFc-oFMftKNFBJv@mail.gmail.com>
	<iakpd7$ja7$1@dough.gmane.org>
Date: Mon, 1 Nov 2010 01:32:30 +0300
X-Google-Sender-Auth: Tq7qX4wQh-Kni4LT0NPyPLvffn8
Message-ID: <AANLkTinfxX_E3L30uK_nvm2hO5f0h-tDOu21mdXC2VGG@mail.gmail.com>
From: Yuri Bushmelev <jay4mail@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.212.47
X-SA-Exim-Mail-From: jay@jay-tech.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=AWL,BAYES_00,SPF_SOFTFAIL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: testing branch 2010-10-29
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
X-List-Received-Date: Sun, 31 Oct 2010 22:33:19 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello!

>> Every build will be started with clean $TMPDIR for now at least
>
> I mentioned this at OEDEM as well, only doing clean builds hides upgrade
> path type of bugs (e.g. libcdio5 -> libcdio). It would be nice if an
> incremental build going from testing-prev to testing-next would be done
> as well before tagging.

I need a lot of HDD space then.
Should I do builds twice - clean and incremental?

Second question - is there any sense to clean/restore $TMPDIR between
building of different images (x11-image/opie-image) but same machine &
distro?

I mean following workflow

clean $TMPDIR/restore $TMPDIR from previous build of x11-image for
this machine/distro
build x11-image
clean $TMPDIR/restore $TMPDIR from previous build of opie-image for
this machine/distro
build opie-image
save $TMPDIR for next testing-next build

VS

clean $TMPDIR/restore $TMPDIR from previous build of this machine/distro
build x11-image
build opie-image
save $TMPDIR for next testing-next build

-- 
Yuri Bushmelev


