Return-Path: <sragolu@mvista.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 28AF171C07
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Dec 2016 09:57:24 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id c184so21329876wmd.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Dec 2016 01:57:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:from:date:message-id:subject:to;
	bh=o3dnfv24YiPyirAA7AnJUFJGuBU4WolsCyZM/Mk1yI0=;
	b=dskRtGGI2zbzJ60cAQVMo1ByFM6ydl9AqRdnC663vfnxhL+gkKGHc02cKjlGUCnEC2
	71RnnchTCpz+tVoRUPiYWDKG5yrVlDwtdp7EaoBKaCVUV3QHEGFQkGNYH5MGgJx9IMFp
	80aP03HGJxv11gPceD28rBDEwUfQ/7D0Vas49AziWWTVFEE31HW6sw/yfugf4cRdJjMM
	5+obsTHOKSp5t5VsfWvKCPg28UyORJrWQK/4mB/gN+6leTuIelViisw+8OrSQ6rIuUob
	oSFe6Mr+fuYBKwG1RbD0jRNzuBYRqiK9S6bz43Y3k+ErXuVxDo6/pade0f4YfpUmS6WE
	gmjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=o3dnfv24YiPyirAA7AnJUFJGuBU4WolsCyZM/Mk1yI0=;
	b=L7ONzotTEQ/BCmGY+mDXuLMT8PIVOoz+jZKDPx42RX7cTwRPRzNSTRKNto6VOuDiZy
	qp6Z17uepQqAkwdfepyozoUFugIMEtUC83p21R1rVmBp4wRUxI3uRyA6trHwUzheWAfF
	Ruisv5/5P80kmkQNpu4xbW+WNxvUc0iMJatg6qNP9H4Ay+5Xw4+Ty4XO6rPQIAunp+Wo
	XoesUkOHBrFE8LKSsjh+xuovTQREx6lbZPFzLoUUf1Q4RshQm8gDlRSEyoF80Kx+ONED
	yBhP3wd1nQoYD5OHZu8U9xBmjZkRWgpaKbUU3eFolTV+rydvH+1QolPnJxlggQP5cBYi
	OO7w==
X-Gm-Message-State: AKaTC03lnVwEsCHgQNGpXvlJgxZljKsONITxlBoMx7Q8n14o3reR1RJXCHS94C2xYIZyPLUhj6khP5oc5fg5uV4h
X-Received: by 10.25.150.210 with SMTP id y201mr32509058lfd.58.1481623045213; 
	Tue, 13 Dec 2016 01:57:25 -0800 (PST)
MIME-Version: 1.0
Received: by 10.25.158.144 with HTTP; Tue, 13 Dec 2016 01:57:24 -0800 (PST)
From: Srinivasa Rao Ragolu <sragolu@mvista.com>
Date: Tue, 13 Dec 2016 15:27:24 +0530
Message-ID: <CAH4+OFoKCiQ+reQ-52MoXSMPgZW9+TNp938E0EXH5Pif48=-pg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: OpenJDK 8 is failing to configure ( dylan yocto)
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
X-List-Received-Date: Tue, 13 Dec 2016 09:57:26 -0000
Content-Type: text/plain; charset=UTF-8

Hi All,

I have taken openjdk-8_72b05 from yocto and tried to build . But somehow
autotools configure could not able to find configure script in
common/autoconf directory and failing at configure stage. Please provide
your inputs to resolve this issue.

Log data follows:
| DEBUG: Executing python function sysroot_cleansstate
| DEBUG: Python function sysroot_cleansstate finished
| DEBUG: SITE files ['endian-little', 'common-linux', 'common-glibc',
'bit-64', 'x86_64-linux', 'common']
| DEBUG: Executing shell function autotools_preconfigure
| DEBUG: Shell function autotools_preconfigure finished
| DEBUG: Executing shell function do_configure
| ERROR: no configure script found at
/home/srinivas/cham-project/ericsson-project/tmp/work/x86_64-linux/openjdk-8-native/72b05-r0/jdk8u-e8bed1496ff2/configure
| ERROR: Function failed: do_configure (see
/home/srinivas/cham-project/ericsson-project/tmp/work/x86_64-linux/openjdk-8-native/72b05-r0/temp/log.do_configure.18043
for further information)


Please help me in resolving this issue

Thanks in advance,
Srinivas.

