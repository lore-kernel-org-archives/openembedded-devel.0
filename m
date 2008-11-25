Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1L54kr-0001eW-Il
	for openembedded-devel@openembedded.org; Tue, 25 Nov 2008 21:43:29 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1L54hx-000792-FZ
	for openembedded-devel@openembedded.org; Tue, 25 Nov 2008 20:40:29 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 25 Nov 2008 20:40:29 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 25 Nov 2008 20:40:29 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 25 Nov 2008 21:40:21 +0100
Message-ID: <gghnrl$1il$1@ger.gmane.org>
References: <gghjh1$dg1$1@ger.gmane.org>
	<1227642854.5377.17.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b2pre) Gecko/20081116 Shredder/3.0b1pre
In-Reply-To: <1227642854.5377.17.camel@dax.rpnet.com>
Sender: news <news@ger.gmane.org>
Subject: Re: [RFC] LICENSE fields and packages
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
X-List-Received-Date: Tue, 25 Nov 2008 20:43:30 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25-11-08 20:54, Richard Purdie wrote:
> Hi,
>
> On Tue, 2008-11-25 at 20:26 +0100, Koen Kooi wrote:
>> Jason Kridner pointed out that we don't actually put the license in the
>> resulting packages, making it hard for finding the license if you only
>> have a bunch or packages.
>>
>> http://cgit.openembedded.net/cgit.cgi?url=openembedded/commit/&id=e35d1ffad1553f259b084578992f15d10f590f98
>>
>> Now the RFC part:
>>
>> Allow URLs in the LICENSE field for lesser know licenses and/or
>> click-through licenses.
>>
>> Related to that: a class that would take a text file and generate a
>> preinsts that shows the textfile and prompts to accept it (or not) would
>> be awesome as well.
>>
>> Back to the point: what do you think of allowing URLs in the LICENSE field?
>
> I don't like the idea of urls in the field itself. I would however love
> to see a class file with a list of valid field entries and corresponding
> urls to the appropriate licence along with other information like
> distributability. In due course I'd like to see that being mandatory for
> new .bb files.

We can start by having insane.bbclass disallowing "Unknown" as license, 
which seems to be the default license in OE.

regards,

Koen



