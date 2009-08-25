Received: from [80.91.229.12] (helo=lo.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Mfvq6-0002mV-4D for openembedded-devel@lists.openembedded.org;
	Tue, 25 Aug 2009 15:13:34 +0200
Received: from list by lo.gmane.org with local (Exim 4.50) id 1MfvYp-00051o-GL
	for openembedded-devel@lists.openembedded.org;
	Tue, 25 Aug 2009 14:55:39 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Aug 2009 14:55:39 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Aug 2009 14:55:39 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 25 Aug 2009 14:55:13 +0200
Message-ID: <h70mvh$899$1@ger.gmane.org>
References: <91283b620908220300u6770aaebo7aa89b1b1b91e2fd@mail.gmail.com>	<91283b620908240250i3e35959bn26a29d99047b455d@mail.gmail.com>	<91283b620908240259s66c46b9bm3302978c59f7b3cd@mail.gmail.com>
	<200908251307.58166.holger+oe@freyther.de>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1.3pre) Gecko/20090811 Shredder/3.0b4pre
In-Reply-To: <200908251307.58166.holger+oe@freyther.de>
Sender: news <news@ger.gmane.org>
Subject: Re: Musicbrainz
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
X-List-Received-Date: Tue, 25 Aug 2009 13:14:28 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25-08-09 13:07, Holger Hans Peter Freyther wrote:
> On Monday 24 August 2009 11:59:31 Stuart Gray wrote:
>> I've fixed it.
>>
>> I added oe_soinstall and pulled the so file in for compilation.
>
> Yes, and it is a messy fix. I have pushed musicbrainz_3.0.2 to OE and use
> another -rpath-link to point it to the libstdc++.
>
>
> One more detail... gcc 4.3/binutils are "leaking" c++ symbols and when
> building the C application, gcc is used for the linking and it is not able to
> find the c++ library. I'm manually pointing gcc to the path of this library
> now.

Use AC_PROG_CXX or set LD to g++, that usually fixes it.

regards,

Koen



