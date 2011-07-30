Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cyril.brulebois@ariadnext.com>) id 1Qn7Pk-00088W-0g
	for openembedded-devel@lists.openembedded.org;
	Sat, 30 Jul 2011 13:09:04 +0200
Received: by wyg30 with SMTP id 30so739756wyg.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Jul 2011 04:04:45 -0700 (PDT)
Received: by 10.227.199.207 with SMTP id et15mr3401665wbb.56.1312023885227;
	Sat, 30 Jul 2011 04:04:45 -0700 (PDT)
Received: from [192.168.0.5] (home.mraw.org [88.164.242.219])
	by mx.google.com with ESMTPS id gd1sm2485390wbb.44.2011.07.30.04.04.44
	(version=SSLv3 cipher=OTHER); Sat, 30 Jul 2011 04:04:44 -0700 (PDT)
Message-ID: <4E33E54B.2010304@ariadnext.com>
Date: Sat, 30 Jul 2011 13:04:43 +0200
From: Cyril Brulebois <cyril.brulebois@ariadnext.com>
Organization: AriadNEXT
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.18) Gecko/20110626 Icedove/3.1.11
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <201107301242.41215.schnitzeltony@gmx.de>
In-Reply-To: <201107301242.41215.schnitzeltony@gmx.de>
Cc: gumstix-users@lists.sourceforge.net
Subject: Re: fakeroot 1.14.5 source is missing
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
X-List-Received-Date: Sat, 30 Jul 2011 11:09:04 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit

Hi,

Andreas Mueller <schnitzeltony@gmx.de> (30/07/2011):
> Hi guys,
> 
> I tried to build an image based on gumstix overo-2011 branch [1] but the sources 
> for fakeroot 1.14.5 can not be downloaded.
> 
> ERROR: fakeroot-native-1.14.5: 
> ftp://ftp.debian.org/debian/pool/main/f/fakeroot/fakeroot_1.14.5.orig.tar.bz2 
> cannot check archive integrity
> 
> In [2] I saw that it is it is not there ( anymore ? ).

pointing to packages which are in unstable or testing feels very wrong.
New versions can come up at any time in unstable, and (if some
constraints are satisfied), can move to testing and overwrite what was
there before. (But pointing to packages in stable would buy you several
years.)

If you need to point to such a package anyway, I'd suggest considering
snapshot.debian.org, which should retain all packages. For example:
  http://snapshot.debian.org/package/fakeroot/1.14.5-1/

http://snapshot.debian.org/archive/debian/20101205T211007Z/pool/main/f/fakeroot/fakeroot_1.14.5.orig.tar.bz2

As a consequence, the URL to the original tarball includes a date
(meaning “fakeroot as seen in Debian as of $date), but I guess that
won't cause any issue.

If you have more Debian-related questions, feel free to ask.

Cheers,
-- 
Cyril Brulebois
Support AriadNEXT
0 825 590 003


