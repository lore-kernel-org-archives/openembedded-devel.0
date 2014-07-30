Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id CC7AC65F81
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Jul 2014 07:28:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s6U7SdHs017849
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 30 Jul 2014 00:28:39 -0700 (PDT)
Received: from [128.224.162.159] (128.224.162.159) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 30 Jul 2014 00:28:38 -0700
Message-ID: <53D89EA9.4020801@windriver.com>
Date: Wed, 30 Jul 2014 15:28:41 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1406700643-5816-1-git-send-email-rongqing.li@windriver.com>
	<CAMKF1sppmXVJj8tkDv4=JJN1jkirMZuJ5pimJDoifcZyikaJRA@mail.gmail.com>
In-Reply-To: <CAMKF1sppmXVJj8tkDv4=JJN1jkirMZuJ5pimJDoifcZyikaJRA@mail.gmail.com>
Subject: Re: [PATCH][meta-python] python-slip-dbus: add recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 30 Jul 2014 07:28:48 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 07/30/2014 02:49 PM, Khem Raj wrote:
> On Tue, Jul 29, 2014 at 11:10 PM,  <rongqing.li@windriver.com> wrote:
>> +SECTION = "devel/python"
>> +LICENSE = "GPLv2+"
>> +LIC_FILES_CHKSUM = "file://COPYING;md5=5574c6965ae5f583e55880e397fbb018"
>> +SRCNAME = "python-slip"
>> +
>> +SRC_URI = "https://fedorahosted.org/released/python-slip/python-slip-${PV}.tar.bz2"
>
> You could use SRCNAME in SRC_URI as well instead of hardcoding python-slip
>
>> +S = "${WORKDIR}/${SRCNAME}-${PV}"
>> +
>> +inherit setuptools
>> +
>> +SRC_URI[md5sum] = "fb3299d75af1a67ca6679d96ce839da6"
>> +SRC_URI[sha256sum] = "f47361ec52b608309b83c71905e692b6b363eaf3b8a7afdeff866cd94463ad5c"
>> +
>> +do_compile_prepend() {
>> +    sed -e 's/@VERSION@/0.6.0/g' setup.py.in > setup.py
>
> could this somehow use PV and not 0.6.0 hardcoded ?
>
>> +}
>
> may be also run the recipe thru contrib/oe-stylize.py for formatting
> and structure.
>

Thanks, I will change them

-- 
Best Reagrds,
Roy | RongQing Li

