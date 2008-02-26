Received: from [209.85.132.246] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <leon.woestenberg@gmail.com>) id 1JU5yf-000318-FS
	for openembedded-devel@lists.openembedded.org;
	Tue, 26 Feb 2008 21:00:47 +0100
Received: by an-out-0708.google.com with SMTP id b33so546617ana.83
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Feb 2008 11:59:59 -0800 (PST)
Received: by 10.100.201.16 with SMTP id y16mr10603810anf.33.1204055999361;
	Tue, 26 Feb 2008 11:59:59 -0800 (PST)
Received: by 10.100.190.7 with HTTP; Tue, 26 Feb 2008 11:59:59 -0800 (PST)
Message-ID: <c384c5ea0802261159i1e21611ax92c8516f7839a7ea@mail.gmail.com>
Date: Tue, 26 Feb 2008 20:59:59 +0100
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 209.85.132.246
X-SA-Exim-Mail-From: leon.woestenberg@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL,RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: libzvbi didn't stage .pc for me due to missing pkgconfig inheritance, something for QA to pick up these cases?
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
X-List-Received-Date: Tue, 26 Feb 2008 20:01:12 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello,

I found that libzvbi didn't stage the .pc files (for pkgconfig) simply
because the recipe didn't inherit from "pkgconfig" bbclass.

More packages might suffer from this (although I doubt it). It might
be a candidate for automatic QA, but that's out of my league.
The idea would be that QA class tests if .pc files are present in the
source dir, but the recipe does not inherit from pkgconfig.

Only a minor issue.

Regards,
-- 
Leon


