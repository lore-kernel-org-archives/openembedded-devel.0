Received: from www.xora.org.uk ([80.68.91.202] helo=xora.vm.bytemark.co.uk)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dp@xora.org.uk>) id 1P5Gqr-0008Tk-Hw
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Oct 2010 13:47:36 +0200
Received: from localhost (localhost [127.0.0.1])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTP id EFCC0A47F0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Oct 2010 12:47:08 +0100 (BST)
X-Virus-Scanned: Debian amavisd-new at xora.vm.bytemark.co.uk
Received: from xora.vm.bytemark.co.uk ([127.0.0.1])
	by localhost (xora.vm.bytemark.co.uk [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id IIezJBB639TF
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Oct 2010 12:47:08 +0100 (BST)
Received: from [192.168.1.10] (188-220-34-37.zone11.bethere.co.uk
	[188.220.34.37])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTPSA id 5EBEFA47A9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Oct 2010 12:47:08 +0100 (BST)
Message-ID: <4CB2F93C.2060609@xora.org.uk>
Date: Mon, 11 Oct 2010 12:47:08 +0100
From: Graeme Gregory <dp@xora.org.uk>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-GB;
	rv:1.9.2.9) Gecko/20100915 Lightning/1.0b2 Thunderbird/3.1.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTimQBC0f8J-J_E+XADErZMAGzgNHRKwUemXThgPy@mail.gmail.com>
In-Reply-To: <AANLkTimQBC0f8J-J_E+XADErZMAGzgNHRKwUemXThgPy@mail.gmail.com>
X-Enigmail-Version: 1.1.1
X-SA-Exim-Connect-IP: 80.68.91.202
X-SA-Exim-Mail-From: dp@xora.org.uk
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: git & SRCREV
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
X-List-Received-Date: Mon, 11 Oct 2010 11:47:36 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

 On 11/10/2010 12:45, Frans Meulenbroeks wrote:
> Roughly once a week i see a question on irc about someone getting a
> git error: "fatal: not a valid object name 1"
> this is because SRCREV is not defined for e.g. that machine.
> What about extending bitbake (guess it is in there) with an error
> message that more clearly explains the problem?
>
As 1 can never be valid for git, how about a if SRCREV==1 then exlode in
git.bbclass

Graeme



