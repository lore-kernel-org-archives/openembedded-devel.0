Received: from [81.169.183.159] (helo=coruscant.onosendai.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <zecke@selfish.org>) id 1KqDow-0001IE-Bw
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Oct 2008 23:22:18 +0200
Received: from [92.116.127.219] (helo=[10.129.127.219])
	by coruscant.onosendai.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.69)
	(envelope-from <zecke@selfish.org>) id 1KqDjw-00065p-6a
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Oct 2008 23:17:08 +0200
From: Holger Freyther <zecke@selfish.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 15 Oct 2008 23:17:10 +0200
User-Agent: KMail/1.9.9
References: <200810151022.38477.zecke@selfish.org> <gd4aul$sb5$1@ger.gmane.org>
In-Reply-To: <gd4aul$sb5$1@ger.gmane.org>
MIME-Version: 1.0
Message-Id: <200810152317.10733.zecke@selfish.org>
X-Broken-Reverse-DNS: no host name found for IP address 92.116.127.219
Subject: Re: [RFC] Enable --hash-style=both for all recent gcc4 targets
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
X-List-Received-Date: Wed, 15 Oct 2008 21:22:18 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wednesday 15 October 2008 10:51:33 Koen Kooi wrote:
> On 15-10-2008 10:22, Holger Freyther wrote:
> > Hey guys,
> >
> > I would start linking everything with -Wl,--hash-style=both as this is
> > said to speed up the loading of shared libraries by about 50%
>
> Also check the as-needed stuff from Poky:
>
> ASNEEDED = "-Wl,--as-needed"
> ASNEEDED_pn-console-tools = ""
> ASNEEDED_pn-distcc = ""
> ASNEEDED_pn-openobex = ""
> ASNEEDED_pn-icu = ""
> ASNEEDED_pn-xserver-kdrive-xomap = ""
> ASNEEDED_pn-minimo = ""
> ASNEEDED_pn-pciutils = ""
> ASNEEDED_pn-puzzles = ""
> ASNEEDED_pn-dialer = ""
>
> TARGET_LDFLAGS += "${ASNEEDED}"
>
> That should also reduce library load time *and* eliminate spurious deps.

Thanks. holger/hash-style has my take on that. It attempts to keep the 
enabling to the libc and distro and the blacklist can be shared among 
everyone.

comments? next stop would the hwcaps we have talked about.

z. 


