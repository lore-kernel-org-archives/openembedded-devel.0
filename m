Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Lxpdg-0000sR-SO
	for openembedded-devel@openembedded.org; Sat, 25 Apr 2009 23:42:24 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LxpYs-00053G-Lx
	for openembedded-devel@openembedded.org; Sat, 25 Apr 2009 21:37:26 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sat, 25 Apr 2009 21:37:26 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Sat, 25 Apr 2009 21:37:26 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sat, 25 Apr 2009 23:37:14 +0200
Message-ID: <gsvvqb$mc4$1@ger.gmane.org>
References: <gsst4a$cvj$1@ger.gmane.org>
	<200904252318.18413.marcin@juszkiewicz.com.pl>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b4pre) Gecko/20090421 Shredder/3.0b3pre
In-Reply-To: <200904252318.18413.marcin@juszkiewicz.com.pl>
Sender: news <news@ger.gmane.org>
Subject: Re: reverting some csets that kill package upgrade paths
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
X-List-Received-Date: Sat, 25 Apr 2009 21:42:25 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25-04-09 23:18, Marcin Juszkiewicz wrote:

>> So suddenly the library packages (or plugin packages, but no
>> difference in this case) have a new name, but don't set RPROVIDES or
>> RREPLACES to the old packages containing *the same files*. This means
>> that 'opkg install<foo>' or 'opkg upgrade' doesn't work anymore. It
>> will abort saying to package<foo>  wants to overwrite files belonging
>> to<bar>. Depending on the way you build your images in OE, your
>> build will break.
>
> Provide a patch which will add such ones?

Well, I verified that e-wm started in beagleboard-demo-image in a build 
from scratch and in an upgraded images 2 days ago, so any problems those 
3 patches were supposed to fix weren't that critical.
*After* those 3 patches I have a broken build and broken upgrade paths, 
while *before* things were working for me.

I actually tested the changes I made for build from scratch as well as 
upgrading an image. While upgrading I actually noticed the ecore bug 
which was present. I could have revert the SRCREV bump, but I went ahead 
and fixed it. So you can see why I get annoyed that a few days later it 
gets broken again by the same person.

regards,

Koen



