Received: from [64.233.182.190] (helo=nf-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <pmiscml@gmail.com>) id 1JQPLG-0001Et-Cz
	for openembedded-devel@lists.openembedded.org;
	Sat, 16 Feb 2008 16:52:44 +0100
Received: by nf-out-0910.google.com with SMTP id h3so466578nfh.22
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Feb 2008 07:52:17 -0800 (PST)
Received: by 10.78.206.14 with SMTP id d14mr5705916hug.9.1203177137436;
	Sat, 16 Feb 2008 07:52:17 -0800 (PST)
Received: from widy.localdomain ( [88.231.76.37])
	by mx.google.com with ESMTPS id b36sm8713541ika.2.2008.02.16.07.52.12
	(version=SSLv3 cipher=OTHER); Sat, 16 Feb 2008 07:52:15 -0800 (PST)
Date: Sat, 16 Feb 2008 17:52:42 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
To: angstrom-distro-devel@linuxtogo.org
Message-ID: <20080216175242.724b75a6@widy.localdomain>
In-Reply-To: <74d0deb30802160739o7aafbbbdo4093d7c9ef38beb9@mail.gmail.com>
References: <20080216150111.3737b02b@widy.localdomain>
	<74d0deb30802160739o7aafbbbdo4093d7c9ef38beb9@mail.gmail.com>
X-Mailer: Claws Mail 3.0.2 (GTK+ 2.12.5; i686-pc-linux-gnu)
Mime-Version: 1.0
X-SA-Exim-Connect-IP: 64.233.182.190
X-SA-Exim-Mail-From: pmiscml@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [Angstrom-devel] [RFC] Per-ANGSTROM_MODE caches for Angstrom
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 16 Feb 2008 15:52:44 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hello,

On Sat, 16 Feb 2008 16:39:42 +0100
"pHilipp Zabel" <philipp.zabel@gmail.com> wrote:

> On Feb 16, 2008 2:01 PM, Paul Sokolovsky <pmiscml@gmail.com> wrote:
> > Hello,
> >
> > It's pretty annoying to wait for cache rebuild each time
> > ANGSTROM_MODE is swicthed, especially if that happens often.
> > Following patch stores bitbake cache for each mode separately:
> >
> > #
> > # old_revision [1821f6eadefc14ad7ce51d5ab026da139608f557]
> > #
> > # patch "conf/distro/include/angstrom.inc"
> > #  from [b86b952c90304d1fd39f1415f6af7f71d02e00df]
> > #    to [e7921869d30b7e5df3fd39fbd4bec5d2495b5d31]
> > #
> > ============================================================
> > --- conf/distro/include/angstrom.inc
> > b86b952c90304d1fd39f1415f6af7f71d02e00df +++
> > conf/distro/include/angstrom.inc
> > e7921869d30b7e5df3fd39fbd4bec5d2495b5d31 @@ -12,6 +12,7 @@
> > ANGSTROM_MODE ?= "glibc" # Can be "glibc", "eglibc" or "uclibc"
> > ANGSTROM_MODE ?= "glibc"
> >
> > +CACHE = "${TMPDIR}/cache${@['', '/' +
> > str(bb.data.getVar('ANGSTROM_MODE', d,
> > 1))][bool(bb.data.getVar('ANGSTROM_MODE', d, 1))]}${@['', '/' +
> > str(bb.data.getVar('MACHINE', d,
> > 1))][bool(bb.data.getVar('MACHINE', d, 1))]}" DEPLOY_DIR =
> > "${TMPDIR}/deploy/${ANGSTROM_MODE}" require
> > conf/distro/include/angstrom-${ANGSTROM_MODE}.inc
> 
> +1, for the  idea, but why not just ${TMPDIR}/cache/${ANGSTROM_MODE} ?

Well, nice question ;-). To be generic and putable even in
bitbake.conf ;-)

> And I don't understand why you need to include MACHINE there.
> I've never needed to rebuild caches when switching MACHINE, and I
> shouldn't have to.

Heh, multimachine puts it there ;-)

> 
> regards
> Philipp


-- 
Best regards,
 Paul                          mailto:pmiscml@gmail.com


