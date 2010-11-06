Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1PEs5A-0006Ja-VS
	for openembedded-devel@lists.openembedded.org;
	Sun, 07 Nov 2010 00:22:04 +0100
Received: by qwd6 with SMTP id 6so3519301qwd.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 06 Nov 2010 16:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=ZFEhXWBkt9j0Q43RCQJcXkrt8wVX5afQq+bhjmgLpX0=;
	b=g+CS4kNCMx+NzN3a7f0XhVaiI7J2J1PpRbesYVsWstzZwKbxLGTBBfkhsMnoFlOc+E
	IRTpmCE3hOzzAcPfwasie4S4dvv7EIXCUt+d8CIBYI1PU0w4sBLH6Jpzewr3l169OGD9
	7XVmUGYXnko0AKUoGq7AyE/+ioq9epClYuGvw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=XC7r6EmxOGWpLYkbo4UQtY7mAigBZQXHDx/qkR+fJvpF0D/HgdBlrKscmPZ5rru22v
	fxUw03Fqu9xIFNVv9sIguBlI9XXZQ3Nr8aICqd+fZ3bd4DC4Owm6IOoA0fTqDwU2OxLV
	2VLCzgQ1bEj+xEHkSJSoVoISxx77h7K5BYJwM=
MIME-Version: 1.0
Received: by 10.229.99.84 with SMTP id t20mr3547996qcn.120.1289085665226; Sat,
	06 Nov 2010 16:21:05 -0700 (PDT)
Received: by 10.229.212.85 with HTTP; Sat, 6 Nov 2010 16:21:05 -0700 (PDT)
In-Reply-To: <AANLkTimXqxS4rCPXuxx=_MhdKfG1yTA8gbnowUEYB0vn@mail.gmail.com>
References: <AANLkTinXYcNN=iozP-aXPDuFzQqM13KDf5my1W6DTap6@mail.gmail.com>
	<4CC500A2.7020702@gmail.com>
	<AANLkTikzjkHxbXd3iCBny0yoNPBVTH4_LyhuYfSpg-SV@mail.gmail.com>
	<AANLkTimXqxS4rCPXuxx=_MhdKfG1yTA8gbnowUEYB0vn@mail.gmail.com>
Date: Sun, 7 Nov 2010 00:21:05 +0100
Message-ID: <AANLkTimHfcqX1ZkbD+c2gx5ujupyw-hA2mpUf=LJvjcY@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.216.47
X-SA-Exim-Mail-From: andrea.adami@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Race issues (lzma-native)
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
X-List-Received-Date: Sat, 06 Nov 2010 23:22:07 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Strange...

Built today with Metadata rev fda42d9 and no issues.
Tried on Ubuntu and Gentoo 32bit

Regards

Andrea



On Thu, Nov 4, 2010 at 1:27 PM, Andrea Adami <andrea.adami@gmail.com> wrote=
:
> FWIW Issue is still present.
>
> I'll try the workaround you posted.
>
> Andrea
>
>
>
> On Tue, Oct 26, 2010 at 9:58 AM, Andrea Adami <andrea.adami@gmail.com> wr=
ote:
>> Just to add this time the race appears building on Ubuntu 10.4 32bit.
>> Last race-case (gtk+-native) was only on Gentoo and not on Ubuntu...
>>
>> Both distros are on the same Quad host and share =A0an EXT3 OpenEmbedded
>> partition, though.
>>
>> PARALLEL_MAKE =3D "-j5"
>> BB_NUMBER_THREADS =3D "4"
>>
>>
>> Perplexed...
>>
>> Andrea
>>
>> On Mon, Oct 25, 2010 at 5:59 AM, Graham Gower <graham.gower@gmail.com> w=
rote:
>>> On 10/24/2010 07:29 PM, Andrea Adami wrote:
>>>> Hello,
>>>>
>>>> during first build of console image I notice a strange fault:
>>>> subsequent builds are ok.
>>>> My scripts builds console-image and opie-image.
>>>>
>>>> ERROR: Task 2411
>>>> (virtual:native:/oe/openembedded/recipes/lzma/lzma_4.65.bb,
>>>> do_distribute_sources) failed with exit code '1'
>>>> NOTE: Unpacking ../sources/lzma465.tar.bz2 to
>>>> tmp/work/i686-linux/lzma-native-4.65-r4.1/
>>>> NOTE: package lzma-native-4.65-r4.1: task do_distribute_sources: Start=
ed
>>>> NOTE: package lzma-native-4.65-r4.1: task SRC_DISTRIBUTECOMMAND: Faile=
d
>>>> ERROR: Function 'SRC_DISTRIBUTECOMMAND' failed
>>>>
>>>>
>>>> Looking at the
>>>> run.SRC_DISTRIBUTECOMMAND.18268 =A0 16384 (failing)
>>>> run.SRC_DISTRIBUTECOMMAND.9570 =A0 =A0 34334
>>>>
>>>> it looks like the file is not complete / malformed:
>>>>
>>>> package_generate_ipkg_conf() {
>>>> <------>mkdir -p /oe/build/tmp/sysroots/i686-linux/etc/
>>>> <------>echo "src oe file:/oe/build/tmp/deploy/glibc/ipk" >
>>>> /oe/build/tmp/sysroots/i686-linux/etc/opkg.conf
>>>> <------>echo "src oe file:/
>>>> EOF
>>>>
>>>> run.do_distribute_sources.18268 =A0is empty, while second time
>>>> run.do_distribute_sources.9570 =A0 1051 contains =A0def do_distribute_=
sources(d):
>>>>
>>>> This seems indeed a race issue...
>>>>
>>>> Andrea
>>>>
>>>> _______________________________________________
>>>> Openembedded-devel mailing list
>>>> Openembedded-devel@lists.openembedded.org
>>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>>
>>> I can reproduce this one quite easily. Reverting a6a23f73 seems to make=
 it
>>> disappear. Alternately the change below works, but I'm not convinced th=
is is
>>> the right fix.
>>>
>>> Can someone with greater insight explain what causes this race?
>>>
>>> -Graham
>>>
>>>
>>> diff --git a/classes/src_distribute.bbclass b/classes/src_distribute.bb=
class
>>> index 795a5cf..98d8d88 100644
>>> --- a/classes/src_distribute.bbclass
>>> +++ b/classes/src_distribute.bbclass
>>> @@ -1,7 +1,7 @@
>>> =A0SRC_DISTRIBUTE_DLONLY ?=3D "0"
>>> =A0SRC_DISTRIBUTECOMMAND[func] =3D "1"
>>>
>>> -addtask distribute_sources before do_build after do_fetch
>>> +addtask distribute_sources before do_build after do_unpack
>>> =A0python do_distribute_sources () {
>>> =A0 =A0 =A0 =A0bb.build.exec_func("do_fetch", d)
>>>
>>>
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>>
>>
>


