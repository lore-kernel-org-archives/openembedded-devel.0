Return-Path: <sandro.stiller@elfin.de>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 3EC956E680
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Mar 2016 12:21:10 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id l68so175515345wml.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Mar 2016 04:21:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=elfin-de.20150623.gappssmtp.com; s=20150623;
	h=to:from:subject:message-id:date:user-agent:mime-version
	:content-transfer-encoding;
	bh=oscv/T8AbiPl3DHk27cJpN+/gTd7f/p//9qHKnVn1bc=;
	b=1Xxe3wAS3wYN/1sd+J2O3Dgj1V54jpKJtY8LsxEKwE/yu4J6rGLLkLFLlyPE71YSqy
	ORAoko7RE4Ao11bnrhQLaXkCgKaMFsX8dkt8CTCdiSlMeMoUbb5BRSJmBdVGKOQbwz4t
	P3eTn6Vh3d9RkjMwMqyL6yvFBDJzwAncuKwyekcmHahBg9VC+kerPFsjGMBmdd6Vpldz
	IV/WPi9G7bYaWbcnCPy5EaN4IKHdHtRvD+xWkDgqAf+iX5JugcEyE5A7kw+PIU0PQfhO
	2wtsvVZLKcsh8g5c5A50yzgxDyh1Z3l9Of6yq2BtW7PvVpKv0fDQ2AgyzitziOcxJvll
	kDwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:to:from:subject:message-id:date:user-agent
	:mime-version:content-transfer-encoding;
	bh=oscv/T8AbiPl3DHk27cJpN+/gTd7f/p//9qHKnVn1bc=;
	b=jdXkOamAPj2OkuA4v0G1FGIKZvu68A0E7eO8FF0S2L7e5kHADaLfeFYr7gmTy6q7v7
	uj7SzsABDiubeuW4I8wtmnRRp771KbPFiaauINu1BPxAD1p312q+Vb0ErNO5VrOxIP2N
	QIpN3wJKnQZIY8SwUOKyVq8RtGsr0PjSckJUb1ANoJUASAguoK6O4fnGAtKLpPXPYH0P
	3IazGtcsWBlquew7zpL7S5AsqPR1N7gHGf6WdmeX0BuS1mXbvx37qBmrDuR+c317ikxV
	RzAMKBp8ReUD2VRckF9+S3lGZJzzIK63d9nliij5OHtTVZa8tJWPg0C5zlnw+S1jiV2K
	GgiA==
X-Gm-Message-State: AD7BkJIaEysmb8DutR9DqpSsalUckkYwhGuQ4yorY0xpuwzMIdRnAZGjPn5H+blR557vvQ==
X-Received: by 10.28.9.71 with SMTP id 68mr24837019wmj.33.1457526070737;
	Wed, 09 Mar 2016 04:21:10 -0800 (PST)
Received: from [192.168.2.147] (b2b-94-79-174-114.unitymedia.biz.
	[94.79.174.114]) by smtp.googlemail.com with ESMTPSA id
	ks5sm7701641wjb.13.2016.03.09.04.21.09
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 09 Mar 2016 04:21:10 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
From: Sandro Stiller <sandro.stiller@elfin.de>
Message-ID: <56E01535.6030509@elfin.de>
Date: Wed, 9 Mar 2016 13:21:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
Subject: systemd service not enabled when adding simple recipe to image
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
X-List-Received-Date: Wed, 09 Mar 2016 12:21:12 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,
I have a problem enabling a simple systemd service:
If I install my package using the .ipk file, everything works fine
(systemd service ist enabled after install), but if I create an image
containing this package, the service is disabled.
It can be enabled by calling "systemctl enable <mytestscript.service>".
All files of the package are installed correctly (only the systemd
symlink is missing). I have other packages with working systemd, the
problem exists only in the simple case with a single shell script.

I use Angstrom v2015.06 / Yocto 1.8

Can anybody tell me what I'm doing wrong?

Thank you very much,

Sandro


My files:
###################### mytestscript.bb ########################
SUMMARY = "systemd test script"
DESCRIPTION = "This script is a quick demo for a not initialized systemd 
service."
SECTION = "console/network"
LICENSE = "MIT"
LIC_FILES_CHKSUM = 
"file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690"

inherit systemd

SRC_URI = "file://mytestscript.service \
            file://mytestscript.sh \
           "

do_compile() {
}

do_install () {
   install -d ${D}${bindir}
   install -m 0755 ${WORKDIR}/mytestscript.sh ${D}${bindir}
   install -d ${D}${systemd_unitdir}/system
   install -m 0644 ${WORKDIR}/mytestscript.service 
${D}${systemd_unitdir}/system
   sed -i -e 's,@BINDIR@,${bindir},g' \
		${D}${systemd_unitdir}/system/mytestscript.service
}

NATIVE_SYSTEMD_SUPPORT = "1"
SYSTEMD_PACKAGES = "${PN}"
SYSTEMD_SERVICE_${PN} = "mytestscript.service"
SYSTEMD_AUTO_ENABLE = "enable"

FILES_${PN} += "${systemd_unitdir}/system/mytestscript.service"

###################### files/mytestscript.sh #########################
#!/bin/sh
echo "Hello from testscript"

###################### files/mytestscript.service ######################
[Unit]
Description=A test script
After=local-fs.target

[Service]
Type=oneshot
ExecStart=@BINDIR@/mytestscript.sh

[Install]
WantedBy=multi-user.target

