Return-Path: <naresh.bhat@linaro.org>
Received: from mail-ob0-f170.google.com (mail-ob0-f170.google.com
	[209.85.214.170])
	by mail.openembedded.org (Postfix) with ESMTP id E0332755CC
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Jun 2015 09:35:52 +0000 (UTC)
Received: by obbea2 with SMTP id ea2so123422981obb.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 02 Jun 2015 02:35:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=U6+rNAN81w+0VHQMvmQz5xhG/WQUcTH10FsLF2taMZE=;
	b=T4RPRvi0KOTq79Y8acYhTdI4QPG9da3dX1BFnfyRvA5bWo5Pn28tT0DdqJ6lUyX7Sv
	hXcsTT4F7zrf2oWzNo5jVVmoZNLUejt281+YxNy/g12hdJC3snbPjR1bAp9KHNMPOE42
	LqTt5bzc8/aCVjRKDfHW0chWVU5111gKzxh6p5Ekkz4HXyTclJ5ZdTvuSDegWq7KGnoM
	0IsCOGd3tvczdOBhwyL6NgFI6qj+F6ISf8q8FlHhoCvGKccNq7I/aDgWbAIKBX7yfluQ
	OIKIHVslzwVizcV7pCa/pluQBKMPt0kFd7s8N5UzMoL3q15QzSONDRSenjSclYnhNw1Q
	euuw==
X-Gm-Message-State: ALoCoQnBVQLo0hkgEvsCuJoY1phPfeZ1xZ+SiK6H5P9RgMpEB1+c3WGvZx3ABUeroMM5qsKw0VP9
MIME-Version: 1.0
X-Received: by 10.182.16.161 with SMTP id h1mr824928obd.49.1433237753491; Tue,
	02 Jun 2015 02:35:53 -0700 (PDT)
Received: by 10.60.167.75 with HTTP; Tue, 2 Jun 2015 02:35:53 -0700 (PDT)
In-Reply-To: <CAMKF1spR8ScXYM2pViEaY1=7DcXLcdKTxCKfQw_P-QETpgsWOw@mail.gmail.com>
References: <1433170089-9030-1-git-send-email-naresh.bhat@linaro.org>
	<CAMKF1spR8ScXYM2pViEaY1=7DcXLcdKTxCKfQw_P-QETpgsWOw@mail.gmail.com>
Date: Tue, 2 Jun 2015 15:05:53 +0530
Message-ID: <CAFoFrHaqZMm6bSXFpFOf8pvux=Mz4+vbHsvtbG-s=YgT-KXriQ@mail.gmail.com>
From: Naresh Bhat <naresh.bhat@linaro.org>
To: openembedded-devel@lists.openembedded.org
Cc: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
Subject: Re: [meta-filesystems][PATCH] xorriso: Add xorriso v1.4.0
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 02 Jun 2015 09:35:53 -0000
Content-Type: text/plain; charset=UTF-8

Hi Khem Raj,

On 1 June 2015 at 23:40, Khem Raj <raj.khem@gmail.com> wrote:
> On Mon, Jun 1, 2015 at 7:48 AM, Naresh Bhat <naresh.bhat@linaro.org> wrote:
>> Add xorriso v1.4.0 based on the discussions
>> http://patchwork.openembedded.org/patch/91143/
>> http://lists.openembedded.org/pipermail/openembedded-devel/2015-April/100981.html
>> We have tested this package with
>> Montavista CGE product - http://www.mvista.com/ and
>> luvOS distribution - https://01.org/linux-uefi-validation build.
>> Inherit the pkgconfig to avoid the below error,
>> ..
>> ...
>> | disabled use of O_DIRECT with input of -as cdrskin
>> | luv-yocto/build/tmp/work/aarch64-oe-linux/xorriso/1.4.0-r0/xorriso-1.4.0/
>> configure: line 14352: syntax error near unexpected token `LIBCDIO,'
>> | luv-yocto/build/tmp/work/aarch64-oe-linux/xorriso/1.4.0-r0/xorriso-1.4.0/
>> configure: line 14352: `    PKG_CHECK_MODULES(LIBCDIO, libcdio >= $LIBCDIO_REQUIRED)'
>> ...
>> ....
>>
>> Signed-off-by: Naresh Bhat <naresh.bhat@linaro.org>
>> Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
>> Signed-off-by: Gaurang Shastri <gshastri@juniper.net>
>> ---
>>  .../recipes-utils/xorriso/xorriso_1.4.0.bb         |   30 ++++++++++++++++++++
>>  1 file changed, 30 insertions(+)
>>  create mode 100644 meta-filesystems/recipes-utils/xorriso/xorriso_1.4.0.bb
>>
>> diff --git a/meta-filesystems/recipes-utils/xorriso/xorriso_1.4.0.bb b/meta-filesystems/recipes-utils/xorriso/xorriso_1.4.0.bb
>> new file mode 100644
>> index 0000000..2f81f0d
>> --- /dev/null
>> +++ b/meta-filesystems/recipes-utils/xorriso/xorriso_1.4.0.bb
>> @@ -0,0 +1,30 @@
>> +DESCRIPTIONS = "xorriso copies file objects from POSIX compliant filesystems \
>> +into Rock Ridge enhanced ISO 9660 filesystems and allows session-wise \
>> +manipulation of such filesystems"
>> +
>> +LICENSE = "GPLv3"
>> +LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
>> +
>> +# with, without, depends, rdepends
>> +#
>> +PACKAGECONFIG ??= "acl attr zlib bzip2 readline"
>> +PACKAGECONFIG[acl] = "--enable-libacl,--disable-libacl,acl,"
>> +PACKAGECONFIG[attr] = "--enable-xattr,--disable-xattr,attr,"
>> +PACKAGECONFIG[zlib] = "--enable-zlib,--disable-zlib,zlib,"
>> +PACKAGECONFIG[bzip2] = "--enable-libbz2,--disable-libbz2,bzip2,"
>> +PACKAGECONFIG[readline] = "--enable-libreadline,--disable-libreadline,readline,"
>> +
>> +RDEPENDS_${PN} = "tk"
>> +
>> +inherit autotools-brokensep pkgconfig
>
> would be good if it did not need brokensep but probably its ok to have
> it done as a follow up.
I understand.  If you are ok with it.  We want to take it as a follow
up activity.
>
>> +
>> +SRC_URI = "http://www.gnu.org/software/${BPN}/${BPN}-${PV}.tar.gz"
>> +
>> +do_configure_prepend () {
>> +    touch NEWS
>> +}
>> +
>> +BBCLASSEXTEND = "native"
>> +
>> +SRC_URI[md5sum] = "ec79fd2736b8da76e7a870e27cadf6fa"
>> +SRC_URI[sha256sum] = "0bd1e085015b28c24f57697d6def2fe84517967dc417554c0c3ccf1685ed0e56"
>> --
>> 1.7.9.5
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

