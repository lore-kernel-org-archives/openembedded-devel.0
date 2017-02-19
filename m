Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 152AC71A54;
	Sun, 19 Feb 2017 19:56:17 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id v186so60680698wmd.0;
	Sun, 19 Feb 2017 11:56:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=fOETAVP4gt1kNNQeNJVB9Ro8ZxZ3080LTCAgQCHytwU=;
	b=iyKRh0O09OfdRNJbwjlmVXze+N9za9WbwfO+DGw7mvf0goj2tN6ZML9CY19pTLIM6e
	1/P1CKq8v24acUxQ7/xDYBFDpIwmDFHPc6kzZJ52L7cIUtaFLZ2uJMIvsvArRYLfNdG6
	uv1ZofEwz3Kr00wlqaxU+WQTkYD2xUPFxxElUOaiIezWpjVleScKMHeAv2oTqf2I+uKb
	J824sX/rWOeDII4rkUOEe74y/WHTW1sV/cVWwSJyb+WHYAdtorFRKGdkO4L52FDhLFQM
	SM2YZC28tQSDUL8Nz6cEpg/4529N9oyYb+fAio6vK25gHkH3XyJM+gjvOPPC5kb3TmT0
	+0+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=fOETAVP4gt1kNNQeNJVB9Ro8ZxZ3080LTCAgQCHytwU=;
	b=Az4RCsetZRKTUjEOV6QYNnlbmX5XxlBvvP0cCk/J73m6Zp+aZ7LGl0DcCk27ytNwnc
	3ZbVestQIIdkBglX+zBBV8b9DcK+75eDfd/1757ZVxJ5ocBv86LuZ2hnGSG+e8Qk6tz4
	PuzgB4rQlrgFZ1knpAG4KedHpLBL6pLQovwmLRkIWKS4V8SAozuiUVX5+xcr6hcMQSw+
	4G1acjThb8goIeO0w9oJhBlQSC4fqzeRB/iDpSgftCc6pZ6qBvGKXAHha0bhQ8SsDvRo
	oeV0Gs2Zh+ndRH3Sfuanjb44LtraHWyNIrXj3bLY3V35qkIbMUVORcuJq8qn/TLSVQqK
	Zldg==
X-Gm-Message-State: AMke39nBfb2cw9LIkyda0xsADebMCC5z5kPE3HgnI2V7ohGV6q81CAE9aJgZEEA/Ks0jkZjlc6yX0km63Dtu2w==
X-Received: by 10.28.96.130 with SMTP id u124mr16238035wmb.81.1487534177367;
	Sun, 19 Feb 2017 11:56:17 -0800 (PST)
MIME-Version: 1.0
Received: by 10.80.148.174 with HTTP; Sun, 19 Feb 2017 11:56:16 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sun, 19 Feb 2017 20:56:16 +0100
Message-ID: <CA+chaQdVyf-j8fLG+vbPy79s5U35_LymQteaB+YxqxAa+xA55A@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: State of bitbake world, Failed tasks 2017-02-18
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
X-List-Received-Date: Sun, 19 Feb 2017 19:56:18 -0000
Content-Type: text/plain; charset=UTF-8

== Number of issues - stats ==
{| class='wikitable'
!|Date		     !!colspan='3'|Failed tasks			    !!colspan='6'|Failed
depencencies			 !!|Signatures		  !!colspan='12'|QA !!Comment
|-
||		||qemuarm	||qemux86	||qemux86_64	||qemuarm||max||min	||qemux86||max||min	||all
	||already-stripped	||libdir	||textrel	||build-deps	||file-rdeps	||version-going-backwards	||host-user-contaminated	||installed-vs-shipped	||unknown-configure-option	||symlink-to-sysroot	||invalid-pkgconfig	||pkgname	||
|-

||2017-02-18	||5	||6	||5	||N/A	||N/A	||N/A	||N/A	||N/A	||N/A	||0	||0		||0		||3		||1		||5		||2144		||0		||0		||0		||0		||0		||0		||
|}
http://www.openembedded.org/wiki/Bitbake_World_Status

== Failed tasks 2017-02-18 ==

INFO: jenkins-job.sh-1.8.17 Complete log available at
http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.report.20170219_095431.log

=== common (5) ===
    * meta-openembedded/meta-gnome/recipes-gnome/gthumb/gthumb_2.12.4.bb:do_configure
    * meta-openembedded/meta-gnome/recipes-support/florence/florence_0.5.4.bb:do_configure
    * meta-openembedded/meta-oe/recipes-support/farsight/farsight2_0.0.22.bb:do_configure
    * meta-smartphone/meta-android/recipes-android/android-tools/android-tools_4.2.2.bb:do_compile
    * virtual:native:meta-openembedded/meta-oe/recipes-extended/efivar/efivar_0.30.bb:do_compile

=== common-x86 (0) ===

=== qemuarm (0) ===

=== qemux86 (1) ===
    * meta-browser/recipes-browser/chromium/chromium-wayland_53.0.2785.143.bb:do_compile

=== qemux86_64 (0) ===

=== Number of failed tasks (16) ===
{| class=wikitable
|-
|| qemuarm 	|| 5	 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.world.qemuarm.20170217_163325.log/
|| http://errors.yoctoproject.org/Errors/Build/32678/
|-
|| qemux86 	|| 6	 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.world.qemux86.20170217_153048.log/
|| http://errors.yoctoproject.org/Errors/Build/32679/
|-
|| qemux86_64 	|| 5	 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.world.qemux86-64.20170218_121122.log/
|| http://errors.yoctoproject.org/Errors/Build/32693/
|}

=== PNBLACKLISTs (421) ===

=== QA issues (2153) ===
{| class=wikitable
!| Count		||Issue

|-
||0	||already-stripped
|-
||0	||host-user-contaminated
|-
||0	||installed-vs-shipped
|-
||0	||invalid-pkgconfig
|-
||0	||libdir
|-
||0	||pkgname
|-
||0	||symlink-to-sysroot
|-
||0	||unknown-configure-option
|-
||1	||build-deps
|-
||2144	||version-going-backwards
|-
||3	||textrel
|-
||5	||file-rdeps
|}



=== Incorrect PACKAGE_ARCH or sstate signatures (0) ===

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.signatures.20170218_120426.log/

No issues detected

