Received: from [83.151.25.170] (helo=srv043.dedi23.de)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <mickey@vanille-media.de>) id 1HfOdC-0003Vu-53
	for openembedded-devel@lists.openembedded.org;
	Sun, 22 Apr 2007 01:04:38 +0200
Received: by srv043.dedi23.de (Postfix, from userid 65534)
	id E008428C012; Sun, 22 Apr 2007 00:27:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.1.7-deb (2006-10-05) on 
	srv043.dedi23.de
X-Spam-Level: ***
X-Spam-Status: No, score=3.7 required=5.0 tests=RCVD_IN_NJABL_DUL, RCVD_IN_PBL,
	RCVD_IN_SORBS_DUL autolearn=no version=3.1.7-deb
Received: from PROMETHEUS (e180170118.adsl.alicedsl.de [85.180.170.118])
	by srv043.dedi23.de (Postfix) with ESMTP id 6D8B428C011
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 22 Apr 2007 00:27:42 +0200 (CEST)
Date: Sun, 22 Apr 2007 00:34:55 +0200
From: "Dr. Michael 'Mickey' Lauer" <mickey@vanille-media.de>
X-Mailer: The Bat! (v3.98.4) Professional
Organization: Vanille-Media
X-Priority: 3 (Normal)
Message-ID: <1967888562.20070422003455@vanille-media.de>
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@lists.openembedded.org>
In-Reply-To: <1176998423.5833.99.camel@localhost.localdomain>
References: <E1HeU56-0006o4-VP@linuxtogo.org>
	<157361400.20070419145713@vanille-media.de>
	<1176998423.5833.99.camel@localhost.localdomain>
MIME-Version: 1.0
Subject: Re: [oe-commits] org.oe.dev mtx-3a.conf, nylon-image-base.bb: removed remaints from old OE code (PACKAGE_INSTALL instead of IPKG_INSTALL)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 21 Apr 2007 23:04:38 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Richard Purdie wrote:
> On Thu, 2007-04-19 at 14:57 +0200, Dr. Michael 'Mickey' Lauer wrote:
>> MartinDietze commit wrote:
>> > mtx-3a.conf, nylon-image-base.bb: removed remaints from old OE code
>> > (PACKAGE_INSTALL instead of IPKG_INSTALL)
>> 
>> >  TARGET_ARCH = "arm"
>> > -IPKG_ARCHS = "all arm ${MACHINE}"
>> > +#PACKAGE_ARCHS = "all arm ${MACHINE}"
>> 
>> Why is that commented?

> Since I mentioned that it wasn't needed after recent changes (which it
> isn't).

Ah.

>> > -inherit image_ipk
>> > -inherit nylon_image
>> > -LICENSE = MIT
>> > +inherit image
>> > +inherit nylon-image
>> > +LICENSE = "MIT"
>> 
>> Are you sure about that? image_ipk looks about right for me.

> image_ipk is incorrect and I'd mentioned this being a problem on the
> mailing list - it was causing parsing errors. We have multiple image
> generation types now and selecting them like that in .bb files doesn't
> make sense so images just inherit image.

Oh.

Guess I should better refrain from commenting until I'm working with
.dev again...

Regards,

:M:
-- 
Michael 'Mickey' Lauer | IT-Freelancer | http://www.vanille-media.de



