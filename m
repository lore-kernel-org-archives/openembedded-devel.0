Received: from [64.233.162.228] (helo=nz-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <goxboxlive@gmail.com>) id 1HgxFW-0005ld-O8
	for openembedded-devel@lists.openembedded.org;
	Thu, 26 Apr 2007 08:14:39 +0200
Received: by nz-out-0506.google.com with SMTP id m22so545389nzf
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Apr 2007 23:05:50 -0700 (PDT)
Received: by 10.114.202.15 with SMTP id z15mr458862waf.1177567550587;
	Wed, 25 Apr 2007 23:05:50 -0700 (PDT)
Received: by 10.114.197.15 with HTTP; Wed, 25 Apr 2007 23:05:50 -0700 (PDT)
Message-ID: <7221c7d80704252305g1d230f99kc69121820ff6535d@mail.gmail.com>
Date: Thu, 26 Apr 2007 08:05:50 +0200
From: "GoXbox Live" <goxboxlive@gmail.com>
To: "Using the OpenEmbedded metadata to build Distributions"
	<openembedded-devel@lists.openembedded.org>
In-Reply-To: <462FBE16.9070805@dominion.kabel.utwente.nl>
MIME-Version: 1.0
References: <E1HgoSJ-0008AG-St@linuxtogo.org>
	<462FBE16.9070805@dominion.kabel.utwente.nl>
X-Content-Filtered-By: Mailman/MimeDel 2.1.9
Subject: Re: [oe-commits] org.oe.dev xtscal: attempt to fix miscalibrations
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 26 Apr 2007 06:14:39 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

I can confirm that this is working with HTC Universal, we have now
calibration in landscape mode like it's supposed to be on our device.

But, i would also like to said that of course this will affect other
devices. This patch hasent been working, because the line that checks out
wich device you are running wasent working.
So to fix this is not to revert the patch, to fix this you have to remove
the devices who is supposed to do their calibration in portrait mode from
line wich calls for calibration in 270 degree. AFAIK default is 90 degree so
there should be no reason to have them in the 90 degree line either.

goxboxlive.


2007/4/25, Koen Kooi <koen@dominion.kabel.utwente.nl>:
>
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> koen commit schreef:
> > xtscal: attempt to fix miscalibrations
>
> Could people with one of:
> "HP IPAQ H3600" | "HP IPAQ H3700" | "HP IPAQ H3900" | "HTC Universal" |
> *COLLIE | *POODLE
> | *SPITZ | *AKITA | *BORZOI
>
> check if calibration isn't 90 degrees of anymore?
>
> If not, we most likely need to revert revision
> d18552e5056a026d8ed8959e135b2fa05c3e1b6b
>
> thanks,
>
> Koen
>
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFGL74WMkyGM64RGpERArL6AJ9650uuYRwFPYEiX6uhAxCkzjKGDwCgtrp1
> xYkYIvAbAd0zasrxpkCcbvs=
> =u97/
> -----END PGP SIGNATURE-----
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

