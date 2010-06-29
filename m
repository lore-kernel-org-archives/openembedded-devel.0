Received: from mta6.brinkster.com ([65.182.109.75])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <John.Willis@Distant-earth.com>) id 1OTcQv-0007i0-TZ
	for openembedded-devel@lists.openembedded.org;
	Tue, 29 Jun 2010 17:09:11 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mta6.brinkster.com (Postfix) with ESMTP id F3BAA8C826
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Jun 2010 11:04:26 -0400 (EDT)
X-Virus-Scanned: amavisd-new at mta6.brinkster.com
Received: from mta6.brinkster.com ([127.0.0.1])
	by localhost (mta6.brinkster.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W6gRAB4m3c6U
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Jun 2010 11:04:26 -0400 (EDT)
Received: from MareImbrium (cpc1-bath2-0-0-cust327.aztw.cable.virginmedia.com
	[82.46.19.72])
	by mta6.brinkster.com (Postfix) with ESMTPA id AD3208C1AC
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Jun 2010 11:04:25 -0400 (EDT)
From: "John Willis" <John.Willis@Distant-earth.com>
To: <openembedded-devel@lists.openembedded.org>
References: <alpine.DEB.2.00.1006291005050.10428@lynx>
In-Reply-To: <alpine.DEB.2.00.1006291005050.10428@lynx>
Date: Tue, 29 Jun 2010 16:04:14 +0100
Message-ID: <01fb01cb179c$580068f0$08013ad0$@Distant-earth.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 14.0
Thread-Index: AQLo6HRe2tqVl3Ygc+gnZjrrgALrrpBdZfZw
X-SA-Exim-Connect-IP: 65.182.109.75
X-SA-Exim-Mail-From: John.Willis@Distant-earth.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: so ... what's the proper way to report a build failure?
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
X-List-Received-Date: Tue, 29 Jun 2010 15:09:11 -0000
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: en-us

Hi Robert,

>   given that i like to keep up with the OE dev branch and test build a
> beagleboard-demo-image as necessary, what is the *encouraged* way to
> report a new build failure?  on the OE list?  on the angstrom list?
> tinderbox?
> 
>   after a "git pull" earlier this morning, "realpath-1.15" fails to build.
what
> should i do with the error diagnostics?

Pretty sure this has been suggested in the past ;-)
(http://www.mail-archive.com/openembedded-devel@lists.openembedded.org/msg02
876.html) but I'll say again, setting up Tinderbox
(http://tinderbox.openembedded.net/) has to be a pretty good starting place
to collaborate on build issues.

It's really easy to setup
(http://wiki.openembedded.net/index.php/How_do_I_send_automatic_success_and_
failure_reports) and the classes will automatically deal with uploading of
your fail logs/build info etc. so you can refer others to it (and for that
matter, see if others are building the same packages without issue).

Regards,

John




