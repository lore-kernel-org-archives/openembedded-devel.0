Received: from [81.169.183.159] (helo=coruscant.onosendai.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <zecke@selfish.org>) id 1JZ12F-0001GC-86
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Mar 2008 10:44:41 +0100
Received: from firewall.tw.openmoko.org ([124.219.5.210] helo=tamarin.local)
	by coruscant.onosendai.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.60)
	(envelope-from <zecke@selfish.org>) id 1JZ10M-0004AS-Gx
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Mar 2008 10:42:42 +0100
From: Holger Freyther <zecke@selfish.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Mar 2008 10:42:38 +0100
User-Agent: KMail/1.9.9
References: <200803110807.11368.zecke@selfish.org> <fr5egp$jbl$1@ger.gmane.org>
In-Reply-To: <fr5egp$jbl$1@ger.gmane.org>
MIME-Version: 1.0
Message-Id: <200803111042.39028.zecke@selfish.org>
X-SA-Exim-Connect-IP: 81.169.183.159
X-SA-Exim-Mail-From: zecke@selfish.org
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Reconsidering the work flow and how the SCM system fits in
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
X-List-Received-Date: Tue, 11 Mar 2008 09:44:41 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Tuesday 11 March 2008 09:05:45 Koen Kooi wrote:
> Holger Freyther schreef:
> | PS: It is not the speed of mtn, it is the lack of development in areas
>
> like
>
> | branches, merging, rebasing, we need to use these in OE!
>
> How many people have actually used a branch when developing OE stuff? I
> did for the avr32 work and didn't have any problem, merging back only
> took one 'mtn propagate' and a push. Regardless if we should switch or
> not, I would like to see some 'evidence' of people trying to use a
> branch and fail.

I have been trying to merge the dreambox branch for the last six month. 
Monotone has not allowed me to do this so far. It has gone from just refusing 
the work, to spitting random ids on the console, to spitting filenames 
without path on the console. And no: Deleting/Renaming files before being 
able to merge is not an option, specially because mtn is not showing you all 
conflicts... so in the worse case you need to rename more than one file, 
creating really ugly history and only because mtn is not up to the job.
Also you have witnessed the issue with suspending branches and the automerger 
making them live again... there is enough evidence...

z.


