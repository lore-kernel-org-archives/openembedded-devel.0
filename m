Received: from na3sys009aog112.obsmtp.com ([74.125.149.207])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <bengardiner@nanometrics.ca>) id 1P66Ji-0005Ug-Oo
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Oct 2010 20:44:51 +0200
Received: from source ([74.125.83.180]) by na3sys009aob112.postini.com
	([74.125.148.12]) with SMTP
	ID DSNKTLX98a+o9vlYdDMBCKVr/n2upMNwILWT@postini.com;
	Wed, 13 Oct 2010 11:44:21 PDT
Received: by mail-pv0-f180.google.com with SMTP id 6so569714pvg.11
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Oct 2010 11:44:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.142.71.11 with SMTP id t11mr7920635wfa.121.1286995053131; Wed,
	13 Oct 2010 11:37:33 -0700 (PDT)
Received: by 10.220.199.2 with HTTP; Wed, 13 Oct 2010 11:37:33 -0700 (PDT)
In-Reply-To: <i94r56$spo$1@dough.gmane.org>
References: <1286988161-20097-1-git-send-email-bengardiner@nanometrics.ca>
	<i94r56$spo$1@dough.gmane.org>
Date: Wed, 13 Oct 2010 14:37:33 -0400
Message-ID: <AANLkTinY4ObZCkhW_tND0R=p308v6R957YF=7-GTO1=1@mail.gmail.com>
From: Ben Gardiner <bengardiner@nanometrics.ca>
To: Koen Kooi <k.kooi@student.utwente.nl>,
	=?ISO-8859-1?Q?V=EDctor_M=2E_J=E1quez_L=2E?= <vjaquez@igalia.com>,
	openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.149.207
X-SA-Exim-Mail-From: bengardiner@nanometrics.ca
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
	WEIRD_PORT autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] [PATCH] distro: make TARGET_VENDOR a weak assignment to enable external-csl
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
X-List-Received-Date: Wed, 13 Oct 2010 18:44:51 -0000
Content-Type: text/plain; charset=ISO-8859-1

My apologies, Victor, for duplicating your efforts. I was
simultaneously preparing this patch on the 8th.

On Wed, Oct 13, 2010 at 1:44 PM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 13-10-10 18:42, Ben Gardiner wrote:
>> Trying to use an external toolchain like the 2009q1 toolchain from codesourcery
>> has some strange results since the toolchain has vendor 'none' but
>> distributions like angstrom set TARGET_VENDOR unconditionally.
>>
>> This changeset makes all assignments of TARGET_VENDOR in distros weak as was
>> suggested by Denys Dmytriyenko in a recent mailing list discussion [1].
>
> Well, not 2 days ago this idea was shot down:
> http://thread.gmane.org/gmane.comp.handhelds.openembedded/37918

Thank you, Koen, for pointing me to the recent discussion. I tried to
modify the toolchain-external.inc -- as you suggested in that thread
-- so that TARGET_VENDOR could be set by a TOOLCHAIN_VENDOR variable:

diff --git a/conf/distro/include/toolchain-external.inc
b/conf/distro/include/toolchain-external.inc
index ff83f5a..585d50e 100644
--- a/conf/distro/include/toolchain-external.inc
+++ b/conf/distro/include/toolchain-external.inc
@@ -6,3 +6,5 @@ PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc =
"external-toolchain-${TOOLCHAIN
 PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}g++ =
"external-toolchain-${TOOLCHAIN_BRAND}"
 #PREFERRED_PROVIDER_linux-libc-headers =
"external-toolchain-${TOOLCHAIN_BRAND}"

+TOOLCHAIN_VENDOR ?= "${TARGET_VENDOR}"
+TARGET_VENDOR = "${TOOLCHAIN_VENDOR}"

and added TOOLCHAIN_VENDOR = "-none" in my local conf.

But it appears that the angstrom-2008.1 distro conf is still
overriding the TARGET_VENDOR variable:
$bitbake -i
/usr/lib/pymodules/python2.6/bb/shell.py:59: DeprecationWarning: The
popen2 module is deprecated.  Use the subprocess module.
  import sys, os, readline, socket, httplib, urllib, commands, popen2,
copy, shlex, Queue, fnmatch
BitBake Shell Version 0.5.3.1 (C) 2005 Michael 'Mickey' Lauer
<mickey@Vanille.de>
Type 'help' for more information, press CTRL-D to exit.
BB>> parse
[snip]
NOTE: Handling BitBake files: | (7131/7131) [100 %]
NOTE: Parsing finished. 0 cached, 6796 parsed, 335 skipped, 2 masked.

BB>> getvar TARGET_VENDOR
-angstrom
BB>> getvar TOOLCHAIN_VENDOR
-none
BB>> getvar TARGET_SYS
arm-angstrom-linux-gnueabi

So my initial attempt is not going to cut it. Could you elaborate on
what you imagine the necessary modifications to toolchain-external.inc
might be? I'm happy to implement and/or test.

Best Regards,
Ben Gardiner

---
Nanometrics Inc.
http://www.nanometrics.ca


