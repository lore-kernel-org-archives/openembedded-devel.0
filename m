Received: from [81.169.178.128] (helo=h6563.serverkompetenz.net)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <oe@hentges.net>) id 1J3CbH-0007YY-NP
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 Dec 2007 16:37:19 +0100
Received: from localhost (localhost [127.0.0.1])
	by h6563.serverkompetenz.net (Postfix) with ESMTP id 7B564308010
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Dec 2007 16:32:48 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at hentges.net
Received: from h6563.serverkompetenz.net ([127.0.0.1])
	by localhost (h6563.serverkompetenz.net [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id Matk-ZZGxSJX
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Dec 2007 16:32:46 +0100 (CET)
Received: from [192.168.5.2] (xdsl-87-79-225-199.netcologne.de [87.79.225.199])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by h6563.serverkompetenz.net (Postfix) with ESMTP id 953FB308004
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Dec 2007 16:32:46 +0100 (CET)
From: Matthias Hentges <oe@hentges.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <fju2o1$9l2$1@ger.gmane.org>
References: <fju2o1$9l2$1@ger.gmane.org>
Date: Fri, 14 Dec 2007 16:32:45 +0100
Message-Id: <1197646365.9761.13.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.2 
Subject: Re: RFC: drop timezones from OE
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
X-List-Received-Date: Fri, 14 Dec 2007 15:37:19 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit


Am Freitag, den 14.12.2007, 15:08 +0100 schrieb Rolf Leggewie:
> Hi,
> 
> it seems that there are two, conflicting packages in OE providing
> timezone data: tzdata from glibc and timezones from opie/handhelds.
> 
> I think it would make sense to drop timezones and only have the timezone
> data from glibc as this eliminates problems where one wants to install
> package A that depends on tzdata but you also want package B where the
> dependency is declared for timezones.  Currently, you can only install
> either A or B.
> 
> If there is consensus on this, I would take care that OE metadata is
> updated accordingly (drop timezones folder, replace occurences of
> timezones in DEPENDS with tzdata, etc.)
> 
> Regards
> 
> Rolf
> 
+1

It is an ancient Opie relict that should have died a long time ago.

-- 
Matthias 'CoreDump' Hentges 
Cologne / Germany

Webmaster of Hentges.net & Embedded Linux Developer
GPG ->  gpg --keyserver gpg-keyserver.de --recv-keys 0xAF3030D9

My OS: Debian SID: Geek by Nature, Linux by Choice





