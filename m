Return-Path: <omri.sarig13@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92811C35FF3
	for <webhook@archiver.kernel.org>; Fri, 21 Mar 2025 07:29:38 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web11.15760.1742542173220112768
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Mar 2025 00:29:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DqsALxwv;
 spf=pass (domain: gmail.com, ip: 209.85.167.49, mailfrom: omri.sarig13@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-543d8badc30so1907805e87.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 21 Mar 2025 00:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742542171; x=1743146971; darn=lists.openembedded.org;
        h=in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iBImhA3h3j11wShWZ1Nw5aKXRwOeeIIknTXikelSiCU=;
        b=DqsALxwvyL0jCx2qVj0Fypi775+xxWjZ9wzkeWqUZLkeMsOIgXRCmy7sg6eOkeltHi
         9Qt1kWRfrgWShh26oTmOlRXVkpLkTzY9P9R7/4sKr7gula7XRlsz41BdEx9tITr5ajuO
         7sH/FD+YJtZHsJvGRvSUh1j/iYE876gBia8iRNeeF3y2IqhgwJ6KNpkk2XPBAv3x2imt
         yqXX9lXdn90R0CGw5XZCm6NYfxX4lTWxq4c03sDfmfZp6mcmPVsFg62Ty+vIvXdNVMqQ
         b2jJE7nWId3fq8en0I88qAGrAhuF5Ualxwu0jtkWciQnO/u5s7Dakj0n/IpJ1N0NpygP
         GhTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742542171; x=1743146971;
        h=in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=iBImhA3h3j11wShWZ1Nw5aKXRwOeeIIknTXikelSiCU=;
        b=Klne95W51gmnqVG7NKdUBeXXxbrfa64ubnVgrS5MPXbZlTpjMt7gCTEa7YM3nuqa7a
         wbKMwxJ0Bhrd9P94SNJsBi1LwbPTvgvkXFoyCBMIbC21wurF9M2+UIoaujvtP+JCNf3n
         0vucgipbcGCjOluEx7pDzRAGn+yPz1kHjR0FqOTd2dx85LCZGVgf8EZFnoG6Wit5VN55
         8cV1Fd5w3pNMHW4yRBmH6LyA+nMUJeaqNb83m9YI+NuiNxXeaN2d/AbTrUfN5hxgLg3Q
         nqIoXkqzZNC3JPVUvCptBqgTAWpduTPEv7+hBjYr4QLSmEviQ5WUgXee39rqYdbMBsLX
         IVDw==
X-Forwarded-Encrypted: i=1; AJvYcCUhEpMGA3jrKsLUqmNjKIaJyAykgC5/m5W2G/byiPEPhKNCQL/X5OAqZMgtQhuWG8MEXp8/SMZc3rzSR/TJpQHHVlM=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx5ucxt17Fyi4VckaAlx7WW4P+vypvkMtTvRyU2Hw7t4EvFVv7y
	4fI+P16HQcStdPNhZxZMEG0XiXLnx0kRof/IFMdQAgLXXcmSeJkm
X-Gm-Gg: ASbGnct99zLRwbqrybtysFqZZvW0+0drvJrcAt/5qi8tmYMTNKDGJrxma2IEdQ+GBp1
	zLB0nMSU14D2L4sem6hMJQFzoYz+VT8ud+AhyGBCNjCnBZoz1g1UahR2kO7B4cwgbKhV7ShRStK
	096dvI3N6TtfRit2wc7ha+G2p9vUlmj7TMbl+eyGFzza1hFdQ27sGsCri2/PkL4+jnDcrf8rSvS
	hzinS8agZiSHHQqBz8wZNxN3TJ0HEus9xU0BlWThVDx18Z1pTeOFBJbb8MnADkDQvZybzn8K3pd
	tAR9D3jJZ/0oD67SatXwaS8auMlB7AOoVSBtEYtfsytLgCAETQ==
X-Google-Smtp-Source: AGHT+IEY/SjAkxyZ2i7k7uB9Gy3eRWndSgawG9eykervBsxODsiNQV5iMU1Lp1DVi1B7B/5d7MaCiw==
X-Received: by 2002:a05:6512:6cf:b0:542:213f:78fd with SMTP id 2adb3069b0e04-54ad64f5960mr587549e87.40.1742542170599;
        Fri, 21 Mar 2025 00:29:30 -0700 (PDT)
Received: from [172.16.6.176] ([81.216.59.226])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ad6512203sm118597e87.241.2025.03.21.00.29.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Mar 2025 00:29:28 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------czlRY8TYnHmW8blcmdLMFnu0"
Message-ID: <cbd99f9b-efd9-4bed-977d-8fc075a540a8@gmail.com>
Date: Fri, 21 Mar 2025 08:28:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-python][PATCH v2] python3-varlink: Add recipe
To: "Marko, Peter" <Peter.Marko@siemens.com>,
 "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
References: <20250320113010.1428716-1-omri.sarig13@gmail.com>
 <AS1PR10MB5697938634FFEB1D1A4B31D6FDD82@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Omri Sarig <omri.sarig13@gmail.com>
In-Reply-To: <AS1PR10MB5697938634FFEB1D1A4B31D6FDD82@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Mar 2025 07:29:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116170

This is a multi-part message in MIME format.
--------------czlRY8TYnHmW8blcmdLMFnu0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/20/25 22:10, Marko, Peter wrote:
> This recipe is missing version (e.g. 31.0.0+git).
I'll add the version, I missed that.
> Also the runtime dependencies should be split.
> I think that at least unittests should go to ptest package, not main.

I was not sure what is the right thing to do here is.
When installing the package through setuptools, it also installs the 
tests directory as part of the package (so it ends up in the target at 
`/usr/lib/python3.12/site-packages/varlink/tests/`).
Following the README, running the examples of the package require 
running some files from the tests directory, that also import unittest.

So, if we want to keep the full functionality, and allow a user on the 
target to run the examples, we have to keep all of the current runtime 
dependencies as part of main.

So the options I can think of are:

1. Leave the dependencies as-is, adding the reasoning above to the 
commit message.
2. Split the dependencies, and remove the tests directory from the 
target (even though it is included through setuptools). This way, the 
package is smaller (and have less dependencies), but it ends up being 
significantly different than what will be available when it is usually 
installed.
2a. If we want, we can have it done through a flag, so a user is able to 
explicitly decide to include the test packages in.
3. Split the dependencies, but keep the tests directory as part of the 
installation - this way, we have less runtime dependencies for regular 
use of the package, but if a user is trying to run the examples on the 
target, they will receive an import error.

What do you think is the best solution here?

Omri

>> -----Original Message-----
>> From:openembedded-devel@lists.openembedded.org <openembedded-
>> devel@lists.openembedded.org> On Behalf Of Omri Sarig via
>> lists.openembedded.org
>> Sent: Thursday, March 20, 2025 12:30
>> To:openembedded-devel@lists.openembedded.org
>> Cc: Omri Sarig<omri.sarig13@gmail.com>
>> Subject: [oe] [meta-python][PATCH v2] python3-varlink: Add recipe
>>
>> Add a python recipe to install the python implementation for the varlink
>> interface.
>>
>> The recipe is using the current master head, instead of the version from
>> pypi. This is done as the pypi version is 4 years old, while the master
>> is continuously maintained in GitHub.
>>
>> The runtime dependencies were created by looking at all the import
>> statement in the installed files of the repository and looking at the
>> relevant packages from the python3 manifest file in meta-poky.
>>
>> Signed-off-by: Omri Sarig<omri.sarig13@gmail.com>
>> ---
>>   .../ptest-packagelists-meta-python.inc        |  1 +
>>   .../python/python3-varlink_git.bb             | 28 +++++++++++++++++++
>>   2 files changed, 29 insertions(+)
>>   create mode 100644 meta-python/recipes-devtools/python/python3-varlink_git.bb
>>
>> diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc b/meta-
>> python/conf/include/ptest-packagelists-meta-python.inc
>> index 3a1fb13ba7..40df4f08f3 100644
>> --- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
>> +++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
>> @@ -89,6 +89,7 @@ PTESTS_FAST_META_PYTHON = "\
>>       python3-unidiff \
>>       python3-uritemplate \
>>       python3-validators \
>> +    python3-varlink \
>>       python3-wrapt \
>>       python3-wsproto \
>>       python3-xlrd \
>> diff --git a/meta-python/recipes-devtools/python/python3-varlink_git.bb b/meta-
>> python/recipes-devtools/python/python3-varlink_git.bb
>> new file mode 100644
>> index 0000000000..8b5e01cf44
>> --- /dev/null
>> +++ b/meta-python/recipes-devtools/python/python3-varlink_git.bb
>> @@ -0,0 +1,28 @@
>> +SUMMARY = " Python implementation of the Varlink protocol"
>> +HOMEPAGE ="https://varlink.org/python/"
>> +LICENSE = "Apache-2.0"
>> +LIC_FILES_CHKSUM =
>> "file://LICENSE.txt;md5=e3fc50a88d0a364313df4b21ef20c29e"
>> +
>> +SRC_URI ="git://github.com/varlink/python.git;protocol=https;branch=master"
>> +
>> +SRCREV = "6012b8805bf2ebcc981c84bd56a3e949a2141c16"
>> +
>> +S = "${WORKDIR}/git"
>> +
>> +inherit python_setuptools_build_meta ptest-python-pytest
>> +
>> +DEPENDS += "python3-setuptools-scm-native"
>> +
>> +RDEPENDS:${PN} += " \
>> +    python3-core \
>> +    python3-datetime \
>> +    python3-io \
>> +    python3-json \
>> +    python3-netclient \
>> +    python3-netserver \
>> +    python3-shell \
>> +    python3-stringold \
>> +    python3-unittest \
>> +"
>> +
>> +PTEST_PYTEST_DIR = "varlink/tests"
--------------czlRY8TYnHmW8blcmdLMFnu0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 3/20/25 22:10, Marko, Peter wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:AS1PR10MB5697938634FFEB1D1A4B31D6FDD82@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM">
      <pre wrap="" class="moz-quote-pre">This recipe is missing version (e.g. 31.0.0+git).</pre>
    </blockquote>
    I'll add the version, I missed that.<br>
    <blockquote type="cite"
cite="mid:AS1PR10MB5697938634FFEB1D1A4B31D6FDD82@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM">
      <pre wrap="" class="moz-quote-pre">
Also the runtime dependencies should be split.
I think that at least unittests should go to ptest package, not main.</pre>
    </blockquote>
    <p>I was not sure what is the right thing to do here is.<br>
      When installing the package through setuptools, it also installs
      the tests directory as part of the package (so it ends up in the
      target at `/usr/lib/python3.12/site-packages/varlink/tests/`).<br>
      Following the README, running the examples of the package require
      running some files from the tests directory, that also import
      unittest.</p>
    <p>So, if we want to keep the full functionality, and allow a user
      on the target to run the examples, we have to keep all of the
      current runtime dependencies as part of main.</p>
    <p>So the options I can think of are:</p>
    <p>1. Leave the dependencies as-is, adding the reasoning above to
      the commit message.<br>
      2. Split the dependencies, and remove the tests directory from the
      target (even though it is included through setuptools). This way,
      the package is smaller (and have less dependencies), but it ends
      up being significantly different than what will be available when
      it is usually installed.<br>
      2a. If we want, we can have it done through a flag, so a user is
      able to explicitly decide to include the test packages in.<br>
      3. Split the dependencies, but keep the tests directory as part of
      the installation - this way, we have less runtime dependencies for
      regular use of the package, but if a user is trying to run the
      examples on the target, they will receive an import error.</p>
    <p>What do you think is the best solution here?</p>
    <p><span style="white-space: pre-wrap">
</span></p>
    <p><span style="white-space: pre-wrap">Omri
</span></p>
    <blockquote type="cite"
cite="mid:AS1PR10MB5697938634FFEB1D1A4B31D6FDD82@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM">
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">-----Original Message-----
From: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-devel@lists.openembedded.org">openembedded-devel@lists.openembedded.org</a> &lt;openembedded-
<a class="moz-txt-link-abbreviated" href="mailto:devel@lists.openembedded.org">devel@lists.openembedded.org</a>&gt; On Behalf Of Omri Sarig via
lists.openembedded.org
Sent: Thursday, March 20, 2025 12:30
To: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-devel@lists.openembedded.org">openembedded-devel@lists.openembedded.org</a>
Cc: Omri Sarig <a class="moz-txt-link-rfc2396E" href="mailto:omri.sarig13@gmail.com">&lt;omri.sarig13@gmail.com&gt;</a>
Subject: [oe] [meta-python][PATCH v2] python3-varlink: Add recipe

Add a python recipe to install the python implementation for the varlink
interface.

The recipe is using the current master head, instead of the version from
pypi. This is done as the pypi version is 4 years old, while the master
is continuously maintained in GitHub.

The runtime dependencies were created by looking at all the import
statement in the installed files of the repository and looking at the
relevant packages from the python3 manifest file in meta-poky.

Signed-off-by: Omri Sarig <a class="moz-txt-link-rfc2396E" href="mailto:omri.sarig13@gmail.com">&lt;omri.sarig13@gmail.com&gt;</a>
---
 .../ptest-packagelists-meta-python.inc        |  1 +
 .../python/python3-varlink_git.bb             | 28 +++++++++++++++++++
 2 files changed, 29 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-varlink_git.bb

diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc b/meta-
python/conf/include/ptest-packagelists-meta-python.inc
index 3a1fb13ba7..40df4f08f3 100644
--- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
+++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
@@ -89,6 +89,7 @@ PTESTS_FAST_META_PYTHON = "\
     python3-unidiff \
     python3-uritemplate \
     python3-validators \
+    python3-varlink \
     python3-wrapt \
     python3-wsproto \
     python3-xlrd \
diff --git a/meta-python/recipes-devtools/python/python3-varlink_git.bb b/meta-
python/recipes-devtools/python/python3-varlink_git.bb
new file mode 100644
index 0000000000..8b5e01cf44
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-varlink_git.bb
@@ -0,0 +1,28 @@
+SUMMARY = " Python implementation of the Varlink protocol"
+HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://varlink.org/python/">"https://varlink.org/python/"</a>
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM =
<a class="moz-txt-link-rfc2396E" href="file://LICENSE.txt;md5=e3fc50a88d0a364313df4b21ef20c29e">"file://LICENSE.txt;md5=e3fc50a88d0a364313df4b21ef20c29e"</a>
+
+SRC_URI = <a class="moz-txt-link-rfc2396E" href="git://github.com/varlink/python.git;protocol=https;branch=master">"git://github.com/varlink/python.git;protocol=https;branch=master"</a>
+
+SRCREV = "6012b8805bf2ebcc981c84bd56a3e949a2141c16"
+
+S = "${WORKDIR}/git"
+
+inherit python_setuptools_build_meta ptest-python-pytest
+
+DEPENDS += "python3-setuptools-scm-native"
+
+RDEPENDS:${PN} += " \
+    python3-core \
+    python3-datetime \
+    python3-io \
+    python3-json \
+    python3-netclient \
+    python3-netserver \
+    python3-shell \
+    python3-stringold \
+    python3-unittest \
+"
+
+PTEST_PYTEST_DIR = "varlink/tests"
</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------czlRY8TYnHmW8blcmdLMFnu0--

