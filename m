Received: from [83.151.25.170] (helo=srv043.dedi23.de)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <mickey@vanille-media.de>) id 1IT3nC-0004xL-1S
	for openembedded-devel@lists.openembedded.org;
	Thu, 06 Sep 2007 00:56:14 +0200
Received: by srv043.dedi23.de (Postfix, from userid 65534)
	id 80BAE28C013; Thu,  6 Sep 2007 00:50:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.1.7-deb (2006-10-05) on 
	srv043.dedi23.de
X-Spam-Level: ***
X-Spam-Status: No, score=3.9 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_NJABL_DUL,RCVD_IN_PBL,RCVD_IN_SORBS_DUL,
	REPTO_OVERQUOTE_THEBAT autolearn=no version=3.1.7-deb
Received: from PROMETHEUS (e180170160.adsl.alicedsl.de [85.180.170.160])
	by srv043.dedi23.de (Postfix) with ESMTP id 33DF628C012
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Sep 2007 00:50:16 +0200 (CEST)
Date: Thu, 6 Sep 2007 00:53:42 +0200
From: "Dr. Michael Lauer" <mickey@vanille-media.de>
X-Mailer: The Bat! (v3.99.3) Professional
Organization: Vanille-Media
X-Priority: 3 (Normal)
Message-ID: <1929591813.20070906005342@vanille-media.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <46DF0843.3090409@student.utwente.nl>
References: <20070904202957.GD1429@dodger.lab.datenfreihafen.org>
	<1189011486.7849.35.camel@localhost.localdomain>
	<46DEE9E3.4080206@student.utwente.nl>
	<1434447296.20070905205215@vanille-media.de>
	<46DF0843.3090409@student.utwente.nl>
MIME-Version: 1.0
Subject: Re: [RFC] How to handle external kernel patches in oe the right way?
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
X-List-Received-Date: Wed, 05 Sep 2007 22:56:14 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Koen Kooi wrote:
>> Very well. If it annoys you so much, feel free to enhance patch.bbclass to
>> deal with upstream series files while retaining OE-added patches to it.

> Like I said *many* times before, the ezx patch script does that.

As far as I can see this script just dumps out SRC_URI lines. Which
means everytime someone commits a new revision of the patch. Even if
it's not me that needs to do it, I don't like it because it's a manual process.

>> Until then, I think we shouldn't make life more complicated for the
>> actual upstream developers just because of going a bit too far wrt. to
>> our principles.

> How many times to I have to offer to do the work for you!?!?!

Look, I really appreciate this and thanks for that, however I think
there is something seriously wrong in principle if we start treating
OE as a patch archive. This is semi-ok for when we don't have control
over upstream, but it just shouldn't be that way in general.

I think we talked long enough about that, there are different views
here and I doubt that one of us will be able to convince the other.

It was about time we ultimately disagree over an issue. Now let's see
whether we have a working process to deal with such a situation :)

The options:

a) vote for one solution and go with the winner
b) a compromise and make one "stable" bb with patches in OE and one
"unstable" bb that drags patches from upstream.

Eventually we may as well find a suitable compromise in XorA's suggested
patch that makes the fetcher and the patcher know about a quilt series
file, but let's talk about this when it's there.

Regards,

:M:
-- 
Michael 'Mickey' Lauer | IT-Freelancer | http://www.vanille-media.de



