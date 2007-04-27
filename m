Received: from [81.169.183.159] (helo=coruscant.onosendai.de)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <zecke@selfish.org>) id 1HhRJz-0001ax-Bx
	for openembedded-devel@lists.openembedded.org;
	Fri, 27 Apr 2007 16:21:15 +0200
Received: from [91.64.161.147] (helo=[192.168.10.100])
	by coruscant.onosendai.de with esmtpsa
	(TLS-1.0:RSA_AES_128_CBC_SHA1:16) (Exim 4.60)
	(envelope-from <zecke@selfish.org>) id 1HhRBL-0005r5-LU
	for openembedded-devel@lists.openembedded.org;
	Fri, 27 Apr 2007 16:12:19 +0200
Mime-Version: 1.0 (Apple Message framework v752.3)
In-Reply-To: <f0suu0$ij2$1@sea.gmane.org>
References: <f0suu0$ij2$1@sea.gmane.org>
Message-Id: <677BDBD3-C730-4CA9-B937-F5AD6CB2D0FA@selfish.org>
From: Holger Freyther <zecke@selfish.org>
Date: Fri, 27 Apr 2007 16:12:17 +0200
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@lists.openembedded.org>
X-Mailer: Apple Mail (2.752.3)
X-Broken-Reverse-DNS: no host name found for IP address 91.64.161.147
Subject: Re: md5sum check fails for ffmpeg - how do we deal with situations like this?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 27 Apr 2007 14:21:15 -0000
Content-Type: text/plain; charset=US-ASCII; delsp=yes; format=flowed
Content-Transfer-Encoding: 7bit


Am 27.04.2007 um 15:47 schrieb Rolf Leggewie:

> Hi,
>
> I tried to build ffmpeg and got the following:
>
> NOTE: The MD5Sums did not match. Wanted:
> '700b66230a8322493c032c04372b8d74' and Got:
> 'ea5587e3c66d50b1503b82ac4179c303'
> NOTE: Task failed: Checksum of
> 'http://downloads.sourceforge.net/ffmpeg/ffmpeg-0.4.9-pre1.tar.gz'  
> failed

Hey,

find the guy who comitted the md5sum. In this case it is marcin who  
comitted the result of a little script. Ask him to dig out the  
ffmpeg-0.4.9-pre1.tar.gz, ask him to md5sum it and then. Note it is  
important to use the tar.gz the original checksum was generated against.

	compare his *sum against the one in the config file.

0.) marcin doesn't have the original sourcecode in that case we are  
almost lost :)
1.) the "regenerated" sum of the original file(see 0.) and yours  
match in that case we can safely update
2.) the numbers don't match. Then we need to consult upstream and ask  
if they changed the tarball. Sadly this is something that commonly  
happens and then update the checksums.ini.

my two cents

z.


