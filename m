Received: from [81.169.183.159] (helo=coruscant.onosendai.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <zecke@selfish.org>) id 1KuRU2-0007kQ-A6
	for openembedded-devel@lists.openembedded.org;
	Mon, 27 Oct 2008 13:46:10 +0100
Received: from imp050244.vpn.mi.fu-berlin.de ([130.133.50.244]
	helo=tamarin.localnet) by coruscant.onosendai.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.69)
	(envelope-from <zecke@selfish.org>) id 1KuRTG-00052D-Ho
	for openembedded-devel@lists.openembedded.org;
	Mon, 27 Oct 2008 13:45:22 +0100
From: Holger Freyther <zecke@selfish.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 27 Oct 2008 13:45:21 +0100
User-Agent: KMail/1.10.1 (Linux/2.6.27-7-generic; KDE/4.1.2; i686; ; )
References: <ge211u$h4r$1@ger.gmane.org>
	<1225098642.4235.371.camel@lenovo.internal.reciva.com>
	<490599E4.5090409@balister.org>
In-Reply-To: <490599E4.5090409@balister.org>
MIME-Version: 1.0
Message-Id: <200810271345.22194.zecke@selfish.org>
Subject: Re: Reverting recent openmoko commit
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
X-List-Received-Date: Mon, 27 Oct 2008 12:46:10 -0000
Content-Type: text/plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Monday 27 October 2008 11:37:24 Philip Balister wrote:

> I agree the reversion is an overreaction, but also understand this is
> not the first time this has happened. The messages I noticed that raised
> my eyebrows where some simple changes of description tags. The commit
> message was of the from "[description] Change package description". I
> try (when I have time" to inspect commits that impact stuff I care
> about. Messages of this form force me to read the diff to see what was
> impacted.

The difficulty is. The original above commit touched ~40 recipes, now many of 
these changes do not apply because the recipes that are touched changed, are 
not there any more, or not yet merged.

I'm basically in this dilemma:
	- Copy everything from OM over and have one commit... I personally hate this 
as we lose the history of the changes, I don't credit the creators properly. I 
hope there is an agreement.

       - I could rewrite every commit message. I have to admit I'm too lazy to 
spend two weeks in rewriting every single commit message. I would have to 
resort to the above which I think is  a bad idea.

      -  I can merge as I did. The changes (at least at the end of the chain) 
are sensible and should follow common practices. The commit messages are not 
perfect (in the case that they use [] instead of :). From the possible options 
I see this is the best. As this is crediting people properly (encouraging them 
to do more work), it is preserving history (the distance between commits, the 
authors, the reasoning is still there) and it is not doing any damage.

Where from here?
	- I will merge yesterday's work again as is?
	- I will ask our OM developers to use a different style in the commit message 
(even if this is not mandated) to not use braces but colons. And yes I think I 
asked them to use [] as I'm used to this from various other projects, I will 
ask them to change and change it myself.


z.



