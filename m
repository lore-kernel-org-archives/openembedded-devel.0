Received: from ns.penguin.cz ([84.21.108.25])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <utx@penguin.cz>) id 1QB6av-00029Y-P1
	for openembedded-devel@lists.openembedded.org;
	Sat, 16 Apr 2011 16:35:29 +0200
Received: from localhost (localhost [127.0.0.1])
	by ns.penguin.cz (Postfix) with ESMTP id 8ABE41416BA8
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Apr 2011 16:11:55 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at ns.penguin.cz
Received: from ns.penguin.cz ([127.0.0.1])
	by localhost (ns.penguin.cz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5NsOnALLUcAN
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Apr 2011 16:11:55 +0200 (CEST)
Received: from [192.168.1.2] (233-15-80-78.tmcz.cz [78.80.15.233])
	by ns.penguin.cz (Postfix) with ESMTP id 4869E1416BA5
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Apr 2011 16:11:55 +0200 (CEST)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1302951223.8709.23.camel@mattotaupa>
References: <1302951049.8709.22.camel@mattotaupa>
	<1302951223.8709.23.camel@mattotaupa>
Date: Sat, 16 Apr 2011 16:11:47 +0200
Message-ID: <1302963107.8128.5.camel@utx.lan>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.1 
Subject: Re: [PATCH 2/2] viking: add `curl` to `DEPENDS`
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
X-List-Received-Date: Sat, 16 Apr 2011 14:35:29 -0000
Content-Type: text/plain; charset="ISO-8859-2"
Content-Transfer-Encoding: 7bit

Paul Menzel wrote:
> Task configure fails with the following error.

Fixed:
http://git.openembedded.org/cgit.cgi/openembedded/commit/?id=4736307c4a27660405505f2a8231afe974eec2dc
http://git.openembedded.org/cgit.cgi/openembedded/commit/?id=c4c5dc5019dec74d36566b94c0c386e48f6748cb

Well, gpsd in DEPENDS is now obsolete. But I am keeping it here with
hope that somebody will fix it or port.

Note that I have a specific reason to keep old version 0.9.6 there -
newer versions defines a minimal width of the layers panel. On small
screen devices it shrinks usable map space.

On large screen devices latest version works well with a small patch:
https://sourceforge.net/tracker/?func=detail&atid=570954&aid=3206628&group_id=83870

-- 

________________________________________________________________________
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



