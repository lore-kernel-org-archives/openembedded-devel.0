Received: from smtpfb1-g21.free.fr ([212.27.42.9])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ydirson@free.fr>) id 1Oh1c5-0007B2-P0
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 Aug 2010 16:40:07 +0200
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
	by smtpfb1-g21.free.fr (Postfix) with ESMTP id C674D77C45B
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Aug 2010 16:33:16 +0200 (CEST)
Received: from zimbra44-e7.priv.proxad.net (unknown [172.20.243.194])
	by smtp3-g21.free.fr (Postfix) with ESMTP id 199008180A0
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Aug 2010 16:33:11 +0200 (CEST)
Date: Thu, 5 Aug 2010 16:33:10 +0200 (CEST)
From: ydirson@free.fr
To: openembedded-devel@lists.openembedded.org
Message-ID: <689478466.603801281018790928.JavaMail.root@zimbra44-e7.priv.proxad.net>
In-Reply-To: <1281003439.3692.4.camel@mattotaupa>
MIME-Version: 1.0
X-Originating-IP: [195.68.26.1]
X-Mailer: Zimbra 5.0 (ZimbraWebClient - FF3.0
	(Linux)/5.0.15_GA_2815.UBUNTU8_64)
X-Authenticated-User: ydirson@free.fr
X-SA-Exim-Connect-IP: 212.27.42.9
X-SA-Exim-Mail-From: ydirson@free.fr
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 1/3] git: replace remaining broken hardlinks with symlinks.
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
X-List-Received-Date: Thu, 05 Aug 2010 14:40:07 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi Paul,

>Objet: Re: [oe] [PATCH 1/3] git: replace remaining broken hardlinks with symlinks.
>could you do me a favor and explain what is broken regarding hardlinks
>please. This issue was pointed out to me before, but I could not
>reproduce it or did not understand it [1].

I was puzzled myself :)

While dpkg itself handles hardlinks in deb's (and thus in ipk's), if you run
"dpkg --fsystarfile git*.ipk|tar tvf -", you won't see any hardlink in the tar,
even though the Makefile creates them.  You can also "dpkg-deb -x" the ipk and check
that no hardlink gets extracted.

You can also comment out the loop that relinks binaries in current recipe, and see
the size of extracted ipk grow to 40+ MB.

Now I just assumed it was a bug in the mechanism generating the ipk's, but one should
first check that the output of do_stage is correct before pointing a finger :)
I don't claim this patch fixes the root cause of the problem, it just mitigates it and
just allows me to bring a working git in my pocket :)


