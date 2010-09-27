Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P08K0-0004CW-Fw
	for openembedded-devel@lists.openembedded.org;
	Mon, 27 Sep 2010 09:40:25 +0200
Received: by iwn2 with SMTP id 2so2736845iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Sep 2010 00:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=3ypi9hBy+Q3IuVgfJqyLVTTWWlSxz3brubf0xRUhhcs=;
	b=rbWdpWjVHVIv881mAoZkN5UXnoTeBRdo/sUCl04WXCYkvFwLcQhx8GjHLdlv414YUu
	mT6xsRioRaNs8LgeHSdXkkyJAdf/aDztSa8rIojLF27IU5ihVmYtKU5T5HaNKls+Vpki
	sIpZkaLH7khmZiAHwgHL/wPvnpSMB4x+OoZBo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=wrt2NVLOknT/EqOyAVjQNfsvmFir/eGE+5+7dDYtZEcBIUQrpleUeQOSbh4R38/SvI
	Gl7KYXa8lX30dEAfDEccjml9ZtgDhe2kuu3dqUWHggM2XKwwIaAZTkl/PfIev2heiity
	fmaSpL+tDGLPC5wRKxsBLCicES7JUX6tFNQWo=
MIME-Version: 1.0
Received: by 10.231.19.3 with SMTP id y3mr8681571iba.156.1285573210538; Mon,
	27 Sep 2010 00:40:10 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Mon, 27 Sep 2010 00:40:10 -0700 (PDT)
In-Reply-To: <4CA04557.5070207@dresearch.de>
References: <1285230784-16893-1-git-send-email-sledz@dresearch.de>
	<4CA04557.5070207@dresearch.de>
Date: Mon, 27 Sep 2010 09:40:10 +0200
Message-ID: <AANLkTimNJWJz5cbMSWd+ChNxTtB9OZw_vAeoHVqNbeBq@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] linux-2.6.24: avoid kernel error if ubifs superblock read fails
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
X-List-Received-Date: Mon, 27 Sep 2010 07:40:25 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/9/27 Steffen Sledz <sledz@dresearch.de>:
> Ping!
>
> Am 23.09.2010 10:33, schrieb Steffen Sledz:
>> * .get_sb is called on mounts with automatic fs detection too, so this
>> =A0 function should not print an error if it cannot read the superblock
>> =A0 (new behaviour conforms the other fs types)
>>
>> Signed-off-by: Steffen Sledz <sledz@dresearch.de>
>> ---
>> =A0.../linux-2.6.24/ubifs-v2.6.24-silent-get-sb.patch | =A0 11 +++++++++=
++
>> =A0recipes/linux/linux_2.6.24.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0| =A0 =A01 +
>> =A02 files changed, 12 insertions(+), 0 deletions(-)
>> =A0create mode 100644 recipes/linux/linux-2.6.24/ubifs-v2.6.24-silent-ge=
t-sb.patch
>>
>> diff --git a/recipes/linux/linux-2.6.24/ubifs-v2.6.24-silent-get-sb.patc=
h b/recipes/linux/linux-2.6.24/ubifs-v2.6.24-silent-get-sb.patch
>> new file mode 100644
>> index 0000000..33f5f9f
>> --- /dev/null
>> +++ b/recipes/linux/linux-2.6.24/ubifs-v2.6.24-silent-get-sb.patch
>> @@ -0,0 +1,11 @@
>> +--- linux-2.6.24.orig/fs/ubifs/super.c =A0 =A0 =A0 2010-09-23 09:25:52.=
000000000 +0200
>> ++++ linux-2.6.24/fs/ubifs/super.c =A0 =A02010-09-23 09:36:21.000000000 =
+0200
>> +@@ -2020,8 +2020,6 @@
>> + =A0 =A0 =A0*/
>> + =A0 =A0 ubi =3D open_ubi(name, UBI_READONLY);
>> + =A0 =A0 if (IS_ERR(ubi)) {
>> +- =A0 =A0 =A0 =A0 =A0 =A0ubifs_err("cannot open \"%s\", error %d",
>> +- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0name, (int)PTR_ERR(ubi));
>> + =A0 =A0 =A0 =A0 =A0 =A0 return PTR_ERR(ubi);
>> + =A0 =A0 }
>> + =A0 =A0 ubi_get_volume_info(ubi, &vi);
>> diff --git a/recipes/linux/linux_2.6.24.bb b/recipes/linux/linux_2.6.24.=
bb
>> index 9f3655c..982038b 100644
>> --- a/recipes/linux/linux_2.6.24.bb
>> +++ b/recipes/linux/linux_2.6.24.bb
>> @@ -17,6 +17,7 @@ SRC_URI =3D "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6=
/linux-2.6.24.tar.bz2;name=3Dk
>> =A0 =A0 =A0 =A0 =A0 =A0 ${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/patch-=
${PV}.7.bz2;apply=3Dyes;name=3Dstablepatch \
>> =A0 =A0 =A0 =A0 =A0 =A0 file://squashfs-lzma-2.6.24.patch \
>> =A0 =A0 =A0 =A0 =A0 =A0 file://ubifs-v2.6.24.patch \
>> + =A0 =A0 =A0 =A0 =A0 file://ubifs-v2.6.24-silent-get-sb.patch \
>> =A0 =A0 =A0 =A0 =A0 =A0 file://defconfig"
>>
>> =A0# Moved away temporarely until committed properly (work in progress).
>

Hm, I have some concerns:

the first concern is that mainline 2.6.34 still has the code you have delet=
ed.
I'd expect that others would have bumped into this too and that it
would have been fixed this upstream.
Since it isn't, chances are that upstream might have fixed the autofs
detection in a different way.  If they do this differently maybe we
should backport that solution.

the second concern is that you fix it for a single version. If we feel
this patch is needed, I would suggest applying the patch to all linux
recipes.

and the 3rd concern is that I am not too sure whether you do not
remove a message that in other cases would be useful.

Best regards, Frans


