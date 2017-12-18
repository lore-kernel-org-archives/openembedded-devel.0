Return-Path: <asselsm@gmail.com>
Received: from mail-yb0-f193.google.com (mail-yb0-f193.google.com
	[209.85.213.193])
	by mail.openembedded.org (Postfix) with ESMTP id DE95671C42
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Dec 2017 15:33:36 +0000 (UTC)
Received: by mail-yb0-f193.google.com with SMTP id g198so4771932yba.7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Dec 2017 07:33:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:reply-to:sender:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=wLJV/Ljy9P0//Zi+98Q/FFwovVzI4H7QBoMnG8Hfrz0=;
	b=pVWO9/ns+38g6x4AUMoOSsd60QqDbkob/DTx6dFSNPKsEpZl0+8jWpfnbiVDMRt6Yq
	gfXmCS8qRI431ia2ftxx4hnGtP+el0D+G4agX34sYrJD68Q9YyMP/5LdGITcfa4//0yf
	yx0MusMLg8s8NV+FuDuDpDtMF6gYZ60nirlQEHzcgCASMfn+YOm6s9ePcilGzwR7JFgR
	7Z0Uev9iBCTFJaeniuw0XI8QARlVmItA8vFnahvCUagP94LqG9BdD1+CzNP2Twn55Tv7
	K7gbnTtJn98KyUtDr+lv47udNqZB4IynwBVFWgDOY7VaItUWqx1mNzfsoWuz+MyJeHFb
	/+kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:reply-to:sender:in-reply-to
	:references:from:date:message-id:subject:to:cc;
	bh=wLJV/Ljy9P0//Zi+98Q/FFwovVzI4H7QBoMnG8Hfrz0=;
	b=g5H23wWFDZ95jxYEDK/t5BzNrDcX3qbim4q+WEnT3tIQjthhfe/xJ2UOMQRZ9qWSul
	08HPB/DG9oiOBSqvKqtlksB5u46CAk1uZpJgpzX1doLWIdEIer7+Q9G+gDCESakq1qdL
	wDFRDPdvbizg9H9m9X6P+0IOGrKs7shFFW+fE7tmIFqMiiThfbYz6CmCTtMCc976B1hz
	zLkNzhPt3dXIxdaD/35r3bQv7kg8m08ptzzvmPcmfBvO2R3YTgGOOPnLOumeI3sKKZda
	IlKgkhmNje5R+St2F2zRh/U7xe65ahArWFon8OfePo3sUJRe+nGL3tJfywptfEZpubYV
	uNJg==
X-Gm-Message-State: AKGB3mI9YMowiILGpSVYo+0r2uir6xkDmGagh5ON4BeeTf9zy98SEsdo
	E1jJKOdI12ObopZUjNGL9A+gyeSkQb8TZsywIIPtI64i
X-Google-Smtp-Source: ACJfBotDGKmHH1PMsJhe5RA8ju+WYmbIrjaWH8K+ENUr/MVI9dXt1p8DVGiZ4S28SfyCYBIF08aWrvyFJBW4UbKMslU=
X-Received: by 10.129.97.5 with SMTP id v5mr115720ywb.394.1513611217647; Mon,
	18 Dec 2017 07:33:37 -0800 (PST)
MIME-Version: 1.0
Reply-To: mark.asselstine@windriver.com
Sender: asselsm@gmail.com
Received: by 10.37.189.69 with HTTP; Mon, 18 Dec 2017 07:33:36 -0800 (PST)
In-Reply-To: <CADNbA1qnmF3-MKo=fqQQeWEedE5A-wzkUkCgdCNArOePjMaXQw@mail.gmail.com>
References: <1512414044-1012-1-git-send-email-mark.asselstine@windriver.com>
	<CADNbA1qnmF3-MKo=fqQQeWEedE5A-wzkUkCgdCNArOePjMaXQw@mail.gmail.com>
From: Mark Asselstine <mark.asselstine@windriver.com>
Date: Mon, 18 Dec 2017 10:33:36 -0500
X-Google-Sender-Auth: fHpv5AbnFDAnMjb3M-BQByh6FyM
Message-ID: <CAPuovEKdqQP35XwP3bgBrE4EFbM2LwpHrHzxF3my9qaWfAaCbA@mail.gmail.com>
To: Derek Straka <derek@asterius.io>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCH] python-pyroute2: uprev to v0.4.21 (from 0.3.22)
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
X-List-Received-Date: Mon, 18 Dec 2017 15:33:37 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Dec 16, 2017 at 4:58 PM, Derek Straka <derek@asterius.io> wrote:
> On Mon, Dec 4, 2017 at 2:00 PM, Mark Asselstine <
> mark.asselstine@windriver.com> wrote:
>
>> Drop the json<-->simplejson patch instead opting to depend on
>> python-json (part of core python libs). Beyond this the uprev is
>> straightforward.
>>
>> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
>> ---
>>  .../recipes-devtools/python/python-pyroute2.inc    | 23
>> +++++--------------
>>  .../import-simplejson-as-json.patch                | 26
>> ----------------------
>>  ...yroute2_0.3.22.bb => python-pyroute2_0.4.21.bb} |  0
>>  ...route2_0.3.22.bb => python3-pyroute2_0.4.21.bb} |  0
>>  4 files changed, 6 insertions(+), 43 deletions(-)
>>  delete mode 100644 meta-python/recipes-devtools/
>> python/python-pyroute2/import-simplejson-as-json.patch
>>  rename meta-python/recipes-devtools/python/{python-pyroute2_0.3.22.bb =>
>> python-pyroute2_0.4.21.bb} (100%)
>>  rename meta-python/recipes-devtools/python/{python3-pyroute2_0.3.22.bb
>> => python3-pyroute2_0.4.21.bb} (100%)
>>
>> diff --git a/meta-python/recipes-devtools/python/python-pyroute2.inc
>> b/meta-python/recipes-devtools/python/python-pyroute2.inc
>> index da1d4cd..521162c 100644
>> --- a/meta-python/recipes-devtools/python/python-pyroute2.inc
>> +++ b/meta-python/recipes-devtools/python/python-pyroute2.inc
>> @@ -1,26 +1,15 @@
>>  SUMMARY = "A pure Python netlink and Linux network configuration library"
>>  LICENSE = "GPLv2 & Apache-2.0"
>>  LIC_FILES_CHKSUM = "file://LICENSE.GPL.v2;md5=
>> b234ee4d69f5fce4486a80fdaf4a4263 \
>> -                    file://LICENSE.Apache.v2;md5=
>> 3b83ef96387f14655fc854ddc3c6bd57"
>> +                    file://LICENSE.Apache.v2;md5=
>> 34281e312165f843a2b7d1f114fe65ce"
>>
>> -SRC_URI[md5sum] = "733adb362b6603c7269c0b3df3045a55"
>> -SRC_URI[sha256sum] = "5cdf44656cf623369f0cbf183d9d14
>> a1a50ebdffbd50d4e30ffda62c0a05d7b3"
>> -
>> -SRC_URI += "file://import-simplejson-as-json.patch"
>> +SRC_URI[md5sum] = "9c251543c4282a2f8b1a8d6aa8afc688"
>> +SRC_URI[sha256sum] = "7afad28ee0a0f3e7c34adaa9f953d0
>> 0560ed9910203e93f107833b6e8d151171"
>>
>>
> Can we remove the extra path prepend now?
>
>>  FILESEXTRAPATHS_prepend := "${THISDIR}/python-pyroute2:"

Sure. I will send a V2 once we get agreement on the RDEPENDS.

>>
>>  inherit pypi
>>
>> -RDEPENDS_${PN} += "\
>> -  ${PYTHON_PN}-distutils \

stdlib

>> -  ${PYTHON_PN}-simplejson \

per the commit log, use json instead to match upstream expectations.

>> -  ${PYTHON_PN}-multiprocessing \

stdlib

>> -  ${PYTHON_PN}-io ${PYTHON_PN}-pprint \

stdlib

>> -  ${PYTHON_PN}-pickle \

stdlib

>> -  ${PYTHON_PN}-logging \

stdlib

>> -  ${PYTHON_PN}-threading \

stdlib

>> -  ${PYTHON_PN}-textutils \

No reference in this version of pyroute2

>> -  ${PYTHON_PN}-subprocess \

stdlib

>> -  ${PYTHON_PN}-netclient \

No reference in this version of pyroute2

>> -"
>>
> None of these other dependencies are needed for a minimal python install?

Sorry, I should have covered this in my commit log. This was a mistake on my
part but was intentional since these are all stdlib modules as I have show
above and as is described in the the pyroute2 README:
"Pyroute2 is a pure Python **netlink** library. It requires only Python stdlib"

All stdlib modules are listed as RDEPENDS in python[3]-modules so we are
only making work for ourselves breaking these out here. I will put them back
but if we go this route, of listed stdlib RDEPENDS, then there is a lot of work
to ensure this is consistent across all our python recipes.


Mark


>
>> +RDEPENDS_${PN} += " \
>> +    ${PYTHON_PN}-json \
>> +    "
>> diff --git a/meta-python/recipes-devtools/python/python-
>> pyroute2/import-simplejson-as-json.patch b/meta-python/recipes-
>> devtools/python/python-pyroute2/import-simplejson-as-json.patch
>> deleted file mode 100644
>> index d73da07..0000000
>> --- a/meta-python/recipes-devtools/python/python-
>> pyroute2/import-simplejson-as-json.patch
>> +++ /dev/null
>> @@ -1,26 +0,0 @@
>> -Upstream-Status: Inappropriate [wrong dependency]
>> -
>> -Subject: [PATCH] import simplejson as json
>> -
>> -At runtime python-pyroute2 tries to import json, but the module is not
>> -available, import simplejson as json solve the issue.
>> -
>> -Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
>> ----
>> - pyroute2/netlink/rtnl/ifinfmsg.py | 2 +-
>> - 1 file changed, 1 insertion(+), 1 deletion(-)
>> -
>> -diff --git a/pyroute2/netlink/rtnl/ifinfmsg.py b/pyroute2/netlink/rtnl/
>> ifinfmsg.py
>> -index 4f14f25..55643eb 100644
>> ---- a/pyroute2/netlink/rtnl/ifinfmsg.py
>> -+++ b/pyroute2/netlink/rtnl/ifinfmsg.py
>> -@@ -1,5 +1,5 @@
>> - import os
>> --import json
>> -+import simplejson as json
>> - import errno
>> - import select
>> - import struct
>> ---
>> -2.1.4
>> -
>> diff --git a/meta-python/recipes-devtools/python/python-pyroute2_0.3.22.bb
>> b/meta-python/recipes-devtools/python/python-pyroute2_0.4.21.bb
>> similarity index 100%
>> rename from meta-python/recipes-devtools/python/python-pyroute2_0.3.22.bb
>> rename to meta-python/recipes-devtools/python/python-pyroute2_0.4.21.bb
>> diff --git a/meta-python/recipes-devtools/python/python3-
>> pyroute2_0.3.22.bb b/meta-python/recipes-devtools/python/python3-
>> pyroute2_0.4.21.bb
>> similarity index 100%
>> rename from meta-python/recipes-devtools/python/python3-pyroute2_0.3.22.bb
>> rename to meta-python/recipes-devtools/python/python3-pyroute2_0.4.21.bb
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
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

