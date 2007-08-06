Received: from [83.151.25.170] (helo=srv043.dedi23.de)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <mickey@vanille-media.de>) id 1II4Pm-00073i-7M
	for openembedded-devel@openembedded.org; Mon, 06 Aug 2007 17:22:38 +0200
Received: by srv043.dedi23.de (Postfix, from userid 65534)
	id 98F9428C013; Mon,  6 Aug 2007 17:17:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.1.7-deb (2006-10-05) on 
	srv043.dedi23.de
X-Spam-Level: ***
X-Spam-Status: No, score=3.7 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_NJABL_DUL,RCVD_IN_PBL,RCVD_IN_SORBS_DUL,
	REPTO_OVERQUOTE_THEBAT autolearn=no version=3.1.7-deb
Received: from PROMETHEUS (e180131139.adsl.alicedsl.de [85.180.131.139])
	by srv043.dedi23.de (Postfix) with ESMTP id 08C8228C012;
	Mon,  6 Aug 2007 17:17:53 +0200 (CEST)
Date: Mon, 6 Aug 2007 17:20:09 +0200
From: "Dr. Michael Lauer" <mickey@vanille-media.de>
X-Mailer: The Bat! (v3.99.3) Professional
Organization: Vanille-Media
X-Priority: 3 (Normal)
Message-ID: <1632090386.20070806172009@vanille-media.de>
To: Koen Kooi <koen@dominion.kabel.utwente.nl>
In-Reply-To: <46B6CD51.7030405@dominion.kabel.utwente.nl>
References: <46A8B354.1010204@dominion.kabel.utwente.nl>
	<46B6CD51.7030405@dominion.kabel.utwente.nl>
MIME-Version: 1.0
Cc: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>,
	openembedded-devel@lists.openembedded.org
Subject: Re: [RFC] use packages/linux/linux-ezx-2.6.21/update_patches.sh for openmoko kernels
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
X-List-Received-Date: Mon, 06 Aug 2007 15:22:38 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Koen Kooi wrote:
> Koen Kooi schreef:
>> Hi,
>> 
>> Currently openmoko kernel pull patches from svn and manually apply them with quilt. We've
>> seen numerous breakages in the past with this method, so I would like to suggest using
>> something like update_patches.sh to pull a patchset from svn, add them to OE and
>> automagically write out a SRC_URI.
>> 
>> This would have the following benefits:
>> 
>> 1) patches don't suddenly change
>> 2) less breakage due to typos in commits upstream
>> 3) less work than continuously checking if recipe and svn patchset match
>> 4) less surprises when using a global SRCDATE
>> 
>> And since it's a script, it's not more work than the status quo.
>> 
>> what do you think?

> I have seen no objections, so I will convert the kernels tomorrow to include the patches
> in OE instead of pulling from svn.

I'm very much against this. It adds unnecessary stuff into the SCM. Patches in
our SVM should only be added if there's no way to get them into
upstream.

Please don't do it but use the SRCDATE (or rather SVNREV) instead.

Regards,

:M:
-- 
Michael 'Mickey' Lauer | IT-Freelancer | http://www.vanille-media.de



