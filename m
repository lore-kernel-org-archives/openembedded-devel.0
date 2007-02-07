Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1HEms0-0004sb-0O
	for openembedded-devel@openembedded.org; Wed, 07 Feb 2007 14:29:56 +0100
Received: from lieve.dominion.void (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l17DTqLr019324 for <openembedded-devel@openembedded.org>;
	Wed, 7 Feb 2007 14:29:52 +0100
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
To: openembedded-devel@openembedded.org
In-Reply-To: <f34f85580702070514u42b2b887qf416466c5b7bf83d@mail.gmail.com>
References: <f34f85580702070514u42b2b887qf416466c5b7bf83d@mail.gmail.com>
Date: Wed, 07 Feb 2007 14:22:09 +0100
Message-Id: <1170854529.3226.1.camel@lieve>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: tzdata.bb
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
X-List-Received-Date: Wed, 07 Feb 2007 13:29:56 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Op wo, 07-02-2007 te 08:14 -0500, schreef Todd Blumer:
> Because of the impending changes to daylight savings time (DST) here
> in the US, I was motivated to work on creating a new timezone package.
> In the base package I tried to put a city in every timezone around the
> world. This package replaces the 'timezone' package used by Opie, so
> some other packages will need to be changed to depend on tzdata
> instead of timezone. (I used 'tzdata' since that is the Debian name
> and in case some developers were not ready to switch over to tzdata.)
> 
> Someone with write access to oe (something I should probably get
> eventually :-) can commit this to dev if you feel it is appropriate to
> do so. I have tested the US Eastern time.
> 
> I'm sure more work could be done here. Feedback is welcome.

2 small things:

* don't use cp -a, that breaks on non-GNU buildsystems
* don't rely on /usr/bin/zic being present, but provide a zic-native
recipe

regards,

Koe



