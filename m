Received: from [81.169.183.159] (helo=coruscant.onosendai.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <zecke@selfish.org>) id 1JgS0O-0008Kr-DC
	for openembedded-devel@lists.openembedded.org;
	Mon, 31 Mar 2008 23:57:28 +0200
Received: from [212.23.103.84] (helo=[10.161.84.136])
	by coruscant.onosendai.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.60)
	(envelope-from <zecke@selfish.org>) id 1JgS0N-0007Bk-Hi
	for openembedded-devel@lists.openembedded.org;
	Mon, 31 Mar 2008 23:57:28 +0200
From: Holger Freyther <zecke@selfish.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 31 Mar 2008 23:07:51 +0200
User-Agent: KMail/1.9.9
References: <200803311438.09825.e.robertson.svg@gmail.com>
In-Reply-To: <200803311438.09825.e.robertson.svg@gmail.com>
MIME-Version: 1.0
Message-Id: <200803312307.51210.zecke@selfish.org>
X-Broken-Reverse-DNS: no host name found for IP address 212.23.103.84
Subject: Re: stable branch checksum missmatch for quilt-0.45
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
X-List-Received-Date: Mon, 31 Mar 2008 21:57:29 -0000
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Monday 31 March 2008 21:38:05 E Robertson wrote:

> NOTE: package quilt-native-0.45: started
> NOTE: package quilt-native-0.45-r1: task do_fetch: started
> sh: oe_sha256sum: command not found
> NOTE: The SHA256 Sums do not match.
> Wanted: 'de7290f334baf631a14d031df304ee94cfb550aa69e7512aa589d21c2381c7d8'
> Got: ''

My prolog knowledge is pretty weak but let us analys this:

1. sh: oe_sha256sum: command not found

So executing a command called oe_sha256sum failed


2. > NOTE: The SHA256 Sums do not match.
 > Wanted: 'de7290f334baf631a14d031df304ee94cfb550aa69e7512aa589d21c2381c7d8'
 > Got: ''

So the SHA256 did not match? "" vs. long number (every sha256 hash has the 
same size)


Resolving facts:
	sha256 might be equal to SHA256

	oe_sha256sum might be an OpenEmbedded (oe) program to calculate a
	sha256. It was not able to execute it

	It was not able to execute oe_sha256sum, the stuff printed on the console
	was "".

	This could explain the mismatch?

Applying knowledge:
	You have a failure because oe_sha256sum failed to be executed.

Possible next steps:
	- Check if you have a oe_sha256sum
	- Check if your home partition allows execution of binaries
	- Check your build logs if oe_sha256sum was attempted to be built
	- Check the dep graph if there is a oe_sha256sum in it (bitbake -g and then 
	  read the files and search for sha256)

oe_sha256sum is supposed to be built before everything else, and normally is. 
So good luck and please provide more feedback (you seem to get started)

z.


