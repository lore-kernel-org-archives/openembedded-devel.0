Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81229C433EF
	for <webhook@archiver.kernel.org>; Mon, 18 Jul 2022 06:52:30 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web08.24388.1658127149739064025
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Jul 2022 23:52:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=c83SjvIZ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id n12so2770713wrc.8
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Jul 2022 23:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:content-transfer-encoding
         :user-agent:mime-version;
        bh=rC7bu8agi3njbG5Ha5CQP2Z2CBnPdN/nKgHQPr5KnkM=;
        b=c83SjvIZrKXeyTmLbY4krYnbO+U9037BotQbvO0ydhYJwQMYhR0ZN0QS2pGvzFEI13
         zq1Zc+lLqkJM+qrGdFv/XQy6XnRKKsPLUl1CY2w71AU+6eBcglbrDfC6gLtmOIB3sV2z
         0kPhcfZsClywk7DhLHANagLZGmTtol2+gqeNI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date
         :content-transfer-encoding:user-agent:mime-version;
        bh=rC7bu8agi3njbG5Ha5CQP2Z2CBnPdN/nKgHQPr5KnkM=;
        b=NZvUcAh354L4lteJRijHH6oO0TKcL6Zsz28sKv9j/+PxTyvheBGdID7tX/MkIyz3Kt
         VDVCUUKTlFC5Kg3v0B7aNsZQwyB0nxT6PG3pyWmDddGKRlc3yJHKXnpcLPIMSfJLez8T
         yJODUooyDnw4Q1BPoCH3UqRTT+vbJ/0kyy6OQmOj+6Uei0+OFWT/NiGKGbsikduF6rb1
         BlIiHTfKMaaQuqw5EUDMMDtD6DWSf05il4IVmsSBPJI1264OzoJu37DrqeGAUDle+XtA
         iVcZG/hcFTUNHlHuQbVFN0Oz0uthVYKs2/LesvadbsC7RmSxfafM+cxoSho1GsDt5oIc
         JvjA==
X-Gm-Message-State: AJIora/qvZFmM1XRt7Uy0r2mcDtCviuQ0SFq8jSje+jplgdrzyDKdC5i
	IybROgoyXx9itbd243/L/1DzAZFPdZX6rQ==
X-Google-Smtp-Source: 
 AGRyM1sRH+3Nr3fda1mp2GBSj9aBsGsPB9t2w8zoITtTwjed31ImbQueoTI/qaBohCWiAvHCrSElcg==
X-Received: by 2002:a5d:47ab:0:b0:21d:b2b1:59b1 with SMTP id
 11-20020a5d47ab000000b0021db2b159b1mr21023991wrb.99.1658127147512;
        Sun, 17 Jul 2022 23:52:27 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:7b9:c151:626:cc65?
 ([2001:8b0:aba:5f3c:7b9:c151:626:cc65])
        by smtp.gmail.com with ESMTPSA id
 y16-20020adfe6d0000000b00213ba3384aesm9865116wrm.35.2022.07.17.23.52.26
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jul 2022 23:52:26 -0700 (PDT)
Message-ID: 
 <44a7b736269f3ea568febae5f0d16033347cfe61.camel@linuxfoundation.org>
Subject: buildpaths warnings in meta-openembedded
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Date: Mon, 18 Jul 2022 07:52:26 +0100
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Jul 2022 06:52:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97867

OE-Core recently enabled buildpaths in WARN_QA. This is so any
reproducibility issues are highlighted by the build much earlier and
for a wider cross section of the userbase.=C2=A0We're now at a point where
having issues show up earlier to users is feasible and very valuable.

We've managed to sort out OE-Core but meta-oe still has a number of
issues. I've listed the ones from the last autobuilder run below. Note
that where multiple files in a package trigger a warning, this will
only list the first occurrence. To reproduce locally, after the first
warning shows, the object will install from sstate and now warning will
show a second time so you need to use "-C package_qa" to test under
some cases.

stdio: WARNING: ndisc6-1.0.5-r0 do_package_qa: QA Issue: File /usr/sbin/rdn=
ssd in package ndisc6-rdnssd contains reference to TMPDIR [buildpaths]
stdio: WARNING: ndisc6-1.0.5-r0 do_package_qa: QA Issue: File /usr/bin/rltr=
aceroute6 in package ndisc6-rltraceroute6 contains reference to TMPDIR [bui=
ldpaths]
stdio: WARNING: ndisc6-1.0.5-r0 do_package_qa: QA Issue: File /usr/bin/rdis=
c6 in package ndisc6-rdisc6 contains reference to TMPDIR [buildpaths]
stdio: WARNING: ndisc6-1.0.5-r0 do_package_qa: QA Issue: File /usr/bin/ndis=
c6 in package ndisc6-ndisc6 contains reference to TMPDIR [buildpaths]
stdio: WARNING: ndisc6-1.0.5-r0 do_package_qa: QA Issue: File /usr/bin/name=
2addr in package ndisc6-misc contains reference to TMPDIR
stdio: WARNING: unbound-1.16.0-r0 do_package_qa: QA Issue: File /usr/src/de=
bug/unbound/1.16.0-r0/build/config.h in package unbound-src contains refere=
nce to TMPDIR [buildpaths]
stdio: WARNING: unbound-1.16.0-r0 do_package_qa: QA Issue: File /usr/sbin/u=
nbound in package unbound contains reference to TMPDIR [buildpaths]
stdio: WARNING: minifi-cpp-0.7.0-r0 do_package_qa: QA Issue: File /usr/bin/=
minifi in package minifi-cpp contains reference to TMPDIR
stdio: WARNING: minifi-cpp-0.7.0-r0 do_package_qa: QA Issue: File /usr/bin/=
.debug/minifi in package minifi-cpp-dbg contains reference to TMPDIR
stdio: WARNING: boinc-client-7.18.1-r0 do_package_qa: QA Issue: File /usr/i=
nclude/boinc/svn_version.h in package boinc-client-dev contains reference t=
o TMPDIR [buildpaths]
stdio: WARNING: ntpsec-1.2.1-r0 do_package_qa: QA Issue: File /usr/src/debu=
g/ntpsec/1.2.1-r0/build/host/ntpd/ntp_parser.tab.h in package ntpsec-src co=
ntains reference to TMPDIR [buildpaths]
stdio: WARNING: yasm-1.3.0+gitAUTOINC+ba463d3c26-r0 do_package_qa: QA Issue=
: File /usr/include/libyasm-stdint.h in package yasm-dev contains reference=
 to TMPDIR [buildpaths]
stdio: WARNING: php-8.1.7-r0 do_package_qa: QA Issue: File /usr/bin/phpdbg =
in package php-phpdbg contains reference to TMPDIR [buildpaths]
stdio: WARNING: php-8.1.7-r0 do_package_qa: QA Issue: File /usr/sbin/php-fp=
m in package php-fpm contains reference to TMPDIR [buildpaths]
stdio: WARNING: php-8.1.7-r0 do_package_qa: QA Issue: File /usr/include/php=
/main/build-defs.h in package php-dev contains reference to TMPDIR
stdio: WARNING: php-8.1.7-r0 do_package_qa: QA Issue: File /usr/bin/.debug/=
php-cgi in package php-dbg contains reference to TMPDIR
stdio: WARNING: php-8.1.7-r0 do_package_qa: QA Issue: File /usr/bin/php in =
package php-cli contains reference to TMPDIR [buildpaths]
stdio: WARNING: php-8.1.7-r0 do_package_qa: QA Issue: File /usr/bin/php-cgi=
 in package php-cgi contains reference to TMPDIR [buildpaths]
stdio: WARNING: nspr-4.29-r0 do_package_qa: QA Issue: File /usr/bin/nspr-co=
nfig in package nspr-dev contains reference to TMPDIR [buildpaths]
stdio: WARNING: lprng-3.8.C-r0 do_package_qa: QA Issue: File /etc/lpd/lpd.c=
onf in package lprng contains reference to TMPDIR
stdio: WARNING: log4cpp-1.1.3-r0 do_package_qa: QA Issue: File /usr/bin/log=
4cpp-config in package log4cpp contains reference to TMPDIR [buildpaths]
stdio: WARNING: libwmf-0.2.8.4-r3 do_package_qa: QA Issue: File /usr/bin/li=
bwmf-config in package libwmf contains reference to TMPDIR [buildpaths]
stdio: WARNING: jsonrpc-1.3.0-r0 do_package_qa: QA Issue: File /usr/lib/lib=
json-rpc-cpp/cmake/libjson-rpc-cppTargets.cmake in package jsonrpc-dev cont=
ains reference to TMPDIR [buildpaths]
stdio: WARNING: gutenprint-git-r0 do_package_qa: QA Issue: File /usr/lib/gu=
tenprint/5.3/config.summary in package gutenprint contains reference to TMP=
DIR [buildpaths]
stdio: WARNING: znc-1.8.2-r0 do_package_qa: QA Issue: File /usr/bin/znc-bui=
ldmod in package znc contains reference to TMPDIR [buildpaths]
stdio: WARNING: imagemagick-7.0.10-62-r0 do_package_qa: QA Issue: File /etc=
/ImageMagick-7/delegates.xml in package imagemagick contains reference to T=
MPDIR
stdio: WARNING: ncftp-3.2.6-r0 do_package_qa: QA Issue: File /usr/bin/ncftp=
get in package ncftp contains reference to TMPDIR
stdio: WARNING: hdf5-1.8.21-r0 do_package_qa: QA Issue: File /usr/lib/libhd=
f5.settings in package hdf5 contains reference to TMPDIR [buildpaths]
stdio: WARNING: dovecot-2.3.14-r0 do_package_qa: QA Issue: File /usr/lib/do=
vecot/dovecot-config in package dovecot contains reference to TMPDIR [build=
paths]
stdio: WARNING: opencv-4.6.0-r0 do_package_qa: QA Issue: File /usr/lib/libo=
pencv_core.so.4.6.0 in package libopencv-core contains reference to TMPDIR =
[buildpaths]
stdio: WARNING: ipmiutil-3.1.5-r0 do_package_qa: QA Issue: File /usr/sbin/.=
debug/iseltime in package ipmiutil-dbg contains reference to TMPDIR [buildp=
aths]
stdio: WARNING: net-snmp-5.9.1-r0 do_package_qa: QA Issue: File /usr/lib/ne=
t-snmp/ptest/include/net-snmp/net-snmp-config.h in package net-snmp-ptest c=
ontains reference to TMPDIR [buildpaths]
stdio: WARNING: net-snmp-5.9.1-r0 do_package_qa: QA Issue: File /usr/includ=
e/net-snmp/net-snmp-config-64.h in package net-snmp-dev contains reference =
to TMPDIR
stdio: WARNING: ldns-1.8.1-r0 do_package_qa: QA Issue: File /usr/bin/ldns-c=
onfig in package ldns contains reference to TMPDIR [buildpaths]
stdio: WARNING: vboxguestdrivers-6.1.34-r0 do_package_qa: QA Issue: File /l=
ib/modules/5.15.54-yocto-standard/kernel/misc/vboxvideo.ko in package kerne=
l-module-vboxvideo-5.15.54-yocto-standard contains reference to TMPDIR [bui=
ldpaths]
stdio: WARNING: vboxguestdrivers-6.1.34-r0 do_package_qa: QA Issue: File /l=
ib/modules/5.15.54-yocto-standard/kernel/misc/vboxsf.ko in package kernel-m=
odule-vboxsf-5.15.54-yocto-standard contains reference to TMPDIR [buildpath=
s]
stdio: WARNING: vboxguestdrivers-6.1.34-r0 do_package_qa: QA Issue: File /l=
ib/modules/5.15.54-yocto-standard/kernel/misc/.debug/vboxguest.ko in packag=
e vboxguestdrivers-dbg contains reference to TMPDIR
stdio: WARNING: vboxguestdrivers-6.1.34-r0 do_package_qa: QA Issue: File /l=
ib/modules/5.15.54-yocto-standard/kernel/misc/vboxguest.ko in package kerne=
l-module-vboxguest-5.15.54-yocto-standard contains reference to TMPDIR [bui=
ldpaths]
stdio: WARNING: libwebsockets-4.2.2-r0 do_package_qa: QA Issue: File /usr/l=
ib/cmake/libwebsockets/LibwebsocketsTargets.cmake in package libwebsockets-=
dev contains reference to TMPDIR [buildpaths]
stdio: WARNING: botan-2.19.2-r0 do_package_qa: QA Issue: File /usr/bin/bota=
n in package botan-bin contains reference to TMPDIR [buildpaths]
stdio: WARNING: botan-2.19.2-r0 do_package_qa: QA Issue: File /usr/include/=
botan-2/botan/build.h in package botan-dev contains reference to TMPDIR [bu=
ildpaths]
stdio: WARNING: freeradius-3.0.21-r0 do_package_qa: QA Issue: File /usr/bin=
/radeapclient in package freeradius-utils contains reference to TMPDIR [bui=
ldpaths]
stdio: WARNING: freeradius-3.0.21-r0 do_package_qa: QA Issue: File /usr/lib=
/libfreeradius-server.so.0.0.0 in package freeradius contains reference to =
TMPDIR [buildpaths]
stdio: WARNING: lirc-0.10.1-r0 do_package_qa: QA Issue: File /usr/include/l=
irc/config.h in package lirc-dev contains reference to TMPDIR [buildpaths]
stdio: WARNING: lirc-0.10.1-r0 do_package_qa: QA Issue: File /usr/bin/irexe=
c in package lirc-exec contains reference to TMPDIR [buildpaths]
stdio: WARNING: ruli-0.36-r0 do_package_qa: QA Issue: File /usr/lib/.debug/=
libruli.so.4 in package ruli-dbg contains reference to TMPDIR [buildpaths]
stdio: WARNING: freediameter-1.4.0-r0 do_package_qa: QA Issue: File /usr/li=
b/freeDiameter/ptest/testloadext in package freediameter-ptest contains ref=
erence to TMPDIR
stdio: WARNING: freediameter-1.4.0-r0 do_package_qa: QA Issue: File /usr/sr=
c/debug/freediameter/1.4.0-r0/build/extensions/rt_default/lex.rtd_conf.c in=
 package freediameter-src contains reference to TMPDIR
stdio: WARNING: quagga-1.2.4-r0 do_package_qa: QA Issue: File /usr/src/debu=
g/quagga/1.2.4-r0/build/lib/version.h in package quagga-src contains refere=
nce to TMPDIR [buildpaths]
stdio: WARNING: quagga-1.2.4-r0 do_package_qa: QA Issue: File /usr/lib/libz=
ebra.so.1.0.0 in package quagga contains reference to TMPDIR [buildpaths]
stdio: WARNING: pcp-5.3.6-r0 do_package_qa: QA Issue: File /etc/pcp.conf in=
 package pcp contains reference to TMPDIR [buildpaths]
stdio: WARNING: pcp-5.3.6-r0 do_package_qa: QA Issue: File /usr/include/pcp=
/builddefs in package pcp-dev contains reference to TMPDIR [buildpaths]
stdio: WARNING: curlpp-0.8.1-r0 do_package_qa: QA Issue: File /usr/bin/curl=
pp-config in package curlpp-dev contains reference to TMPDIR [buildpaths]
stdio: WARNING: postgresql-14.4-r0 do_package_qa: QA Issue: File /usr/inclu=
de/postgresql/server/pg_config.h in package postgresql-server-dev contains =
reference to TMPDIR
stdio: WARNING: postgresql-14.4-r0 do_package_qa: QA Issue: File /usr/lib/l=
ibpgcommon_shlib.a in package postgresql-staticdev contains reference to TM=
PDIR
stdio: WARNING: postgresql-14.4-r0 do_package_qa: QA Issue: File /usr/inclu=
de/pg_config.h in package libpq-dev contains reference to TMPDIR [buildpath=
s]
stdio: WARNING: postgresql-14.4-r0 do_package_qa: QA Issue: File /usr/bin/p=
ostgres in package postgresql contains reference to TMPDIR
stdio: WARNING: zfs-2.1.4-r0 do_package_qa: QA Issue: File /lib/modules/5.1=
5.54-yocto-standard/extra/nvpair/znvpair.ko in package zfs contains referen=
ce to TMPDIR
stdio: WARNING: zfs-2.1.4-r0 do_package_qa: QA Issue: File /lib/modules/5.1=
5.54-yocto-standard/extra/nvpair/.debug/znvpair.ko in package zfs-dbg conta=
ins reference to TMPDIR
stdio: WARNING: zfs-2.1.4-r0 do_package_qa: QA Issue: File /usr/lib/pkgconf=
ig/libzfs_core.pc in package zfs-dev contains reference to TMPDIR
stdio: WARNING: nodejs-16.14.2-r0 do_package_qa: QA Issue: File /usr/includ=
e/node/config.gypi in package nodejs-dev contains reference to TMPDIR [buil=
dpaths]
stdio: WARNING: nodejs-16.14.2-r0 do_package_qa: QA Issue: File /usr/bin/.d=
ebug/node in package nodejs-dbg contains reference to TMPDIR [buildpaths]
stdio: WARNING: nodejs-16.14.2-r0 do_package_qa: QA Issue: File /usr/bin/no=
de in package nodejs contains reference to TMPDIR [buildpaths]

Full autobuilder logs:

https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/1849/step=
s/14/logs/stdio

Patches to help with these would be very welcome.

Cheers,

Richard

