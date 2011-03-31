Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Q5L0U-0002tK-Vu
	for openembedded-devel@lists.openembedded.org;
	Thu, 31 Mar 2011 18:46:03 +0200
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1Q5KyY-0007jh-Ea from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Thu, 31 Mar 2011 09:44:02 -0700
Received: from SVR-ORW-FEM-05.mgc.mentorg.com ([147.34.97.43]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Thu, 31 Mar 2011 09:44:02 -0700
Received: from [172.30.80.77] (147.34.91.1) by svr-orw-fem-05 (147.34.97.43)
	with Microsoft SMTP Server id 14.1.270.1;
	Thu, 31 Mar 2011 09:44:01 -0700
Message-ID: <4D94AF48.1090500@mentor.com>
Date: Thu, 31 Mar 2011 09:43:52 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.14) Gecko/20110223 Lightning/1.0b2 Thunderbird/3.1.8
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <in21a8$jod$1@dough.gmane.org>
In-Reply-To: <in21a8$jod$1@dough.gmane.org>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 31 Mar 2011 16:44:02.0295 (UTC)
	FILETIME=[D72D3870:01CBEFC2]
Subject: Re: [2011.03-maintenance] Pull request #9
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
X-List-Received-Date: Thu, 31 Mar 2011 16:46:03 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 03/31/2011 06:58 AM, Koen Kooi wrote:
> Tom,
> 
> Please pull the 5 commits from here:
> 
> URI: git://dominion.thruhere.net/var/cache/git/openembedded.git
> Branch: 2011.03-maintenance
> 
> Philip Balister (3):
>       autoconf: Fix paths for scripts installed on the target.
>       automake: Fix paths in scripts installed on target.
>       qmake2: Define env var for strip. Convert to use INC_PR.
> 
> Tom Rini (2):
>       In a large number of patches, remove unneeded '..' in paths.
>       tcl: Rework mips-tclstrtod.patch
> 
> You can view the branch online at
> http://dominion.thruhere.net/git/cgit.cgi/openembedded/log/?h=2011.03-maintenance
> 
> The ones from Philip fix the native toolchain and you know what your
> patches do :)

Actually, I want to NAK my own patches here.  After pushing here (and
Mark Hatle pushing to oe-core) I ran into patchdir param which lets us
not have to do patches in do_configure (which is really kinda wrong).
Unfortunately I haven't had time yet to re-do my patches, but I'll try
and get to that today.

- -- 
Tom Rini
Mentor Graphics Corporation
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iQEcBAEBAgAGBQJNlK9HAAoJEI4NMjfc3nJxbNwIAIU4chdfSTA3xoVc0Zcv3//k
v0S4Y/Ton1r9p9UXF1buDVVRT1VrTTHBgMmeE9xC5SwI9I7Nu49NyCc+uKVeejF0
fFi5phtzlSGqnAU5BXk6rNoYCoKNjMhbxE5XykvXj/Wzz7qPeI6fESZJo2PSlywi
3NMXvM8eseTIMPSLwAqH1iUp8fDv/Fgii/COw4CWVxm0qX5GDUiYik/E2bmegdhH
RVAnbJXK6XSUdiZ7twwNWmUz/WSjFErmO0lmpZkOyjyUWC52GKxOdNwx9jzQneDD
WNGfdGTvaxyvO4ciQCRnC9+8woytAAlI0OUKR7a/F8I1iiG4yw6MVewA8M44EJs=
=01Dt
-----END PGP SIGNATURE-----


