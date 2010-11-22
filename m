Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PKYfs-0001je-11
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Nov 2010 16:51:48 +0100
Received: by yxd5 with SMTP id 5so4421343yxd.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Nov 2010 07:50:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=oHPTv873y8pzZFkDM2rugA/04OwrcsAGOTwfEQZGspM=;
	b=qmsgwcAv21Hp+sSPuv5CQhAQQv93qtL1xl+xWhxkKw9J3sHofyzsw8ClVV1wGeqSPB
	zyLH+HvEGDZ/2fc+zFEFOqWrANLhglTTI/kLYmwJopy+NYoumyc8ekW1ian5y8ca48cE
	wjf/vcpxiY4BuQW55LZUNZdHV5SRVKRNl6rnQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=T99KWulbXpLippvgI66b2xNGRgxXUfelXFZQ8dO/bAh4gZ6tSRjeTJYhGwOz5kHt4g
	XMDaAqLWZ3Wvxg0H+mtd345LfNzh0NCe4IFraukHJ4eBpCoj0le0vgSp+0EWUC/Gsdpc
	AUReZ5iSScJA4FtuggLnmok+BvL2/1DJzD6Yo=
Received: by 10.91.10.21 with SMTP id n21mr5998990agi.75.1290441011026; Mon,
	22 Nov 2010 07:50:11 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.120.8 with HTTP; Mon, 22 Nov 2010 07:49:50 -0800 (PST)
In-Reply-To: <AANLkTinfgjppRu8VZPG0H_BsVZEtkeOyNW9reHYyN3YS@mail.gmail.com>
References: <1290248944-13342-1-git-send-email-Martin.Jansa@gmail.com>
	<AANLkTinfgjppRu8VZPG0H_BsVZEtkeOyNW9reHYyN3YS@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 22 Nov 2010 07:49:50 -0800
Message-ID: <AANLkTim56Xp739POOxAW7CT2Xg20oz=TXoE3FMDVZNi4@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: eglibc packaging broken, too much stuff in eglibc-dev
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
X-List-Received-Date: Mon, 22 Nov 2010 15:52:00 -0000
X-List-Received-Date: Mon, 22 Nov 2010 15:52:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 22, 2010 at 4:02 AM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> On Sat, Nov 20, 2010 at 11:29 AM, Martin Jansa <martin.jansa@gmail.com> w=
rote:
>> Hi, not sure if this happens only with DISTRO=3Dmicro (I haven't noticed
>> it with SHR, but here is size of packages before (.old) and after applyi=
ng
>> following patch.
>>
>> Sideeffect of this issue is this:
>> 09:10:18 < JaMa|Off> hmm any idea why I got:
>> 09:10:18 < JaMa|Off> Package: libc6
>> 09:10:18 < JaMa|Off> Version: 2.12-r15.7+svnr11982
>> 09:10:18 < JaMa|Off> Depends: libc6-dev
>> 09:10:28 < JaMa|Off> with micro/spitz?
>> 09:11:58 < JaMa|Off> it's probably because libc6-dev has more files than=
 it should have :/ ie:
>> 09:12:00 < JaMa|Off> | =C2=A0* check_data_file_clashes: Package libc-ext=
ra-nss wants to install file /OE/tmpdir-micro/rootfs/minimal-image/lib/libn=
ss_nisplus.so.2
>> 09:12:00 < JaMa|Off> | =C2=A0 =C2=A0 =C2=A0 But that file is already pro=
vided by package =C2=A0* libc6-dev
>>
>>
>> bitbake@jama ~/tmpdir-micro/work/armv5te-oe-linux-gnueabi $ du -hs eglib=
c-2.12-r15.7+svnr11982.old/packages-split/* | grep -v locale | grep -v gcon=
v | grep -v charmap
>> 4.0K =C2=A0 =C2=A0eglibc-2.12-r15.7+svnr11982.old/packages-split/catchse=
gv
>> 2.4M =C2=A0 =C2=A0eglibc-2.12-r15.7+svnr11982.old/packages-split/eglibc
>> 357M =C2=A0 =C2=A0eglibc-2.12-r15.7+svnr11982.old/packages-split/eglibc-=
dbg
>> 209M =C2=A0 =C2=A0eglibc-2.12-r15.7+svnr11982.old/packages-split/eglibc-=
dev
>> ^^^^
>> 4.0K =C2=A0 =C2=A0eglibc-2.12-r15.7+svnr11982.old/packages-split/eglibc-=
dev.shlibdeps
>> 3.8M =C2=A0 =C2=A0eglibc-2.12-r15.7+svnr11982.old/packages-split/eglibc-=
doc
>> 0 =C2=A0 =C2=A0 =C2=A0 eglibc-2.12-r15.7+svnr11982.old/packages-split/eg=
libc-extra-nss
>> ^^^^
>> 0 =C2=A0 =C2=A0 =C2=A0 eglibc-2.12-r15.7+svnr11982.old/packages-split/eg=
libc-pcprofile
>> 202M =C2=A0 =C2=A0eglibc-2.12-r15.7+svnr11982.old/packages-split/eglibc-=
pic
>> 0 =C2=A0 =C2=A0 =C2=A0 eglibc-2.12-r15.7+svnr11982.old/packages-split/eg=
libc-static
>> 0 =C2=A0 =C2=A0 =C2=A0 eglibc-2.12-r15.7+svnr11982.old/packages-split/eg=
libc-thread-db
>> 893K =C2=A0 =C2=A0eglibc-2.12-r15.7+svnr11982.old/packages-split/eglibc-=
utils
>> 4.0K =C2=A0 =C2=A0eglibc-2.12-r15.7+svnr11982.old/packages-split/eglibc-=
utils.shlibdeps
>> 8.0K =C2=A0 =C2=A0eglibc-2.12-r15.7+svnr11982.old/packages-split/ldd
>> 0 =C2=A0 =C2=A0 =C2=A0 eglibc-2.12-r15.7+svnr11982.old/packages-split/li=
bcidn
>> 0 =C2=A0 =C2=A0 =C2=A0 eglibc-2.12-r15.7+svnr11982.old/packages-split/li=
bmemusage
>> 0 =C2=A0 =C2=A0 =C2=A0 eglibc-2.12-r15.7+svnr11982.old/packages-split/li=
bsegfault
>> 112K =C2=A0 =C2=A0eglibc-2.12-r15.7+svnr11982.old/packages-split/nscd
>> 4.0K =C2=A0 =C2=A0eglibc-2.12-r15.7+svnr11982.old/packages-split/nscd.sh=
libdeps
>> 428K =C2=A0 =C2=A0eglibc-2.12-r15.7+svnr11982.old/packages-split/sln
>> bitbake@jama ~/tmpdir-micro/work/armv5te-oe-linux-gnueabi $ du -hs eglib=
c-2.12-r15.7+svnr11982/packages-split/* | grep -v locale | grep -v gconv | =
grep -v charmap
>> 4.0K =C2=A0 =C2=A0eglibc-2.12-r15.7+svnr11982/packages-split/catchsegv
>> 2.4M =C2=A0 =C2=A0eglibc-2.12-r15.7+svnr11982/packages-split/eglibc
>> 357M =C2=A0 =C2=A0eglibc-2.12-r15.7+svnr11982/packages-split/eglibc-dbg
>> 3.1M =C2=A0 =C2=A0eglibc-2.12-r15.7+svnr11982/packages-split/eglibc-dev
>> ^^^^
>> 3.8M =C2=A0 =C2=A0eglibc-2.12-r15.7+svnr11982/packages-split/eglibc-doc
>> 100K =C2=A0 =C2=A0eglibc-2.12-r15.7+svnr11982/packages-split/eglibc-extr=
a-nss
>> ^^^^
>> 4.0K =C2=A0 =C2=A0eglibc-2.12-r15.7+svnr11982/packages-split/eglibc-extr=
a-nss.shlibdeps
>> 8.0K =C2=A0 =C2=A0eglibc-2.12-r15.7+svnr11982/packages-split/eglibc-pcpr=
ofile
>> 4.0K =C2=A0 =C2=A0eglibc-2.12-r15.7+svnr11982/packages-split/eglibc-pcpr=
ofile.shlibdeps
>> 202M =C2=A0 =C2=A0eglibc-2.12-r15.7+svnr11982/packages-split/eglibc-pic
>> 205M =C2=A0 =C2=A0eglibc-2.12-r15.7+svnr11982/packages-split/eglibc-stat=
ic
>> 28K =C2=A0 =C2=A0 eglibc-2.12-r15.7+svnr11982/packages-split/eglibc-thre=
ad-db
>> 4.0K =C2=A0 =C2=A0eglibc-2.12-r15.7+svnr11982/packages-split/eglibc-thre=
ad-db.shlibdeps
>> 893K =C2=A0 =C2=A0eglibc-2.12-r15.7+svnr11982/packages-split/eglibc-util=
s
>> 4.0K =C2=A0 =C2=A0eglibc-2.12-r15.7+svnr11982/packages-split/eglibc-util=
s.shlibdeps
>> 8.0K =C2=A0 =C2=A0eglibc-2.12-r15.7+svnr11982/packages-split/ldd
>> 180K =C2=A0 =C2=A0eglibc-2.12-r15.7+svnr11982/packages-split/libcidn
>> 4.0K =C2=A0 =C2=A0eglibc-2.12-r15.7+svnr11982/packages-split/libcidn.shl=
ibdeps
>> 20K =C2=A0 =C2=A0 eglibc-2.12-r15.7+svnr11982/packages-split/libmemusage
>> 4.0K =C2=A0 =C2=A0eglibc-2.12-r15.7+svnr11982/packages-split/libmemusage=
.shlibdeps
>> 12K =C2=A0 =C2=A0 eglibc-2.12-r15.7+svnr11982/packages-split/libsegfault
>> 4.0K =C2=A0 =C2=A0eglibc-2.12-r15.7+svnr11982/packages-split/libsegfault=
.shlibdeps
>> 112K =C2=A0 =C2=A0eglibc-2.12-r15.7+svnr11982/packages-split/nscd
>> 4.0K =C2=A0 =C2=A0eglibc-2.12-r15.7+svnr11982/packages-split/nscd.shlibd=
eps
>> 428K =C2=A0 =C2=A0eglibc-2.12-r15.7+svnr11982/packages-split/sln
>>
>> eglibc-extra-nss detail (interesting that what was only link to nonexist=
ent file before is now
>> real file, maybe that's because ${libdir} ${base_libdir} points to same =
dir in micro and files
>> are overwritten during install?

yes that seems to be the reason. your patch seems ok fix

>>
>> bitbake@jama ~/tmpdir-micro/work/armv5te-oe-linux-gnueabi $ ls -lR eglib=
c-2.12-r15.7+svnr11982.old/packages-split/eglibc-extra-nss
>> eglibc-2.12-r15.7+svnr11982.old/packages-split/eglibc-extra-nss:
>> total 0
>> drwxr-xr-x 2 bitbake bitbake 160 Nov 20 09:22 lib
>>
>> eglibc-2.12-r15.7+svnr11982.old/packages-split/eglibc-extra-nss/lib:
>> total 0
>> lrwxrwxrwx 1 bitbake bitbake 23 Nov 20 09:22 libnss_hesiod.so.2 -> libns=
s_hesiod-2.12.1.so
>> lrwxrwxrwx 1 bitbake bitbake 20 Nov 20 09:22 libnss_nis.so.2 -> libnss_n=
is-2.12.1.so
>> lrwxrwxrwx 1 bitbake bitbake 24 Nov 20 09:22 libnss_nisplus.so.2 -> libn=
ss_nisplus-2.12.1.so
>>
>> bitbake@jama ~/tmpdir-micro/work/armv5te-oe-linux-gnueabi $ ls -lR eglib=
c-2.12-r15.7+svnr11982/packages-split/eglibc-extra-nss
>> eglibc-2.12-r15.7+svnr11982/packages-split/eglibc-extra-nss:
>> total 0
>> drwxr-xr-x 2 bitbake bitbake 360 Nov 20 09:42 lib
>>
>> eglibc-2.12-r15.7+svnr11982/packages-split/eglibc-extra-nss/lib:
>> total 100
>> lrwxrwxrwx 1 bitbake bitbake =C2=A0 =C2=A018 Nov 20 09:42 libnss_compat.=
so -> libnss_compat.so.2
>> lrwxrwxrwx 1 bitbake bitbake =C2=A0 =C2=A015 Nov 20 09:42 libnss_dns.so =
-> libnss_dns.so.2
>> lrwxrwxrwx 1 bitbake bitbake =C2=A0 =C2=A017 Nov 20 09:42 libnss_files.s=
o -> libnss_files.so.2
>> lrwxrwxrwx 1 bitbake bitbake =C2=A0 =C2=A018 Nov 20 09:42 libnss_hesiod.=
so -> libnss_hesiod.so.2
>> -rwxr-xr-x 1 bitbake bitbake 13840 Nov 20 09:41 libnss_hesiod.so.2
>> lrwxrwxrwx 1 bitbake bitbake =C2=A0 =C2=A015 Nov 20 09:42 libnss_nis.so =
-> libnss_nis.so.2
>> -rwxr-xr-x 1 bitbake bitbake 38496 Nov 20 09:41 libnss_nis.so.2
>> lrwxrwxrwx 1 bitbake bitbake =C2=A0 =C2=A019 Nov 20 09:42 libnss_nisplus=
.so -> libnss_nisplus.so.2
>> -rwxr-xr-x 1 bitbake bitbake 42588 Nov 20 09:41 libnss_nisplus.so.2
>>
>> Following patch was tested only with micro and maybe it's not correct at=
 all, that's why it's just RFC.
>>
>> Regards,
>
> Here is the same for SHR/eglibc build (to test it also with not-collapsed=
 /usr).
>
> bitbake@jama ~/tmpdir-shr/work $ du -hs
> eglibc-2.12-r15.7+svnr11982.old/packages-split/* | grep -v locale |
> grep -v gconv | grep -v charmap
> 4.0K =C2=A0 =C2=A0eglibc-2.12-r15.7+svnr11982.old/packages-split/catchseg=
v
> 3.0M =C2=A0 =C2=A0eglibc-2.12-r15.7+svnr11982.old/packages-split/eglibc
> 357M =C2=A0 =C2=A0eglibc-2.12-r15.7+svnr11982.old/packages-split/eglibc-d=
bg
> 208M =C2=A0 =C2=A0eglibc-2.12-r15.7+svnr11982.old/packages-split/eglibc-d=
ev
> 3.8M =C2=A0 =C2=A0eglibc-2.12-r15.7+svnr11982.old/packages-split/eglibc-d=
oc
> 100K =C2=A0 =C2=A0eglibc-2.12-r15.7+svnr11982.old/packages-split/eglibc-e=
xtra-nss
> 4.0K =C2=A0 =C2=A0eglibc-2.12-r15.7+svnr11982.old/packages-split/eglibc-e=
xtra-nss.shlibdeps
> 8.0K =C2=A0 =C2=A0eglibc-2.12-r15.7+svnr11982.old/packages-split/eglibc-p=
cprofile
> 4.0K =C2=A0 =C2=A0eglibc-2.12-r15.7+svnr11982.old/packages-split/eglibc-p=
cprofile.shlibdeps
> 201M =C2=A0 =C2=A0eglibc-2.12-r15.7+svnr11982.old/packages-split/eglibc-p=
ic
> 0 =C2=A0 =C2=A0 =C2=A0 eglibc-2.12-r15.7+svnr11982.old/packages-split/egl=
ibc-static
> 28K =C2=A0 =C2=A0 eglibc-2.12-r15.7+svnr11982.old/packages-split/eglibc-t=
hread-db
> 4.0K =C2=A0 =C2=A0eglibc-2.12-r15.7+svnr11982.old/packages-split/eglibc-t=
hread-db.shlibdeps
> 340K =C2=A0 =C2=A0eglibc-2.12-r15.7+svnr11982.old/packages-split/eglibc-u=
tils
> 4.0K =C2=A0 =C2=A0eglibc-2.12-r15.7+svnr11982.old/packages-split/eglibc-u=
tils.shlibdeps
> 8.0K =C2=A0 =C2=A0eglibc-2.12-r15.7+svnr11982.old/packages-split/ldd
> 180K =C2=A0 =C2=A0eglibc-2.12-r15.7+svnr11982.old/packages-split/libcidn
> 4.0K =C2=A0 =C2=A0eglibc-2.12-r15.7+svnr11982.old/packages-split/libcidn.=
shlibdeps
> 20K =C2=A0 =C2=A0 eglibc-2.12-r15.7+svnr11982.old/packages-split/libmemus=
age
> 4.0K =C2=A0 =C2=A0eglibc-2.12-r15.7+svnr11982.old/packages-split/libmemus=
age.shlibdeps
> 12K =C2=A0 =C2=A0 eglibc-2.12-r15.7+svnr11982.old/packages-split/libsegfa=
ult
> 4.0K =C2=A0 =C2=A0eglibc-2.12-r15.7+svnr11982.old/packages-split/libsegfa=
ult.shlibdeps
> 112K =C2=A0 =C2=A0eglibc-2.12-r15.7+svnr11982.old/packages-split/nscd
> 4.0K =C2=A0 =C2=A0eglibc-2.12-r15.7+svnr11982.old/packages-split/nscd.shl=
ibdeps
> 428K =C2=A0 =C2=A0eglibc-2.12-r15.7+svnr11982.old/packages-split/sln
>
> bitbake@jama ~/tmpdir-shr/work $ du -hs
> eglibc-2.12-r15.7+svnr11982/packages-split/* | grep -v locale | grep
> -v gconv | grep -v charmap
> 4.0K =C2=A0 =C2=A0eglibc-2.12-r15.7+svnr11982/packages-split/catchsegv
> 3.0M =C2=A0 =C2=A0eglibc-2.12-r15.7+svnr11982/packages-split/eglibc
> 357M =C2=A0 =C2=A0eglibc-2.12-r15.7+svnr11982/packages-split/eglibc-dbg
> 3.1M =C2=A0 =C2=A0eglibc-2.12-r15.7+svnr11982/packages-split/eglibc-dev
> 3.8M =C2=A0 =C2=A0eglibc-2.12-r15.7+svnr11982/packages-split/eglibc-doc
> 100K =C2=A0 =C2=A0eglibc-2.12-r15.7+svnr11982/packages-split/eglibc-extra=
-nss
> 4.0K =C2=A0 =C2=A0eglibc-2.12-r15.7+svnr11982/packages-split/eglibc-extra=
-nss.shlibdeps
> 8.0K =C2=A0 =C2=A0eglibc-2.12-r15.7+svnr11982/packages-split/eglibc-pcpro=
file
> 4.0K =C2=A0 =C2=A0eglibc-2.12-r15.7+svnr11982/packages-split/eglibc-pcpro=
file.shlibdeps
> 201M =C2=A0 =C2=A0eglibc-2.12-r15.7+svnr11982/packages-split/eglibc-pic
> 205M =C2=A0 =C2=A0eglibc-2.12-r15.7+svnr11982/packages-split/eglibc-stati=
c
> 28K =C2=A0 =C2=A0 eglibc-2.12-r15.7+svnr11982/packages-split/eglibc-threa=
d-db
> 4.0K =C2=A0 =C2=A0eglibc-2.12-r15.7+svnr11982/packages-split/eglibc-threa=
d-db.shlibdeps
> 340K =C2=A0 =C2=A0eglibc-2.12-r15.7+svnr11982/packages-split/eglibc-utils
> 4.0K =C2=A0 =C2=A0eglibc-2.12-r15.7+svnr11982/packages-split/eglibc-utils=
.shlibdeps
> 8.0K =C2=A0 =C2=A0eglibc-2.12-r15.7+svnr11982/packages-split/ldd
> 180K =C2=A0 =C2=A0eglibc-2.12-r15.7+svnr11982/packages-split/libcidn
> 4.0K =C2=A0 =C2=A0eglibc-2.12-r15.7+svnr11982/packages-split/libcidn.shli=
bdeps
> 20K =C2=A0 =C2=A0 eglibc-2.12-r15.7+svnr11982/packages-split/libmemusage
> 4.0K =C2=A0 =C2=A0eglibc-2.12-r15.7+svnr11982/packages-split/libmemusage.=
shlibdeps
> 12K =C2=A0 =C2=A0 eglibc-2.12-r15.7+svnr11982/packages-split/libsegfault
> 4.0K =C2=A0 =C2=A0eglibc-2.12-r15.7+svnr11982/packages-split/libsegfault.=
shlibdeps
> 112K =C2=A0 =C2=A0eglibc-2.12-r15.7+svnr11982/packages-split/nscd
> 4.0K =C2=A0 =C2=A0eglibc-2.12-r15.7+svnr11982/packages-split/nscd.shlibde=
ps
> 428K =C2=A0 =C2=A0eglibc-2.12-r15.7+svnr11982/packages-split/sln
>
> bitbake@jama ~/tmpdir-shr/work $ =C2=A0ls -lR
> eglibc-2.12-r15.7+svnr11982.old/packages-split/eglibc-extra-nss
> eglibc-2.12-r15.7+svnr11982.old/packages-split/eglibc-extra-nss:
> total 0
> drwxr-xr-x 2 bitbake bitbake 280 Nov 22 10:53 lib
>
> eglibc-2.12-r15.7+svnr11982.old/packages-split/eglibc-extra-nss/lib:
> total 100
> -rwxr-xr-x 1 bitbake bitbake 13840 Nov 22 10:52 libnss_hesiod-2.12.1.so
> lrwxrwxrwx 1 bitbake bitbake =C2=A0 =C2=A023 Nov 22 10:53 libnss_hesiod.s=
o.2 ->
> libnss_hesiod-2.12.1.so
> -rwxr-xr-x 1 bitbake bitbake 38496 Nov 22 10:52 libnss_nis-2.12.1.so
> lrwxrwxrwx 1 bitbake bitbake =C2=A0 =C2=A020 Nov 22 10:53 libnss_nis.so.2=
 ->
> libnss_nis-2.12.1.so
> -rwxr-xr-x 1 bitbake bitbake 42588 Nov 22 10:52 libnss_nisplus-2.12.1.so
> lrwxrwxrwx 1 bitbake bitbake =C2=A0 =C2=A024 Nov 22 10:53 libnss_nisplus.=
so.2 ->
> libnss_nisplus-2.12.1.so
> bitbake@jama ~/tmpdir-shr/work $ =C2=A0ls -lR
> eglibc-2.12-r15.7+svnr11982/packages-split/eglibc-extra-nss
> eglibc-2.12-r15.7+svnr11982/packages-split/eglibc-extra-nss:
> total 0
> drwxr-xr-x 2 bitbake bitbake 168 Nov 22 11:27 lib
>
> eglibc-2.12-r15.7+svnr11982/packages-split/eglibc-extra-nss/lib:
> total 100
> -rwxr-xr-x 1 bitbake bitbake 13840 Nov 22 11:27 libnss_hesiod-2.12.1.so
> -rwxr-xr-x 1 bitbake bitbake 38496 Nov 22 11:27 libnss_nis-2.12.1.so
> -rwxr-xr-x 1 bitbake bitbake 42588 Nov 22 11:27 libnss_nisplus-2.12.1.so
>
> Not sure if those .so are enough (cannot find any package linked to it
> now) or if it's linked against ie libnss_nis.so.2, but if someone can
> confirm it's enough I'll push that patch (with INC_PR bump).
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


