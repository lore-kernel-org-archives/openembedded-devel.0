Received: from stoexhubfe01.domain01.net ([83.145.59.140])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1QtbWZ-0002rN-Iv
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Aug 2011 10:30:55 +0200
Received: from localhost (193.235.91.228) by stoexhubfe01.domain01.net
	(10.12.10.6) with Microsoft SMTP Server id 8.3.137.0; Wed, 17 Aug 2011
	10:26:17 +0200
Date: Wed, 17 Aug 2011 10:26:28 +0200
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20110817082628.GG7904@chargestorm.se>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <cover.1313561874.git.anders@chargestorm.se>
	<41c00fa60312c83a2a9d8a296430b98f37c1991e.1313561874.git.anders@chargestorm.se>
	<1313568501.4294.4.camel@mattotaupa>
MIME-Version: 1.0
In-Reply-To: <1313568501.4294.4.camel@mattotaupa>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.21 (2010-09-15)
X-GFI-SMTP-Submission: 1
Subject: Re: [meta-oe][PATCH v3 2/2] ckermit: update to version 9.0
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
X-List-Received-Date: Wed, 17 Aug 2011 08:30:55 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

* Paul Menzel <paulepanter@users.sourceforge.net> [110817 10:08]:
> Am Mittwoch, den 17.08.2011, 08:25 +0200 schrieb Anders Darander:
> > -LICENSE = "Kermit"
> > -LIC_FILES_CHKSUM = "file://COPYING.TXT;md5=17dabbd2543933464b6d32083c3a3596"
> > -SRC_URI = "ftp://kermit.columbia.edu/kermit/archives/cku${PV}.tar.gz;subdir=${BPN}-${PV}"
> > +LICENSE = "BSD-3-Clause"
> > +LIC_FILES_CHKSUM = "file://COPYING.TXT;md5=932ca542d6c6cb8a59a0bcd76ab67cc3"
> > +SRC_URI = "ftp://www.columbia.edu/kermit/archives/cku${PV}.tar.gz;subdir=${BPN}-${PV}"

> Koen already applied your patches, so this is just a note to please also
> add such changes to the commit message next time. Especially since the
> former URL seems to be the one used on the download page [1].

My mistake. When I started updating the recipe, the original url was not
working, and when submitting the patch series, I thought I had already
reverted that change. The non-working URL was probably only a temporary
glitch. Although I normally tend to review the patches one extra time,
to make sure that the commit message includes all changes, I missed this
one...

I've just submitted a new patch, reverting to the original SRC_URI, as
it _is_ working.

Thanks for spotting this!

Cheers,
Anders

-- 
Anders Darander
ChargeStorm AB	


