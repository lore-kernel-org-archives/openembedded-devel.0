Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id C2BED7807C;
	Thu, 16 Nov 2017 02:25:59 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id j28so16158118pfk.8;
	Wed, 15 Nov 2017 18:26:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=y2MLTh989p0hkxb0jlcQTT9lni+9tIOb67CyCXPZAwc=;
	b=cWB9kXcAjX8SMDRKnK/yMmaXa7ToAxczgCUu47QnnGNd6lGQK9SUOO6E33Nmj1aSP6
	maxMUn9r47gMcLhlsG9eusV1l9cIUQ5uCXmkofV8teM3SSjvfl7QAdSLG1idPZggDNIg
	KQEVsY9jodKrd8x3foot1IgVaGYotCRhm9bQmk1Vc8Bt3+uv9SRSgeQGsrpNdY7vIJ2K
	fmXK+VbWyDl7rqlCwV5+pHu3Ah+WVGCkZtx84gbPTQgFhzvvXBQ2mA9fqa5u1dV6rnGm
	X/Bv+eACmXiOUm3uWejp/cF8R8iLxUR28Bs+i6C17+GF6NyH+Cq+6pjpkRiqc8zFWegd
	w3NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=y2MLTh989p0hkxb0jlcQTT9lni+9tIOb67CyCXPZAwc=;
	b=fwycixxexflCHUknbFRMrWFc1ODtAflServtf9/6glrNgasT66UizkV5Gl5rMJidWB
	uqzyPhmuJoNdOOEgA9T1tNKSO4TYVqIGrN5/VoKj6SHtC3rXYYTcA2Wh74ck7XoDwzmD
	gXgZ0VDlMO4hFaKGxfmuS6oNP21uOw60yV5lBwJ1wdoWc7H5tfo3dcrRVE2AyGGYIh0u
	APdwPzXYyJoq8FbpYj2pdYPPFa1nLi4fHHll2pkw7L8kVqBb0zL4Kwj6i8reJx56xz2N
	SitpZ0jxZz8jJVNMFRb4q8rbZXKxeVXh1aACotzKdo/HU4BX7UhJQ/R0OQiNKGMV88X7
	lp3g==
X-Gm-Message-State: AJaThX4hEs+GfPooNjhg+f0hLbbPwPcODczr+TjrBrXIvW9odwAEfIRa
	EVtL2N5U5StyUy61yW5XhiCp9Q==
X-Google-Smtp-Source: AGs4zMY/xxw9j8osDfth7LhSLNzKmoOgm/pBy41ywEk9/vXCSGrwDg40xcaoFj0P61hTFRC2DjeEiA==
X-Received: by 10.98.192.7 with SMTP id x7mr162736pff.142.1510799160754;
	Wed, 15 Nov 2017 18:26:00 -0800 (PST)
Received: from ?IPv6:2601:202:4001:9ea0:a90f:c0e3:b57a:b8e0?
	([2601:202:4001:9ea0:a90f:c0e3:b57a:b8e0])
	by smtp.gmail.com with ESMTPSA id u7sm45357pfh.142.2017.11.15.18.25.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 15 Nov 2017 18:26:00 -0800 (PST)
To: Martin Jansa <martin.jansa@gmail.com>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>,
	Ross Burton <ross.burton@intel.com>
References: <151032511199.27841.6992651845996774565@git.openembedded.org>
	<20171110144512.3538E233675@git.openembedded.org>
	<CA+chaQcCtC+UZsTFVtiQF+-rPuGSk7-0nTz+raXvv6SxcQ=N0w@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <aa53f8a2-995d-8ce1-6cca-36c11043068c@gmail.com>
Date: Wed, 15 Nov 2017 18:25:59 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <CA+chaQcCtC+UZsTFVtiQF+-rPuGSk7-0nTz+raXvv6SxcQ=N0w@mail.gmail.com>
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
X-List-Received-Date: Thu, 16 Nov 2017 02:26:00 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 11/11/2017 02:45 PM, Martin Jansa wrote:
> Hi,
>
> will you please send fix for:
> ERROR: Nothing PROVIDES 'virtual/db' (but
> meta-oe/meta-networking/recipes-daemons/postfix/postfix_3.2.2.bb
> meta-oe/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb
> DEPENDS on or otherwise requires it).

there are two commits pending
https://patchwork.openembedded.org/patch/145728/
https://patchwork.openembedded.org/patch/145729/

which I will take now.

- armin
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
>>  HOMEPAGE = "http://www.oracle.com/technetwork/database/database-
>> technologies/berkeleydb/overview/index.html"
>>  LICENSE = "Sleepycat"
>> -VIRTUAL_NAME ?= "virtual/db"
>>  RCONFLICTS_${PN} = "db3"
>>
>>  PR = "r1"
>> @@ -37,15 +36,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=
>> ed1158e31437f4f87cdd4ab2b8613955"
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


