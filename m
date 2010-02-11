Received: from ns.penguin.cz ([84.21.108.25])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1NfhuX-0003SP-OL
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Feb 2010 23:53:28 +0100
Received: from localhost (localhost [127.0.0.1])
	by ns.penguin.cz (Postfix) with ESMTP id 89FBA1422AC1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Feb 2010 23:51:19 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at ns.penguin.cz
Received: from ns.penguin.cz ([127.0.0.1])
	by localhost (ns.penguin.cz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Doyb89D8ukUy
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Feb 2010 23:51:19 +0100 (CET)
Received: from [192.168.1.2] (7-165-207-85.strcechy.adsl-llu.static.bluetone.cz
	[85.207.165.7]) by ns.penguin.cz (Postfix) with ESMTP id 5F41F1416BAC
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Feb 2010 23:51:19 +0100 (CET)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4B73FE28.3080703@theforce.com.au>
References: <4B73FE28.3080703@theforce.com.au>
Date: Thu, 11 Feb 2010 23:51:09 +0100
Message-ID: <1265928669.7804.14.camel@utx.utx.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.2 
X-SA-Exim-Connect-IP: 84.21.108.25
X-SA-Exim-Mail-From: utx@penguin.cz
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: gnumeric not building
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
X-List-Received-Date: Thu, 11 Feb 2010 22:53:28 -0000
Content-Type: text/plain; charset="ISO-8859-2"
Content-Transfer-Encoding: 7bit

Grahame Jordan wrote:
> Hi,
> 
> While building omap3-desktop-image gnumeric failed looking for 
> gnumeric-stock-pixbufs.h
> | application.c:26:44: error: pixmaps/gnumeric-stock-pixbufs.h: No such 
> file or directory
> 
> This file is in my older repository so I copied it over and it now compiles.
> Should this file be put back?

This file should be auto-generated using helper utility from the
gdk-pixbuf-csource-native. It is in DEPENDS, but it looks like something
went wrong. I was able to build gnumeric-1.9.14-r0, so you have to look
deeper into your logs.


________________________________________________________________________
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



