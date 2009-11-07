Received: from [80.91.229.12] (helo=lo.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1N6qJa-0002Ud-PP for openembedded-devel@lists.openembedded.org;
	Sat, 07 Nov 2009 19:47:13 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1N6qIP-0007oN-6B
	for openembedded-devel@lists.openembedded.org;
	Sat, 07 Nov 2009 19:45:57 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 Nov 2009 19:45:57 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 Nov 2009 19:45:57 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sat, 07 Nov 2009 19:45:34 +0100
Message-ID: <hd4f8e$gik$1@ger.gmane.org>
References: <ac9c93b10911060006x1a60e677ic6f2c192eedc176d@mail.gmail.com>	<217663.38369.qm@web112503.mail.gq1.yahoo.com>	<ac9c93b10911060237i44b0d886qccfb0d64f94ae6ec@mail.gmail.com>	<ac9c93b10911060633h7240008eqd035499cf052af1e@mail.gmail.com>	<hd40rf$sb7$1@ger.gmane.org>
	<ac9c93b10911071001l1e556324q467845ef4771e864@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.3pre) Gecko/20090811 Shredder/3.0b4pre
In-Reply-To: <ac9c93b10911071001l1e556324q467845ef4771e864@mail.gmail.com>
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: mysql 5
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
X-List-Received-Date: Sat, 07 Nov 2009 18:47:13 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07-11-09 19:01, Frans Meulenbroeks wrote:
> 2009/11/7 Koen Kooi<k.kooi@student.utwente.nl>:
>> On 06-11-09 15:33, Frans Meulenbroeks wrote:
>>>
>>> one more thing
>>> when installing mysql5 client or server packages they insist on
>>> installing libmysqlclient-dev
>>> No idea why this should be the -dev package. Content seems as expected.
>>> Solutions are welcome !
>>
>> Probably a .so file that isn't a symlink to so.4.5.5.64.4
>>
>> regards,
>>
>> Koen
>
> Guess so, no idea how this symlinking exactly works and how it is
> split over the normal and the -dev package.

you can inspect the install/ dir and then the .shlibs files in staging, 
that should tell you in what package an .so file is hiding that isn't a 
symlink.



