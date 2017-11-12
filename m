Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 3696478480;
	Sun, 12 Nov 2017 11:48:45 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id z3so130333wme.3;
	Sun, 12 Nov 2017 03:48:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=yMZkMXaufdZHBqwzaoKL97v3NFgUXfqjZLsSbAX3vmY=;
	b=M516lXWQ1ZXJruhaeAvIBHV2DRXh70/oOzlsr9xapKF4tKoXcYOdYEP6HkFRuN3wUv
	JF12M3asfp0359j9KVJgR/VR7mzbFoy88wmf7Vr1ODqxsBMc0mm5EVeKEH6kYAw8IJRm
	FMwx73sbz1J3yxURahiLI/tBS+9fDwcVqU1fkkq0exaxwqjf8m+JL9DmZxE3BZ6W/WFH
	mUiD2uFmFQx3SkPC0xYt7K2DEG1hDJF/o77AUyyutjrJKDhBzZWVznVBJSGS/PZHGAVR
	kNs8/K8R9RpiK0EOhidT5vHsQeaJOtI36vNyH015a744T5O8gCwJkgcgQtllQK5uMfSg
	sMjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=yMZkMXaufdZHBqwzaoKL97v3NFgUXfqjZLsSbAX3vmY=;
	b=X1ivopGckjD4/f+JUcQT2HCeEgEnpP6jcnJoxEB9Du6cDbzC6x2G6U4z3/LAuBibv6
	qqR6V6PwKLoWH4+3qVOIF0yQ9G/yojdPvwDp6PzJC9B0VfC76MR7O65cRRdb8/EnKe6X
	eRfbzX6pcSgpsomI8bhg8gZnD/YfNoGzhh3kShjSu/VxNs64f66xxvm6LOwm2193oWkB
	eV9oCdVmAqf/0s3Q2UgE/F6WcuWilIpwVdPZ1aJODVdNrlhfzaLVz9rLpqVKAXa9c3tv
	jbv9PiEFZQR01jniYM1o4/j+yc0m5uqL3xWgZTjS9n4hP0JINzQCdYOQkCdksjT0RI98
	czcQ==
X-Gm-Message-State: AJaThX76xmXg3OzfZYISirhbKTOMYw08o0lFR9C+vUVBSIxONlv0xhj0
	xoRTCsHn7CNr2OQbL9Iffqkl7MEtBSn5NQBmqic=
X-Google-Smtp-Source: AGs4zMZBA5lfcUdlXnq6E7g67EayTOeFiOIkLCxEDRNas9/BDHObjm6w1lW1AabLErGIvvSkFu62i7c9TxUrRaezCOQ=
X-Received: by 10.28.118.1 with SMTP id r1mr2746428wmc.10.1510487326423; Sun,
	12 Nov 2017 03:48:46 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.173.139 with HTTP; Sun, 12 Nov 2017 03:48:45 -0800 (PST)
In-Reply-To: <CA+chaQcCtC+UZsTFVtiQF+-rPuGSk7-0nTz+raXvv6SxcQ=N0w@mail.gmail.com>
References: <151032511199.27841.6992651845996774565@git.openembedded.org>
	<20171110144512.3538E233675@git.openembedded.org>
	<CA+chaQcCtC+UZsTFVtiQF+-rPuGSk7-0nTz+raXvv6SxcQ=N0w@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sun, 12 Nov 2017 12:48:45 +0100
Message-ID: <CA+chaQc5S7D_gbcwPNR2+TmoB+Qxh1X3OdwzJNc5HSPDjMuAZg@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>, 
	Ross Burton <ross.burton@intel.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "openembedded-commits@lists.openembedded.org"
	<openembedded-commits@lists.openembedded.org>
Subject: Re: [oe-commits] [openembedded-core] 04/44: db: don't provide virtual/db
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
X-List-Received-Date: Sun, 12 Nov 2017 11:48:46 -0000
Content-Type: text/plain; charset="UTF-8"

Also, was this ever sent to ML for review? I haven't found it in my maildir
and google haven't found it in ML archive as well.

On Sat, Nov 11, 2017 at 11:45 PM, Martin Jansa <martin.jansa@gmail.com>
wrote:

> Hi,
>
> will you please send fix for:
> ERROR: Nothing PROVIDES 'virtual/db' (but meta-oe/meta-networking/
> recipes-daemons/postfix/postfix_3.2.2.bb meta-oe/meta-networking/
> recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb DEPENDS on or otherwise
> requires it).
>
> Thanks
>
> On Fri, Nov 10, 2017 at 3:45 PM, <git@git.openembedded.org> wrote:
>
>> This is an automated email from the git hooks/post-receive script.
>>
>> rpurdie pushed a commit to branch master-next
>> in repository openembedded-core.
>>
>> commit dcbc45aa3fe72c528fe4d47a783da4b4ed5ff38e
>> Author: Ross Burton <ross.burton@intel.com>
>> AuthorDate: Tue Oct 31 21:10:13 2017 +0000
>>
>>     db: don't provide virtual/db
>>
>>     As there are no alternative providers for virtual/db remove the
>> PROVIDES and
>>     recipes can just depend on db.
>>
>>     Signed-off-by: Ross Burton <ross.burton@intel.com>
>> ---
>>  meta/recipes-support/db/db_5.3.28.bb | 10 ----------
>>  1 file changed, 10 deletions(-)
>>
>> diff --git a/meta/recipes-support/db/db_5.3.28.bb
>> b/meta/recipes-support/db/db_5.3.28.bb
>> index fb4befb..fe71967 100644
>> --- a/meta/recipes-support/db/db_5.3.28.bb
>> +++ b/meta/recipes-support/db/db_5.3.28.bb
>> @@ -12,7 +12,6 @@ SECTION = "libs"
>>  SUMMARY = "Berkeley Database v5"
>>  HOMEPAGE = "http://www.oracle.com/technetwork/database/database-technol
>> ogies/berkeleydb/overview/index.html"
>>  LICENSE = "Sleepycat"
>> -VIRTUAL_NAME ?= "virtual/db"
>>  RCONFLICTS_${PN} = "db3"
>>
>>  PR = "r1"
>> @@ -37,15 +36,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=ed1158e314
>> 37f4f87cdd4ab2b8613955"
>>
>>  inherit autotools
>>
>> -# Put virtual/db in any appropriate provider of a
>> -# relational database, use it as a dependency in
>> -# place of a specific db and use:
>> -#
>> -# PREFERRED_PROVIDER_virtual/db
>> -#
>> -# to select the correct db in the build (distro) .conf
>> -PROVIDES += "${VIRTUAL_NAME}"
>> -
>>  # The executables go in a separate package - typically there
>>  # is no need to install these unless doing real database
>>  # management on the system.
>>
>> --
>> To stop receiving notification emails like this one, please contact
>> the administrator of this repository.
>> --
>> _______________________________________________
>> Openembedded-commits mailing list
>> Openembedded-commits@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-commits
>>
>
>

