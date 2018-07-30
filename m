Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	by mail.openembedded.org (Postfix) with ESMTP id EA77178D39
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jul 2018 17:39:47 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id w16-v6so7656418ljh.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jul 2018 10:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:subject:to:cc:references:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=f40k23Vr/j6BDP7sfyyWOtvlRABrd8QDSfUNwaMzO5U=;
	b=DOgSPqcOR7dCMWNdGjAnAWII1TBf3ZZQt7BDu4iKJ+kGQdIRLX4/ZeCOnqEj72KPLm
	khCAvs1+f11Xg5ljXxzYTXjd7CFqIuTD0gLvpbp0DNxC7AV2uze7WidosjEG5m0rOFMj
	gNDKJx/eIM1WOuhqGKmfxR/iqWa6VzsMUH2O4T7K09EhV/W2rtT9qP26+camLXkxLK2i
	E+/PwZcw5qZABxzWFI9j5JjbtHejgpOU1GwPkhmoAEej94hKpTOIpevK0wIV3sHZusAa
	l0GtxGQd2VUBFiKT1KPXcWK+D8imUjCsRy0u50zU8KXL7UCxvl+4UN/2wP1lxzkfDGiy
	5+Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:subject:to:cc:references:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=f40k23Vr/j6BDP7sfyyWOtvlRABrd8QDSfUNwaMzO5U=;
	b=Ahly3uYKzsDRGkIJH7l1oH2EnrmMnR13P90HtDEaE5WDuWL6H62NGmtrQqTUVPUoZW
	3afUfXISN8JVhC5Iw2plPlCmU9Y12wKsx/ZBmLH+Hu0zwTPTjG/lTndAWrUILXymjYDo
	ZI5fmPS1Qd6yzEALBGa+cutfyB5E/E9eUkqlU4LyXFVX2K1nKBev5PXEQcjFfuf1IRZM
	XeEisuUyeSCIPBxAtOxFL9q2lZozOXLD7VU8ry1kmEBk6H+sIZ1GiykT8hjwSaUWu71H
	VYPvPqyRkfPz4GmlIL73TD4qlOG3qKRg15NzeaRQPExJ3jd6tmdejqoQR3vCwpy9WSB6
	p3BA==
X-Gm-Message-State: AOUpUlH9A5hOyBW8d2vayfwHPoVxA3ow7FEG7ht7vnqYJwZKx6GzduB7
	+nzaPNwbI11A4EWpyyZFglPQcg==
X-Google-Smtp-Source: AAOMgpfC/Wvh468p9CQa+1t5WZ/jVZOm5iWMCt17lrlmwRWoDU5ONd97+aw0DqS4el3nRpqI9UEyyA==
X-Received: by 2002:a2e:40c:: with SMTP id
	12-v6mr14183583lje.146.1532972388327; 
	Mon, 30 Jul 2018 10:39:48 -0700 (PDT)
Received: from ?IPv6:2a04:ae08:1403:ff00:958b:9f8c:39d7:b97d?
	([2a04:ae08:1403:ff00:958b:9f8c:39d7:b97d])
	by smtp.gmail.com with ESMTPSA id
	w12-v6sm2198664ljw.60.2018.07.30.10.39.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 30 Jul 2018 10:39:47 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
X-Google-Original-From: Oleksandr Kravchuk <dev@sashko.rv.ua>
To: Martin Jansa <martin.jansa@gmail.com>,
	Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
References: <20180730161223.9299-1-oleksandr.kravchuk@pelagicore.com>
	<20180730162307.GA1361@jama>
Message-ID: <518c2a4d-a677-3ad2-e50c-c4332f873ab2@sashko.rv.ua>
Date: Mon, 30 Jul 2018 19:39:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180730162307.GA1361@jama>
Cc: openembedded-devel@lists.openembedded.org,
	Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
Subject: Re: [meta-oe][PATCH] Revert "glibmm: Upgrade to 2.56.0"
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
X-List-Received-Date: Mon, 30 Jul 2018 17:39:48 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 30/07/18 18:23, Martin Jansa wrote:
> On Mon, Jul 30, 2018 at 06:12:23PM +0200, Oleksandr Kravchuk wrote:
>> sumo branch of poky contains glib v2.54 which makes compilation of this
>> package fail due to nonexistent functions in the library used by the
>> C++ bindings.
> This explanation doesn't make any sense to me.
>
> With sumo branch of poky use sumo branch of meta-oe which still has
> 2.54.1 version.

Martin -

I appreciate fast response, but your feedback is very ambiguous and 
therefore not helpful: which part of my explanation need to be improved? 
One needs to know if explanation has to be extended or changed 
completely. You simply repeated statement from my commit message and 
presented it as something opposite of what I've said. This is what truly 
doesn't make any sense.

Let me try to explain it differently: poky has glib version 2.54 in its 
'sumo' branch; corresponding branch (sumo) of meta-openembeded has C++ 
binding for glib version 2.56, which has C++ function wrappers for 
functions implemented in glib 2.56, which obviously won't compile, since 
we have glib and headers for it of version 2.54.

If my English is still too poor for you, I propose you checking out sumo 
branches of poky and open-embedded and trying to build 'glibmm' package.

SPOILER: result is going to be the following:

| ../../../glibmm-2.56.0/gio/giomm/application.cc: In member function 
'void Gio::Application::set_option_context_parameter_string(const 
Glib::ustring&)':
| ../../../glibmm-2.56.0/gio/giomm/application.cc:1169:3: error: 
'g_application_set_option_context_parameter_string' was not declared in 
this scope
|    g_application_set_option_context_parameter_string(gobj(), 
parameter_string.empty() ? nullptr : parameter_string.c_str());
|    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| ../../../glibmm-2.56.0/gio/giomm/application.cc:1169:3: note: 
suggested alternative: 'set_option_context_parameter_string'
|    g_application_set_option_context_parameter_string(gobj(), 
parameter_string.empty() ? nullptr : parameter_string.c_str());
|    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    set_option_context_parameter_string
| ../../../glibmm-2.56.0/gio/giomm/application.cc: In member function 
'void Gio::Application::set_option_context_summary(const Glib::ustring&)':
| ../../../glibmm-2.56.0/gio/giomm/application.cc:1174:3: error: 
'g_application_set_option_context_summary' was not declared in this scope
|    g_application_set_option_context_summary(gobj(), summary.empty() ? 
nullptr : summary.c_str());
|    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| ../../../glibmm-2.56.0/gio/giomm/application.cc:1174:3: note: 
suggested alternative: 'set_option_context_summary'
|    g_application_set_option_context_summary(gobj(), summary.empty() ? 
nullptr : summary.c_str());
|    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    set_option_context_summary
| ../../../glibmm-2.56.0/gio/giomm/application.cc: In member function 
'void Gio::Application::set_option_context_description(const 
Glib::ustring&)':
| ../../../glibmm-2.56.0/gio/giomm/application.cc:1179:3: error: 
'g_application_set_option_context_description' was not declared in this 
scope
|    g_application_set_option_context_description(gobj(), 
description.empty() ? nullptr : description.c_str());
|    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| ../../../glibmm-2.56.0/gio/giomm/application.cc:1179:3: note: 
suggested alternative: 'set_option_context_description'
|    g_application_set_option_context_description(gobj(), 
description.empty() ? nullptr : description.c_str());
|    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    set_option_context_description


Let us check the first function 
(https://developer.gnome.org/gio/stable/GApplication.html#g-application-set-option-context-parameter-string) 
and find out that it was introduced in 2.56.

>
>> This reverts commit acfba081bbe49fd9dccbf12be6535d5342c6d747.
>> ---
>>   .../0001-Glib-Threads-Private-Fix-gobj.patch  | 40 +++++++++++++++++++
>>   .../{glibmm_2.56.0.bb => glibmm_2.54.1.bb}    |  5 ++-
>>   2 files changed, 43 insertions(+), 2 deletions(-)
>>   create mode 100644 meta-oe/recipes-core/glib-2.0/glibmm/0001-Glib-Threads-Private-Fix-gobj.patch
>>   rename meta-oe/recipes-core/glib-2.0/{glibmm_2.56.0.bb => glibmm_2.54.1.bb} (86%)
>>
>> diff --git a/meta-oe/recipes-core/glib-2.0/glibmm/0001-Glib-Threads-Private-Fix-gobj.patch b/meta-oe/recipes-core/glib-2.0/glibmm/0001-Glib-Threads-Private-Fix-gobj.patch
>> new file mode 100644
>> index 000000000..7899022f1
>> --- /dev/null
>> +++ b/meta-oe/recipes-core/glib-2.0/glibmm/0001-Glib-Threads-Private-Fix-gobj.patch
>> @@ -0,0 +1,40 @@
>> +From 838fe84c2ddcc9af51c34f751defbf3dd0ba8a06 Mon Sep 17 00:00:00 2001
>> +From: Kjell Ahlstedt <kjellahlstedt@gmail.com>
>> +Date: Wed, 20 Dec 2017 20:00:32 +0100
>> +Subject: [PATCH] Glib::Threads::Private: Fix gobj()
>> +
>> +Bug 791711
>> +
>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> +---
>> +Upstream-Status: Backport [https://github.com/GNOME/glibmm/commit/37d57ae9572b7d74aa385a30313eceae7f2d3fce]
>> + glib/glibmm/threads.h | 2 +-
>> + glib/src/threads.hg   | 2 +-
>> + 2 files changed, 2 insertions(+), 2 deletions(-)
>> +
>> +diff --git a/glib/glibmm/threads.h b/glib/glibmm/threads.h
>> +index f7e2b82a..2c0cbe8c 100644
>> +--- a/glib/glibmm/threads.h
>> ++++ b/glib/glibmm/threads.h
>> +@@ -657,7 +657,7 @@ public:
>> +    */
>> +   inline void replace(T* data);
>> +
>> +-  GPrivate* gobj() { return gobject_; }
>> ++  GPrivate* gobj() { return &gobject_; }
>> +
>> + private:
>> +   GPrivate gobject_;
>> +diff --git a/glib/src/threads.hg b/glib/src/threads.hg
>> +index 86d7a17b..c82a6130 100644
>> +--- a/glib/src/threads.hg
>> ++++ b/glib/src/threads.hg
>> +@@ -628,7 +628,7 @@ public:
>> +    */
>> +   inline void replace(T* data);
>> +
>> +-  GPrivate* gobj() { return gobject_; }
>> ++  GPrivate* gobj() { return &gobject_; }
>> +
>> + private:
>> +   GPrivate gobject_;
>> diff --git a/meta-oe/recipes-core/glib-2.0/glibmm_2.56.0.bb b/meta-oe/recipes-core/glib-2.0/glibmm_2.54.1.bb
>> similarity index 86%
>> rename from meta-oe/recipes-core/glib-2.0/glibmm_2.56.0.bb
>> rename to meta-oe/recipes-core/glib-2.0/glibmm_2.54.1.bb
>> index 2f048d2f6..4706432ab 100644
>> --- a/meta-oe/recipes-core/glib-2.0/glibmm_2.56.0.bb
>> +++ b/meta-oe/recipes-core/glib-2.0/glibmm_2.54.1.bb
>> @@ -13,9 +13,10 @@ SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
>>   SRC_URI = " \
>>       ftp://ftp.gnome.org/pub/GNOME/sources/glibmm/${SHRT_VER}/glibmm-${PV}.tar.xz \
>>       file://remove-examples.patch \
>> +    file://0001-Glib-Threads-Private-Fix-gobj.patch \
>>   "
>> -SRC_URI[md5sum] = "5aa7a60084fe3e01d746c96f4a115302"
>> -SRC_URI[sha256sum] = "6e74fcba0d245451c58fc8a196e9d103789bc510e1eee1a9b1e816c5209e79a9"
>> +SRC_URI[md5sum] = "dee5ebe309f5976c3dacfcf5c43a062b"
>> +SRC_URI[sha256sum] = "7cc28c732b04d70ed34f0c923543129083cfb90580ea4a2b4be5b38802bf6a4a"
>>   
>>   do_install_append() {
>>       install -d ${D}${datadir}/glibmm-2.4
>> -- 
>> 2.17.1
>>
>> -- 
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


