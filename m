Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RtTiZ-0006p5-Dd for openembedded-devel@lists.openembedded.org;
	Sat, 04 Feb 2012 01:43:03 +0100
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RtTao-00086g-W9 for openembedded-devel@lists.openembedded.org;
	Sat, 04 Feb 2012 01:35:03 +0100
Received: from 28.254-240-81.adsl-static.isp.belgacom.be ([81.240.254.28])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sat, 04 Feb 2012 01:35:02 +0100
Received: from koen by 28.254-240-81.adsl-static.isp.belgacom.be with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 04 Feb 2012 01:35:02 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Sat, 04 Feb 2012 01:31:59 +0100
Message-ID: <jghu9u$dqo$2@dough.gmane.org>
References: <20120201080441.DA76610333@opal>
	<20120203131451.GJ3893@jama.jama.net>
	<CAP9ODKqdXtrAqUY=1XHE4QDpRPyNbOV5ZswKihCWbSWU9+L05w@mail.gmail.com>
	<20120203154742.GM3893@jama.jama.net>
	<CAP9ODKoaqi96Bzktk=TC0dXmz6YV1v-1vAAgaqc+qE02Rpd81Q@mail.gmail.com>
	<CAAQYJAvfYLRcYw7fKVogjkwuST-b4oYMCH4_VZG6P8Xy5QgjgQ@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: 28.254-240-81.adsl-static.isp.belgacom.be
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:9.0) Gecko/20111222 Thunderbird/9.0.1
In-Reply-To: <CAAQYJAvfYLRcYw7fKVogjkwuST-b4oYMCH4_VZG6P8Xy5QgjgQ@mail.gmail.com>
X-Enigmail-Version: 1.3.5
Subject: Re: [oe-commits] Otavio Salvador : systemd.bbclass: depends on systemd
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
X-List-Received-Date: Sat, 04 Feb 2012 00:43:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 04-02-12 01:15, Andrea Adami schreef:
> On Fri, Feb 3, 2012 at 5:58 PM, Otavio Salvador <otavio@ossystems.com.br>
> wrote:
>> On Fri, Feb 3, 2012 at 13:47, Martin Jansa <martin.jansa@gmail.com>
>> wrote:
>> 
>>>> I understand your use case but it seems in this case you ought to
>>> override
>>>> it in a bbappend. It doesn't seems right as this is the exception,
>>>> not
>>> the
>>>> rule. If we don't depends on it, we can end with the binaries being
>>>> not available in case a rootfs generation.
>>> 
>>> Which recipes really depend on systemd during build? I know about 
>>> polkit, something else?
>> 
>> 
>> At this moment I know about polkit, I didn't check newer udev but I
>> think it ought to depends on it as well.
>> 
>> -- Otavio Salvador                             O.S. Systems E-mail:
>> otavio@ossystems.com.br  http://www.ossystems.com.br Mobile: +55 53
>> 9981-7854              http://projetos.ossystems.com.br 
>> _______________________________________________ Openembedded-devel
>> mailing list Openembedded-devel@lists.openembedded.org 
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> 
> Unfortunately the patch has a bad side-effect:
> 
> http://paste.debian.net/154741/
> 
> (I removed /systemd to show the culprit)
> 
> Sadly enough freedesktop git is down, so I've been obliged to revert that
> patch.

only cgit, not the actual git server
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iEYEARECAAYFAk8sfH8ACgkQMkyGM64RGpFOKACgk2/B+ac8q6HOs2ctoJff3KrN
D7cAn2w+6lseVIR15bhtOywS9gUvdUFd
=2BCI
-----END PGP SIGNATURE-----



