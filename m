Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NVhWg-0004xA-67 for openembedded-devel@lists.openembedded.org;
	Fri, 15 Jan 2010 09:27:29 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1NVhUN-0008W0-Er
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Jan 2010 09:25:03 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Jan 2010 09:25:03 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Jan 2010 09:25:03 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 15 Jan 2010 09:23:50 +0100
Message-ID: <hip8ml$2mq$2@ger.gmane.org>
References: <>
	<20100114195301.GA3529@gmail.com>	<op.u6jv0uycmn1qzu@guohr-laptop-ubuntu>
	<201001150733.59792.marcin@juszkiewicz.com.pl>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.7) Gecko/20100112 Shredder/3.0.2pre
In-Reply-To: <201001150733.59792.marcin@juszkiewicz.com.pl>
X-Enigmail-Version: 1.0
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] Support building all project in one directory
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
X-List-Received-Date: Fri, 15 Jan 2010 08:27:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 15-01-10 07:33, Marcin Juszkiewicz wrote:
> Dnia piątek, 15 stycznia 2010 o 02:35:13 Guo Hongruan napisał(a):
>> 在 Fri, 15 Jan 2010 03:53:01 +0800，Khem Raj <raj.khem@gmail.com> 写道:
>>> On (14/01/10 17:19), Guo Hongruan wrote:
>>>> After changing this way, the native tools can be shared with
>>>> different buildings.
>>>
>>> They get shared even now. I have my TMPDIR = /scratch/oe/build and
>>> DEPLOY_DIR = ${TMPDIR}/deploy/${LIBC}
>>>
>>> I share the native tools all the time
>  
>> This way, the packages built in ${TMPDIR}/work/ will bother each other. It
>> is obvious that a binary package built based on uclibc is different with
>> the same one built base on glibc. So I think it's better to classify them
>> using ${LIBC}.
> 
> As long as you do build for uclibc and glibc/eglibc in one TMPDIR they are 
> fine due to different TARGET_SYS. Problem starts when you want to share glibc 
> and eglibc builds as they use same TARGET_SYS. And thats when you need 
> something to separate TMPDIR. But as I wrote before you can alter name of 
> directories in your local.conf without changing them for rest of our users.

Or you can just use angstrom, which has all that magic already :)

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLUCYWMkyGM64RGpERAlzFAKCMEP4Gvm64Jr6LU28MamhAmdlULACcCKrK
xja2GfGxhQs2avrMe/3CZIw=
=vIXP
-----END PGP SIGNATURE-----



