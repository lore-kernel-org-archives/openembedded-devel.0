Return-Path: <bounce+4d9b4d.3a5685-openembedded-devel=lists.openembedded.org@asterius.io>
X-Greylist: delayed 301 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 05 Jul 2017 13:29:11 UTC
Received: from mail4.static.mailgun.info (mail4.static.mailgun.info
	[104.130.122.4])
	by mail.openembedded.org (Postfix) with ESMTP id 71344776F4
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Jul 2017 13:29:10 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=asterius.io; q=dns/txt;
	s=mailo; t=1499261352; h=Content-Type: Cc: To: Subject: Message-ID:
	Date: From: References: In-Reply-To: MIME-Version: Sender;
	bh=SLAFCjq6Cf2LHNJEESpj3jdMUp1i1nxc4YEXUujSXDE=;
	b=rkEYBIyN28IUxqYq6QigtA320jnebqxYiIDTsY6Nj+EfPV7fzUkOGSa/bOx0vkDm7k34X6rR
	oEG63mJnDeS5sRGEhF+iXob9s9jaYnGc75syv+nb5CkXQ+f0Nw9bg0/gXdRKs7J4tzcnWPFM
	7oSi6SwhWfAMjNberl6tWp4umT4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=asterius.io; s=mailo;
	q=dns; h=Sender: MIME-Version: In-Reply-To: References: From: Date:
	Message-ID: Subject: To: Cc: Content-Type;
	b=WWY55/O2OCkomj5mnItrTKyo3+nyOzQGBWg3qVbQkIR0R+86dVMxe3MJ5dgij/q7xByyVe
	K+8laYOA8hmeF0kcjcBu2NNqjM/GZxebJvqA/EWA7wIeoA/gqePtCfhy4Dn+N33HsyNwMrXJ
	qcWKH5I67ikW520WKgSVPiFdTbbVk=
Sender: derek@asterius.io
X-Mailgun-Sending-Ip: 104.130.122.4
X-Mailgun-Sid: WyIzN2NkMyIsICJvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyIsICIzYTU2ODUiXQ==
Received: from mail-io0-f174.google.com (mail-io0-f174.google.com
	[209.85.223.174])
	by mxa.mailgun.org with ESMTP id 595ce879.7f8d681b8170-smtp-out-n01;
	Wed, 05 Jul 2017 13:24:09 -0000 (UTC)
Received: by mail-io0-f174.google.com with SMTP id z62so85554394ioi.3;
	Wed, 05 Jul 2017 06:24:09 -0700 (PDT)
X-Gm-Message-State: AKS2vOwCe5itep3isCshq9UinkG/XdgHgBmXhSlBwAZxXXMV0xpKpp2R
	UOtzV7haqsNTuEE4Stq8ZlDcGZOPyw==
X-Received: by 10.107.131.203 with SMTP id n72mr46575269ioi.141.1499261049171; 
	Wed, 05 Jul 2017 06:24:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.133.224 with HTTP; Wed, 5 Jul 2017 06:24:08 -0700 (PDT)
In-Reply-To: <CA+chaQfGw_QQwM3VV989+62B5GAj5VHMwowgia3tMhkXm+iQZA@mail.gmail.com>
References: <149789352069.8282.14573081186702268358@git.openembedded.org>
	<20170619173202.216EB2328FD@git.openembedded.org>
	<CA+chaQfGw_QQwM3VV989+62B5GAj5VHMwowgia3tMhkXm+iQZA@mail.gmail.com>
From: Derek Straka <derek@asterius.io>
Date: Wed, 5 Jul 2017 09:24:08 -0400
X-Gmail-Original-Message-ID: <CADNbA1qKY5BGu9cLXgRcaUfPoG2BK06w2_k10wm+44WQOAey6Q@mail.gmail.com>
Message-ID: <CADNbA1qKY5BGu9cLXgRcaUfPoG2BK06w2_k10wm+44WQOAey6Q@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>,
	"openembedded-commits@lists.openembedded.org"
	<openembedded-commits@lists.openembedded.org>
Subject: Re: [oe-commits] [meta-openembedded] 37/44: python-pytest: update to version 3.1.2
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
X-List-Received-Date: Wed, 05 Jul 2017 13:29:11 -0000
Content-Type: text/plain; charset="UTF-8"

Looks like it is calling out the setuptools-scm package in
the setup_requires section in setup.py.  That forces the egg file to get
downloaded when setup.py is run rather than the usual fetch stages.  I'll
remove that requirement and update to the latest version later today.  That
should resolve the issue of fetching

On Tue, Jul 4, 2017 at 2:24 AM, Martin Jansa <martin.jansa@gmail.com> wrote:

> Why is setuptools downloading something (bypassing bitbake fetcher _and_
> already populated premirror) causing build failures like this:
> http://errors.yoctoproject.org/Errors/Details/146740/
>
> On Mon, Jun 19, 2017 at 7:32 PM, <git@git.openembedded.org> wrote:
>
>> This is an automated email from the git hooks/post-receive script.
>>
>> martin_jansa pushed a commit to branch master
>> in repository meta-openembedded.
>>
>> commit af0e31c58a381c2478435e8d015c142bab58c452
>> Author: Derek Straka <derek@asterius.io>
>> AuthorDate: Fri Jun 16 16:02:09 2017 -0400
>>
>>     python-pytest: update to version 3.1.2
>>
>>     Signed-off-by: Derek Straka <derek@asterius.io>
>>     Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>> ---
>>  meta-python/recipes-devtools/python/python-pytest.inc                 |
>> 4 ++--
>>  .../python/{python-pytest_3.0.6.bb => python-pytest_3.1.2.bb}         |
>> 0
>>  .../python/{python3-pytest_3.0.6.bb => python3-pytest_3.1.2.bb}       |
>> 0
>>  3 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta-python/recipes-devtools/python/python-pytest.inc
>> b/meta-python/recipes-devtools/python/python-pytest.inc
>> index c9c9bbf..2826838 100644
>> --- a/meta-python/recipes-devtools/python/python-pytest.inc
>> +++ b/meta-python/recipes-devtools/python/python-pytest.inc
>> @@ -2,8 +2,8 @@ SUMMARY = "Simple powerful teting with python"
>>  LICENSE = "MIT"
>>  LIC_FILES_CHKSUM = "file://LICENSE;md5=d8a5609608d9a5a180705b0fa298ae01"
>>
>> -SRC_URI[md5sum] = "6639592fa430567d024189f097fcdbd7"
>> -SRC_URI[sha256sum] = "643434a9f1a188271da35e20064cb
>> 8b6c5440976c5bb541dc7b5b0e3cf75d940"
>> +SRC_URI[md5sum] = "c4d179f89043cc925e1c169d03128e02"
>> +SRC_URI[sha256sum] = "795ec29fbba70b22a593691ce8bcd
>> 4bdde2dc96e8099731f73c7d8bb3ce879bf"
>>
>>  RDEPENDS_${PN}_class-target += " \
>>      ${PYTHON_PN}-argparse \
>> diff --git a/meta-python/recipes-devtools/python/python-pytest_3.0.6.bb
>> b/meta-python/recipes-devtools/python/python-pytest_3.1.2.bb
>> similarity index 100%
>> rename from meta-python/recipes-devtools/python/python-pytest_3.0.6.bb
>> rename to meta-python/recipes-devtools/python/python-pytest_3.1.2.bb
>> diff --git a/meta-python/recipes-devtools/python/python3-pytest_3.0.6.bb
>> b/meta-python/recipes-devtools/python/python3-pytest_3.1.2.bb
>> similarity index 100%
>> rename from meta-python/recipes-devtools/python/python3-pytest_3.0.6.bb
>> rename to meta-python/recipes-devtools/python/python3-pytest_3.1.2.bb
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

