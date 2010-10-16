Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1P76M5-0001YB-Jy
	for openembedded-devel@lists.openembedded.org;
	Sat, 16 Oct 2010 14:59:21 +0200
Received: from [192.168.0.101] (91-64-127-39-dynip.superkabel.de
	[91.64.127.39])
	by gandharva.secretlabs.de (Postfix) with ESMTPA id 2AD611B10C0B
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Oct 2010 12:59:39 +0000 (UTC)
Message-ID: <4CB9A189.7060402@freyther.de>
Date: Sat, 16 Oct 2010 14:58:49 +0200
From: Holger Freyther <holger+oe@freyther.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.9) Gecko/20100921 Fedora/3.1.4-1.fc14 Lightning/1.0b2
	Thunderbird/3.1.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1287230170-20745-1-git-send-email-fransmeulenbroeks@gmail.com>	<4CB99A9C.2060507@freyther.de>
	<20101016125032.GA32732@rhein.zuhause.netz>
In-Reply-To: <20101016125032.GA32732@rhein.zuhause.netz>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] gnutols_2.10.1: remove the libtool-m4-macros
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
X-List-Received-Date: Sat, 16 Oct 2010 12:59:22 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 10/16/2010 02:50 PM, Henning Heinold wrote:

>> I think that appraoch is wrong. autoreconf --install --force should call
>> libtoolize which will copy over new files. So we should delete the libtool m4
>> files, run libtoolize and hope that it works. Did you try this?
> 
> *g* Did you look at the patch? Frans is doing what you suggested.
> 

Well, anything of that size is hard to read. I got lost in reading the diff of
a diff. Anyone knows if there is a git format-patch option to not print
removed files? I should have seen the dirstat though.


BTW: Title should be gnutls and not gnutols.


