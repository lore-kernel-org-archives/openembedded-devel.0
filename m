Received: from [209.85.222.192] (helo=mail-pz0-f192.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <aalonso00@gmail.com>) id 1N902k-0002CP-21
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Nov 2009 18:34:45 +0100
Received: by pzk30 with SMTP id 30so2342298pzk.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Nov 2009 09:33:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=hlYWoPC2VdO0t8mPQhIZyxCzko/JdPHn15LrHJJQg0Y=;
	b=obn5an/bfAh2H+y4/PTIgMbhYq+9tafUgGt9WNfQ8skOiwrwE4q+9w6VBT7j9mkpnf
	UB+drhcF8nF6MO10mSdNAP3pN4SH3E0yhLqsAJACLE/VeQnG/jQm146qtTRovxakQjxJ
	J3QD3TUDfL4W7mdA8PlHUpqkUMnRJxYqID2cs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=ClT5/ReHZ7HQnRCNQqFcGOFXZgYPhA8cXk67B+US3GkHmIlT4KaaNmjvfHW9n3q2+N
	E3jr6TYOWVBF4uIlUaZxBM3JM0DLm7c1aK6NeXF2Cd61e8qDuEfGPoc6+T/shVSoCSoE
	SMrA7tZBZGb5H288q+A9bLX652yV5B8mfiCqA=
MIME-Version: 1.0
Received: by 10.114.188.17 with SMTP id l17mr6941651waf.135.1258133207064; 
	Fri, 13 Nov 2009 09:26:47 -0800 (PST)
In-Reply-To: <4AFD8C6C.4090606@mwester.net>
References: <alpine.LFD.2.00.0911130443520.1157@localhost>
	<4AFD4DD6.70509@balister.org>
	<alpine.LFD.2.00.0911130732220.17745@localhost>
	<4AFD5440.6080202@balister.org> <4AFD8C6C.4090606@mwester.net>
Date: Fri, 13 Nov 2009 11:26:47 -0600
Message-ID: <d1ded4380911130926q50482065l7ea74d56cc0b71d2@mail.gmail.com>
From: Adrian Alonso <aalonso00@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.222.192
X-SA-Exim-Mail-From: aalonso00@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: build breakage: python-native-2.6.1
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
X-List-Received-Date: Fri, 13 Nov 2009 17:34:45 -0000
Content-Type: text/plain; charset=ISO-8859-1

After applying the patch http://tim.rpsys.net/python-hostfix.patch
and rebuild python-native_2.6.1.bb

Works with out `readline tweak`

Here is the build log

[aalonso@localhost conf]$ bitbake -b
~/workspace/oe/openembedded/recipes/python/python-native_2.6.1.bb
NOTE: Preparing runqueue
NOTE: Executing runqueue
NOTE: Running task 1 of 17 (ID: 1,
/home/aalonso/workspace/oe/openembedded/recipes/python/
python-native_2.6.1.bb, do_setscene)
NOTE: Running task 2 of 17 (ID: 2,
/home/aalonso/workspace/oe/openembedded/recipes/python/
python-native_2.6.1.bb, do_fetch)
NOTE: Running task 3 of 17 (ID: 3,
/home/aalonso/workspace/oe/openembedded/recipes/python/
python-native_2.6.1.bb, do_unpack)
NOTE: Running task 4 of 17 (ID: 13,
/home/aalonso/workspace/oe/openembedded/recipes/python/
python-native_2.6.1.bb, do_distribute_sources)
NOTE: Unpacking ../../sources/Python-2.6.1.tar.bz2 to
tmp/work/x86_64-linux/python-native-2.6.1-ml8.2/
NOTE: Running task 5 of 17 (ID: 4,
/home/aalonso/workspace/oe/openembedded/recipes/python/
python-native_2.6.1.bb, do_patch)
NOTE: Applying patch '00-fix-bindir-libdir-for-cross.patch'
(../../openembedded/recipes/python/python-native-2.6.1/00-fix-bindir-libdir-for-cross.patch)
NOTE: Applying patch '04-default-is-optimized.patch'
(../../openembedded/recipes/python/python-native-2.6.1/04-default-is-optimized.patch)
NOTE: Applying patch '05-enable-ctypes-cross-build.patch'
(../../openembedded/recipes/python/python-2.6.1/05-enable-ctypes-cross-build.patch)
NOTE: Applying patch '10-distutils-fix-swig-parameter.patch'
(../../openembedded/recipes/python/python-native-2.6.1/10-distutils-fix-swig-parameter.patch)
NOTE: Applying patch '11-distutils-never-modify-shebang-line.patch'
(../../openembedded/recipes/python/python-native-2.6.1/11-distutils-never-modify-shebang-line.patch)
NOTE: Applying patch '12-distutils-prefix-is-inside-staging-area.patch'
(../../openembedded/recipes/python/python-native-2.6.1/12-distutils-prefix-is-inside-staging-area.patch)
NOTE: Applying patch 'debug.patch'
(../../openembedded/recipes/python/python-native-2.6.1/debug.patch)
NOTE: Applying patch 'nohostlibs.patch'
(../../openembedded/recipes/python/python-native-2.6.1/nohostlibs.patch)
NOTE: Running task 6 of 17 (ID: 5,
/home/aalonso/workspace/oe/openembedded/recipes/python/
python-native_2.6.1.bb, do_configure)
NOTE: Running task 7 of 17 (ID: 6,
/home/aalonso/workspace/oe/openembedded/recipes/python/
python-native_2.6.1.bb, do_qa_configure)
NOTE: Running task 8 of 17 (ID: 7,
/home/aalonso/workspace/oe/openembedded/recipes/python/
python-native_2.6.1.bb, do_compile)
NOTE: Running task 9 of 17 (ID: 8,
/home/aalonso/workspace/oe/openembedded/recipes/python/
python-native_2.6.1.bb, do_install)
NOTE: Running task 10 of 17 (ID: 12,
/home/aalonso/workspace/oe/openembedded/recipes/python/
python-native_2.6.1.bb, do_package)
NOTE: Running task 11 of 17 (ID: 9,
/home/aalonso/workspace/oe/openembedded/recipes/python/
python-native_2.6.1.bb, do_populate_staging)
NOTE: Legacy staging mode for
/home/aalonso/workspace/oe/openembedded/recipes/python/
python-native_2.6.1.bb
NOTE: Running task 12 of 17 (ID: 16,
/home/aalonso/workspace/oe/openembedded/recipes/python/
python-native_2.6.1.bb, do_package_write_ipk)
NOTE: Running task 13 of 17 (ID: 11,
/home/aalonso/workspace/oe/openembedded/recipes/python/
python-native_2.6.1.bb, do_package_write)
NOTE: Running task 14 of 17 (ID: 15,
/home/aalonso/workspace/oe/openembedded/recipes/python/
python-native_2.6.1.bb, do_package_stage)
NOTE: Running task 15 of 17 (ID: 10,
/home/aalonso/workspace/oe/openembedded/recipes/python/
python-native_2.6.1.bb, do_qa_staging)
NOTE: Running task 16 of 17 (ID: 14,
/home/aalonso/workspace/oe/openembedded/recipes/python/
python-native_2.6.1.bb, do_package_stage_all)
NOTE: Running task 17 of 17 (ID: 0,
/home/aalonso/workspace/oe/openembedded/recipes/python/
python-native_2.6.1.bb, do_build)
NOTE: Tasks Summary: Attempted 17 tasks of which 0 didn't need to be rerun
and 0 failed.


On Fri, Nov 13, 2009 at 10:42 AM, Mike Westerhof <mike@mwester.net> wrote:

> Philip Balister wrote:
> > On 11/13/2009 07:34 AM, Robert P. J. Day wrote:
> >>    i'm not on F11 anymore, i'm effectively on F12 (fully-updated f12
> >> beta).  i made the upgrade a couple days ago and that's when those
> >> other packages broke.  hmmmm ... i really should have made that
> >> chronological connection.
> >>
> >>    but after the upgrade, i did a full rebuild of everything and those
> >> were the only packages to fail.  so, percentage-wise, that's not bad.
> >
> > I'm on F11 fwiw.
> >
> > I got this from gsb and a core file:
> >
> > http://pastebin.ca/1669812
> >
> > Philip
> >
> >>
> >> rday
>
> Same python-native failure.
>
> Fedora 10, the host hasn't been updated in many many weeks (so host
> changes are ruled out).  CCACHE is disabled.  xterm is not installed on
> the host.  It is a 64-bit install.
>
> -Mike (mwester)
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



-- 
Saludos
Adrian Alonso
http://aalonso.wordpress.com
Fedora Project Contributor
https://fedoraproject.org/wiki/User:Aalonso

