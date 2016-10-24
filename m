Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id DD52871B42
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Oct 2016 17:17:44 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id o81so10763502wma.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Oct 2016 10:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=qdxO3bUVTUSzdgd0CYfJJdqB/1H/BLTV7hhje3qQg/Q=;
	b=bG1ul6H/tG85cvECixLLCQ82+suhdsMcFGiezzG4MC5ncrJX8Gm9d9IERELbFVk1FH
	6Z0hNWPg5aPqJqCYUFxNZOfmZkhUEXC5+GcxL2xZ2R19QOLbEsK8kZQOvdidpIaboiaT
	VLelqHqIdW722ZtAqbF+Nsk4kwgprHvrVPxEdf3V2Z/Peuh+1XPN6T18bJptyBVrFQ1J
	Lek6iCJ4hIpSzkDlYGNOsdH9dQ+yE+Iz1qaK4cK8sW51SChRm+2DFdjMK/1UhfXwXQfn
	OjGqhn3nnBRb5z2linuBGvFTsFqoHQ+wc9PwMOMiGwtSRGF9mbBeo17+g/JlnBG774gG
	g9ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=qdxO3bUVTUSzdgd0CYfJJdqB/1H/BLTV7hhje3qQg/Q=;
	b=jtSBaOHxB9SSKKl2ddfIS03dz/7szAWetg78TOvZcCAk3R2X9zlbDL3kiShVWcsgI9
	rzYKNK/8Tv+mT6l+bU68Lb1rSHLDeRHmA9zCCnWDQYJ63sXhDeTVaStKDwIr+814Fq9a
	r3H1S0oCQilHHO36KmnIbsMdih/xuWvFcv/cz/4ntqIx+zHuKx7gUfY1O5d0a3sUUC7c
	xn5G8AJ9KLgGdmyXZnyYuVmiQAGC9F0kZlCsMPAEainB9Vn/y7HovHFhZ0quc1LelS7u
	qh/rkP25G4XeKr0n+Iync8ySsUTE5dHHaIkeUkL0Uk9lYGTX+VdjJj+23cUgUGjzNtN4
	wWSQ==
X-Gm-Message-State: ABUngvfXzME1swht5d1X9wZKSRl3E5aMy7ULLJ7EcJghR+7t+p66WCMJKjXIL+Vlr1CHWIvPabBrTk68LezXQg==
X-Received: by 10.194.216.37 with SMTP id on5mr12228026wjc.162.1477329465232; 
	Mon, 24 Oct 2016 10:17:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.159.203 with HTTP; Mon, 24 Oct 2016 10:17:44 -0700 (PDT)
In-Reply-To: <f7937b85-5a5d-7a80-8d17-9cfb5913a12a@linux.vnet.ibm.com>
References: <1475854216-6859-1-git-send-email-msbarth@linux.vnet.ibm.com>
	<CA+chaQd6QesJQpKBtxuADbAAcYBtMs3tT-_JfqatAwip1uZOBw@mail.gmail.com>
	<f7937b85-5a5d-7a80-8d17-9cfb5913a12a@linux.vnet.ibm.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 24 Oct 2016 19:17:44 +0200
Message-ID: <CA+chaQcCHkGGm3cgS-xK4DupHzwzpj4T+EngUv-aqBGWdEXOWg@mail.gmail.com>
To: msbarth <msbarth@linux.vnet.ibm.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v2] autoconf-archive: 2012.04.07 -> 2016.09.16
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 24 Oct 2016 17:17:45 -0000
Content-Type: text/plain; charset=UTF-8

Then you (or someone else) need to fix gnome-common, before this is merged.

On Mon, Oct 24, 2016 at 6:55 PM, msbarth <msbarth@linux.vnet.ibm.com> wrote:

> These macros should be provided by the autoconf-archive recipe as
> gnome-common has been deprecated in favour of using the macros from the
> latest upstream autoconf-archive which this patch set is moving to.
>
> On 10/12/2016 03:26 PM, Martin Jansa wrote:
>
> Some files from this conflict with gnome-common:
>
> ERROR: autoconf-archive-2016.09.16-r0 do_populate_sysroot: The recipe autoconf-archive is trying to install files into a shared area when those files already exist. Those files and their manifest location are:
>    sysroots/qemux86/usr/share/aclocal/ax_check_enable_debug.m4
>  Matched in b'manifest-qemux86-gnome-common.populate_sysroot'
>  sysroots/qemux86/usr/share/aclocal/ax_code_coverage.m4
>  Matched in b'manifest-qemux86-gnome-common.populate_sysroot'
> Please verify which recipe should provide the above files.
>
>
> On Fri, Oct 7, 2016 at 5:30 PM, Matthew Barth <msbarth@linux.vnet.ibm.com>
> wrote:
>
>> Signed-off-by: Matthew Barth <msbarth@linux.vnet.ibm.com>
>> ---
>>  meta-oe/recipes-devtools/autoconf-archive/autoconf-archive.inc    | 7
>> ++++---
>>  ...oconf-archive_2012.04.07.bb => autoconf-archive_2016.09.16.bb} | 8
>> +++-----
>>  2 files changed, 7 insertions(+), 8 deletions(-)
>>  rename meta-oe/recipes-devtools/autoconf-archive/{autoconf-archive_
>> 2012.04.07.bb => autoconf-archive_2016.09.16.bb} (55%)
>>
>> diff --git a/meta-oe/recipes-devtools/autoconf-archive/autoconf-archive.inc
>> b/meta-oe/recipes-devtools/autoconf-archive/autoconf-archive.inc
>> index 9399363..2b5df70 100644
>> --- a/meta-oe/recipes-devtools/autoconf-archive/autoconf-archive.inc
>> +++ b/meta-oe/recipes-devtools/autoconf-archive/autoconf-archive.inc
>> @@ -1,15 +1,16 @@
>> +SUMMARY = "A collection of macros for GNU Autoconf"
>> +DESCRIPTION = "The autoconf-archive set of macros extend the pre-defined
>> \
>> +capabilities within the complete autoconf tool set."
>>  LICENSE = "GPLv3"
>>  HOMEPAGE = "http://www.gnu.org/software/autoconf-archive/"
>>  SECTION = "devel"
>> -
>>  DEPENDS += "m4-native"
>>  DEPENDS_class-native = "m4-native gnu-config-native"
>>  DEPENDS_class-nativesdk = "m4-nativesdk gnu-config-nativesdk"
>> -
>>  RDEPENDS_${PN} = "m4 gnu-config"
>>  RDEPENDS_${PN}_class-native = "m4-native gnu-config-native"
>>  RDEPENDS_${PN}_class-nativesdk = "m4-nativesdk gnu-config-nativesdk"
>>
>> -SRC_URI = "${GNU_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2"
>> +SRC_URI = "${GNU_MIRROR}/${BPN}/${BPN}-${PV}.tar.xz"
>>
>>  inherit autotools
>> diff --git a/meta-oe/recipes-devtools/autoconf-archive/autoconf-archive
>> _2012.04.07.bb b/meta-oe/recipes-devtools/autoconf-archive/
>> autoconf-archive_2016.09.16.bb
>> similarity index 55%
>> rename from meta-oe/recipes-devtools/autoconf-archive/autoconf-archive_
>> 2012.04.07.bb
>> rename to meta-oe/recipes-devtools/autoconf-archive/autoconf-archive_
>> 2016.09.16.bb
>> index 5baaecc..1a0470c 100644
>> --- a/meta-oe/recipes-devtools/autoconf-archive/autoconf-archive
>> _2012.04.07.bb
>> +++ b/meta-oe/recipes-devtools/autoconf-archive/autoconf-archive
>> _2016.09.16.bb
>> @@ -1,13 +1,11 @@
>>  require autoconf-archive.inc
>>
>> -
>> -PARALLEL_MAKE = ""
>> -
>>  LICENSE = "GPLv2 & GPLv3"
>>  LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
>>
>> -SRC_URI[md5sum] = "e842c5b9fae021007bd70550362e5e80"
>> -SRC_URI[sha256sum] = "040b443bf68efd52fbfcb294b556b
>> fbbbfe432db78445ca25e0cfe2e88f96a14"
>> +SRC_URI[md5sum] = "bf19d4cddce260b3c3e1d51d42509071"
>> +SRC_URI[sha256sum] = "e8f2efd235f842bad2f6938bf4a72
>> 240a5e5fcd248e8444335e63beb60fabd82"
>>
>>  EXTRA_OECONF += "ac_cv_path_M4=m4"
>> +
>>  BBCLASSEXTEND = "native nativesdk"
>> --
>> 1.9.1
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
>
>
>

