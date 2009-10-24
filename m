Received: from [80.91.229.12] (helo=lo.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1N1i4y-0000qu-MX for openembedded-devel@lists.openembedded.org;
	Sat, 24 Oct 2009 16:58:55 +0200
Received: from list by lo.gmane.org with local (Exim 4.50) id 1N1i3z-0002PP-3n
	for openembedded-devel@lists.openembedded.org;
	Sat, 24 Oct 2009 16:57:51 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Oct 2009 16:57:51 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Oct 2009 16:57:51 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sat, 24 Oct 2009 16:57:27 +0200
Message-ID: <hbv4kn$4ao$1@ger.gmane.org>
References: <hbuf0m$esa$1@ger.gmane.org> <1256390835.4307.0@zaurus>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.3pre) Gecko/20090811 Shredder/3.0b4pre
In-Reply-To: <1256390835.4307.0@zaurus>
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Revert "package bbclass: strip static libs as well"
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
X-List-Received-Date: Sat, 24 Oct 2009 14:58:55 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24-10-09 15:27, Stanislav Brabec wrote:

>> And these wouldn't need special handling:
>
> All of them probably would need. For example without libgcc.a you will
> not be able to compile.
>
>>   >  gcc-4.3.3-r7.1: /usr/lib/gcc/arm-angstrom-linux-gnueabi/4.3.3/
>> libgcc.a

Now please pay attention, since I'm saying this for the second time now:

"Actually it's /lib/*.a,/usr/lib/*.a -> static"

So /usr/lib/gcc/arm-angstrom-linux-gnueabi/4.3.3/libgcc.a won't go into 
-static since it doesn't match /lib/*.a,/usr/lib/*.a

regards,

Koen






