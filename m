Received: from [213.140.2.82] (helo=aa015msg.fastweb.it)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <giancarlo.formicuccia@gmail.com>) id 1Gjtpz-0006zJ-Mp
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 Nov 2006 09:40:11 +0100
Received: from ms011msg.fastweb.it (10.31.40.27) by aa015msg.fastweb.it
	(7.3.105.6)
	id 4535D64600C3AAD1 for openembedded-devel@lists.openembedded.org;
	Tue, 14 Nov 2006 09:36:32 +0100
Received: from [192.168.1.26] (83.103.123.107) by ms011msg.fastweb.it (7.2.070)
	id 443CC12D05500FA0 for openembedded-devel@lists.openembedded.org;
	Tue, 14 Nov 2006 09:38:02 +0100
From: Giancarlo Formicuccia <giancarlo.formicuccia@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 14 Nov 2006 10:38:01 +0000
User-Agent: KMail/1.9.4
MIME-Version: 1.0
Message-Id: <200611141038.01935.giancarlo.formicuccia@gmail.com>
Subject: Networking problem with glibc 2.5 and old arm ABI
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
X-List-Received-Date: Tue, 14 Nov 2006 08:40:12 -0000
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi *,

I hit a libc bug building an image for arm with old ABI; the problem is the 
same described here:
http://sources.redhat.com/ml/libc-ports/2006-10/msg00038.html
In my case the assert is triggered by applications using networking (i.e. 
ssh, ...)

I applied the patch described here
http://sources.redhat.com/ml/libc-ports/2006-10/msg00069.html
and the problem seems to be fixed.

Maybe the patch should be included to the dev repository?

Thanks,
Giancarlo


