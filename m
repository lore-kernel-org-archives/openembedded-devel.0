Received: from zmta01.irigo.dk ([193.200.44.52])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eha@doredevelopment.dk>) id 1PZIBV-00034d-4K
	for openembedded-devel@lists.openembedded.org;
	Sun, 02 Jan 2011 08:16:57 +0100
Received: from localhost (localhost.localdomain [127.0.0.1])
	by zmta01.irigo.dk (Postfix) with ESMTP id C985422B48F6;
	Sun,  2 Jan 2011 08:16:32 +0100 (CET)
X-Virus-Scanned: amavisd-new at zmta01.irigo.dk
Received: from zmta01.irigo.dk ([127.0.0.1])
	by localhost (zmta01.irigo.dk [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z4j3XTE9+--P; Sun,  2 Jan 2011 08:16:27 +0100 (CET)
Received: from [192.168.1.20] (0x55532124.adsl.cybercity.dk [85.83.33.36])
	by zmta01.irigo.dk (Postfix) with ESMTP id A039122B48C9;
	Sun,  2 Jan 2011 08:16:27 +0100 (CET)
From: Esben Haabendal <eha@doredevelopment.dk>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1293905677.17519.16909.camel@rex>
References: <1293905677.17519.16909.camel@rex>
Organization: =?ISO-8859-1?Q?Dor=E9Development?= ApS
Date: Sun, 02 Jan 2011 08:16:26 +0100
Message-ID: <1293952586.18787.373.camel@eha>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Cc: bitbake-dev <bitbake-dev@lists.berlios.de>
Subject: Re: Bitbake task logging
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
X-List-Received-Date: Sun, 02 Jan 2011 07:16:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit


> e) I'm not 100% on this yet but I'm wondering if we should scrap
> stdout/stderr output to the UI console in debug mode, just make it clear
> where the output went on the console? If you ever have two tasks running
> the output is unreadable anyway.

Yes, stdout/stderr from two (or more) concurrent tasks are pretty
unreadable at best.  But it could make sense to have a debug mode which
does output stdout/stderr to console, while disabling concurrent task
execution.

/Esben



