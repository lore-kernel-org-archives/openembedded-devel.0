Received: from [216.145.245.199] (helo=mx03.dls.net)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <mwester@dls.net>) id 1JGJPK-0007MP-Vv
	for openembedded-devel@lists.openembedded.org;
	Sat, 19 Jan 2008 20:31:11 +0100
Received: from gw.mwester.net ([209.242.5.110] helo=midnight)
	by mx03.dls.net with esmtpa (Exim 4.63)
	(envelope-from <mwester@dls.net>) id 1JGJPK-0000DR-H6
	for openembedded-devel@lists.openembedded.org;
	Sat, 19 Jan 2008 13:31:10 -0600
Message-ID: <007901c85ad1$d202c240$6f01a8c0@mwester.net>
From: "Mike \(mwester\)" <mwester@dls.net>
To: <openembedded-devel@lists.openembedded.org>
Date: Sat, 19 Jan 2008 13:30:59 -0600
MIME-Version: 1.0
X-Priority: 3
X-MSMail-Priority: Normal
X-Mailer: Microsoft Outlook Express 6.00.2900.3138
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.2900.3198
Subject: inetutils package upgrade?
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
X-List-Received-Date: Sat, 19 Jan 2008 19:31:11 -0000
Content-Type: text/plain; format=flowed; charset="iso-8859-1";
	reply-type=original
Content-Transfer-Encoding: 7bit

There's been a request to have inetutils put back into the SlugOS feeds. 
The existing version (1.4.2) doesn't build; bumping it up to the latest 
upstream version (1.5) fixes it so it builds once again.  Unless someone 
objects, I'll commit the change in a day or two to bump it up.

Also, if anyone is using the inetutils package, and feels strongly that we 
should break it up into smaller packages (inetutils-servers and 
inetutils-clients, for example?), we should discuss that.  My current 
feeling is that this is a seldom-used package, and probably isn't worth 
breaking up -- but it is a fairly big ipk (1/4 MByte compressed) with many 
different utilities contained therein.  If there are many users, perhaps 
they might benefit by being able to install only the portion they desire.

Regards,
Mike (mwester) 



