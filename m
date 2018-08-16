Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f169.google.com (mail-qt0-f169.google.com
	[209.85.216.169])
	by mail.openembedded.org (Postfix) with ESMTP id 2580A79015
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Aug 2018 17:58:37 +0000 (UTC)
Received: by mail-qt0-f169.google.com with SMTP id m13-v6so5784037qth.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Aug 2018 10:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=2najv6rEogTFraJCRpqbsGNfkTmBQoPVYVuSfO59YLs=;
	b=ddA675Z5w1BtEialAimwhEmQRyLXjMSYWZdb5kgV0iaVnJBNznP/EP5g9RzYo065l9
	UTHjj34Mqk2VcDC0r1Y4W2vnffeN7wqMcUI7RUAFVE2YOLix6242MFvQa4wxzdB28uKI
	SJaoMRjx9Xan6CJw7dKPK1FEIPDxd2pw0NYR+f38dQDCghXnezDOFc/3qBQXHZpf6fa1
	q7lQ9SULco866smMYDDO+w9j+C89I9Cn4CyMmlxd8b+Pp+nREe/YqM3+Gj1KHZ80XDHn
	92iH64bk0lPG2xjttqeNerfRSYEJyo8LAWp564NzF6dNoi5MMdKPikJnxeVUDw+wGh2T
	T1Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=2najv6rEogTFraJCRpqbsGNfkTmBQoPVYVuSfO59YLs=;
	b=eGRZQYenVB+krHgfzdJlNjPMjG307PW/0qrW+WjDb0tTCAqkAnIjzV5AI8tSxJYe4K
	zmg3vIXYF9310AgTDr2xawbQfFywjFn+dXmCYB8CmhT/zKHGv7k4VVh56V342xYN610U
	iAOIj/PbiNVMj+q6VjewwO2Y5PprBdUsuMLqDqitJRwmMrELqIvTQkgthzrysaktihL/
	xDq9yoFblyZxbgj3hlx8WQ8C562P+WMTB2lOgVWIWlUZ6HfN5Ct26n+JKB4gB9CuT1nj
	tEkRvOIwQ/9eWDAF6wFV3ZMj8cOp9JrO7fbtpucPRQHdJooHSnrk6h61IvXOQ6E4v+UA
	gtng==
X-Gm-Message-State: AOUpUlGZDSEo0um3nckccnLPq094lV3mhzkYESq3Gjd4R7oPQ3KiyoWF
	bm9tMtV+SeDMJpNk9tOt41WEjeWYvc45TrDCwfM=
X-Google-Smtp-Source: AA+uWPwGNFEBQISeGsNkbb+wRv+NCA4zgmHmA3AJUjgOs+ztplDcFoUrJv6TnEAZ9JhISQsosF+nKBwEiGWfP0+fR5o=
X-Received: by 2002:a0c:da90:: with SMTP id
	z16-v6mr28077247qvj.55.1534442318643; 
	Thu, 16 Aug 2018 10:58:38 -0700 (PDT)
MIME-Version: 1.0
References: <20180813081742.6961-1-raj.khem@gmail.com>
	<20180813081742.6961-19-raj.khem@gmail.com>
	<CA+chaQcy1F03YbKDg4SEHwajyrx2gRjLCQVAHg++Hu5xCaguew@mail.gmail.com>
In-Reply-To: <CA+chaQcy1F03YbKDg4SEHwajyrx2gRjLCQVAHg++Hu5xCaguew@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 16 Aug 2018 10:58:12 -0700
Message-ID: <CAMKF1sodqt9+PP_upLN3F8fKpM-F4JxzTkRBe8Pw7-JkHuteag@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 19/21] cfengine, cfengine-masterfiles: Upgrade to 3.12.0
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
X-List-Received-Date: Thu, 16 Aug 2018 17:58:38 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 16, 2018 at 10:27 AM Martin Jansa <martin.jansa@gmail.com> wrote:
>
> With this one I'm seeing cfengine-3.12.0-r0 do_package failure:
>
> ERROR: SYSTEMD_SERVICE_cfengine value cf-consumer.service does not exist

its likely, since my local builders use sysvinit and OE builders
where I relied for systemd builds are currently enjoying a cruise in pacific

care to cook a patch ? if not I will get to it eventually.

>
> On Mon, Aug 13, 2018 at 10:20 AM Khem Raj <raj.khem@gmail.com> wrote:
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  ...10.2.bb => cfengine-masterfiles_3.12.0.bb} |  4 +--
>>  .../cfengine/change-hard-coded-lib-path.patch | 28 -------------------
>>  .../set-path-of-default-config-file.patch     | 23 ++++++++++++---
>>  ...{cfengine_3.10.2.bb => cfengine_3.12.0.bb} |  7 ++---
>>  4 files changed, 24 insertions(+), 38 deletions(-)
>>  rename meta-oe/recipes-extended/cfengine/{cfengine-masterfiles_3.10.2.bb => cfengine-masterfiles_3.12.0.bb} (87%)
>>  delete mode 100644 meta-oe/recipes-extended/cfengine/cfengine/change-hard-coded-lib-path.patch
>>  rename meta-oe/recipes-extended/cfengine/{cfengine_3.10.2.bb => cfengine_3.12.0.bb} (93%)
>>
>> diff --git a/meta-oe/recipes-extended/cfengine/cfengine-masterfiles_3.10.2.bb b/meta-oe/recipes-extended/cfengine/cfengine-masterfiles_3.12.0.bb
>> similarity index 87%
>> rename from meta-oe/recipes-extended/cfengine/cfengine-masterfiles_3.10.2.bb
>> rename to meta-oe/recipes-extended/cfengine/cfengine-masterfiles_3.12.0.bb
>> index b52e7cc082..dda6af9c9d 100644
>> --- a/meta-oe/recipes-extended/cfengine/cfengine-masterfiles_3.10.2.bb
>> +++ b/meta-oe/recipes-extended/cfengine/cfengine-masterfiles_3.12.0.bb
>> @@ -22,8 +22,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=9f76426f9ef8c6f6739fadd21d817a4f"
>>
>>  SRC_URI = "https://cfengine-package-repos.s3.amazonaws.com/tarballs/${BP}.tar.gz"
>>
>> -SRC_URI[md5sum] = "1247ef4e8f3cee5efa98da50c326e5a4"
>> -SRC_URI[sha256sum] = "5d18a8d71f451d0b5dd1f5e579452b29b99b664f2bb0827dbba9a615f2764df6"
>> +SRC_URI[md5sum] = "d59bd8c95620da816c382f749d425860"
>> +SRC_URI[sha256sum] = "1c50e3d8c702097e13a21258626d936d6ff2e6492e893dfe286ff0d6204d7a65"
>>
>>  inherit autotools
>>
>> diff --git a/meta-oe/recipes-extended/cfengine/cfengine/change-hard-coded-lib-path.patch b/meta-oe/recipes-extended/cfengine/cfengine/change-hard-coded-lib-path.patch
>> deleted file mode 100644
>> index 2295e415cd..0000000000
>> --- a/meta-oe/recipes-extended/cfengine/cfengine/change-hard-coded-lib-path.patch
>> +++ /dev/null
>> @@ -1,28 +0,0 @@
>> -Upstream-Status: Inappropriate [configuration]
>> -
>> -projlibdir use a hard coded lib path, this will cause error when build a 64bit
>> -target. So change it to suitable path.
>> -
>> -Signed-off-by: Song.Li <Song.Li@windriver.com>
>> -Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
>> -Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> ----
>> - configure.ac | 2 +-
>> - 1 file changed, 1 insertion(+), 1 deletion(-)
>> -
>> -diff --git a/configure.ac b/configure.ac
>> -index 38e2b9c..bc6b996 100644
>> ---- a/configure.ac
>> -+++ b/configure.ac
>> -@@ -188,7 +188,7 @@ AS_IF([test x"$enable_fhs" = xyes], [
>> -   fi
>> -
>> -   sbindir='${exec_prefix}/bin' # /var/cfengine/bin despite being sbin_?
>> --  projlibdir='${exec_prefix}/lib'
>> -+  projlibdir='${libdir}'
>> -   mandir='${exec_prefix}/share/man'
>> - ])
>> -
>> ---
>> -1.7.1
>> -
>> diff --git a/meta-oe/recipes-extended/cfengine/cfengine/set-path-of-default-config-file.patch b/meta-oe/recipes-extended/cfengine/cfengine/set-path-of-default-config-file.patch
>> index b9526f2843..db69f951ca 100644
>> --- a/meta-oe/recipes-extended/cfengine/cfengine/set-path-of-default-config-file.patch
>> +++ b/meta-oe/recipes-extended/cfengine/cfengine/set-path-of-default-config-file.patch
>> @@ -1,23 +1,38 @@
>> +From dc270040cb3beb5ca42f864813145c8a68594bad Mon Sep 17 00:00:00 2001
>> +From: Kai Kang <kai.kang@windriver.com>
>> +Date: Mon, 18 Jul 2016 09:06:06 +0800
>> +Subject: [PATCH] cfengine: add recipe and base policy
>> +
>>  Upstream-Status: Inappropriate [configuration]
>>
>>  Set the path of default configure file.
>>
>>  Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> +
>>  ---
>> + misc/init.d/cfengine3.in | 12 ++++--------
>> + 1 file changed, 4 insertions(+), 8 deletions(-)
>> +
>>  diff --git a/misc/init.d/cfengine3.in b/misc/init.d/cfengine3.in
>> -index d6ae26f..1dee283 100644
>> +index c584817..12f5803 100644
>>  --- a/misc/init.d/cfengine3.in
>>  +++ b/misc/init.d/cfengine3.in
>> -@@ -101,11 +101,7 @@ if [ -z "$LOCKDIR" ]; then
>> +@@ -101,14 +101,10 @@ if [ -z "$LOCKDIR" ]; then
>>   fi
>>
>>   # default control file
>>  -if [ "$DEBIAN" = "1" ]; then
>>  -    DEFAULT=/etc/default/cfengine3
>> +-    INIT_FUNCTIONS=/lib/lsb/init-functions
>> +-    if [ -e "$INIT_FUNCTIONS" ]; then
>> +-        . "$INIT_FUNCTIONS"
>> +-    fi
>>  -else
>>  -    DEFAULT=/etc/sysconfig/cfengine3
>> --fi
>>  +DEFAULT=/etc/default/cfengine3
>> ++INIT_FUNCTIONS=/lib/lsb/init-functions
>> ++if [ -e "$INIT_FUNCTIONS" ]; then
>> ++    . "$INIT_FUNCTIONS"
>> + fi
>>
>>   if [ -f $DEFAULT ]; then
>> -     . $DEFAULT
>> diff --git a/meta-oe/recipes-extended/cfengine/cfengine_3.10.2.bb b/meta-oe/recipes-extended/cfengine/cfengine_3.12.0.bb
>> similarity index 93%
>> rename from meta-oe/recipes-extended/cfengine/cfengine_3.10.2.bb
>> rename to meta-oe/recipes-extended/cfengine/cfengine_3.12.0.bb
>> index b86b0a1f18..aa33a97a4d 100644
>> --- a/meta-oe/recipes-extended/cfengine/cfengine_3.10.2.bb
>> +++ b/meta-oe/recipes-extended/cfengine/cfengine_3.12.0.bb
>> @@ -16,12 +16,11 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=f8b34828ab373d6b1bb4b0fc60a78494"
>>  DEPENDS = "attr tokyocabinet"
>>
>>  SRC_URI = "https://cfengine-package-repos.s3.amazonaws.com/tarballs/${BP}.tar.gz \
>> -           file://change-hard-coded-lib-path.patch \
>>             file://set-path-of-default-config-file.patch \
>> -"
>> +           "
>>
>> -SRC_URI[md5sum] = "c16baf08189a1af6fcf2e2ff61102992"
>> -SRC_URI[sha256sum] = "d4fa9ac7276dba7b85d6757aab2f0929ab8d3b115cb0e7b0cf984760347429d7"
>> +SRC_URI[md5sum] = "33ef12260db4b430352229f37f7cb0e5"
>> +SRC_URI[sha256sum] = "d71ba98a272390c6fa8bc20e8ea27f0050a0a72a3e6b206a4762b4646be332ec"
>>
>>  inherit autotools systemd
>>
>> --
>> 2.18.0
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

