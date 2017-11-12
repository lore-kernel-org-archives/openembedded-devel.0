Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id A2FB17858D;
	Sun, 12 Nov 2017 17:23:08 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id j28so7867536pfk.8;
	Sun, 12 Nov 2017 09:23:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=jN5hXj2hRcsZSowHDNj7TP4XFObAO0Ipj/H9PyIuBAk=;
	b=ousYDEPtwU8qdAHoT+bGFNZY3dOA5r58Z/BXc3FsBdkFUwsXJpddRS6IXq5pfQPtTr
	XfA7W1khIkO04+ja5D/gv/Jl0pDn4rJQ17V4kfS3hbaIA92NcODXkNNJcTAsoIdwoVhg
	ZNpNIta69/AUnFIoYUrzZeVkttDcZaAig1zyScrk5rFOwqn63BJtlcouxE2qKwRQ5WIl
	pHNaCnVh4BvGQNCpEnN7c7noFYactgKff9ueXHjbw9k890KBcz+yqLzpENMzOc3vLiut
	t6awwJ3hn/WM6IPmVrlUGPVOoWe++jkBXF3WPMvnShyh0rGs3Hiplyknu3D+h5O3JNaq
	8PIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=jN5hXj2hRcsZSowHDNj7TP4XFObAO0Ipj/H9PyIuBAk=;
	b=k6NqcGq/sumE0lwcwp/+IfX0HOHQzpWM5gKAmkiyi+LdH5pbZl4WEQgvDqRL1C3M7O
	3HC/NCMlz2aW8dVs58qKl2TWqdPdpZDYUFgYBx2J8yyW/78uynzwLBAFVODbMTTcItqj
	TAKWUh70hggFp+WVMtCYa3jlGo7Ht82xPADK3LeFSLoz7rPdq6fGsrN3ThU2VnfLQ8Z+
	Tpci/b8M95N2/ztjP2Kd5PubVavyDURVlU+QeBFjNN2zaem/gYW+XFADTjJtOUDCoHBU
	n5JCvO8z8JYlzxC3Wr23wuVWiFM/l//7k1w7tgijBJ38i2A/AJEbGVJcg7VmK6jIWGQY
	Tfjw==
X-Gm-Message-State: AJaThX4DcIdYQPbSdE1L4o/efMigPA3z3LSNozuMXGroOhoMlXC+GaJk
	gBElkVZ4/ruiqooikIQmEKdOgCQextZVi9VYJ90=
X-Google-Smtp-Source: AGs4zMbuh+8Aw7dj8DTBbPobCrvMlc4UShe8fFJ4qCN+k5WoEQQox/c4zoDRipAJ7yPPqJkylivekGGVNy48kqEUHig=
X-Received: by 10.98.207.71 with SMTP id b68mr7158116pfg.125.1510507389485;
	Sun, 12 Nov 2017 09:23:09 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.167.106 with HTTP; Sun, 12 Nov 2017 09:22:38 -0800 (PST)
In-Reply-To: <CA+chaQc5S7D_gbcwPNR2+TmoB+Qxh1X3OdwzJNc5HSPDjMuAZg@mail.gmail.com>
References: <151032511199.27841.6992651845996774565@git.openembedded.org>
	<20171110144512.3538E233675@git.openembedded.org>
	<CA+chaQcCtC+UZsTFVtiQF+-rPuGSk7-0nTz+raXvv6SxcQ=N0w@mail.gmail.com>
	<CA+chaQc5S7D_gbcwPNR2+TmoB+Qxh1X3OdwzJNc5HSPDjMuAZg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 12 Nov 2017 09:22:38 -0800
Message-ID: <CAMKF1srK9j6UVu=9dHQOSREauBm_Pv89TF+fen_xXpFT3=C4Ng@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: "openembedded-commits@lists.openembedded.org"
	<openembedded-commits@lists.openembedded.org>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Sun, 12 Nov 2017 17:23:08 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Nov 12, 2017 at 3:48 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> Also, was this ever sent to ML for review? I haven't found it in my maildir
> and google haven't found it in ML archive as well.
>

Its not on patchwork it seems to have slipped in probably by an overisight
but I think fix is right. Probably a simple fix for meta-oe recipes to depend on
db will be what we need

> On Sat, Nov 11, 2017 at 11:45 PM, Martin Jansa <martin.jansa@gmail.com>
> wrote:
>
>> Hi,
>>
>> will you please send fix for:
>> ERROR: Nothing PROVIDES 'virtual/db' (but meta-oe/meta-networking/
>> recipes-daemons/postfix/postfix_3.2.2.bb meta-oe/meta-networking/
>> recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb DEPENDS on or otherwise
>> requires it).
>>
>> Thanks
>>
>> On Fri, Nov 10, 2017 at 3:45 PM, <git@git.openembedded.org> wrote:
>>
>>> This is an automated email from the git hooks/post-receive script.
>>>
>>> rpurdie pushed a commit to branch master-next
>>> in repository openembedded-core.
>>>
>>> commit dcbc45aa3fe72c528fe4d47a783da4b4ed5ff38e
>>> Author: Ross Burton <ross.burton@intel.com>
>>> AuthorDate: Tue Oct 31 21:10:13 2017 +0000
>>>
>>>     db: don't provide virtual/db
>>>
>>>     As there are no alternative providers for virtual/db remove the
>>> PROVIDES and
>>>     recipes can just depend on db.
>>>
>>>     Signed-off-by: Ross Burton <ross.burton@intel.com>
>>> ---
>>>  meta/recipes-support/db/db_5.3.28.bb | 10 ----------
>>>  1 file changed, 10 deletions(-)
>>>
>>> diff --git a/meta/recipes-support/db/db_5.3.28.bb
>>> b/meta/recipes-support/db/db_5.3.28.bb
>>> index fb4befb..fe71967 100644
>>> --- a/meta/recipes-support/db/db_5.3.28.bb
>>> +++ b/meta/recipes-support/db/db_5.3.28.bb
>>> @@ -12,7 +12,6 @@ SECTION = "libs"
>>>  SUMMARY = "Berkeley Database v5"
>>>  HOMEPAGE = "http://www.oracle.com/technetwork/database/database-technol
>>> ogies/berkeleydb/overview/index.html"
>>>  LICENSE = "Sleepycat"
>>> -VIRTUAL_NAME ?= "virtual/db"
>>>  RCONFLICTS_${PN} = "db3"
>>>
>>>  PR = "r1"
>>> @@ -37,15 +36,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=ed1158e314
>>> 37f4f87cdd4ab2b8613955"
>>>
>>>  inherit autotools
>>>
>>> -# Put virtual/db in any appropriate provider of a
>>> -# relational database, use it as a dependency in
>>> -# place of a specific db and use:
>>> -#
>>> -# PREFERRED_PROVIDER_virtual/db
>>> -#
>>> -# to select the correct db in the build (distro) .conf
>>> -PROVIDES += "${VIRTUAL_NAME}"
>>> -
>>>  # The executables go in a separate package - typically there
>>>  # is no need to install these unless doing real database
>>>  # management on the system.
>>>
>>> --
>>> To stop receiving notification emails like this one, please contact
>>> the administrator of this repository.
>>> --
>>> _______________________________________________
>>> Openembedded-commits mailing list
>>> Openembedded-commits@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-commits
>>>
>>
>>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

