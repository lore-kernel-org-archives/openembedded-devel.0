Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1ShvvE-0002Gp-DP
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Jun 2012 06:56:40 +0200
Received: by pbbrq2 with SMTP id rq2so2947631pbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jun 2012 21:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:x-enigmail-version:content-type
	:content-transfer-encoding;
	bh=EfwZ+KNlmfZoR0570FdpihsyAOQyUH99kkry0FxdZDY=;
	b=WbgyuIXiNBH2FAiIqr94ciJmMQlgU2N6PNNHHf4E8PRdKMBIkfdZklBVC6qOIFMhAN
	JujKZoddcjUjhwg2kCECfDZOw5lYIY0tLy21yELOQ3NdnvfP6Czq+pWcs7FUE02yW6q3
	1bMkyK5FaLHdAqVkPxmvsAvwfp7CvE42KSuYHmWhgWmkHFzmlWd5Vow0BU6LdmisCqCd
	jTy758RNzwPFLXkv/TDon9nZOAGPMFkNfou0P9LYiNjtJ9cIJWvHoSGl54vxDZGZFEQw
	TE4qkbkI3J5lCwayTShCp8RnOcI438rBlaoDP2x6mjzcXfKEtkvtuzeGRkx0MDACH7v1
	NJCg==
Received: by 10.68.213.234 with SMTP id nv10mr6131693pbc.56.1340340353020;
	Thu, 21 Jun 2012 21:45:53 -0700 (PDT)
Received: from [192.168.1.71] (99-57-140-209.lightspeed.sntcca.sbcglobal.net.
	[99.57.140.209])
	by mx.google.com with ESMTPS id qm6sm37771766pbc.10.2012.06.21.21.45.51
	(version=SSLv3 cipher=OTHER); Thu, 21 Jun 2012 21:45:52 -0700 (PDT)
Message-ID: <4FE3F884.1070403@gmail.com>
Date: Thu, 21 Jun 2012 21:45:56 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:13.0) Gecko/20120614 Thunderbird/13.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1340338450-23907-1-git-send-email-elvis.dowson@gmail.com>
	<4FE3F482.50506@gmail.com>
	<CC9E678D-B16D-472D-9896-2DDA3E23CB19@gmail.com>
In-Reply-To: <CC9E678D-B16D-472D-9896-2DDA3E23CB19@gmail.com>
X-Enigmail-Version: 1.4.2
Subject: Re: [meta-openembedded] python_numpy: Fix SRC_URI warnings.
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
X-List-Received-Date: Fri, 22 Jun 2012 04:56:40 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 6/21/2012 9:39 PM, Elvis Dowson wrote:
> No, I did not. The location of the files had move to architecture
> specific folders, but the main recipe had not been updated to
> reflect this, so I just corrected the recipe.

OK you can just do

MACHINE=qemuarm bitbake -e python-numpy | grep -i "^SRC_URI="

and see what it shows.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (MingW32)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAk/j+IQACgkQuwUzVZGdMxTyiQCglNWEIfS2EC7Sm0R60GsT0m4I
pOsAn1olV/oDwSSqVYxpy3hoaFP1YJgo
=9qri
-----END PGP SIGNATURE-----


