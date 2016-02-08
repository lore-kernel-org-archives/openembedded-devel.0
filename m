Return-Path: <sledz@dresearch-fe.de>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id BFBB9731BA
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Feb 2016 11:43:15 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id g62so112273315wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Feb 2016 03:43:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dresearch-fe-de.20150623.gappssmtp.com; s=20150623;
	h=resent-from:resent-to:resent-date:resent-message-id
	:resent-user-agent:to:from:subject:message-id:date:user-agent
	:mime-version:content-type:content-transfer-encoding;
	bh=IqFUIDMqPbDX9gqUK0NexMLUaGlJKFD+2f9PdD/7paY=;
	b=I3hYkt4nnaoG2SeaLjAvNBSUsgm3GEnhRHnAvbxT7LYRBvRmqyd3fYqeQgh3cNHlvu
	yM4h8xo3fVPxOI9fVoedlpjTO+2UZqvH2cR3NKi3VyOrNGlE8cZWw6ChZWf9b7MxsaJn
	hr86PzOCBGfAJyFZXqD/4XvR+88Dkj4POpET56NuYyZ4VjTREr8NdUWq6w/srp9SwcPb
	jc8bq3iy8AgiA9kRCPdL7TtsSA6imN/hScj6bwm2LcuczTvDsfepWav28fv17QbJ8eQi
	2K//Y6xru8qvJ/cuwK9u8lqfvd3jaHiSsndSx73+KwRmIPNOMeKfhhc+A1FgWJ77LhR1
	JezA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:resent-from:resent-to:resent-date
	:resent-message-id:resent-user-agent:to:from:subject:message-id:date
	:user-agent:mime-version:content-type:content-transfer-encoding;
	bh=IqFUIDMqPbDX9gqUK0NexMLUaGlJKFD+2f9PdD/7paY=;
	b=JA5Wdlad6q/l5E3scn0+lAs6Lt3emzJEGrbozbvhtgBfnP5BlA4c27UzRjDoSwnxCr
	I/bUZosmD+exPhl0q4O/Bv9fikojkm054wnrgZ/U0g7FlBK1kSaPZrIIp9OtSrfr2Zwn
	gLSIRQdPGlo6VXMfjhvHZ0aRxHwafi+CS/Al/Fl7rqSEsUE255fCBqaghVDrzNMrzB6h
	wrSrTegIpV/hZKrneTU9x5Og/MElvg8uncPf7xRj0HEG5Ynnj59WY7KTatFEOUgI7DGe
	b/o4TekCUcGIRKD1D3JwH6jW5WMZAbUaYsZOve2P434q9H+JKCnvUilPp2rZh5FZCglu
	TewA==
X-Gm-Message-State: AG10YOStaEgbO4WnPuTLgkYhTultDNGB/OH/K11mJUUX/aqnH/QcnX1NH8NLc8xch5qZ5A==
X-Received: by 10.194.114.106 with SMTP id jf10mr32788285wjb.149.1454931796017;
	Mon, 08 Feb 2016 03:43:16 -0800 (PST)
Received: from [172.29.23.46] (zk223.dresearch-fe.de. [217.92.177.116])
	by smtp.googlemail.com with ESMTPSA id
	p9sm29410983wjy.41.2016.02.08.03.43.15
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 08 Feb 2016 03:43:15 -0800 (PST)
Resent-From: Steffen Sledz <sledz@dresearch-fe.de>
Resent-To: openembedded-devel
 <openembedded-devel@lists.openembedded.org>
Resent-Date: Mon, 8 Feb 2016 12:43:14 +0100
Resent-Message-ID: <56B87F52.6060200@dresearch-fe.de>
Resent-User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:38.0) Gecko/20100101 Thunderbird/38.5.0
Received: from [172.29.23.46] (zk223.dresearch-fe.de. [217.92.177.116])
	by smtp.googlemail.com with ESMTPSA id
	u191sm11935241wmd.4.2016.02.08.02.23.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 08 Feb 2016 02:23:07 -0800 (PST)
To: openembedded-core <openembedded-core@lists.openembedded.org>
From: Steffen Sledz <sledz@dresearch-fe.de>
X-Enigmail-Draft-Status: N1210
Message-ID: <56B86C8A.9020304@dresearch-fe.de>
Date: Mon, 8 Feb 2016 11:23:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.0
MIME-Version: 1.0
Subject: kernel not booting if build with gcc-5.2.0
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
X-List-Received-Date: Mon, 08 Feb 2016 11:43:17 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

While switching from fido to jethro we hit the next problem. :(

For one of our machines (based on Marvell Kirkwood, very similar to OpenRD) the kernel build with the preferred gcc-5.2.0 does not boot. Immediately after the kernel is started from u-boot the system freezes. The last output on the console is "Starting kernel ...".

If we build with the also available gcc-4.9.3 the kernel boots fine.

The kernel version is the one siggested by jethro:

 SRC_URI = " git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git;protocol=git;nocheckout=1;name=machine \
 ...
 LINUX_VERSION ?= "4.2"
 LINUX_VERSION_EXTENSION_append = "-hikirk"
 ...
 SRCREV_machine="64291f7db5bd8150a74ad2036f1037e6a0428df2"

Any suggestions?

Regards,
Steffen

- -- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJWuGyJAAoJEIz5slJ1krPh1pUP/RtqrOY8EIjpksnpOuF4hecR
fyigic5MN4D+/n4meRUOXYOGZHvBSWIQXLYvfooCTAMYaQS+J96B+2ZCVkv52AI6
NyGGdUJ065+yPt3obgOBP2/yJXsvJWPmlIa6SZDawwXnsr2hJZE2wrCpDWeVXvyy
LnhykrkCcblTvHH2nWkK+Tym1uOAfNrU8bqptm66jrSKg/9gysSicwamzyAeofrU
K+gizGKa4mj54QeINvGKwVWOzSWPNBuAszfnnDwcg9Cpc1GZpjc511oUBMO2xCqH
Sub8D0yBtGreokfYDl5FDlT+7n1qtpliZ7ZFZH0TZqWazA021u0nZ/UWHQe3UtOI
uaswhTdRQqL+okqKqrIAvcTuFcCZxBVd8orz7wEm/3huTAWIWQplyPWSOXjeK9es
MbkO/daNLsRzF/PJgX+zF5mk1F06o/zYwXRzWboNMPeir3ehet2N1CUKLJVbKMW3
cDvYXEtvYwXe8JtYPxQUN4ceruxqvrLVdZMhViIiVOXqGmRsXPsPKQIE9qXIa4gY
GTY/n7FSHThf1q3j3cTu+p2AWpGgYzaaZ/i4mFK72Sn0FHZZGPEtB6/QvvFEORLn
7Dfm3YThf4od6V1T1JVDQKwRIXeGjXRNb27bWyWIOhkLx+mfh3Y9HaCXfIeXsyk+
5AkiQRfKR/O29IePx0a0
=J9ka
-----END PGP SIGNATURE-----

