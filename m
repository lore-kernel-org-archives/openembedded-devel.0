Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LZD2F-0003XY-Bt
	for openembedded-devel@openembedded.org; Tue, 17 Feb 2009 00:37:59 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LZD0L-0007Gu-N9
	for openembedded-devel@openembedded.org; Mon, 16 Feb 2009 23:36:01 +0000
Received: from p5483a559.dip0.t-ipconnect.de ([84.131.165.89])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Mon, 16 Feb 2009 23:36:01 +0000
Received: from vjensen by p5483a559.dip0.t-ipconnect.de with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Mon, 16 Feb 2009 23:36:01 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Vitus Jensen <vjensen@gmx.de>
Date: Mon, 16 Feb 2009 23:35:48 +0000 (UTC)
Message-ID: <gnct8k$i0f$2@ger.gmane.org>
References: <34765.AFRWCldXDSo=.1234790540.squirrel@webmail.no-log.org>
	<200902161659.09894.khimov@altell.ru>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: p5483a559.dip0.t-ipconnect.de
User-Agent: Pan/0.133 (House of Butterflies)
Sender: news <news@ger.gmane.org>
Subject: Re: bzip2-full-native_1.0.5.bb problem and possible fix
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
X-List-Received-Date: Mon, 16 Feb 2009 23:37:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Am Mon, 16 Feb 2009 16:59:09 +0300 schrieb Roman I Khimov:

> GNUtoo:
>> I've:
>> >| cp: will not overwrite just-created
>>
>> `/home/embedded/oetmp_openmoko/work/i686-linux/bzip2-full-native-1.0.5-
r0
>>/bzip2-1.0.5/install-sh' with
>> `/home/embedded/oetmp_openmoko/staging/i686-linux/usr/share/
automake-1.9/
>>install-sh'
> 
> Most probably you've worked with automake 1.9, then switched to automake
> 1.10 (or reverse way) and got two automakes in staging directory, then
> this:
> 
>> cp ${STAGING_DATADIR_NATIVE}/automake*/install-sh ${S}/
> 
> which should expand as (for example)
> 
> cp ${STAGING_DATADIR_NATIVE}/automake-1.10/install-sh ${S}/
> 
> expands as
> 
> cp ${STAGING_DATADIR_NATIVE}/automake-1.10/install-sh \
> 	${STAGING_DATADIR_NATIVE}/automake-1.9/install-sh ${S}/
> 
> Boom.
> 
> Had this on automake switch too, not sure how to fix it better, but it's
> not a problem when you only use one automake (and you can clean up stale
> version manually if you switched from one version to another).

http://bugs.openembedded.net/show_bug.cgi?id=4911

It's the issue described there, right?  I had this problem once but it 
mysteriously went away.  Probably after wiping TMPDIR but "bitbake bzip2 -
c clean" would have been enough?

Vitus

-- 
Vitus Jensen, Hannover, Germany, Earth, Milky Way, Universe (current)



