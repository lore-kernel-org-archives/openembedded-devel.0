Return-Path: <ticotimo@gmail.com>
Received: from mail-it1-f196.google.com (mail-it1-f196.google.com
	[209.85.166.196])
	by mail.openembedded.org (Postfix) with ESMTP id 3F4BA7E3B0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Jun 2019 02:54:29 +0000 (UTC)
Received: by mail-it1-f196.google.com with SMTP id q14so9914220itc.5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 09 Jun 2019 19:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=4H+UO7LxeIhlsRJsVfCIxR1232yc6LvUciqsqKDB2RI=;
	b=OHfL4s+kMB7fXJHZuUh/id90KPH5M1mFrBK45Kc73kwST3zq+J48my5IianIOWuu8o
	6/P2Q4CLQP3+vtVeZsbdnD54uZFLeGDOEzoiED71raN/FcRvM14e66OTBAfEH6ziax5k
	LT4pSRJgokupPKFkC//4cUFtIUCcUVv2MrUJEt5Vk4bAcb+aLdPYRSEV5/KInr/OIgOC
	cbE+IcO80CMdd7gynndRcVJF1SWMrgCWn3A6bV7LjBtR89DSDGpgRbfSZd/MqOyN3PDA
	eIfZ2vrDq4xDEj3yqnazRshCysjIXtX49XX4napPW5TCpDodWzbXqcEZFk80uFAsJOwv
	5qgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=4H+UO7LxeIhlsRJsVfCIxR1232yc6LvUciqsqKDB2RI=;
	b=DQzV742F6y7GlfQux+0mEZBhdmY9/xvBhqMCAIoMpEwinuCYooLj2J9FuWVUGEyXz9
	dCKg15aS/RtvWGkNw79yYI4PcT9Lj8JE7F2QJNOqmOKTy9QROOjynonbtpVp//YkZM/z
	aanFKsq1nI5kY1VNwZhTrtHpOG3sLbTRv0hbXbX2jpJsdvLqiV+wRVujGwFja74q/FMl
	XWlfLrIyTGIAry1zNiuM1PkUApJbWRcqCEuhsxm8Ci5S1NeCNAJiIhHQjgMvIIr6qRWK
	8TgrDfQOV8bGrPK+6qNIuTSevpenEOybEVNBdLujg1n8p+9ojQ3WNtKnIJs8ok4JO4h2
	vDcw==
X-Gm-Message-State: APjAAAXDXduND5Ej8d9uFIaBt38BIxBxRju1ggWkt1DnidwfCVEWjdT4
	obWvOwzU7fCM2AWEkL0cOfXNMlcyvcp2JZ+Ev0YNfw==
X-Google-Smtp-Source: APXvYqxpIfXLnZ1GIMpvEW4co5iPFzKSZvysC659cOAVPXgTc4uXB7hifpOIo5e12AlJEQDNzrO+bGFXg1Bj+UWg+Es=
X-Received: by 2002:a24:a43:: with SMTP id 64mr12993554itw.100.1560135270170; 
	Sun, 09 Jun 2019 19:54:30 -0700 (PDT)
MIME-Version: 1.0
References: <1559703841-263740-1-git-send-email-changqing.li@windriver.com>
	<1559703841-263740-3-git-send-email-changqing.li@windriver.com>
	<CANx9H-AQ46hCN=CzMQuGOWxjHeyEJz7ZyxW=HzXtJpxCAg2ZSA@mail.gmail.com>
	<1876ebf3-47eb-2fdc-d149-2f760470c6ce@windriver.com>
In-Reply-To: <1876ebf3-47eb-2fdc-d149-2f760470c6ce@windriver.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Sun, 9 Jun 2019 19:54:19 -0700
Message-ID: <CANx9H-AoWyzQZyU+uDMQAxyyXDDxcv2naEKFqXZ5fgyVm6Y-Kg@mail.gmail.com>
To: Changqing Li <changqing.li@windriver.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 2/7] python-pygobject: upgrade 3.28.3 -> 3.32.1
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
X-List-Received-Date: Mon, 10 Jun 2019 02:54:29 -0000
Content-Type: text/plain; charset="UTF-8"

Thanks!

On Sun, Jun 9, 2019 at 6:34 PM Changqing Li <changqing.li@windriver.com>
wrote:

> On 6/7/19 3:12 PM, Tim Orling wrote:
>
> Please consider providing a python3 version as well. Python2 will be EOL
> soon.
>
> Already have one under oe-core layer
>
>
> On Tue, Jun 4, 2019 at 8:04 PM <changqing.li@windriver.com> wrote:
>
>> From: Changqing Li <changqing.li@windriver.com>
>>
>> switch to meson build
>>
>> Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> ---
>>  ...thon-pygobject_3.28.3.bb => python-pygobject_3.32.1.bb} | 14
>> +++++++++-----
>>  1 file changed, 9 insertions(+), 5 deletions(-)
>>  rename meta-oe/recipes-devtools/python/{python-pygobject_3.28.3.bb =>
>> python-pygobject_3.32.1.bb} (64%)
>>
>> diff --git a/meta-oe/recipes-devtools/python/python-pygobject_3.28.3.bb
>> b/meta-oe/recipes-devtools/python/python-pygobject_3.32.1.bb
>> similarity index 64%
>> rename from meta-oe/recipes-devtools/python/python-pygobject_3.28.3.bb
>> rename to meta-oe/recipes-devtools/python/python-pygobject_3.32.1.bb
>> index 348a039..c26b383 100644
>> --- a/meta-oe/recipes-devtools/python/python-pygobject_3.28.3.bb
>> +++ b/meta-oe/recipes-devtools/python/python-pygobject_3.32.1.bb
>> @@ -4,6 +4,7 @@ SECTION = "devel/python"
>>  LICENSE = "LGPLv2.1"
>>  LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7"
>>
>> +GNOMEBASEBUILDCLASS = "meson"
>>  inherit gnomebase gobject-introspection distutils-base
>> upstream-version-is-even
>>
>>  DEPENDS += "python glib-2.0"
>> @@ -13,16 +14,19 @@ SRC_URI = " \
>>      http://ftp.gnome.org/pub/GNOME/sources/${SRCNAME}/${@gnome_verdir("${PV}")}/${SRCNAME}-${PV}.tar.xz
>> \
>>  "
>>
>> -SRC_URI[md5sum] = "3bac63c86bb963aa401f97859464aa90"
>> -SRC_URI[sha256sum] =
>> "3dd3e21015d06e00482ea665fc1733b77e754a6ab656a5db5d7f7bfaf31ad0b0"
>> +SRC_URI[md5sum] = "9d5dbca10162dd9b0d03fed0c6cf865d"
>> +SRC_URI[sha256sum] =
>> "32c99def94b8dea5ce9e4bc99576ef87591ea779b4db77cfdca7af81b76d04d8"
>>
>>  S = "${WORKDIR}/${SRCNAME}-${PV}"
>>
>> -BBCLASSEXTEND = "native"
>> +UNKNOWN_CONFIGURE_WHITELIST = "introspection"
>> +
>> +PACKAGECONFIG[cairo] = "-Dpycairo=true,-Dpycairo=false, cairo
>> python-pycairo, python-pycairo"
>> +PACKAGECONFIG[tests] = "-Dtests=true, -Dtests=false, , "
>>
>> -EXTRA_OECONF = "--disable-cairo"
>>
>> -RDEPENDS_${PN} += "python-setuptools"
>> +BBCLASSEXTEND = "native"
>> +RDEPENDS_${PN} = "python-setuptools"
>>  RDEPENDS_${PN}_class-native = ""
>>
>>  do_install_append() {
>> --
>> 2.7.4
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
> --
> BRs
>
> Sandy(Li Changqing)
>
>

