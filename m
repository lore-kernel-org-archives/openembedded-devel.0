Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 54B5A70F06
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Sep 2014 08:27:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s838Rq4H024105
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 3 Sep 2014 01:27:53 -0700 (PDT)
Received: from [128.224.162.204] (128.224.162.204) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Wed, 3 Sep 2014 01:27:52 -0700
Message-ID: <5406D105.5070309@windriver.com>
Date: Wed, 3 Sep 2014 16:27:49 +0800
From: Chong Lu <Chong.Lu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <1409726935-6212-1-git-send-email-Chong.Lu@windriver.com>
	<1755298.3zgHOsdkmW@peggleto-mobl5.ger.corp.intel.com>
In-Reply-To: <1755298.3zgHOsdkmW@peggleto-mobl5.ger.corp.intel.com>
X-Originating-IP: [128.224.162.204]
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-virtualization][PATCH V2] lxc: fix RDEPENDS on bash
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
X-List-Received-Date: Wed, 03 Sep 2014 08:27:57 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit


On 09/03/2014 04:19 PM, Paul Eggleton wrote:
> Hi Chong,
>
> On Wednesday 03 September 2014 14:48:55 Chong Lu wrote:
>> Split a ${PN}-template pkg to put ${datadir}/lxc/templates/, and debash in
>> ${datadir}/lxc/hooks/*
>>
>> Bash scripts:
>> lxc/usr/share/lxc/hooks/mountcgroups:#!/bin/bash
>> lxc/usr/share/lxc/hooks/ubuntu-cloud-prep:#!/bin/bash
>> lxc/usr/share/lxc/templates/lxc-debian:1:#!/bin/bash
>> lxc/usr/share/lxc/templates/lxc-openmandriva:1:#!/bin/bash
>> lxc/usr/share/lxc/templates/lxc-archlinux:1:#!/bin/bash
>> lxc/usr/share/lxc/templates/lxc-centos:1:#!/bin/bash
>> lxc/usr/share/lxc/templates/lxc-plamo:1:#!/bin/bash -eu
>> lxc/usr/share/lxc/templates/lxc-ubuntu-cloud:1:#!/bin/bash
>> lxc/usr/share/lxc/templates/lxc-opensuse:1:#!/bin/bash
>> lxc/usr/share/lxc/templates/lxc-gentoo:1:#!/bin/bash
>> lxc/usr/share/lxc/templates/lxc-altlinux:1:#!/bin/bash
>> lxc/usr/share/lxc/templates/lxc-sshd:1:#!/bin/bash
>> lxc/usr/share/lxc/templates/lxc-ubuntu:1:#!/bin/bash
>> lxc/usr/share/lxc/templates/lxc-cirros:1:#!/bin/bash
>> lxc/usr/share/lxc/templates/lxc-busybox:1:#!/bin/bash
>> lxc/usr/share/lxc/templates/lxc-fedora:1:#!/bin/bash
>>
>> Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
>> ---
>>   recipes-containers/lxc/lxc_1.0.5.bb |   11 +++++++++--
>>   1 file changed, 9 insertions(+), 2 deletions(-)
> meta-virtualization patches should be sent to the
> meta-virtualization@yoctoproject.org mailing list rather than here.
>
> Cheers,
> Paul

Hi Paul,

Thanks, I will resend it.

Best Regards
Chong



