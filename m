Received: from [209.85.223.190] (helo=mail-iw0-f190.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1N69wu-0003kQ-Fb
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 Nov 2009 22:32:59 +0100
Received: by iwn28 with SMTP id 28so371772iwn.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Nov 2009 13:31:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=egqauY9aJm1Q70W92q+Lvj9UiGMs02D+NWPh04bs51E=;
	b=avEsNrluwNOp99Of9rtpRqevy6QabUNqM8ikQEEUOXPugGaBKw8CQPaiuryHXx/VeT
	tuif/1jX/llokaHAqLfaHLlEmOHkxFOj/Qy02Dex5mNyeHstZNk+9lTv/rPT9Aov4alJ
	fq1qsDk2o/zF1luwva05xW8nWadB59Pyirp3I=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	b=YGlEHc+8gzabUFglBEaitKMSjaNNq9R8c1ecvbCYtm6QuXd0qyXQKJVdVmh+PZHG5/
	M08LK8QDfPLuwGzl4GqCKImMuggbenAY9cY2EbLxM7pWyrPTSX5MRlbuz/EEOtBCUuCM
	921KWLV3jzYlZMopHhDhCE48fjsJko5vupkag=
MIME-Version: 1.0
Received: by 10.231.25.29 with SMTP id x29mr2208496ibb.31.1257456702334; Thu, 
	05 Nov 2009 13:31:42 -0800 (PST)
In-Reply-To: <699461.13009.qm@web53905.mail.re2.yahoo.com>
References: <699461.13009.qm@web53905.mail.re2.yahoo.com>
Date: Thu, 5 Nov 2009 13:31:42 -0800
Message-ID: <19c1b8a90911051331t5f6865dem88cf82ad6e23adc0@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.190
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: gumstix-users@lists.sourceforge.net
Subject: Re: bitbake gumstix-basic-image error with 'patches' directory
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
X-List-Received-Date: Thu, 05 Nov 2009 21:33:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 22, 2009 at 4:40 AM, Charlie Woloszynski
<cwoloszynski@yahoo.com> wrote:
> I am new to OE and bitbake, so perhaps this is an easy question:
>
> I am using the pixhawk.oe build setup and I invoke 'bitbake gumstix-basic=
-image'
>
> I get the following output. =C2=A0Can someone suggest how to 'unstick' th=
is? =C2=A0Rerunning bitbake results in the same output.
>
>
> OE:overo charlie@charlie-desktop:~/macfs/pixhawk.oe$ bitbake pixhawk-cons=
ole-imageNOTE: Handling BitBake files: \ (7409/7409) [100 %]
> NOTE: Parsing finished. 7125 cached, 0 parsed, 284 skipped, 2 masked.
> NOTE: Cache is clean, not saving.
> NOTE: Resolving any missing task queue dependencies
> NOTE: Preparing runqueue
> NOTE: Executing runqueue
> NOTE: Running task 127 of 4046 (ID: 1263, /home/charlie/macfs/pixhawk.oe/=
org.openembedded.dev/recipes/mpfr/mpfr-native_2.3.1.bb, do_patch)
> NOTE: Applying patch 'long-long-thumb.patch' (org.openembedded.dev/recipe=
s/mpfr/long-long-thumb.patch)
> NOTE: Task failed: Command Error: exit status: 1 =C2=A0Output:
> Importing patch /home/charlie/macfs/pixhawk.oe/org.openembedded.dev/recip=
es/mpfr/long-long-thumb.patch (stored as long-long-thumb.patch)
> mkdir: cannot create directory `patches': File exists

It works well here so dont know what could be wrong at your end.
one thing you could try is create 'files' directory under recipes/mpfr
and move long-long-thumb.patch to this new dir
and then clean mpfr-native and build it again.

> cp: accessing `patches/long-long-thumb.patch': Not a directory
> Failed to import patch long-long-thumb.patch
> ERROR: TaskFailed event exception, aborting
>
>
> A quick search in my system for directories called 'patches' shows the fo=
llowing:
>
> OE:overo charlie@charlie-desktop:~/macfs/pixhawk.oe$ find . -name "patche=
s" -print | xargs ls -lddrwxr-xr-x 17 charlie charlie 578 2008-05-04 07:28 =
./tmp/work/armv7a-angstrom-linux-gnueabi/binutils-cross-2.18.50.0.7-r7.1/bi=
nutils-2.18.50.0.7/patches
> drwxrwxr-x 10 charlie charlie 340 2009-10-22 04:17 ./tmp/work/i686-linux/=
autoconf-native-2.63-r8.0/autoconf-2.63/patches
> drwxrwxr-x =C2=A02 charlie charlie =C2=A068 2009-10-22 04:17 ./tmp/work/i=
686-linux/automake-native-1.10.2-r2.0/automake-1.10.2/patches
> drwxrwxr-x =C2=A04 charlie charlie 136 2009-10-22 04:25 ./tmp/work/i686-l=
inux/bison-native-2.3-r1/bison-2.3/patches
> drwxrwxr-x =C2=A05 charlie charlie 170 2009-10-22 04:25 ./tmp/work/i686-l=
inux/flex-native-2.5.31-r2/flex-2.5.31/patches
> drwxrwxr-x =C2=A07 charlie charlie 238 2009-10-22 04:20 ./tmp/work/i686-l=
inux/gettext-native-0.17-r4/gettext-0.17/patches
> drwxrwxr-x =C2=A07 charlie charlie 238 2009-10-22 04:19 ./tmp/work/i686-l=
inux/gmp-native-4.2.4-r0.1/gmp-4.2.4/patches
> drwxrwxr-x =C2=A05 charlie charlie 170 2009-10-22 04:16 ./tmp/work/i686-l=
inux/gnu-config-native-0.1+cvs20050701-r5/config/patches
> drwxrwxr-x =C2=A05 charlie charlie 170 2009-10-22 04:18 ./tmp/work/i686-l=
inux/libtool-native-2.2.6a-r25.0/libtool-2.2.6/patches
> drwxrwxr-x =C2=A02 charlie charlie =C2=A068 2009-10-22 04:16 ./tmp/work/i=
686-linux/m4-native-1.4.12-r0/m4-1.4.12/patches
> drwxrwxr-x =C2=A02 charlie charlie =C2=A068 2009-10-22 04:11 ./tmp/work/i=
686-linux/stagemanager-native-0.0.1-r11/stagemanager-0.0.1/patches
>
>
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


