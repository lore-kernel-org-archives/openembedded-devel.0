Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1P11Et-0006R4-Im
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Sep 2010 20:18:48 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1P11Ec-0005A7-VK from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Sep 2010 11:18:30 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Wed, 29 Sep 2010 11:18:30 -0700
Received: from [172.30.80.16] ([172.30.80.16]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Wed, 29 Sep 2010 12:18:29 -0600
Message-ID: <4CA382F1.8040207@mentor.com>
Date: Wed, 29 Sep 2010 11:18:25 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTinMWT7K-h+hH0LvPD119Nxxpitro=f6igQvL7-K@mail.gmail.com>	<4CA2DDFF.2090201@eukrea.com>
	<AANLkTikv8x4xoAD5zPnprHpo9wcWc1hi8FF=5m8mtCi4@mail.gmail.com>
In-Reply-To: <AANLkTikv8x4xoAD5zPnprHpo9wcWc1hi8FF=5m8mtCi4@mail.gmail.com>
X-OriginalArrivalTime: 29 Sep 2010 18:18:29.0744 (UTC)
	FILETIME=[B7A50F00:01CB6002]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] kernel NOTE messages fix
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
X-List-Received-Date: Wed, 29 Sep 2010 18:18:49 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Frans Meulenbroeks wrote:
> Thanks for the feedback and the acks.
> I'll make a formal patch for this and push it with the acks added.
> Maybe this evening otherwise tomorrow (but if someone can't wait so
> long feel free to make the patch (but please let me know on irc, so we
> do not end up duplicating things))
> 
> Wrt the kernel-dev route: I didn't try it, as Henning & Petr (and
> maybe also Eric) tried this before.
> 
> Tom, I do encounter issues with scripts and strip either. They are
> still on my to-investigate list and are not related to the issue at
> hand, but when building slugos-image for nslu2 I get the messages
> given below. Guess this is the same problem you are facing.
> 
> I'm open for hints on how to fix this one.

I think something like:
- Copy sources, cd to dest
- Backup .config
- make mrproper
- Restore .config to destdir
- make ... modules_prep or so (don't have it off-hand, but make help 
shows) which gets things valid again for external modules to build.

Problem is that (a) that won't work on 2.4 and (b) I don't know how far 
back, off-hand, that make target exists in 2.6.

-- 
Tom Rini
Mentor Graphics Corporation


