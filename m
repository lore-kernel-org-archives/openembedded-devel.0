Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LcLMR-0006nU-Pe
	for openembedded-devel@openembedded.org; Wed, 25 Feb 2009 16:07:47 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LcLJM-0000JG-Uz
	for openembedded-devel@openembedded.org; Wed, 25 Feb 2009 15:04:37 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 25 Feb 2009 15:04:36 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 25 Feb 2009 15:04:36 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 25 Feb 2009 16:04:27 +0100
Message-ID: <go3mlr$29l$1@ger.gmane.org>
References: <49A4EAFC.3080806@dls.net> <go2tlk$akt$2@ger.gmane.org>
	<1235550209.2621.28.camel@andromeda>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20090219 Shredder/3.0b3pre
In-Reply-To: <1235550209.2621.28.camel@andromeda>
Sender: news <news@ger.gmane.org>
Subject: Re: fakeroot fails to build
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
X-List-Received-Date: Wed, 25 Feb 2009 15:07:48 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25-02-09 09:23, Michael 'Mickey' Lauer wrote:
> Am Mittwoch, den 25.02.2009, 08:57 +0100 schrieb Koen Kooi:
>> On 25-02-09 07:53, Mike (mwester) wrote:
>>> fakeroot fails to build -- any idea how we can fix this?
>> By reverting the merge of the sane-defaults branch that got merged with
>> zero review
>
> Ah right, I probably didn't wait long enough.

I think we should get rid of the "silence is approval" dogma, especially 
since I needed to commit this today:

http://cgit.openembedded.net/cgit.cgi?url=openembedded/commit/&id=d6a0ddf22540c930f8ab9033870eb6509713e5b7

and

http://cgit.openembedded.net/cgit.cgi?url=openembedded/commit/&id=98238944c784e673cab4691a861f3d9fa61f85a4

Since both automake and fakeroot are pretty important, dare I say 
'core', a simple test would be nice before checking in changes. While 
the automake problem wouldn't have shown up in review, the missing 
fakeroot checksums would have.



