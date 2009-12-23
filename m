Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NNN4S-0002gx-60 for openembedded-devel@lists.openembedded.org;
	Wed, 23 Dec 2009 09:59:56 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1NNN2b-0000Iy-Iv
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Dec 2009 09:57:57 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Dec 2009 09:57:57 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Dec 2009 09:57:57 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 23 Dec 2009 09:57:34 +0100
Message-ID: <hgsm1u$2dd$1@ger.gmane.org>
References: <op.u5b0cczimn1qzu@guohr-laptop-ubuntu>	<4B30E03B.1040500@mwester.net>
	<20091222195157.GB2271@denix.org>
	<ac9c93b10912221425g4fee3ca0kdc0257be7eb677bc@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.5) Gecko/20091220 Shredder/3.0.1pre
In-Reply-To: <ac9c93b10912221425g4fee3ca0kdc0257be7eb677bc@mail.gmail.com>
X-Enigmail-Version: 1.0
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: why rootfs directory in temp is empty
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
X-List-Received-Date: Wed, 23 Dec 2009 08:59:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 22-12-09 23:25, Frans Meulenbroeks wrote:
> 2009/12/22 Denys Dmytriyenko <denis@denix.org>:
>> On Tue, Dec 22, 2009 at 09:05:31AM -0600, Mike Westerhof wrote:
>>> Guo Hongruan wrote:
>>>> Hi guys,
>>>>   Today, I build an base-image using OE. And I want to check the content
>>>> of rootfs, but I found the directory rootfs in building directory is
>>>> empty. I remember there was the ontent of the target root filesystem.
>>>> Why have to remove them? Does it means the rootfs directory is unuseful?
>>>>
>>>> Thanks a lot!
>>>>
>>>
>>> Add IMAGE_KEEPROOTFS = "1" to your local.conf file.
>>> I'm not sure why the change was made to clean it out every build, though.
>>
>> To prevent people from using it as an NFS share and having problems.
> 
> Ehm, can you please clarify why this would cause a problem?

The nfs server doesn't run inside the do_rootfs fakeroot sessions and
hence all the permission will be screwed up. If you can teach OE to
respawn the nfs server inside the fakeroot session, you might get away
with it :)

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLMdt+MkyGM64RGpERAjY1AJwPkbebEMCnt2oSjDTXxJLDMJibgQCeKiIR
y343rN9hGQCkMzn8Kx6csBQ=
=zSNI
-----END PGP SIGNATURE-----



