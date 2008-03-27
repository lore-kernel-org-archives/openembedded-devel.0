Received: from [81.169.183.159] (helo=coruscant.onosendai.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <zecke@selfish.org>) id 1JevJu-00081K-Lt
	for openembedded-devel@lists.openembedded.org;
	Thu, 27 Mar 2008 17:51:18 +0100
Received: from [212.23.103.122] (helo=[10.161.239.33])
	by coruscant.onosendai.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.60)
	(envelope-from <zecke@selfish.org>) id 1JevJu-0006YX-27
	for openembedded-devel@lists.openembedded.org;
	Thu, 27 Mar 2008 17:51:18 +0100
From: Holger Freyther <zecke@selfish.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 27 Mar 2008 17:50:49 +0100
User-Agent: KMail/1.9.9
References: <47EAEB1D.9060004@xora.org.uk>
	<200803270349.59619.zecke@selfish.org> <fsggcu$5i8$1@ger.gmane.org>
In-Reply-To: <fsggcu$5i8$1@ger.gmane.org>
MIME-Version: 1.0
Message-Id: <200803271750.49583.zecke@selfish.org>
X-Broken-Reverse-DNS: no host name found for IP address 212.23.103.122
Subject: Re: SCM scorecards
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
X-List-Received-Date: Thu, 27 Mar 2008 16:51:18 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thursday 27 March 2008 17:01:34 Koen Kooi wrote:
> Holger Freyther schreef:

> That's because you used the wrong branch include pattern when pushing,
> you did:
>
> ~  mtn push host org.foo.zecke1
>
> you want:

Why would I want to push my changes to the original branch? In this case I 
don't want to because they contain untested changes.

This means I have to pull a 'virgin' org.openmoko.dev tree, pull my branches 
from the other db and publish. Or kill the revisions in the org.openmoko.dev 
branch I don't want to push.


>
> ~  mtn push host org.foo.{original,zecke1}
>
> the second will only transfer new revs, instead of marking all revs with
> the new branch cert and (re)transferring them.

Interesting. I thought the certs say which revision they are attached to, so I 
would have to upload ~25.000 branch certs. The revisions should be unchanged 
and only certs should be uploaded. I assume this is a bug and unnoticed due 
the use of broadband. :)

thanks for the fish-slap, I was able to publish my two branches. So it is not 
zero points on the scoreboard, but I hit one limitiation and one bug or just 
two bugs. I will get my act together and report them.

	z.


