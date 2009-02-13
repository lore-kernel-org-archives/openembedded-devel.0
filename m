Received: from [65.182.109.70] (helo=mta1.brinkster.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <John.Willis@Distant-earth.com>) id 1LY3wx-0003LP-VK
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Feb 2009 20:43:48 +0100
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mta1.brinkster.com (Postfix) with ESMTP id F04983966F4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Feb 2009 14:42:18 -0500 (EST)
X-Virus-Scanned: amavisd-new at 
X-Spam-Flag: NO
X-Spam-Score: 0.289
X-Spam-Level: 
X-Spam-Status: No, score=0.289 tagged_above=-10 required=5 tests=[AWL=-0.443, 
	BAYES_00=-2.599, MSGID_MULTIPLE_AT=1.449, RCVD_IN_PBL=0.905,
	RCVD_IN_SORBS_DUL=0.877, RDNS_DYNAMIC=0.1]
Received: from mta1.brinkster.com ([127.0.0.1])
	by localhost (mta1.brinkster.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7ViCgtWq3A89
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Feb 2009 14:42:18 -0500 (EST)
Received: from MareImbrium (82-46-19-72.cable.ubr02.bath.blueyonder.co.uk
	[82.46.19.72])
	by mta1.brinkster.com (Postfix) with ESMTP id 8EEA6395FFE
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Feb 2009 14:42:16 -0500 (EST)
From: "John Willis" <John.Willis@Distant-earth.com>
To: <openembedded-devel@lists.openembedded.org>
References: <200902131728.08634.openembedded@haerwu.biz>	<878woae03q.fsf@neumann.lab.ossystems.com.br>	<fce2a370902130939m708ada3dn55be8cdeadacbfbb@mail.gmail.com>
	<871vu2chee.fsf@neumann.lab.ossystems.com.br>
In-Reply-To: <871vu2chee.fsf@neumann.lab.ossystems.com.br>
Date: Fri, 13 Feb 2009 19:41:59 -0000
Message-ID: <029801c98e13$26b15b10$74141130$@Willis@Distant-earth.com>
MIME-Version: 1.0
X-Mailer: Microsoft Office Outlook 12.0
Thread-Index: AcmODG8DHt1bN7HXTG+RzzKd9OqRSgABH4oA
Subject: Re: checksums situation
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
X-List-Received-Date: Fri, 13 Feb 2009 19:43:48 -0000
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: en-us

> >> <...>
> >>> This solution also has one nasty part - now we can keep SRC_URI for
> >>> multiple versions in common file, but if we switch to storing it in
> >>> SRC_URI we will have to change that.
> >>>
> >>> Other solution proposed on IRC was to keep checksums in extra file
> in
> >>> each directory of packages/ subdirectory. I think that it is not
> best
> >>> but sounds better then one file.
> >>>
> >>> What do you think? Which way we should go? Do you have other ideas?
> >> <...>
> >>
> >> What about having a checksums for _each_ recipe?
> >>
> >> foo_1.0.bb
> >> foo_1.0.md5sum
> >
> > This will waste directories and will make tree navigation harder.
> 
> Well; so let's just create a md5sums directory at OE topdir and add the
> dirs and files there.

Why not take that a little further and just have a checksums dir at the root
with a 'downloadname'.manifest with MD5 and SHA256 hashes? Take the
formatting from Gentoo if people want to. Plenty of scope to be flexible in
the future then without committing to some name stamped method ;-).

I think the URL pre filename is a bit of a non issue as it stands mind you
and I am not sure that the current checksums.ini approach is as bad as all
that if it dropped dupes and URLs. Maybe a little refinement is needed but a
wholesale change seems a little extreme (but I can see pros and cons for
both). As long as it is kept clean and contained and does not break overlays
to much I guess I am happy.

Regards,

John




