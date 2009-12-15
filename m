Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1NKQKq-0002uj-Ox
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Dec 2009 06:52:39 +0100
Received: from tamarin.localnet (123-192-180-176.dynamic.kbronet.com.tw
	[123.192.180.176])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id A1E921B10C03
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Dec 2009 05:46:26 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 15 Dec 2009 06:50:46 +0100
User-Agent: KMail/1.12.2 (Linux/2.6.31; KDE/4.3.2; i686; ; )
References: <op.u4yom7zgmn1qzu@guohr-laptop-ubuntu>
In-Reply-To: <op.u4yom7zgmn1qzu@guohr-laptop-ubuntu>
MIME-Version: 1.0
Message-Id: <200912150650.46475.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Patch for bitbake to enable the --ignore-deps option accept regular expression
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
X-List-Received-Date: Tue, 15 Dec 2009 05:52:39 -0000
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit

On Tuesday 15 December 2009 05:12:41 Guo Hongruan wrote:
> Hi guys,
>     I modified the bitbake to enable it accept regular expression with -I
> option. Now I can generate dot file without any native packages, using the
> following command:
> 
> bitbake -g helloworld-image -I "native$"
> 
>     Hope it is useful for you
> 
> Thanks a lot!
>

Awesome! Could you please do me three more favors?

1.) Use git commit and send us the result of git format-patch. This way you 
will be properly credited as the author of the change.

2.) You have added the same code to 3 (or 4... I don't want to count) places, 
I think this warrants to create a new python helper function (feel free to ask 
me how to do it) to have some code sharing.

3.) Once you have factored out the code into a method that returns True/False 
depending on if you filter it or not... You can directly return on the first 
match instead of doing the regexp on every other dependency as well.


thanks a lot!

	z.


