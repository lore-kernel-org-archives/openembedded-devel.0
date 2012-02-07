Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RumlQ-000176-G1 for openembedded-devel@lists.openembedded.org;
	Tue, 07 Feb 2012 16:15:24 +0100
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Rumde-0003je-8A for openembedded-devel@lists.openembedded.org;
	Tue, 07 Feb 2012 16:07:22 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Feb 2012 16:07:22 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Feb 2012 16:07:22 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 07 Feb 2012 16:07:08 +0100
Message-ID: <jgremu$4e1$1@dough.gmane.org>
References: <1328607054-21182-1-git-send-email-koen@dominion.thruhere.net>
	<1328623914.4320.5.camel@mattotaupa>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:9.0) Gecko/20111222 Thunderbird/9.0.1
In-Reply-To: <1328623914.4320.5.camel@mattotaupa>
X-Enigmail-Version: 1.3.5
Subject: Re: [PATCH] systemd: move to v40 and don't kill user processes on exit
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
X-List-Received-Date: Tue, 07 Feb 2012 15:15:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 07-02-12 15:11, Paul Menzel schreef:
> Am Dienstag, den 07.02.2012, 10:30 +0100 schrieb Koen Kooi:
>> This fixes screen and tmux persistency issues.
> 
> Two patches would have been better. Or is v40 also needed to fix these 
> issues?

Not sure, I tested the logind thing after the v40 bump, hence the PR
increase below.

> 
>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net> --- 
>> .../0001-docs-fix-build-without-xsltproc.patch     |    8 ++-- 
>> ...-logind-don-t-kill-user-processes-on-exit.patch |   31
>> ++++++++++++++++++++ meta-oe/recipes-core/systemd/systemd_git.bb
>> |    5 ++- 3 files changed, 38 insertions(+), 6 deletions(-) create
>> mode 100644
>> meta-oe/recipes-core/systemd/systemd/0002-systemd-logind-don-t-kill-user-processes-on-exit.patch
>>
>>
>> 
diff --git
a/meta-oe/recipes-core/systemd/systemd/0001-docs-fix-build-without-xsltproc.patch
b/meta-oe/recipes-core/systemd/systemd/0001-docs-fix-build-without-xsltproc.patch
>> index 6775349..390d65c 100644 ---
>> a/meta-oe/recipes-core/systemd/systemd/0001-docs-fix-build-without-xsltproc.patch
>>
>> 
+++
b/meta-oe/recipes-core/systemd/systemd/0001-docs-fix-build-without-xsltproc.patch
>> @@ -1,4 +1,4 @@ -From 97719ec99e3bd0040b616b044ab6ae33ae1cfd15 Mon Sep
>> 17 00:00:00 2001 +From 7395173a5af08e9e58aed33e831d0bfc6515891d Mon Sep
>> 17 00:00:00 2001 From: Koen Kooi <koen@dominion.thruhere.net> Date:
>> Sun, 2 Oct 2011 19:54:29 +0200 Subject: [PATCH 1/2] docs: fix build
>> without xsltproc @@ -6,18 +6,18 @@ Subject: [PATCH 1/2] docs: fix build
>> without xsltproc Make would choke on missing rules for man/systemd.1
>> 
>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net> ----
>> 
>> Upstream-status: rejected [fix your docbook install]
>> 
>> +--- Makefile.am |    5 +++++ 1 files changed, 5 insertions(+), 0
>> deletions(-)
>> 
>> diff --git a/Makefile.am b/Makefile.am -index 110a2f4..a5e57b7 100644 
>> +index f1f975f..53f99a1 100644 --- a/Makefile.am +++ b/Makefile.am -@@
>> -650,6 +650,7 @@ EXTRA_DIST += \ +@@ -649,6 +649,7 @@ EXTRA_DIST += \ 
>> src/acl-util.h \ src/logs-show.h
>> 
>> diff --git
>> a/meta-oe/recipes-core/systemd/systemd/0002-systemd-logind-don-t-kill-user-processes-on-exit.patch
>> b/meta-oe/recipes-core/systemd/systemd/0002-systemd-logind-don-t-kill-user-processes-on-exit.patch
>>
>> 
new file mode 100644
>> index 0000000..c28f189 --- /dev/null +++
>> b/meta-oe/recipes-core/systemd/systemd/0002-systemd-logind-don-t-kill-user-processes-on-exit.patch
>>
>> 
@@ -0,0 +1,31 @@
>> +From eccbcfd37d41e1cb66bdf19cded899a36cc3842d Mon Sep 17 00:00:00
>> 2001 +From: Koen Kooi <koen@dominion.thruhere.net> +Date: Tue, 7 Feb
>> 2012 10:12:51 +0100 +Subject: [PATCH 2/2] systemd-logind: don't kill
>> user processes on exit + +This fixed screen and tmux + +Signed-off-by:
>> Koen Kooi <koen@dominion.thruhere.net> + +Upstream-status: Unknown + 
>> +--- + src/login/systemd-logind.conf |    2 +- + 1 files changed, 1
>> insertions(+), 1 deletions(-) + +diff --git
>> a/src/login/systemd-logind.conf b/src/login/systemd-logind.conf +index
>> 9909804..ba69b6c 100644 +--- a/src/login/systemd-logind.conf ++++
>> b/src/login/systemd-logind.conf +@@ -9,7 +9,7 @@ + + [Login] +
>> #NAutoVTs=6 +-#KillUserProcesses=no ++KillUserProcesses=no +
>> #KillOnlyUsers= + #KillExcludeUsers=root + #Controllers= +-- +1.7.2.5 
>> + diff --git a/meta-oe/recipes-core/systemd/systemd_git.bb
>> b/meta-oe/recipes-core/systemd/systemd_git.bb index 89f910b..c1a0117
>> 100644 --- a/meta-oe/recipes-core/systemd/systemd_git.bb +++
>> b/meta-oe/recipes-core/systemd/systemd_git.bb @@ -14,14 +14,15 @@
>> inherit gitpkgv PKGV = "v${GITPKGVTAG}"
>> 
>> PV = "git" -PR = "r13" +PR = "r15"
> 
> Only do `r14`?
> 
>> inherit useradd pkgconfig autotools vala perlnative
>> 
>> -SRCREV = "bbd9b8c2139a70005e4e83d198575e2a10fe1db2" +SRCREV =
>> "d26e4270409506cd398875216413b651d6ee7de6"
>> 
>> SRC_URI = "git://anongit.freedesktop.org/systemd/systemd;protocol=git
>> \ file://0001-docs-fix-build-without-xsltproc.patch \ +
>> file://0002-systemd-logind-don-t-kill-user-processes-on-exit.patch \ 
>> ${UCLIBCPATCHES} \ " UCLIBCPATCHES = ""
> 
> I have no time to test this. But I guess you did.
> 
> Reviewed-by: Paul Menzel <paulepanter@users.sourceforge.net>
> 
> 
> Thanks,
> 
> Paul
> 
> 
> 
> _______________________________________________ Openembedded-devel
> mailing list Openembedded-devel@lists.openembedded.org 
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iEYEARECAAYFAk8xPhkACgkQMkyGM64RGpEwZACfUb2qY9WxQOEDuQxfjkpRkpaU
XQAAoJmR++r/9iVjH5fvQ1pCvvQTtgCt
=Tzvh
-----END PGP SIGNATURE-----



