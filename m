Received: from [65.182.109.71] (helo=mta2.brinkster.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <John.Willis@Distant-earth.com>) id 1LNTa9-0004SG-JV
	for openembedded-devel@lists.openembedded.org;
	Thu, 15 Jan 2009 15:52:29 +0100
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mta2.brinkster.com (Postfix) with ESMTP id 5C9055E1F7B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Jan 2009 09:45:43 -0500 (EST)
X-Virus-Scanned: amavisd-new at 
X-Spam-Flag: NO
X-Spam-Score: -0.445
X-Spam-Level: 
X-Spam-Status: No, score=-0.445 tagged_above=-10 required=5 tests=[AWL=0.272, 
	BAYES_00=-2.599, RCVD_IN_PBL=0.905, RCVD_IN_SORBS_DUL=0.877,
	RDNS_DYNAMIC=0.1]
Received: from mta2.brinkster.com ([127.0.0.1])
	by localhost (mta2.brinkster.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Tw2QMeqru3sw
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Jan 2009 09:45:41 -0500 (EST)
Received: from MareImbrium (82-46-19-72.cable.ubr02.bath.blueyonder.co.uk
	[82.46.19.72])
	by mta2.brinkster.com (Postfix) with ESMTP id 6076B5E1FEB
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Jan 2009 09:45:40 -0500 (EST)
From: "John Willis" <John.Willis@Distant-earth.com>
To: <openembedded-devel@lists.openembedded.org>
References: <gkn9vn$mh4$1@ger.gmane.org>
In-Reply-To: <gkn9vn$mh4$1@ger.gmane.org>
Date: Thu, 15 Jan 2009 14:45:23 -0000
Message-ID: <07FF17F1860B45E8953571020236997C@distantearth.home>
MIME-Version: 1.0
X-Mailer: Microsoft Office Outlook 11
Thread-Index: Acl3DU0vJTijOAEmQCCrI6YN651OOQAEE20w
X-MimeOLE: Produced By Microsoft MimeOLE V6.0.6001.18049
Subject: Re: [RFC] Overlay hosting and mirroring on git.oe.net
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
X-List-Received-Date: Thu, 15 Jan 2009 14:52:30 -0000
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

> There are a lot of OE based projects around that use an overlay to
> manage their tweaks (e.g. gumstix, openpandora, arago), which has pros
> and cons. A while ago I was talking to John Willis (of open2x and
> openpandora fame) and he liked the idea of mirroring the pandora overlay
> on git.oe.net to make it more visible and to make it easier for OE
> developers to work on making pieces of it upstream safe.
> I think a git mirror of poky would fall in this category as well.

Get's my vote. As I mentioned on IRC the current OpenPandora model uses 3
overlays. With the 3rd one being a simple user.collection that local Pandora
specific recipes go into before working there way upwards.

In time I would love to get to a model for Pandora specific stuff where
hacks go user.collection > openpandora.dev > (hopefully)
openembedded.dev/stable. Mirroring the GIT for openpandora.dev (or whatever
the final name we settle on is) on git.oe.net seems very sensible to me.
This also fits with possible ideas such as a 'for-upstream' branch to manage
upwards movement.

I am in the progress of moving/consolidating all the OpenPandora GIT stuff
onto one server (git.openpandora.org) so as soon as that is done then I can
see no reason not to start the mirroring even if we are still loading stuff
in and tweaking.

Regards,

John Willis




