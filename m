Received: from [81.169.183.159] (helo=coruscant.onosendai.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <zecke@selfish.org>) id 1JeqzK-0001ft-HJ
	for openembedded-devel@lists.openembedded.org;
	Thu, 27 Mar 2008 13:13:46 +0100
Received: from [212.23.103.62] (helo=[10.129.250.21])
	by coruscant.onosendai.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.60)
	(envelope-from <zecke@selfish.org>) id 1JeqzI-0007sW-5x
	for openembedded-devel@lists.openembedded.org;
	Thu, 27 Mar 2008 13:13:46 +0100
From: Holger Freyther <zecke@selfish.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 27 Mar 2008 03:49:59 +0100
User-Agent: KMail/1.9.9
References: <47EAEB1D.9060004@xora.org.uk>
In-Reply-To: <47EAEB1D.9060004@xora.org.uk>
MIME-Version: 1.0
Message-Id: <200803270349.59619.zecke@selfish.org>
X-Broken-Reverse-DNS: no host name found for IP address 212.23.103.62
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
X-List-Received-Date: Thu, 27 Mar 2008 12:13:46 -0000
Content-Disposition: inline
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Thursday 27 March 2008 01:32:29 Graeme Gregory wrote:
> Moving a private discussion public I started to add a quick score card for
> SCM's
>
> This is currently how I see feature support.
>
> So far we seem to have this list where goodness is 1-5 (5 being good)
>
> CPU Load Git 5 Monotone 3
> Ease of branching Git 5 Monotone 5
> Ease of Branch Merging Git 4 Monotone 3
> Ease of Serving Git 1 Monotone 5
> Ease of Distributed SCM Git 2 Monotone 5
>
>
> Im sure there is more scores we can add to this list. And you might not
> agree with my scores, but it seems pretty close so far.

Ease of publishing branches Git 5 Monotone 0:
	Reasoning:
		With git, I push and transfer the number of bytes that I have changed
		to the server. So a small change is a small upload.

		With mtn (0.37 here) in contrast it wants to upload every revision to the 
		server. I'm on a GPRS/UMTS/CDMA line and after ~48MB of upload I got 
		disconnected, twice. The revs still reside on my disk only, I'm not able
		to share it. The database is locked during this operation, I can not do 
		diffs, commits, checkouts during this time.

		Publishing means uploading what we have created, which is a lot bigger than 
		just my small change.


z.


