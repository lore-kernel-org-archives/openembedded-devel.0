Received: from [64.22.125.45] (helo=wiki.koala.it)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koansoftware@gmail.com>) id 1LvoB9-0000vV-3o
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Apr 2009 09:44:35 +0200
Received: from localhost (localhost [127.0.0.1])
	by wiki.koala.it (Postfix) with ESMTP id CA39E2C7FD;
	Mon, 20 Apr 2009 07:38:14 +0000 (UTC)
Received: from wiki.koala.it ([127.0.0.1])
	by localhost (wiki.koala.it [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SFRLiXcAwG54; Mon, 20 Apr 2009 07:38:13 +0000 (UTC)
Received: from [192.168.0.5] (host56-7-static.30-87-b.business.telecomitalia.it
	[87.30.7.56]) by wiki.koala.it (Postfix) with ESMTP id 688D82C797;
	Mon, 20 Apr 2009 07:38:12 +0000 (UTC)
Message-ID: <49EC26E1.8020909@gmail.com>
Date: Mon, 20 Apr 2009 09:40:17 +0200
From: Marco Cavallini <koansoftware@gmail.com>
Organization: Marco Cavallini - Bergamo - Italia
User-Agent: Thunderbird 2.0.0.21 (X11/20090318)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <49EB6F02.1030402@gmail.com>
	<6978a1740904192319w5ed4ec4bs4c854ecdc540aaa4@mail.gmail.com>
In-Reply-To: <6978a1740904192319w5ed4ec4bs4c854ecdc540aaa4@mail.gmail.com>
Subject: Re: devshell not working with screen remote shell
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
X-List-Received-Date: Mon, 20 Apr 2009 07:44:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

s hakkesteegt ha scritto:
> You might want to add this to your local.conf
> 
> TERMCMD = "${SCREEN_TERMCMD}"
> TERMCMDRUN = "${SCREEN_TERMCMDRUN}"
> 
> devshell will open in a new screen session, witch you can attach to
> manually.
> 

Siebren,
thank you for answering.
I am using a remote ssh connection to the OE development server and I
use screen package inside it.
I tried adding your lines and now the build stops here

 NOTE: package bluez-utils-3.36-r5: task do_devshell: started

but nothing happens.

Are you using this with the same conditions (remote ssh + screen) or
locally?

/marco





