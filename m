Received: from [141.2.4.18] (helo=mail.tm.informatik.uni-frankfurt.de)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <mickey@tm.informatik.uni-frankfurt.de>)
	id 1GPGDn-00056R-Ss for openembedded-devel@lists.openembedded.org;
	Mon, 18 Sep 2006 12:19:27 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.tm.informatik.uni-frankfurt.de (Postfix) with ESMTP id B15FF982
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Sep 2006 12:15:27 +0200 (CEST)
Received: from mail.tm.informatik.uni-frankfurt.de ([127.0.0.1])
	by localhost (mail [127.0.0.1]) (amavisd-new, port 10024) with ESMTP
	id 06498-10 for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Sep 2006 12:15:24 +0200 (CEST)
Received: from [141.2.14.64] (gandalf.tm.informatik.uni-frankfurt.de
	[141.2.14.64])
	by mail.tm.informatik.uni-frankfurt.de (Postfix) with ESMTP id 3396A871
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Sep 2006 12:15:24 +0200 (CEST)
From: Michael 'Mickey' Lauer <mickey@tm.informatik.uni-frankfurt.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <E1GPFZo-0004gs-Mh@linuxtogo.org>
References: <E1GPFZo-0004gs-Mh@linuxtogo.org>
Organization: VanilleMedia
Date: Mon, 18 Sep 2006 12:15:23 +0200
Message-Id: <1158574523.5494.5.camel@gandalf.tm.informatik.uni-frankfurt.de>
Mime-Version: 1.0
X-Mailer: Evolution 2.7.2.1-3mdv2007.0 
X-Virus-Scanned: by amavisd-new at tm.informatik.uni-frankfurt.de
Subject: Re: [oe-commits] org.oe.dev opie-freetype: fix packaging in proper	way: APPTYPE = 'plugin'
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 18 Sep 2006 10:19:28 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Am Montag, den 18.09.2006, 11:38 +0200 schrieb hrw commit:
> opie-freetype: fix packaging in proper way: APPTYPE = 'plugin'

This is not necessary and was left out on purpose. Please see the
following snippet from opie.bbclass:

        APPNAME = bb.data.getVar( "APPNAME", d, True ) or
bb.data.getVar( "PN", d, True )
        APPTYPE = bb.data.getVar( "APPTYPE", d, True )
        if not APPTYPE:
                if bindir == "<BINDIR>":
                        APPTYPE = "quicklaunch"
                else:
                        APPTYPE = "plugin"

Since bindir is plugin/fontfactories for SECTION=opie/fontfactories,
APPTYPE=plugin gets automatically set.

-- 
Regards,

Michael 'Mickey' Lauer | FreeLancer | http://www.Vanille-Media.de




