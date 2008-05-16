Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Jx4tt-0003kg-MY
	for openembedded-devel@openembedded.org; Fri, 16 May 2008 20:43:29 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1Jx4s2-0004CY-S9
	for openembedded-devel@openembedded.org; Fri, 16 May 2008 18:41:34 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Fri, 16 May 2008 18:41:34 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Fri, 16 May 2008 18:41:34 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 16 May 2008 20:41:26 +0200
Message-ID: <g0kkgn$kc8$1@ger.gmane.org>
References: <g0ke5t$s9n$1@ger.gmane.org> <482DC846.1040301@bolloretelecom.eu>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Thunderbird 3.0a1pre (Macintosh/2008050803)
In-Reply-To: <482DC846.1040301@bolloretelecom.eu>
Sender: news <news@ger.gmane.org>
Subject: Re: disapproval or revision 462968658bdc2a3c48a8d634f9be59d450259f49
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10b4
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
X-List-Received-Date: Fri, 16 May 2008 18:43:29 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Jeremy Lainé wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Hi Koen,
>
> I guess our messages missed each other..
>
> Koen Kooi wrote:
>> Some days ago I fixed openssl-native so it doesn't put target flags
>>   into the host build anymore:
>>
>> openssl-native: stop leaking target compile flags
>> (FULL_OPTIMIZATION) into native build, it kills kittens.
>>
>> r462968658bdc2a3c48a8d634f9be59d450259f49 reverses that fix and
>> breaks my build. So it has been disapproved.
>>
> My commit did *not* reverse your fix, I kept your FULL_OPTIMIZATION =
> "", so these do not end up in the CFLAG variable.

Ah, while I was trying to get rid of FULL_OPTIMIZATION, it wasn't enough 
to set it to "", but it seems I probably had a broken bitbake cache, 
since now everything works as expected (including a correct 
FULL_OPTIMIZATION[1]!).

Sorry for the mess, I committed a new revision that removes the exports 
and makes 0.9.8m the default again, since it now builds (probably due to 
having correct CFLAG this time *cough*).

regards,

Koen

[1] I kept it empty just to be complete sure. It's not like we're going 
to do heavy crypto during builds.

> As explained in my
> other email, CFLAG mustn't be exported, it breaks things as it
> forcibly replace the compilation flags.
>
> - --
> Jeremy LAINE
> Bolloré telecom | 11bis, rue Scribe | F-75009 Paris
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.6 (GNU/Linux)
> Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org
>
> iD8DBQFILchGCL1n3lVB9EYRAmkrAJ0aEZgrcN0AXsgdMZqVBizwzoecjQCgxzlO
> x/cYM0HMpWrK1NVaRzSzuoE=
> =Jhkw
> -----END PGP SIGNATURE-----




