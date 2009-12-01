Received: from hapkido.dreamhost.com ([66.33.216.122] ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Sebastian@SSpaeth.de>) id 1NFRZB-0005y9-0M
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Dec 2009 13:10:52 +0100
Received: from homiemail-a21.g.dreamhost.com (caiajhbdcbhh.dreamhost.com
	[208.97.132.177])
	by hapkido.dreamhost.com (Postfix) with ESMTP id AFBD2179E18
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Dec 2009 04:09:14 -0800 (PST)
Received: from [192.168.1.154] (unknown [195.190.181.110])
	by homiemail-a21.g.dreamhost.com (Postfix) with ESMTPA id 8267D300064
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Dec 2009 04:09:11 -0800 (PST)
Message-ID: <4B150765.8030403@SSpaeth.de>
Date: Tue, 01 Dec 2009 13:09:09 +0100
From: Sebastian Spaeth <Sebastian@SSpaeth.de>
Organization: ETH Zurich
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <ad82c8890912010402p6defc358rd7c353f92c6b2fa9@mail.gmail.com>
In-Reply-To: <ad82c8890912010402p6defc358rd7c353f92c6b2fa9@mail.gmail.com>
X-Enigmail-Version: 0.95.7
OpenPGP: id=C827A062
X-SA-Exim-Connect-IP: 66.33.216.122
X-SA-Exim-Mail-From: Sebastian@SSpaeth.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: compiling linphone using openembedded
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
X-List-Received-Date: Tue, 01 Dec 2009 12:10:52 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

vivek tambakad wrote:
> *OSError: [Errno 13] Permission denied:
> '/home/development/em-x270/stuff/build/tmp'

Well, you have previously stuff put there as root and now as user you
don't have permission to modify it. Surprised?

Delete your tmp dir (or make all files being owned by the user).

spaetz


