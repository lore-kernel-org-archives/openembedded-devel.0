Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1NQYkp-0004Ji-Aq
	for openembedded-devel@lists.openembedded.org;
	Fri, 01 Jan 2010 05:04:50 +0100
Received: from tamarin.localnet (123-192-180-176.dynamic.kbronet.com.tw
	[123.192.180.176])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id EA1511B10C02
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Jan 2010 03:59:46 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 1 Jan 2010 05:02:35 +0100
User-Agent: KMail/1.12.2 (Linux/2.6.31; KDE/4.3.2; i686; ; )
References: <D15778FFF6A6CA4FAF01B8D2C3780300499CFF2A86@ushqwmb02.palm1.palmone.com>
In-Reply-To: <D15778FFF6A6CA4FAF01B8D2C3780300499CFF2A86@ushqwmb02.palm1.palmone.com>
MIME-Version: 1.0
Message-Id: <201001010502.35744.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Two quick questions
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
X-List-Received-Date: Fri, 01 Jan 2010 04:04:50 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Thursday 31 December 2009 19:55:52 Michael Morrell wrote:
> I have two quick OE questions.
> 
> First, is it possible to use any of the "directives" in a bb file or conf
>  file based on a condition?  For example, can I "inherit" a class or use
>  "addtask" only under certain conditions.  I couldn't find a way to do
>  this.

The question is why do you need this? What would be your usecase? You could 
achieve this with inherit ${MY_VAR} and then have MY_VAR be either "base" 
(which is already included) or what you want... but this is kind of ugly and 
hard to understand.



> Second, if I have some code common to several bb files, I can either put it
>  in a .inc file and use "require" or in a .bbclass file and use "inherit". 
>  Are there any guidelines on which approach is better?

my rule of thumb. .inc if it only belongs to the package. E.g. all "foo" 
packages need this... For a .bbclass two or more packages would need to use 
this functionality. The classic example here is a buildsystem...


z.


