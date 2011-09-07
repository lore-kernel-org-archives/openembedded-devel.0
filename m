Received: from mail-qy0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mikhailboiko85@gmail.com>) id 1R1O7R-0006vi-Fg
	for openembedded-devel@lists.openembedded.org;
	Wed, 07 Sep 2011 21:49:11 +0200
Received: by qyk4 with SMTP id 4so1710895qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Sep 2011 12:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=38y5h1bnZj/IYpv94/70fK9Ef2hE1jpiw/oKjitudKA=;
	b=jrIrQqb64OTxc8gmDFLQvUq3kHvF6YocPoTTQUZADWoJi0umEktQ7MCDNnSyQRnAlD
	hAuK5taGLRhdefhmZTdMmiUrbTkeP1fTuP6bZdwGR1BHuymCd023DvVHMZlzsduL7hD5
	2/JsBpi56j+jeZoghhquwRYsBzf75CWHrrrH8=
MIME-Version: 1.0
Received: by 10.229.248.139 with SMTP id mg11mr3508022qcb.13.1315424646332;
	Wed, 07 Sep 2011 12:44:06 -0700 (PDT)
Received: by 10.229.11.67 with HTTP; Wed, 7 Sep 2011 12:44:06 -0700 (PDT)
Date: Wed, 7 Sep 2011 22:44:06 +0300
Message-ID: <CAOWBBJyQ=b+zkOgFmn8GaWVVBKyXHcGS3h_ZqXSsG-WYjkgsgA@mail.gmail.com>
From: Mikhail Boiko <mikhailboiko85@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Some issues with compiling xbmc
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
X-List-Received-Date: Wed, 07 Sep 2011 19:49:11 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi

Had some issues with compiling xbmc for "babbage" machine and I managed to
solve them, but in a very, very strange way.
When compiling xbmc, i had error because build system was trying to link
libraries from my host system. Typical error message looked like this:
>>> /usr/lib/libz.so: file not recognized: File format not recognized
>>> collect2: ld returned 1 exit status
That was pretty odd, because when I built xbmc for beagleboard, I had no
such errors. I traced that libtool try to link packages from my host system,
if in apropriate *.la file, "installed" parametr set to "yes". When I
changed value for "installed" from "yes" to "no", this probles disappeared.
It was done for libz.la and libexpat.la, the only libraries I had problem
with.
But what is strange to me, when I compiled angstrom 2008 for beagleboard,
value of "installed" parametr in libz.la and libexpat.la files were set to
"no" by default. So, for different distro versions, libtool generete *.la
files with different meanings. Don't know who to blame, angstrom or oe.
Also, this issue can be solved by removing zlib-dev and libexpat-dev
packages from my host machine (thanks to guys from irc),

I'm not sure that it is critical issue, but al least, people should be
warned about it.

Thanks

