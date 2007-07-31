Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1IFmW8-0005aw-71
	for openembedded-devel@openembedded.org; Tue, 31 Jul 2007 09:51:44 +0200
Received: from Powerbook-2.local (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l6V7nr1R020947 for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Jul 2007 09:49:53 +0200
Message-ID: <46AEE9A0.2050504@dominion.kabel.utwente.nl>
Date: Tue, 31 Jul 2007 09:49:52 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 2.0.0.5 (Macintosh/20070716)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <1185839805.7719.103.camel@localhost.localdomain>
In-Reply-To: <1185839805.7719.103.camel@localhost.localdomain>
X-Enigmail-Version: 0.95.2
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: The future of "svnnow"
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
X-List-Received-Date: Tue, 31 Jul 2007 07:51:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Richard Purdie schreef:

> 
> What still needs to be done (patches welcome)
> =============================================
> 
> 1. Fix revision lockdown SRCREV_pn-somepackage = "90" etc. Thats a
> problem in localpath() in svn.py.
> 
> 2. Handling of multiple SCMs in the SRC_URI. The plan here is simple,
> any package doing this has to set SRCREV_FORMAT specifying the format of
> the SRCREV string. get_srcrev() can collect the SCM revisions, fill out
> the string and return it. The format and inner workings of this are open
> for discussion and to be determined. 
> 
> 3. Finish sortable_revision(). If self._sortable_revision() isn't
> present, it should read a counter, revision pair from BB_URI_LOCALCOUNT.
> If the revision is different to _latest_revision, increase the counter
> and store + return it. 
> 
> 4. Fix the git fetcher to make git "now" work. These "local revision
> counter" packages will not be shareable between different builds but we
> always knew that would be the case with git and this is as close as we
> can get.
> 
> 5. Examine the other fetchers and see if we can add some kind of "now"
> support to them too.
> 
> 6. Add policy control variables to control the wiping of BB_URI_HEADREVS

  7. make a minrev and max rev for patches and try to convert dates to revisions for
existing users of ;mindate=20070707;maxdate=20080808 in SRC_URI

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFGrumgMkyGM64RGpERAvY+AJwIksReey1LVHa6NpFRvcdFvldPOgCfbeLO
jvrr6XXcdJFxRjH+GFUsQlU=
=9FHq
-----END PGP SIGNATURE-----


