Return-Path: <net147@gmail.com>
Received: from mail-pd0-f178.google.com (mail-pd0-f178.google.com
	[209.85.192.178])
	by mail.openembedded.org (Postfix) with ESMTP id 9AFC861663;
	Mon, 15 Jul 2013 13:08:03 +0000 (UTC)
Received: by mail-pd0-f178.google.com with SMTP id w11so10763484pde.37
	for <multiple recipients>; Mon, 15 Jul 2013 06:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=4jJJo6FdMe1DK1Q0Do6/fKijXCrqfP41kJ3H1wW+fbg=;
	b=dQ7VrfNKS5GLHq40VszqZTGLokl0n+LnknsPAgcQMoEzpvi123BuhKRuw6Br81lOLM
	rvpaEP/6tpWlULTN7MvziYy+XISbhVs7vhnP/mZbFWR/jlVSROouonAzvhnkEs7GzoAe
	X5M2so7GWiVFsvvq5uqvzEeV70BStWCBqAl2FtHO6CHf9tGgSFU3eAvMEibVPbb3uTs5
	gAhd47cUjjtzNZR0j50ViVA1yzG3RYeOBW1FzI4nQ1uSSNNtyqwhJwZlbYAe5G8pIZaN
	jxeMN7lno0hgnSrmlMVqJrem9r030Q8lLJ6F8qANIIltIcxYZXk274575F28xJ8MrcVX
	E0DQ==
X-Received: by 10.68.99.98 with SMTP id ep2mr5102146pbb.6.1373893684356;
	Mon, 15 Jul 2013 06:08:04 -0700 (PDT)
Received: from [192.168.0.2] (60-242-179-244.static.tpgi.com.au.
	[60.242.179.244]) by mx.google.com with ESMTPSA id
	ht5sm15271522pbb.29.2013.07.15.06.08.01 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 15 Jul 2013 06:08:03 -0700 (PDT)
Message-ID: <51E3F30A.2070205@gmail.com>
Date: Mon, 15 Jul 2013 23:03:06 +1000
From: Jonathan Liu <net147@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130620 Thunderbird/17.0.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <20130708083024.252B2502D7@opal>
	<CALbNGRT+FYkwWQzvaSUo0zarUx7MyNEJWjWs17M0cP2z6iYgBw@mail.gmail.com>
In-Reply-To: <CALbNGRT+FYkwWQzvaSUo0zarUx7MyNEJWjWs17M0cP2z6iYgBw@mail.gmail.com>
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Jonathan Liu : qt-creator: add new recipe for version 2.7.2
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
X-List-Received-Date: Mon, 15 Jul 2013 13:08:04 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

On 15/07/2013 7:03 PM, Andreas Müller wrote:
> On Mon, Jul 8, 2013 at 10:30 AM,  <git@git.openembedded.org> wrote:
>> Module: meta-openembedded.git
>> Branch: master
>> Commit: 4d2b8ed90614a21d8d7d7c38d013c0c74d9ffffc
>> URL:    http://git.openembedded.org/?p=meta-openembedded.git&a=commit;h=4d2b8ed90614a21d8d7d7c38d013c0c74d9ffffc
>>
>> Author: Jonathan Liu <net147@gmail.com>
>> Date:   Sat Jul  6 02:46:58 2013 +0000
>>
>> qt-creator: add new recipe for version 2.7.2
>>
>> Signed-off-by: Jonathan Liu <net147@gmail.com>
>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>>
>> ---
>>
>>   meta-oe/recipes-qt/qt-creator/qt-creator_2.7.2.bb |   30 +++++++++++++++++++++
>>   1 files changed, 30 insertions(+), 0 deletions(-)
>>
>> diff --git a/meta-oe/recipes-qt/qt-creator/qt-creator_2.7.2.bb b/meta-oe/recipes-qt/qt-creator/qt-creator_2.7.2.bb
>> new file mode 100644
>> index 0000000..2948d81
>> --- /dev/null
>> +++ b/meta-oe/recipes-qt/qt-creator/qt-creator_2.7.2.bb
>> @@ -0,0 +1,30 @@
>> +DESCRIPTION = "Lightweight, cross-platform integrated development environment"
>> +
>> +HOMEPAGE = "http://qt-project.org/"
>> +LICENSE = "LGPLv2.1"
>> +LIC_FILES_CHKSUM = "file://LGPL_EXCEPTION.TXT;md5=eb6c371255e1262c55ae9b652a90b528 \
>> +                    file://LICENSE.LGPL;md5=243b725d71bb5df4a1e5920b344b86ad"
>> +SECTION = "qt/app"
>> +
>> +SRC_URI = "http://download.qt-project.org/official_releases/qtcreator/2.7/${PV}/${BP}-src.tar.gz"
>> +SRC_URI[md5sum] = "7f1c10740784d3edf2347c27be21fd1a"
>> +SRC_URI[sha256sum] = "5df913faa43a5fbf44fb1f25faaf6d258134b8f9e6b8ef8a21277136dec9e189"
>> +
>> +S = "${WORKDIR}/${BP}-src"
>> +
>> +inherit qt4x11
>> +
>> +do_install() {
>> +       oe_runmake INSTALL_ROOT=${D}${prefix} install
>> +       oe_runmake INSTALL_ROOT=${D}${prefix} install_docs
>> +       rm -f ${D}${libdir}/qtcreator/lib*.so
>> +}
>> +
>> +FILES_${PN} += "${datadir}/icons \
>> +                ${datadir}/qtcreator \
>> +                ${libdir}/qtcreator/*"
>> +FILES_${PN}-dbg += "${datadir}/qtcreator/*/*/*/*/.debug \
>> +                    ${libdir}/qtcreator/.debug \
>> +                    ${libdir}/qtcreator/*/*/.debug"
>> +RRECOMMENDS_${PN} += "packagegroup-core-buildessential \
>> +                      packagegroup-qt-toolchain-target"
>>
> I get
>
> Log data follows:
> | DEBUG: Executing python function sysroot_cleansstate
> | DEBUG: Python function sysroot_cleansstate finished
> | DEBUG: Executing shell function do_configure
> | NOTE: using qmake spec in
> /home/andreas/tmp/oe-core-eglibc/sysroots/overo/usr/share/qt4/mkspecs/linux-gnueabi-oe-g++,
> using profiles ''
> | Project MESSAGE: Cannot build Qt Creator with Qt version .
> | Project ERROR: Use at least Qt 4.8.0.
> | ERROR: Error calling
> /home/andreas/tmp/oe-core-eglibc/sysroots/x86_64-linux/usr/bin/qmake2
> on qtcreator.pro
> | ERROR: Function failed: do_configure (see
> /home/andreas/tmp/oe-core-eglibc/work/cortexa8hf-vfp-neon-angstrom-linux-gnueabi/qt-creator/2.7.2-r0/temp/log.do_configure.29576
> for further information)
>
> Is it possible that iti is caused by checking host's qt version (this is 4.7.4)?
>
> Andreas
Are you using the latest openembedded-core master? These have been many 
fixes for Qt.
For example: 
http://cgit.openembedded.org/openembedded-core/commit/?id=dcaa40e65d986587fa7c44f4285bbd0883478cc3

Regards,
Jonathan

