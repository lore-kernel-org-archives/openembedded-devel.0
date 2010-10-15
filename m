Received: from familie-heinold.de
	([85.214.48.103] helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1P6lJ7-0000Qd-HP
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Oct 2010 16:30:54 +0200
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 3C28511000B4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Oct 2010 16:30:25 +0200 (CEST)
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id A007611000A7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Oct 2010 16:30:23 +0200 (CEST)
Received: from rhein.familie-heinold.de (g225075015.adsl.alicedsl.de
	[92.225.75.15]) by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Oct 2010 16:30:23 +0200 (CEST)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id AC96B3C0FD; Fri, 15 Oct 2010 16:30:14 +0200 (CEST)
Date: Fri, 15 Oct 2010 16:30:14 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101015143014.GA9736@rhein.zuhause.netz>
References: <1287144965-6419-1-git-send-email-obi@opendreambox.org>
	<1287144965-6419-4-git-send-email-obi@opendreambox.org>
MIME-Version: 1.0
In-Reply-To: <1287144965-6419-4-git-send-email-obi@opendreambox.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-Virus-Scanned: ClamAV using ClamSMTP
X-SA-Exim-Connect-IP: 85.214.48.103
X-SA-Exim-Mail-From: heinold@inf.fu-berlin.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 4/4] libsdl-directfb: update to 1.2.14
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
X-List-Received-Date: Fri, 15 Oct 2010 14:30:54 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Obi,

please do not patch libtool m4 macros. The workaround for this is simple remove all macros
and let them copying from autoconf.

Here is what I did for sdl-tff.

do_configure_prepend() {
  
   MACROS="libtool.m4 lt~obsolete.m4 ltoptions.m4 ltsugar.m4 ltversion.m4"
 
   for i in ${MACROS}; do
     rm acinclude/$i
   done

}


Bye Henning


