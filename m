Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SdUG0-0000cK-4e
	for openembedded-devel@lists.openembedded.org;
	Sun, 10 Jun 2012 00:35:44 +0200
Received: by pbbrq2 with SMTP id rq2so3749501pbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Jun 2012 15:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:x-enigmail-version:content-type
	:content-transfer-encoding;
	bh=69JOq5T1YpTevQ5jJPN8dFp4aHSnFmAeDm8+basNiuw=;
	b=f2rOCO+vEEv3AHAC0wOIOTibZ0n5K5mXiMF+tpL5/EjJpavRbmbnNMSIoqcWL7Jx8+
	oFcxR/tiT50xwlA8wiHPsgTbACZRbTMV88Z9We7Sh06r03NEDOybRXYCjBZ0yUQDOaqK
	1zd4UXX1hNUs+X5Okw9VVOHeK4TJa94nf/KQeFXzYBMT1MhH3be2u9VH+zy7/zlqe+ga
	MXVbldbfXqM8W/XdXIXURPyV8p8TBvpRL0spYQfTfPkjmFf7V8qlx5mlqPmB3XSSD5st
	d1GakzlFSqtjjaP5c1N+D6x2mrX+/xXQCmjXnH1gVdwaNIUVn2ntH5+rsU61CxYKjaws
	Kg9g==
Received: by 10.68.134.161 with SMTP id pl1mr10375497pbb.29.1339280712020;
	Sat, 09 Jun 2012 15:25:12 -0700 (PDT)
Received: from [192.168.1.71] (99-57-140-209.lightspeed.sntcca.sbcglobal.net.
	[99.57.140.209])
	by mx.google.com with ESMTPS id jp3sm12710778pbc.7.2012.06.09.15.25.10
	(version=SSLv3 cipher=OTHER); Sat, 09 Jun 2012 15:25:10 -0700 (PDT)
Message-ID: <4FD3CD4D.1090909@gmail.com>
Date: Sat, 09 Jun 2012 15:25:17 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:12.0) Gecko/20120428 Thunderbird/12.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4FCC5A7B.8040204@gmail.com>
	<CAMKF1spW20v28PG+Te=5nfiGR0upuRqTRTr7G3w3SZTeR1zi7w@mail.gmail.com>
	<4FCE2F51.3030003@gmail.com>
	<CAMKF1sqdnyayLoU0Fdhxgy07uUdHDiB3D6pF5gpZpjb8HFFx7w@mail.gmail.com>
	<4FCEF69C.1070907@gmail.com>
In-Reply-To: <4FCEF69C.1070907@gmail.com>
X-Enigmail-Version: 1.4.2
Subject: Re: gcc-crosssdk-initial can not compile. Get message: this target does not support --with-float
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
X-List-Received-Date: Sat, 09 Jun 2012 22:35:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 6/5/2012 11:20 PM, Martin Ertsås wrote:
> The configure log is at: http://pastebin.com/93h1rw7G while the
> compile log, which is what actually failes, is at: 
> http://pastebin.com/2iXYrCDa
> 

can you try this patch please

http://patchwork.openembedded.org/patch/29589/

and report if it fixes the problem.

- -Khem
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (MingW32)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAk/TzUwACgkQuwUzVZGdMxScmwCdH3cD2RwQGjgtZmn3V3oRVWcH
r0UAn0wptXuapT0nHtBVz3IbLSoi5R2A
=zhhD
-----END PGP SIGNATURE-----


