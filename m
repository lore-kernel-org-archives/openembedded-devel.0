Received: from [81.169.183.159] (helo=coruscant.onosendai.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <zecke@selfish.org>) id 1Ju3y3-0003b7-Qm
	for openembedded-devel@lists.openembedded.org;
	Thu, 08 May 2008 13:07:19 +0200
Received: from world82.mi.fu-berlin.de ([160.45.115.82])
	by coruscant.onosendai.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.69)
	(envelope-from <zecke@selfish.org>) id 1Ju3xP-0005Co-Ta
	for openembedded-devel@lists.openembedded.org;
	Thu, 08 May 2008 13:06:39 +0200
From: Holger Freyther <zecke@selfish.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 8 May 2008 13:06:36 +0200
User-Agent: KMail/1.9.9
References: <200805080215.23729.zecke@selfish.org> <fvuj9i$nt9$1@ger.gmane.org>
In-Reply-To: <fvuj9i$nt9$1@ger.gmane.org>
MIME-Version: 1.0
Message-Id: <200805081306.37230.zecke@selfish.org>
Subject: Re: Creating a pristine environment?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10b4
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
X-List-Received-Date: Thu, 08 May 2008 11:07:20 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thursday 08 May 2008 12:05:38 Koen Kooi wrote:
> Holger Freyther wrote:
> > Hey,
> >
> > I have seen raster's environment breaking various buildsystems and we
> > might want to really start having a clean environment before starting to
> > build.
> >
> > the patch below should implement it. Should we do this in OE? I'm aware
> > of the unexport inside OE but we really should do this the otherway
> > around.
>
> While this is a good idea, your current implementation breaks:
>
> MACHINE=foo ANGSTROM_MODE=bar bitbake foo-bar-image

Well, that would make a case for keeping the unexport feature in OE. Or we 
could move the unsetting to after having parsed the configuration. I will 
give the 2nd idea a go...


z.


