Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OZmlF-0001i1-UZ
	for openembedded-devel@lists.openembedded.org;
	Fri, 16 Jul 2010 17:23:54 +0200
Received: by iwn34 with SMTP id 34so2325103iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jul 2010 08:23:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=BJFzFzkSb3bg3yTXhmdsIVucXyHfN7KWMDftdtBL1eY=;
	b=sItVISS8QqaChNVx/GlPna1Bk32mnYv9L17JTba0OCWa2XfFXPikc1GZYgaSv/c5Vi
	Xk3ukoPPZwHq25oOBe5SM2Jg6aZZsmzPgmclc9peBc5MM/Z3C+uWoLA3CkCllwnDrwD3
	GiSLqWcGWY8klXlXZcF0Ha8IwjFaFFaNmt5dQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=RwGkdapU2AB5W7hZFINc1YWVtEZZATuq6fzdYygJkFgSec91eKm9Jk6nLkGoZxbsIS
	8XN9Nq4xOEdqQtxwC3lAmAvppXfllkjV5on/oy4PNxB87qnxj+YshQvMMIKySq/mq3w7
	ehrrX2O8X8uXS8S6WxF/rruYKRaI/B0X251zo=
Received: by 10.231.146.141 with SMTP id h13mr1121553ibv.1.1279293805285; Fri, 
	16 Jul 2010 08:23:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.35.8 with HTTP; Fri, 16 Jul 2010 08:23:05 -0700 (PDT)
In-Reply-To: <1279270987.4164.29.camel@mattotaupa>
References: <1279216536.3741.27.camel@mattotaupa>
	<1279270987.4164.29.camel@mattotaupa>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 16 Jul 2010 08:23:05 -0700
Message-ID: <AANLkTimGrdHiLeLLsInSl9L-KS8SbvNt4ws2kDcpEEN1@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: angstrom-2008.1, uclibc: git-native: sysroot-destdir 6, 4 GB 	big, since some executables are 100 MB each
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
X-List-Received-Date: Fri, 16 Jul 2010 15:23:54 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 16, 2010 at 2:03 AM, Paul Menzel
<paulepanter@users.sourceforge.net> wrote:
> Dear OE folks,
>
>
> Am Donnerstag, den 15.07.2010, 19:55 +0200 schrieb Paul Menzel:
>
>> I ran out of space and noticed
>>
>> =A0 =A0 /angstrom-dev/work/i686-linux/git-native-1.7.0.2-r4
>>
>> is 8,1G big.
>>
>> Some of the executable files in
>>
>> =A0 =A0 /angstrom-dev/work/i686-linux/git-native-1.7.0.2-r4/sysroot-dest=
dir/angstrom-dev/sysroots/i686-linux/usr/libexec/git-core/
>>
>> are 101 MB big.

its most probably the -g3/-ggdb3 bloat. and this option should be removed
from build flags atleast so the native binaries dont bloat.

here is a little change that you will need



diff --git a/conf/distro/include/angstrom-uclibc.inc
b/conf/distro/include/angstrom-uc
index 4ca6838..1c7f7f5 100644
--- a/conf/distro/include/angstrom-uclibc.inc
+++ b/conf/distro/include/angstrom-uclibc.inc
@@ -15,7 +15,7 @@ TARGET_OS =3D "${@['${TARGET_OS_UC}',
'uclinux-uclibc'][bb.data.getVar
 #mess with compiler flags to use -Os instead of -O2
 #Please see http://free-electrons.com/doc/embedded_linux_optimizations/img=
47.html
for
 FULL_OPTIMIZATION =3D "-fexpensive-optimizations -fomit-frame-pointer
-frename-register
-BUILD_OPTIMIZATION =3D "-O2 -ggdb3"
+BUILD_OPTIMIZATION =3D "-O2"


its ok with other libcs for angstrom as the flag has already been
removed from them. Try this and rebake git-native after cleaning it

Thx
-Khem


>>
>> This regression must have been introduced between this morning 6 a.m.
>> UTC and now.
>>
>> I could not reproduce this using the distributions minimal-uclibc or
>> angstrom-2008.1 with glibc.
>>
>> If you need more information I could try to downgrade the uclibc
>> revision.
>
> I can still reproduce the problem with angstrom-2008.1, uclibc-git and
> OE dev branch HEAD from today 9fd5a8cb38a376633eb0bd7981548179b6bea25d.
>
> =A0 =A0 =A0 =A0/angstrom-dev/work/i686-linux/git-native-1.7.0.2-r4/sysroo=
t-destdir/angstrom-dev/sysroots/i686-linux/usr/libexec/git-core$ ls -lh | s=
ort -k 5
> =A0 =A0 =A0 =A0[=85]
> =A0 =A0 =A0 =A0-rwxr-xr-x 1 usern usern 101M 16. Jul 10:51 git
> =A0 =A0 =A0 =A0-rwxr-xr-x 1 usern usern 101M 16. Jul 10:51 git-annotate
> =A0 =A0 =A0 =A0-rwxr-xr-x 1 usern usern 101M 16. Jul 10:51 git-apply
> =A0 =A0 =A0 =A0-rwxr-xr-x 1 usern usern 101M 16. Jul 10:51 git-archive
> =A0 =A0 =A0 =A0-rwxr-xr-x 1 usern usern 101M 16. Jul 10:51 git-blame
> =A0 =A0 =A0 =A0-rwxr-xr-x 1 usern usern 101M 16. Jul 10:51 git-branch
> =A0 =A0 =A0 =A0-rwxr-xr-x 1 usern usern 101M 16. Jul 10:51 git-bundle
> =A0 =A0 =A0 =A0-rwxr-xr-x 1 usern usern 101M 16. Jul 10:51 git-cherry
> =A0 =A0 =A0 =A0-rwxr-xr-x 1 usern usern 101M 16. Jul 10:51 git-cherry-pic=
k
> =A0 =A0 =A0 =A0-rwxr-xr-x 1 usern usern 101M 16. Jul 10:51 git-clean
> =A0 =A0 =A0 =A0-rwxr-xr-x 1 usern usern 101M 16. Jul 10:51 git-clone
> =A0 =A0 =A0 =A0-rwxr-xr-x 1 usern usern 101M 16. Jul 10:51 git-commit
> =A0 =A0 =A0 =A0-rwxr-xr-x 1 usern usern 101M 16. Jul 10:51 git-commit-tre=
e
> =A0 =A0 =A0 =A0-rwxr-xr-x 1 usern usern 101M 16. Jul 10:51 git-config
> =A0 =A0 =A0 =A0-rwxr-xr-x 1 usern usern 101M 16. Jul 10:51 git-diff
> =A0 =A0 =A0 =A0-rwxr-xr-x 1 usern usern 101M 16. Jul 10:51 git-fetch
> =A0 =A0 =A0 =A0-rwxr-xr-x 1 usern usern 101M 16. Jul 10:51 git-fmt-merge-=
msg
> =A0 =A0 =A0 =A0-rwxr-xr-x 1 usern usern 101M 16. Jul 10:51 git-for-each-r=
ef
> =A0 =A0 =A0 =A0-rwxr-xr-x 1 usern usern 101M 16. Jul 10:51 git-fsck
> =A0 =A0 =A0 =A0-rwxr-xr-x 1 usern usern 101M 16. Jul 10:51 git-fsck-objec=
ts
> =A0 =A0 =A0 =A0-rwxr-xr-x 1 usern usern 101M 16. Jul 10:51 git-grep
> =A0 =A0 =A0 =A0-rwxr-xr-x 1 usern usern 101M 16. Jul 10:51 git-hash-objec=
t
> =A0 =A0 =A0 =A0-rwxr-xr-x 1 usern usern 101M 16. Jul 10:51 git-help
> =A0 =A0 =A0 =A0-rwxr-xr-x 1 usern usern 101M 16. Jul 10:51 git-index-pack
> =A0 =A0 =A0 =A0-rwxr-xr-x 1 usern usern 101M 16. Jul 10:51 git-init
> =A0 =A0 =A0 =A0-rwxr-xr-x 1 usern usern 101M 16. Jul 10:51 git-init-db
> =A0 =A0 =A0 =A0-rwxr-xr-x 1 usern usern 101M 16. Jul 10:51 git-ls-remote
> =A0 =A0 =A0 =A0-rwxr-xr-x 1 usern usern 101M 16. Jul 10:51 git-mailsplit
> =A0 =A0 =A0 =A0-rwxr-xr-x 1 usern usern 101M 16. Jul 10:51 git-merge
> =A0 =A0 =A0 =A0-rwxr-xr-x 1 usern usern 101M 16. Jul 10:51 git-merge-recu=
rsive
> =A0 =A0 =A0 =A0-rwxr-xr-x 1 usern usern 101M 16. Jul 10:51 git-merge-subt=
ree
> =A0 =A0 =A0 =A0-rwxr-xr-x 1 usern usern 101M 16. Jul 10:51 git-mktag
> =A0 =A0 =A0 =A0-rwxr-xr-x 1 usern usern 101M 16. Jul 10:51 git-mktree
> =A0 =A0 =A0 =A0-rwxr-xr-x 1 usern usern 101M 16. Jul 10:51 git-name-rev
> =A0 =A0 =A0 =A0-rwxr-xr-x 1 usern usern 101M 16. Jul 10:51 git-pack-redun=
dant
> =A0 =A0 =A0 =A0-rwxr-xr-x 1 usern usern 101M 16. Jul 10:51 git-pack-refs
> =A0 =A0 =A0 =A0-rwxr-xr-x 1 usern usern 101M 16. Jul 10:51 git-prune
> =A0 =A0 =A0 =A0-rwxr-xr-x 1 usern usern 101M 16. Jul 10:51 git-push
> =A0 =A0 =A0 =A0-rwxr-xr-x 1 usern usern 101M 16. Jul 10:51 git-read-tree
> =A0 =A0 =A0 =A0-rwxr-xr-x 1 usern usern 101M 16. Jul 10:51 git-reset
> =A0 =A0 =A0 =A0-rwxr-xr-x 1 usern usern 101M 16. Jul 10:51 git-rev-list
> =A0 =A0 =A0 =A0-rwxr-xr-x 1 usern usern 101M 16. Jul 10:51 git-shortlog
> =A0 =A0 =A0 =A0-rwxr-xr-x 1 usern usern 101M 16. Jul 10:51 git-show
> =A0 =A0 =A0 =A0-rwxr-xr-x 1 usern usern 101M 16. Jul 10:51 git-show-branc=
h
> =A0 =A0 =A0 =A0-rwxr-xr-x 1 usern usern 101M 16. Jul 10:51 git-show-ref
> =A0 =A0 =A0 =A0-rwxr-xr-x 1 usern usern 101M 16. Jul 10:51 git-stage
> =A0 =A0 =A0 =A0-rwxr-xr-x 1 usern usern 101M 16. Jul 10:51 git-stripspace
> =A0 =A0 =A0 =A0-rwxr-xr-x 1 usern usern 101M 16. Jul 10:51 git-symbolic-r=
ef
> =A0 =A0 =A0 =A0-rwxr-xr-x 1 usern usern 101M 16. Jul 10:51 git-update-ind=
ex
> =A0 =A0 =A0 =A0-rwxr-xr-x 1 usern usern 101M 16. Jul 10:51 git-upload-arc=
hive
> =A0 =A0 =A0 =A0-rwxr-xr-x 1 usern usern 101M 16. Jul 10:51 git-verify-tag
> =A0 =A0 =A0 =A0-rwxr-xr-x 1 usern usern 101M 16. Jul 10:51 git-write-tree
> =A0 =A0 =A0 =A0[=85]
>
> Could you please check your work directory and see if you have the same
> problem.
>
>
> Thanks,
>
> Paul
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>


