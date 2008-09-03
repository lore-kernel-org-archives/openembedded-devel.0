Received: from [81.169.183.159] (helo=coruscant.onosendai.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <zecke@selfish.org>) id 1Kb1eM-0001MV-9W
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Sep 2008 01:20:34 +0200
Received: from [92.117.198.21] (helo=tamarin.local)
	by coruscant.onosendai.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.69)
	(envelope-from <zecke@selfish.org>) id 1Kb1cE-0000J8-9s
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Sep 2008 01:18:26 +0200
From: Holger Freyther <zecke@selfish.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 4 Sep 2008 01:17:38 +0200
User-Agent: KMail/1.9.9
References: <200809031554.52267.zecke@selfish.org> <g9mi4r$53n$1@ger.gmane.org>
In-Reply-To: <g9mi4r$53n$1@ger.gmane.org>
MIME-Version: 1.0
Message-Id: <200809040117.39159.zecke@selfish.org>
X-Broken-Reverse-DNS: no host name found for IP address 92.117.198.21
Subject: Re: Hash based SCMs and OpenEmbedded/Bitbake
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
X-List-Received-Date: Wed, 03 Sep 2008 23:20:34 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wednesday 03 September 2008 19:39:39 Koen Kooi wrote:

> > Issue: The PV says something like PV = "1.0.0+gitr${SRCREV}". Now the
> > SRCREV is fixed and will not go through the python hook. So the resulting
> > package will be PV = "1.0.0+gitrdeadbeef" and if you want to upgrade to
> > the ref "affe" you will have a package called "1.0.0+gitraffe" which is
> > not upgradable.
>
> The trick I have been lately:
>
> PV = "0.0+${PR}+gitr${SRCREV}"
>
> You increment PR everytime you bump SRCREV. Ugly, but works quite well :)

I have seen that in the neuros recipes and removed that... I don't want to say 
what I thought when I saw this the first time.... :)


