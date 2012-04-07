Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SGMsV-0007Zz-0S
	for openembedded-devel@lists.openembedded.org;
	Sat, 07 Apr 2012 06:03:55 +0200
Received: by pbcum15 with SMTP id um15so2610377pbc.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Apr 2012 20:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:x-enigmail-version:content-type
	:content-transfer-encoding;
	bh=B6JEfCIeMM/XHTfbzOC+lekJL3c6dYfgJy7cf3iCTm8=;
	b=mOvG849o6XhwA/l72wnPuuRjPl0d8S/aFa59HGj7ZGMsVGfeh51lVbb5qnA5LKnPgX
	0gw/0p59PJ63Mniv2xJdBteRju7M1yH37czwj9W1KphdIAmeS1oDM/+HThqi8LcSSgkX
	m9MP7jw9O7rRmbmoPDRl3X1Jq3wHdFHncnvy9qklmDHtOtmPSiHEI82LwhetZzkSyPzM
	hVoaaoIJf/LWjCLZrmuoL4lK+Hp2HAoZPQEIymYf5SnHIza4Y8rHQOyd5uOkpB5RJXyG
	p12SuJkczSM9IKf6ZCgPzG98jT82GFywVsrTbTq/wIQJWq5Xt729M0NLXuH3Uzccvv2z
	LYKQ==
Received: by 10.68.74.197 with SMTP id w5mr420534pbv.129.1333770880680;
	Fri, 06 Apr 2012 20:54:40 -0700 (PDT)
Received: from [192.168.1.79] (99-57-140-209.lightspeed.sntcca.sbcglobal.net.
	[99.57.140.209])
	by mx.google.com with ESMTPS id y5sm8045936pbk.5.2012.04.06.20.54.38
	(version=SSLv3 cipher=OTHER); Fri, 06 Apr 2012 20:54:39 -0700 (PDT)
Message-ID: <4F7FBA7D.7060400@gmail.com>
Date: Fri, 06 Apr 2012 20:54:37 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:11.0) Gecko/20120402 Thunderbird/11.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4F66789C.7010503@gmail.com>
In-Reply-To: <4F66789C.7010503@gmail.com>
X-Enigmail-Version: 1.4
Subject: Re: having issues with libprelude and libpam
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
X-List-Received-Date: Sat, 07 Apr 2012 04:03:55 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 03/18/2012 05:06 PM, j wrote:
> I am trying to get libpam to build which fails due to not finding
> the header from the libprelude build, which currently also fails to
> build for me. I am hoping someone knows of a fix or can point me to
> the right place to dig for a solution, I do not see any listed
> fixes or workarounds from my digging online. I have attached the
> build logs for each as well, since they were long if the preferred
> method is different, sorry and please let me know how to post
> those. In the libprelude error its saying there are files that seem
> to have moved, but they actually exsist in the location it says it
> does not.
> 
> I am running on Ubuntu 11.04 32bit (up to date). Bitbake branch
> 1.12, OE branch overo-2011.03 (both up to date). I know this is not
> your guys branch but have not gotten any feed back on gumstix in
> relation to issues building these packages, so checked them verse
> what I believe was the master branch and they had no diff. If I can
> give more info on system specs or anything like that please let me
> know. I believe I know the "issues" just not sure how to go about
> solving them, as libprelude seems like a more serious error. These
> are the only two packages that fail to build for image that do not
> rely on these lib's. I also have both of these installed on the
> build machine itself, I also built everything each rely on for the
> build, at least I believe I did none failed.
> 
> Thanks a ton for any help or info.

problem seems to be that libprelude has restrict mentioned in some
function signature for a variable definition so you have to patch
it up and rename them just adding _ before them should be ok
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAk9/unwACgkQuwUzVZGdMxTDdwCeJTrj74/2nWyvERCeBI9X1Oc4
S0cAniaPMfiH+CO2YQPpC45AEnKQKtiO
=+TDj
-----END PGP SIGNATURE-----


