Received: from [85.214.48.103] (helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1KiwMG-0001jV-68
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Sep 2008 21:18:36 +0200
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 1DD248400AC
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Sep 2008 21:14:54 +0200 (CEST)
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 283B58400A2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Sep 2008 21:14:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.2.5
Received: from rhein.familie-heinold.de (e178074016.adsl.alicedsl.de
	[85.178.74.16]) by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Sep 2008 21:14:53 +0200 (CEST)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id 8AB323C1D7; Thu, 25 Sep 2008 21:14:52 +0200 (CEST)
Date: Thu, 25 Sep 2008 21:14:52 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20080925191451.GA17447@rhein.zuhause.netz>
MIME-Version: 1.0
User-Agent: Mutt/1.5.18 (2008-05-17)
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Discussion about gettext.bbclass
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
X-List-Received-Date: Thu, 25 Sep 2008 19:18:36 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

I want discuss another changes to a classes file. This time
about gettext.bbclass I attached a patch which is simpler
to understand and a little more powerfull.

So what I changed:

- put the DPENDS field on top, because its easier to understand
  that this will parsed and set first, besides gettext_after_parse
  is called after the parsing process

- added virtual/libiconv virtual/libintl to DEPENDS, bescause they
  are mostly needed anyway when you want NLS and do not harm
  when you do not need libintl

Second I want to make a propose to rename this bbclass, because
it is not gettext depend only. We have libiconv either from
libc or gnu and now proxy-libintl involed. So I would suggest
to name it nls.bbclass . I wait for you comments.

Bye Henning


