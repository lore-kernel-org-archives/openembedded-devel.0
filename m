Received: from [72.29.79.205] (helo=rhodos.klever.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <hacker@klever.net>) id 1IE7kb-0008Vb-3l
	for openembedded-devel@lists.openembedded.org;
	Thu, 26 Jul 2007 20:07:51 +0200
Received: from pd953a60b.dip0.t-ipconnect.de ([217.83.166.11]
	helo=olympus.klever.net)
	by rhodos.klever.net with esmtpsa (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.67) (envelope-from <hacker@klever.net>) id 1IE7jC-0005pa-J9
	for openembedded-devel@lists.openembedded.org;
	Thu, 26 Jul 2007 20:06:26 +0200
Message-ID: <46A8E23D.1080201@klever.net>
Date: Thu, 26 Jul 2007 20:04:45 +0200
From: Michael Krelin <hacker@klever.net>
User-Agent: Thunderbird 2.0.0.4 (X11/20070619)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <46A88A22.5010608@dominion.kabel.utwente.nl>	<46A89F67.5080907@klever.net>
	<46A8DB81.5070900@dominion.kabel.utwente.nl>
In-Reply-To: <46A8DB81.5070900@dominion.kabel.utwente.nl>
Subject: Re: [RFC] make building working zaurus images easier
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
X-List-Received-Date: Thu, 26 Jul 2007 18:07:54 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> Michael Krelin schreef:
>> I have never looked into all this machinery, but since we have, e.g.
>> x11-image-spitz.tar.gz and zImage-spitz.bin symlinks, I'd guess that we 
>> can do without these somewhat ugly when unnecessary `ls|sort|uniq|tail` 
>> things, can't we?
> 
> Won't tar package up the symlinks instead of the real files in that case?

`tar -h` won't, but what I meant is (a) we do have information necessary 
to find out the actual filename and (b) if the information is outdated 
we have symlinks to access the proper image and torture it whichever way 
we want.

Love,
H

> 
> regards,
> 
> Koen
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
> 
> iD8DBQFGqNuBMkyGM64RGpERAkr2AJ9BlpLlCmwxdakPwW7TxRFkwFAHVwCeNtcm
> Y7tBsLqo045ka9lG64Z+FNo=
> =8+tA
> -----END PGP SIGNATURE-----
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


