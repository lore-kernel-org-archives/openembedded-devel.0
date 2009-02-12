Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LXaoW-0005rQ-TX
	for openembedded-devel@openembedded.org; Thu, 12 Feb 2009 13:37:08 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LXanE-0007AV-VB
	for openembedded-devel@openembedded.org; Thu, 12 Feb 2009 12:35:48 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 12 Feb 2009 12:35:48 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Thu, 12 Feb 2009 12:35:48 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 12 Feb 2009 13:35:37 +0100
Message-ID: <gn152q$5pk$1@ger.gmane.org>
References: <200902121426.26727.roman@khimov.ru> <gn12ij$ssf$1@ger.gmane.org>
	<4994132E.2040603@balister.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20090209 Shredder/3.0b2pre
In-Reply-To: <4994132E.2040603@balister.org>
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
X-List-Received-Date: Thu, 12 Feb 2009 12:37:09 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12-02-09 13:16, Philip Balister wrote:
> Koen Kooi wrote:
>> On 12-02-09 12:26, Roman I Khimov wrote:
>>> Hello all.
>>>
>>> Don't know why, but rpm2cpio tarball checksums are wrong, so here is
>>> the fix:
>>
>> If they are wrong we want to see the diff between the old and new
>> tarballs, replacing checksums as soon as upstream changes defeats the
>> purpose of us adding them.
>
> How can we find a copy of the tarball with the original checksum? I do
> not have it in my local source cache. The file date on the ftp server is
> March 1 2008. I'm surprised the FreeBSD crowd would change a tarball,
> without changing the version.

It gets worse:

koen@dominion:/OE/build$ md5sum /OE/downloads/*rpm*tbz ; sha256sum 
/OE/downloads/*rpm*tbz
cb0cabdac81b7171843427f32427ca84  rpm2cpio-1.2_2.tbz
20f48aa3c1f950c224e844d3a7d28a679f41173a26a2d7095ef1da27bda42c2f 
rpm2cpio-1.2_2.tbz

angstrom@serenity:~/website/unstable/sources$ md5sum *rpm* ; sha256sum *rpm*
76f8b7060500191c7cde078f831c7f0c  rpm2cpio-1.2_2.tbz
aac7daba6d805d87e62636f0af53ce4b532cacf00a29485d94b3a605f2ffdf6c 
rpm2cpio-1.2_2.tbz


git annotate:

0da69511    (Marcin Juszkiewicz 2007-10-24 13:09:31 +0000 
18933)[ftp://ftp.freebsd.org/pub/FreeBSD//ports/packages/archivers/rpm2cpio-1.2_2.tbz]
a7d0813d    (Otavio Salvador    2008-11-18 12:21:08 -0200 
18934)md5=63f39118ea5ef7cda84a0638002ed6d2
a7d0813d    (Otavio Salvador    2008-11-18 12:21:08 -0200 
18935)sha256=27ffe0392ae193eb04786a2159c099a00fe38ccdaebcebd72afc842c528bb6d3

The first commit is:

commit 0da695117f8a142e6d15601d8d7064ed5c35074a
Author: Marcin Juszkiewicz <hrw@openembedded.org>
Date:   Wed Oct 24 13:09:31 2007 +0000

     checksums.ini: sync with Poky
     r2954 | hrw | 2007-10-24 14:29:57 +0200 (<C5><9A>r, 24 X 2007) | 1 line
     checksums.ini: added some new entries from OpenMoko build
 
------------------------------------------------------------------------
     r2953 | hrw | 2007-10-24 14:28:03 +0200 (<C5><9A>r, 24 X 2007) | 1 line
     checksums.ini: sort by archive name (script for it will be pushed 
into OE later)
 
------------------------------------------------------------------------
     r2952 | hrw | 2007-10-24 13:39:13 +0200 (<C5><9A>r, 24 X 2007) | 1 line
     checksums.ini: sort alphabetically to make updates easier

This is a red herring, see the diff:

-[ftp://ftp.freebsd.org/pub/FreeBSD//ports/packages/archivers/rpm2cpio-1.2_2.tbz]
-md5=d4950dc6918ca79a4abab306b6188512
-sha256=5ec970d34b4e22feea0333dae3b5f5ee0e38295d89e306b4929b910f4a2aae25

+[ftp://ftp.freebsd.org/pub/FreeBSD//ports/packages/archivers/rpm2cpio-1.2_2.tbz]
+md5=d4950dc6918ca79a4abab306b6188512
+sha256=5ec970d34b4e22feea0333dae3b5f5ee0e38295d89e306b4929b910f4a2aae25


The second one:

commit a7d0813dd5c391183b1356c49bf082a647123985
Author: Otavio Salvador <otavio@ossystems.com.br>
Date:   Tue Nov 18 12:21:08 2008 -0200

     checksums.ini: fix rpm2cpio checksums

-md5=d4950dc6918ca79a4abab306b6188512
-sha256=5ec970d34b4e22feea0333dae3b5f5ee0e38295d89e306b4929b910f4a2aae25
+md5=63f39118ea5ef7cda84a0638002ed6d2
+sha256=27ffe0392ae193eb04786a2159c099a00fe38ccd

So it seems that freebsd people are replacing their files or that their 
server suffers massive disk corruption.

regards,

Koen




