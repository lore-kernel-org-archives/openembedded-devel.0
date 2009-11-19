Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpjday@crashcourse.ca>) id 1NB3YK-0005Rv-FY
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Nov 2009 10:43:51 +0100
Received: from cpe002129687b04-cm001225dbafb6.cpe.net.cable.rogers.com
	([99.235.241.187] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1NB3Ww-0001cL-W1 for openembedded-devel@lists.openembedded.org;
	Thu, 19 Nov 2009 04:42:23 -0500
Date: Thu, 19 Nov 2009 04:42:19 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: OpenEmbedded Development mailing list
	<openembedded-devel@lists.openembedded.org>
Message-ID: <alpine.LFD.2.00.0911190430300.3527@localhost>
User-Agent: Alpine 2.00 (LFD 1167 2008-08-23)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SA-Exim-Connect-IP: 64.235.106.9
X-SA-Exim-Mail-From: rpjday@crashcourse.ca
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: confused about where i2c-tools-3.0.2 came from
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
X-List-Received-Date: Thu, 19 Nov 2009 09:43:51 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


  i'm puzzled -- only a few days ago, i was proposing updating the
i2c-tools package from 3.0.1 to 3.0.2 in the dev branch.  there was a
brief discussion that i shouldn't simply *remove* the 3.0.1 contents,
just *add* what was needed for 3.0.2.

  i came back to do that this morning and there already *is*
everything needed for 3.0.2 -- the conf/checksums.ini entry and the
.bb file.  now i check the git log file for conf/checksums.ini and i
find:

commit b3a5d14572d3ddf13e740f32a463afb7e6a2dc58
Author: Koen Kooi <koen@openembedded.org>
Date:   Tue Dec 16 14:50:47 2008 +0100

    i2c-tools: update to 3.0.2

  i could have *sworn* 3.0.2 wasn't in my checkout of the dev branch,
or i wouldn't have put any time into proposing an upgrade.  how
confused am i?  how could i have not noticed that?

rday
--

========================================================================
Robert P. J. Day                               Waterloo, Ontario, CANADA

            Linux Consulting, Training and Kernel Pedantry.

Web page:                                          http://crashcourse.ca
Twitter:                                       http://twitter.com/rpjday
========================================================================


