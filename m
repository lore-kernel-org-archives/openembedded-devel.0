Received: from [72.14.220.152] (helo=fg-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <pmiscml@gmail.com>) id 1J5gCk-0006R8-OS
	for openembedded-devel@lists.openembedded.org;
	Fri, 21 Dec 2007 12:38:14 +0100
Received: by fg-out-1718.google.com with SMTP id 22so133269fge.20
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Dec 2007 03:33:03 -0800 (PST)
Received: by 10.86.96.18 with SMTP id t18mr1053751fgb.13.1198236783004;
	Fri, 21 Dec 2007 03:33:03 -0800 (PST)
Received: from ?192.168.20.166? ( [194.79.8.34])
	by mx.google.com with ESMTPS id 13sm1278704fks.8.2007.12.21.03.33.00
	(version=SSLv3 cipher=OTHER); Fri, 21 Dec 2007 03:33:00 -0800 (PST)
Date: Fri, 21 Dec 2007 13:38:16 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Mailer: The Bat! (v3.64.01 Christmas Edition) Professional
X-Priority: 3 (Normal)
Message-ID: <489984884.20071221133816@gmail.com>
To: Robert Schuster <theBohemian@gmx.net>
In-Reply-To: <476B8D3A.7010703@gmx.net>
References: <476B8D3A.7010703@gmx.net>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: java recipe policy for OE
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 21 Dec 2007 11:38:14 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Robert,

Friday, December 21, 2007, 11:54:02 AM, you wrote:

> Hi,
> the toolchain stuff has not been committed yet but I still want to start
> a little discussion about the future of java packages in OE.

> a) jar location
> The Debian java packages have the fine habit of placing all the jars
> (this is what resembles a shared library in java land) into
> /usr/share/java. Since Java (still) lacks an automated mechanism to look
> up those jars they have to be provided manually when starting an
> application (e.g. through a shell script) and putting them into a common
> directory saves people's nerves.

> Making the jar location variable is easy, making applications work can
> be hard (patching scripts etc). I don't see much value in making this
> configurable either.

  What you mean by "variable"? Packages represent finished software
bundles, are supposed to be installed in specific place, don't have
special requirement of being relocatable, and are not supposed to be
tweak by users besides some specially marked config files.

  Another thing, you should not assume that every distro will *build*
packages to be installed to /usr. Instead, OE offers location
variables (based on standard GNU configure path vars) for packages to
use. So, please don't hardcode /usr or something into your recipes.
Default CLASSPATH is ${datadir}/java thus (worth defining datadir_java
for that, so it was further configurable).

  So, once again, please don't hardcode paths in *your*
.bb's/.bbclass'es. But of course, patching 3rd party code to fully
adhere to this is yet another "another task". But if you can check for
this at least core components, like standard java runtime,
that would be appreciated.

  Realistic usecase? Building NSLU2 Optware like feeds for alien
systems (mostly vendor Leenooxes). OE is pretty bad on that now.
Trying to build nano, I had to patch 2-3 dependent recipes just to
have them build.

[]

> c) naming
> Debian names packages containing only jars lib<PN>-java. If it has a
> corresponding JNI library it is called lib<PN>-jni. I would like to
> adopt this for OE. With the help of a bbclass for java library recipes
> this safes boilerplate. I have an early version of such a bbclass in the
> Jalimo repository for everyone to look at, criticise and enhance. :)

  Oh, these misguided debian naming conventions! (well, depends) We
already have inconsistency with this in OE. Python uses prefix, Perl -
suffixes. Chose your way ;-).

[]

> Regards
> Robert




-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



