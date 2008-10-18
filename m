Received: from [81.169.183.159] (helo=coruscant.onosendai.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <zecke@selfish.org>) id 1KrBis-0001Zy-J5
	for openembedded-devel@lists.openembedded.org;
	Sat, 18 Oct 2008 15:20:02 +0200
Received: from [92.117.26.22] (helo=[10.161.26.22])
	by coruscant.onosendai.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.69)
	(envelope-from <zecke@selfish.org>) id 1KrBii-0000g8-Kf
	for openembedded-devel@lists.openembedded.org;
	Sat, 18 Oct 2008 15:19:54 +0200
From: Holger Freyther <zecke@selfish.org>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 18 Oct 2008 15:20:05 +0200
User-Agent: KMail/1.9.9
References: <1224320609.5215.15.camel@dax.rpnet.com>
	<200810181432.38565.zecke@selfish.org>
In-Reply-To: <200810181432.38565.zecke@selfish.org>
MIME-Version: 1.0
Message-Id: <200810181520.05743.zecke@selfish.org>
X-Broken-Reverse-DNS: no host name found for IP address 92.117.26.22
Subject: FILE_PR and my requirements Re: Some open issues
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
X-List-Received-Date: Sat, 18 Oct 2008 13:20:02 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Saturday 18 October 2008 14:32:37 Holger Freyther wrote:

More in depth:

Issues with the current approach:
	- OE => poky is more hard to sync as one needs to watch PR
	- We need to make sure that people do not introduce PR but use FILE_PR

Alternatives:
	- Python black magic(*)
	- A new set of variables + bitbake change

Alternative Python black magic:
	- I strongly oppose any new transparent python magic. I constantly see people 
confused by what we do behind the scenes. I want that PF (so WORKDIR) 
containts the PN, PV, 'PR' of the resulting package. It can not be that you 
have a PR r10.1 as package but only a r10 in your work directory.
	- If I'm not mistaken about the above I will not be happy with such a 
solution


Alternative a new set of variables:
	- Revert to make PR as it was before. This adds legacy...
	- Introduce PKG_PR which is the composition of PR and DISTRO_PR
	- Change PF to be PN-PV-PR (this influences the stamps)
	- Change Bitbake to cache PKG_PR and prefer it over PR.


comments?


