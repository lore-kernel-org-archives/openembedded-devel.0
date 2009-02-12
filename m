Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LXb40-0006Eh-70
	for openembedded-devel@openembedded.org; Thu, 12 Feb 2009 13:53:08 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LXb2i-0007pn-Fl
	for openembedded-devel@openembedded.org; Thu, 12 Feb 2009 12:51:48 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 12 Feb 2009 12:51:48 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Thu, 12 Feb 2009 12:51:48 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 12 Feb 2009 13:51:34 +0100
Message-ID: <gn160m$8s4$1@ger.gmane.org>
References: <200902121426.26727.roman@khimov.ru> <gn12ij$ssf$1@ger.gmane.org>
	<200902121541.09495.roman@khimov.ru>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20090209 Shredder/3.0b2pre
In-Reply-To: <200902121541.09495.roman@khimov.ru>
Sender: news <news@ger.gmane.org>
Subject: Re: [PATCH] Fix rpm2cio sums
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
X-List-Received-Date: Thu, 12 Feb 2009 12:53:08 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12-02-09 13:41, Roman I Khimov wrote:
> Koen Kooi:
>> On 12-02-09 12:26, Roman I Khimov wrote:
>>> Don't know why, but rpm2cpio tarball checksums are wrong, so here is
>>> the fix:
>> If they are wrong we want to see the diff between the old and new
>> tarballs, replacing checksums as soon as upstream changes defeats the
>> purpose of us adding them.
>
> If I've had old one anywhere around, I'd show the diff, but the problem is I
> don't have it.
>
>  From what I see most probably it's some meta-data changes as we have
> ready-to-install FreeBSD tarball there with all
> its "+COMMENT", "+CONTENTS", "+DESC", "+MTREE_DIRS" files. So
> the 'rpm2cpio.pl' itself should be the same.
>
> Now another question is why OE package uses such tarball as source at all.
> So, probably we can change the source to something like
>
> http://www.freebsd.org/cgi/cvsweb.cgi/%7Echeckout%7E/ports/archivers/rpm2cpio/files/rpm2cpio?rev=1.2;content-type=text%2Fplain;only_with_tag=RELEASE_7_1_0
>
> which is the only file we need and it's rev'd tagged should-be-non-volatile.

Seeing the current sitation with the freebsd people this would get my vote.

regards,

Koen



