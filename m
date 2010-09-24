Received: from smtp.cbnco.com ([207.164.182.72])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <msmith@cbnco.com>) id 1OzEme-0003wo-IY
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Sep 2010 22:22:18 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id D29E68AC630;
	Fri, 24 Sep 2010 16:22:10 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 23099-01; Fri, 24 Sep 2010 16:22:10 -0400 (EDT)
Received: from [172.20.22.83] (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTPSA id 99654681317;
	Fri, 24 Sep 2010 16:22:10 -0400 (EDT)
Message-ID: <4C9D0872.5060404@cbnco.com>
Date: Fri, 24 Sep 2010 16:22:10 -0400
From: Michael Smith <msmith@cbnco.com>
User-Agent: Thunderbird 2.0.0.24 (X11/20100228)
MIME-Version: 1.0
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Virus-Scanned: amavisd-new at cbnco.com
X-SA-Exim-Connect-IP: 207.164.182.72
X-SA-Exim-Mail-From: msmith@cbnco.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: nano RRECOMMENDS ncurses-terminfo
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
X-List-Received-Date: Fri, 24 Sep 2010 20:22:19 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

Since 37df6011, nano recommends ncurses-terminfo.

+# actually RDEPENDS, but ncurses-terminfo is only in ncurses-5.7, so 
RRECOMMENDS for now
+RRECOMMENDS_${PN} = "ncurses-terminfo"

ncurses-terminfo exists in 5.4: it contains 2.4 MB of terminfo data 
files that is just bloat for most people. (Then again, you could say 
nano is also just bloat. :) The base ncurses-5.4 package includes some 
common terminfo files in /etc/terminfo.

So for me, with ncurses 5.4, nano shouldn't depend on or recommend 
ncurses-terminfo - it just bloats up the image.

Is there something special in ncurses-terminfo 5.7 that nano needs?

Thanks,
Mike


