Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <rpurdie@rpsys.net>) id 1GKXMP-0002yE-Nh
	for openembedded-devel@openembedded.org; Tue, 05 Sep 2006 11:36:49 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.6) with ESMTP id k859Y5Cs001956
	for <openembedded-devel@openembedded.org>;
	Tue, 5 Sep 2006 10:34:05 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 01844-04 for <openembedded-devel@openembedded.org>;
	Tue,  5 Sep 2006 10:34:04 +0100 (BST)
Received: from dynamic2.rpnet.com (dynamic2.rpnet.com [192.168.1.32])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.6) with ESMTP id k859Y3eP001950
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Tue, 5 Sep 2006 10:34:03 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@openembedded.org>
In-Reply-To: <20060905084952.GA8359@stygia.hyboria>
References: <44FD3519.7000000@dominion.kabel.utwente.nl>
	<20060905084952.GA8359@stygia.hyboria>
Date: Tue, 05 Sep 2006 10:34:02 +0100
Message-Id: <1157448842.26547.1.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: gtk 2.6/2.8 vs 2.10
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 05 Sep 2006 09:36:50 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2006-09-05 at 09:49 +0100, Graeme Gregory wrote:
> On Tue, Sep 05, 2006 at 10:28:09AM +0200, Koen Kooi wrote:
> > A lot of these problems can be solved with 'preferred-gtk-2.8-versions.inc', but ideally
> > we'd want a way to get the gtk PV from inside other recipes (e.g. gtk-engines).
> > 
> > Does anyone have a good idea on how to handle all this?
> > 
> I just checked my gtk+-2.10.0 and gtk+-2.0.pc contans the following
> line.
> 
> gtk_binary_version=2.10.0
> 
> If this exists for all gtk+ we could parse ths file in install and set
> ${LIBV} with it.

It exists for 2.8.9 so this approach looks promising. Also note the
string is not PV as its 2.4.0 for 2.8.9 so whilst PV would provide some
help, it doesn't really solve this problem.

Cheers,

Richard



