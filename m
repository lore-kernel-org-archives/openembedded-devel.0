Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LcRun-0005ez-SW
	for openembedded-devel@openembedded.org; Wed, 25 Feb 2009 23:07:45 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LcRre-0003nx-PT
	for openembedded-devel@openembedded.org; Wed, 25 Feb 2009 22:04:26 +0000
Received: from p54839b11.dip0.t-ipconnect.de ([84.131.155.17])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 25 Feb 2009 22:04:26 +0000
Received: from vjensen by p54839b11.dip0.t-ipconnect.de with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 25 Feb 2009 22:04:26 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Vitus Jensen <vjensen@gmx.de>
Date: Wed, 25 Feb 2009 22:04:18 +0000 (UTC)
Message-ID: <go4f92$khh$2@ger.gmane.org>
References: <200902131728.08634.openembedded@haerwu.biz>
	<20090224064639.GE2172@smtp.west.cox.net>
	<1235492001.27962.60.camel@andromeda>
	<8763izyarp.fsf@neumann.lab.ossystems.com.br>
	<fce2a370902241036y359e2c7cv1126a62c8627d2bb@mail.gmail.com>
	<20090224185059.GL2172@smtp.west.cox.net>
	<87wsbfw9zy.fsf@neumann.lab.ossystems.com.br>
	<20090225022507.GP2172@smtp.west.cox.net> <go4d36$khh$1@ger.gmane.org>
	<20090225213536.GT2172@smtp.west.cox.net>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: p54839b11.dip0.t-ipconnect.de
User-Agent: Pan/0.133 (House of Butterflies)
Sender: news <news@ger.gmane.org>
Subject: Re: checksums situation
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
X-List-Received-Date: Wed, 25 Feb 2009 22:09:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Am Wed, 25 Feb 2009 14:35:36 -0700 schrieb Tom Rini:

> On Wed, Feb 25, 2009 at 09:27:02PM +0000, Vitus Jensen wrote:
>> Am Tue, 24 Feb 2009 19:25:07 -0700 schrieb Tom Rini:
>> 
>> > On Tue, Feb 24, 2009 at 11:01:05PM -0300, Otavio Salvador wrote:
>> > [snip]
>> >> I do belive that the best way to solve it is to have a md5 file
>> >> together with the .bb recipe. This solves the problems for forks,
>> >> derivatives and also makes harder to just use "cat tmp/checksums.ini
>> >> >> conf/checksums.ini".
>> > 
>> > Running a script that will make the .sum file isn't any harder
>> > really. And it's still a "this is the checksum we downloaded" not
>> > "this is the checksum upstream says is correct".
>> ...
>> 
>> But "this is the checksum we downloaded" says that's it's the same
>> version the author of the .bb receipe downloaded, reviewed and tested
>> on his device.  What is the probability that this author downloaded a
>> corrupt but working archive last november and you get the same corrupt
>> archive now?
> 
> See hrw's post earlier where he points out how many checksums are a
> simple fetch and add? :)

Very simple ... but getting the commit of MODIFIED checksum.ini entries 
through unrecognized is much harder.  I have seen discussions about such 
patches here.


>> If you want better security you have to ask the download source for a
>> GPG signature of his files or the like as MD5 isn't really safe.
> 
> This is one of my points.  People think we have security from our
> current checksum list, but we do not.

But even a really safe signature is just an entry in some central or 
distributed checksum.ini, so commiting a different entry would be as easy 
as it is now.

If this leads you to abandon checksums alltogether: the current situation 
protects against corrupt downloads and otherwise undetected updates from 
upstream and I'm all for keeping such a protection.

Bye,
  Vitus

-- 
Vitus Jensen, Hannover, Germany, Earth, Milky Way, Universe (current)



