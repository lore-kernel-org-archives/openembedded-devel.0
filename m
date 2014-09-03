Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id F1B77713C5
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Sep 2014 08:19:39 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 03 Sep 2014 01:19:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,455,1406617200"; d="scan'208";a="597185559"
Received: from svgunawa-mobl.gar.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.120.16])
	by orsmga002.jf.intel.com with ESMTP; 03 Sep 2014 01:19:38 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Chong Lu <Chong.Lu@windriver.com>
Date: Wed, 03 Sep 2014 09:19:37 +0100
Message-ID: <1755298.3zgHOsdkmW@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.13.3 (Linux/3.15.10-201.fc20.x86_64; KDE/4.13.3; x86_64; ;
	)
In-Reply-To: <1409726935-6212-1-git-send-email-Chong.Lu@windriver.com>
References: <1409726935-6212-1-git-send-email-Chong.Lu@windriver.com>
MIME-Version: 1.0
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
X-List-Received-Date: Wed, 03 Sep 2014 08:19:48 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Chong,

On Wednesday 03 September 2014 14:48:55 Chong Lu wrote:
> Split a ${PN}-template pkg to put ${datadir}/lxc/templates/, and debash in
> ${datadir}/lxc/hooks/*
> 
> Bash scripts:
> lxc/usr/share/lxc/hooks/mountcgroups:#!/bin/bash
> lxc/usr/share/lxc/hooks/ubuntu-cloud-prep:#!/bin/bash
> lxc/usr/share/lxc/templates/lxc-debian:1:#!/bin/bash
> lxc/usr/share/lxc/templates/lxc-openmandriva:1:#!/bin/bash
> lxc/usr/share/lxc/templates/lxc-archlinux:1:#!/bin/bash
> lxc/usr/share/lxc/templates/lxc-centos:1:#!/bin/bash
> lxc/usr/share/lxc/templates/lxc-plamo:1:#!/bin/bash -eu
> lxc/usr/share/lxc/templates/lxc-ubuntu-cloud:1:#!/bin/bash
> lxc/usr/share/lxc/templates/lxc-opensuse:1:#!/bin/bash
> lxc/usr/share/lxc/templates/lxc-gentoo:1:#!/bin/bash
> lxc/usr/share/lxc/templates/lxc-altlinux:1:#!/bin/bash
> lxc/usr/share/lxc/templates/lxc-sshd:1:#!/bin/bash
> lxc/usr/share/lxc/templates/lxc-ubuntu:1:#!/bin/bash
> lxc/usr/share/lxc/templates/lxc-cirros:1:#!/bin/bash
> lxc/usr/share/lxc/templates/lxc-busybox:1:#!/bin/bash
> lxc/usr/share/lxc/templates/lxc-fedora:1:#!/bin/bash
> 
> Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
> ---
>  recipes-containers/lxc/lxc_1.0.5.bb |   11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)

meta-virtualization patches should be sent to the 
meta-virtualization@yoctoproject.org mailing list rather than here.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

