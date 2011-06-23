Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <holger+oe@freyther.de>) id 1QZiGc-0000M4-Iz
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Jun 2011 13:40:14 +0200
Received: from [192.168.0.101] (91-64-95-94-dynip.superkabel.de [91.64.95.94])
	by gandharva.secretlabs.de (Postfix) with ESMTPA id 0A1081B10C03
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jun 2011 11:43:48 +0000 (UTC)
Message-ID: <4E032546.6000308@freyther.de>
Date: Thu, 23 Jun 2011 13:36:38 +0200
From: Holger Freyther <holger+oe@freyther.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110516 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4E03211B.40205@freyther.de>
	<1308828119.21613.138.camel@phil-desktop>
In-Reply-To: <1308828119.21613.138.camel@phil-desktop>
Subject: Re: RFC One recipe with two git repository as sources
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
X-List-Received-Date: Thu, 23 Jun 2011 11:40:14 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 06/23/2011 01:21 PM, Phil Blundell wrote:
> On Thu, 2011-06-23 at 13:18 +0200, Holger Freyther wrote:
>> -        destdir = os.path.join(destdir, "git/")
>> +        destsuffix = ud.parm.get("destsuffix", "git/")
>> +        print destsuffix
>> +        destdir = os.path.join(destdir, destsuffix)
> 
> I think that "print" might be extraneous, but other than this your patch
> looks awesome.  I think this would resolve the problem that I was having
> in.

great, yeah the print is bogus and the question if and how this applies to
fetch/git.py is also unresolved (i had a quick look but have not found the
dirname it uses to create the tarball).


