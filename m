Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch-fe.de>) id 1R3Ytv-0005h5-AX
	for openembedded-devel@lists.openembedded.org;
	Tue, 13 Sep 2011 21:44:11 +0200
Received: by bke11 with SMTP id 11so826914bke.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Sep 2011 12:39:01 -0700 (PDT)
Received: by 10.204.13.77 with SMTP id b13mr1582306bka.251.1315942740667;
	Tue, 13 Sep 2011 12:39:00 -0700 (PDT)
Received: from mobil-400-586.intern.dresearch.de (recycler-gw.in-dsl.de
	[217.197.85.167])
	by mx.google.com with ESMTPS id t16sm2144107bkv.11.2011.09.13.12.38.58
	(version=SSLv3 cipher=OTHER); Tue, 13 Sep 2011 12:38:59 -0700 (PDT)
Message-ID: <4E6FB151.2030701@dresearch-fe.de>
Date: Tue, 13 Sep 2011 21:38:57 +0200
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:6.0.2) Gecko/20110907 Thunderbird/6.0.2
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1315920550-3977-1-git-send-email-sledz@dresearch-fe.de>
	<1315925466.4195.58.camel@mattotaupa>
In-Reply-To: <1315925466.4195.58.camel@mattotaupa>
X-Enigmail-Version: 1.3.1
Cc: Paul Menzel <paulepanter@users.sourceforge.net>
Subject: Re: [PATCH] eglibc-2.9: allow building with newer GNU make
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
X-List-Received-Date: Tue, 13 Sep 2011 19:44:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13.09.2011 16:51, Paul Menzel wrote:
> Am Dienstag, den 13.09.2011, 15:29 +0200 schrieb Steffen Sledz:
>> GNU make >= 3.82 does not allow mixed implicit and normal rules
> 
> Did you update your build host?

No. It's a clean setup with oe master and Kaeilos at openSUSE 11.4.

> I think to circumvent such issues `make-native` 3.81 should be used?

So this assumption seems to be wrong.

>> Signed-off-by: Steffen Sledz <sledz@dresearch-fe.de> --- recipes/eglibc/eglibc-2.9/make-3.82.patch |   16 ++++++++++++++++ recipes/eglibc/eglibc_2.9.bb              |    3 ++- 2 files changed, 18 insertions(+), 1 deletions(-) create mode 100644 recipes/eglibc/eglibc-2.9/make-3.82.patch
>> 
>> diff --git a/recipes/eglibc/eglibc-2.9/make-3.82.patch b/recipes/eglibc/eglibc-2.9/make-3.82.patch new file mode 100644 index 0000000..b0a45d9 --- /dev/null +++ b/recipes/eglibc/eglibc-2.9/make-3.82.patch @@ -0,0 +1,16 @@
> 
> The patch header is missing [1].

Hmmm? After reading [1] i could not find what exactly is missing.

>> +diff -Nurd libc.orig//manual/Makefile libc/manual/Makefile +--- libc.orig//manual/Makefile	2011-09-13 14:49:57.428424088 +0200 ++++ libc/manual/Makefile	2011-09-13 14:50:47.009620484 +0200 +@@ -242,7 +242,11 @@ + .PHONY: stubs + stubs: $(objpfx)stubs + endif +-$(objpfx)stubs ../po/manual.pot $(objpfx)stamp%: ++$(objpfx)stubs ../po/manual.pot: ++	$(make-target-directory) ++	touch $@ ++ ++$(objpfx)stamp%: + 	$(make-target-directory) + 	touch $@ + diff --git a/recipes/eglibc/eglibc_2.9.bb b/recipes/eglibc/eglibc_2.9.bb index be60ba7..7e0fa55 100644 --- a/recipes/eglibc/eglibc_2.9.bb +++ b/recipes/eglibc/eglibc_2.9.bb @@ -3,7 +3,7 @@ require eglibc.inc DEPENDS += "gperf-native" FILESPATHPKG =. "eglibc-svn:" PV = "2.9" -PR = "${INC_PR}.10" +PR = "${INC_PR}.11" PR_append = "+svnr${SRCPV}" SRCREV="10153" EGLIBC_BRANCH="eglibc-2_9" @@ -14,6 +14,7 @@ SRC_URI = "svn://svn.eglibc.org/branches;module=${EGLIBC_BRANCH};proto=svn \ file://shorten-build-commands.patch \ 
>> file://sh4_set_fpscr.patch \ file://sh4_local-fpscr_values.patch \ +           file://make-3.82.patch \ file://etc/ld.so.conf \ file://generate-supported.mk" S = "${WORKDIR}/${EGLIBC_BRANCH}/libc"
> 
> 
> Thanks,
> 
> Paul
> 
> 
> [1] http://openembedded.org/index.php?title=Commit_Patch_Message_Guidelines
> 
> 
> 
> _______________________________________________ Openembedded-devel mailing list Openembedded-devel@lists.openembedded.org http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058


