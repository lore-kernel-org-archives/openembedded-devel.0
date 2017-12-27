Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 8974C605B3;
	Wed, 27 Dec 2017 03:00:20 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id q67so9124449pga.9;
	Tue, 26 Dec 2017 19:00:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=00muznyD+ZuFOjyYXCrPFzflSVLUNBaWhViNl+jlRNA=;
	b=DtwPK484mEzywfpeZGkz3XP77GFiekX1gH+OsJnzaivA0R2zL9rzWVrwDTheRB377Q
	GpHfzyDI1+bp8CuI5mhqiH/WeCSycEJ1mmxmAmlhBlrEt2Dq9YhSSPZkr0Yenj3kmGCf
	iO+cXBXYA3AofO0gSgX4Di1BYwUYNe9H1JHZzZYatoVXwWhv+kiPFswISuBGdTpJ6+Ea
	812lB2s5V7wMN/mwQvv/rQVx1P+P7rW7YgIRhSKPgzHRJIxANQoJ1WCCicx4GThlP2kB
	jhjXDt47HSFEADspDbMB/pqlezYvyW3U3TS/g38JfahOCZjDMQGgUOR/Rwr82vYu+3es
	AOEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=00muznyD+ZuFOjyYXCrPFzflSVLUNBaWhViNl+jlRNA=;
	b=iXysufmRjCc4PRePfS+zJQhnccYwdsgrPhEZD75Q3D0QrZTit0jGl0tmqE/diPb3Ne
	BHFrHWGo40GHM6eHC9Esa8+qG0HT9DE8rBMl4WQgK4sbeLtvwrpKAH1ppJ7GxBbqMMpy
	MLtWTYZj+5v1vrjvhcmTEHXLs8yylzTMbHYtucREN6RSAHVC9+PFs3msRXAgMBOIzNZC
	DOFcXIpEGnaTVlcYRmFVocWc/PskO627pYeYgPLNC9MK/FuJRkkH479hRm8IyILCsKDD
	FDPe1f6Qt3Hbf07RHw+Fp2qcFtKWzLpc9YP0ecXtaqvXnh0cOlyk4tYljCPIqwCA9k8m
	48HA==
X-Gm-Message-State: AKGB3mKtY8RnXSDF5El8qteMxm7ZBeeGyiTtBjzQvV4+kWiqtS4zgheW
	xfz6xYkmiANTR4lx5VE+Hk3MmQ==
X-Google-Smtp-Source: ACJfBouaoIzUBEgppocgT2YGTDBsFlhwtV0LFRL2dSyUNqJOb9E+1fmWPRs5aTqK/DgK5bUqrucQtA==
X-Received: by 10.101.78.6 with SMTP id r6mr9489024pgt.64.1514343619974;
	Tue, 26 Dec 2017 19:00:19 -0800 (PST)
Received: from ?IPv6:2601:202:4000:1184:bd87:68dc:7ad5:c07b?
	([2601:202:4000:1184:bd87:68dc:7ad5:c07b])
	by smtp.gmail.com with ESMTPSA id
	s14sm68129874pfe.36.2017.12.26.19.00.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 26 Dec 2017 19:00:19 -0800 (PST)
To: Bill Randle <bill.randle@gmail.com>, Martin Jansa <martin.jansa@gmail.com>
References: <151400211887.5101.9516674106915358280@git.openembedded.org>
	<20171223040839.6971C2355DB@git.openembedded.org>
	<20171224073443.GA4127@jama>
	<CA+n--H-o6pUnaLH73wYjYXt6Qs6iTuYx7_SKRN0=CFf+E0f4bQ@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <afc92b93-acc1-6ea5-04f2-960f323d7ddf@gmail.com>
Date: Tue, 26 Dec 2017 19:00:17 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <CA+n--H-o6pUnaLH73wYjYXt6Qs6iTuYx7_SKRN0=CFf+E0f4bQ@mail.gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] [meta-openembedded] 14/30: python[3]-flask-nav: new recipes
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
X-List-Received-Date: Wed, 27 Dec 2017 03:00:20 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 12/24/2017 08:03 AM, Bill Randle wrote:
> On Sat, Dec 23, 2017 at 11:34 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
>> On Sat, Dec 23, 2017 at 04:08:52AM +0000, git@git.openembedded.org wrote:
>>> This is an automated email from the git hooks/post-receive script.
>>>
>>> armin_kuster pushed a commit to branch master
>>> in repository meta-openembedded.


>> Hi,
>>
>> This depends on 2 python-blinker reviews which weren't merged with this
>> batch, causing:
>>
>> ERROR: Nothing RPROVIDES 'python3-blinker' (but meta-python/recipes-devtools/python/python3-flask-nav_0.6.bb RDEPENDS on or otherwise requires it)
>> NOTE: Runtime target 'python3-blinker' is unbuildable, removing...
>> Missing or unbuildable dependency chain was: ['python3-blinker']
>> NOTE: Runtime target 'python3-flask-nav' is unbuildable, removing...
>> Missing or unbuildable dependency chain was: ['python3-flask-nav', 'python3-blinker']
>> NOTE: Runtime target 'python3-flask-nav-dev' is unbuildable, removing...
>> Missing or unbuildable dependency chain was: ['python3-flask-nav-dev', 'python3-blinker']
changes found . thanks,

- armin
>>
>> Regards,
> That would be this patch:
> http://lists.openembedded.org/pipermail/openembedded-devel/2017-December/115865.html
> posted on the mailing list five days earlier than the patch for
> flask-nav. I should have perhaps put a note in the patch series that
> the previously submitted patch was also required as a prerequisite.
> I'll to do that in the future.
>
>     -Bill
>
>>> commit 55d77b7e3f81dff333cbaa3361d02249943a8fec
>>> Author: Bill Randle <bill.randle@gmail.com>
>>> AuthorDate: Thu Dec 7 21:49:02 2017 -0800
>>>
>>>     python[3]-flask-nav: new recipes
>>>
>>>     Signed-off-by: Bill Randle <bill.randle@gmail.com>
>>>     Signed-off-by: Armin Kuster <akuster808@gmail.com>
>>> ---
>>>  meta-python/recipes-devtools/python/python-flask-nav.inc    | 13 +++++++++++++
>>>  meta-python/recipes-devtools/python/python-flask-nav_0.6.bb |  2 ++
>>>  .../recipes-devtools/python/python3-flask-nav_0.6.bb        |  2 ++
>>>  3 files changed, 17 insertions(+)
>>>
>>> diff --git a/meta-python/recipes-devtools/python/python-flask-nav.inc b/meta-python/recipes-devtools/python/python-flask-nav.inc
>>> new file mode 100644
>>> index 0000000..932ccdf
>>> --- /dev/null
>>> +++ b/meta-python/recipes-devtools/python/python-flask-nav.inc
>>> @@ -0,0 +1,13 @@
>>> +DESCRIPTION = "Easily create navigation for Flask applications."
>>> +LICENSE = "MIT"
>>> +LIC_FILES_CHKSUM = "file://PKG-INFO;md5=2729ee82259d601d90d28b0574d12416"
>>> +
>>> +SRC_URI[md5sum] = "4d51cfd06d58f8d0fe85775a6696c0e5"
>>> +SRC_URI[sha256sum] = "44e40b755380a1e68ab521a2f9174de259a2c94ddcdaabf36b3aca2e110a33f4"
>>> +
>>> +PYPI_PACKAGE = "flask-nav"
>>> +
>>> +RDEPENDS_${PN} += "\
>>> +    ${PYTHON_PN}-blinker \
>>> +    ${PYTHON_PN}-flask \
>>> +    "
>>> diff --git a/meta-python/recipes-devtools/python/python-flask-nav_0.6.bb b/meta-python/recipes-devtools/python/python-flask-nav_0.6.bb
>>> new file mode 100644
>>> index 0000000..30b5b3b
>>> --- /dev/null
>>> +++ b/meta-python/recipes-devtools/python/python-flask-nav_0.6.bb
>>> @@ -0,0 +1,2 @@
>>> +inherit pypi setuptools
>>> +require python-flask-nav.inc
>>> diff --git a/meta-python/recipes-devtools/python/python3-flask-nav_0.6.bb b/meta-python/recipes-devtools/python/python3-flask-nav_0.6.bb
>>> new file mode 100644
>>> index 0000000..d251152
>>> --- /dev/null
>>> +++ b/meta-python/recipes-devtools/python/python3-flask-nav_0.6.bb
>>> @@ -0,0 +1,2 @@
>>> +inherit pypi setuptools3
>>> +require python-flask-nav.inc
>>>
>>> --
>>> To stop receiving notification emails like this one, please contact
>>> the administrator of this repository.
>>> --
>>> _______________________________________________
>>> Openembedded-commits mailing list
>>> Openembedded-commits@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-commits
>> --
>> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


