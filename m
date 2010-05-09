Received: from smtp-out30.alice.it ([85.33.2.30])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <GNUtoo@no-log.org>) id 1OAzBG-0002kd-RP
	for openembedded-devel@lists.openembedded.org;
	Sun, 09 May 2010 07:36:02 +0200
Received: from FBCMMO02.fbc.local ([192.168.68.196]) by smtp-out30.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Sun, 9 May 2010 07:32:07 +0200
Received: from FBCMCL01B04.fbc.local ([192.168.69.85]) by FBCMMO02.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Sun, 9 May 2010 07:31:46 +0200
Received: from [192.168.1.116] ([79.54.144.103]) by FBCMCL01B04.fbc.local with
	Microsoft SMTPSVC(6.0.3790.3959); Sun, 9 May 2010 07:31:45 +0200
From: GNUtoo <GNUtoo@no-log.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <g2rd1b08f941005080412i42f1ed71ld780acc5e2bd6259@mail.gmail.com>
References: <v2sd1b08f941005071617u31274631hcddebb5b9eeb888d@mail.gmail.com>
	<n2zd1b08f941005080156gd17a92cbk9985dc913c13fb0a@mail.gmail.com>
	<g2rd1b08f941005080412i42f1ed71ld780acc5e2bd6259@mail.gmail.com>
Date: Sun, 09 May 2010 07:31:44 +0200
Message-ID: <1273383104.2355.1.camel@gnutoo-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-OriginalArrivalTime: 09 May 2010 05:31:45.0356 (UTC)
	FILETIME=[E9D248C0:01CAEF38]
X-SA-Exim-Connect-IP: 85.33.2.30
X-SA-Exim-Mail-From: GNUtoo@no-log.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: gtk+native missing dep ?
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
X-List-Received-Date: Sun, 09 May 2010 05:36:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2010-05-08 at 13:12 +0200, Andrea Adami wrote:
> PARALLEL_MAKE = "-j5"
> #BB_NUMBER_THREADS = "4"
> BB_NUMBER_THREADS = "2"
> 
> fixed the things. This time the dependencies were (correctly) built before...
> 
> Andrea
Same issue here with the default settings...
It sometime appear when building from scratch.

| /home/embedded/oetmp_eeepc701/work/i686-linux/gtk
+-native-2.20.0-r8.0/gtk+-2.20.0/modules/input/im-xim.la does not export
GTK+ IM module API: /home/embedded/oetmp_eeepc701/work/i686-linux/gtk
+-native-2.20.0-r8.0/gtk+-2.20.0/modules/input/.libs/im-xim.so:
undefined symbol: g_realloc_n

Denis.







