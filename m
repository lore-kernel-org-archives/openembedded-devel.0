Received: from [78.47.116.26] (helo=drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>) id 1KnqPi-0007SV-Lr
	for openembedded-devel@lists.openembedded.org;
	Thu, 09 Oct 2008 09:58:26 +0200
Received: from [172.16.23.138] (firewall.tw.openmoko.org [124.219.5.210])
	by drlauer-research.com (Postfix) with ESMTP id 4F1E0584392
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Oct 2008 10:06:06 +0200 (CEST)
From: Michael 'Mickey' Lauer <mickey@vanille-media.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20081008233816.7410A189322@amethyst.openembedded.net>
References: <20081008233816.7410A189322@amethyst.openembedded.net>
Date: Thu, 09 Oct 2008 15:52:25 +0800
Message-Id: <1223538745.4714.27.camel@ip6-localhost>
Mime-Version: 1.0
X-Mailer: Evolution 2.24.0-1mdv2009.0 
Subject: Re: [oe-commits] : gettext.bbclass: make it simpler to understand
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
X-List-Received-Date: Thu, 09 Oct 2008 07:58:27 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Am Donnerstag, den 09.10.2008, 01:38 +0200 schrieb OE GIT Trial:
> Module: org.openembedded.dev.git
> Branch: org.openembedded.dev
> Commit: 80bdb16c9dbefb4d06fe1e1d714ba042c833b92f
> URL:    http://gitweb.openembedded.net/?p=org.openembedded.dev.git&a=commit;h=80bdb16c9dbefb4d06fe1e1d714ba042c833b92f
> 
> Author:  <woglinde2@openembedded.org>
> Date:   Wed Oct  8 22:06:39 2008 +0000
> 
> gettext.bbclass: make it simpler to understand
> * set the deps for package which can use NLS stuff
> * filter the deps out if NLS is not requested

I have just reverted this commit as it lead to a dependency loop here
rendering everything unbuildable.

Can you please recheck?

:M:




