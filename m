Received: from [81.169.183.159] (helo=coruscant.onosendai.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <zecke@selfish.org>) id 1KpQgO-0001nU-Eb
	for openembedded-devel@lists.openembedded.org;
	Mon, 13 Oct 2008 18:54:12 +0200
Received: from [92.116.253.95] (helo=[10.129.253.95])
	by coruscant.onosendai.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.69)
	(envelope-from <zecke@selfish.org>) id 1KpQbX-0002Xq-PU
	for openembedded-devel@lists.openembedded.org;
	Mon, 13 Oct 2008 18:49:12 +0200
From: Holger Freyther <zecke@selfish.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 Oct 2008 17:30:12 +0200
User-Agent: KMail/1.9.9
MIME-Version: 1.0
Message-Id: <200810131730.14114.zecke@selfish.org>
X-Broken-Reverse-DNS: no host name found for IP address 92.116.253.95
Subject: [RFC] File local variables
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
X-List-Received-Date: Mon, 13 Oct 2008 16:54:12 -0000
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hey guys,

imagine the following situation, I have the following files:
	foo-native_1.2.3.bb
	foo_1.2.2.bb
	foo_1.2.3.bb
	foo.inc

now I'm forced to keep PR,PE inside the .inc file but in most of our cases we 
have the PR inside the final recipe file. This means when doing a change to 
an inc I need to open all other users to bump the right thing.

Have you experienced this as well?

I have wondered if something like:
	PE_${FN} = "0"
	PR_${FN} = "0"

in each separate file and then some Bitbake magic to build the sum from every 
included file?

comments? Am I just too lazy?

	z.


