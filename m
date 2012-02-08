Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Rv75r-0007fw-Pv
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Feb 2012 13:57:51 +0100
Received: by wgbdr13 with SMTP id dr13so459399wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Feb 2012 04:49:48 -0800 (PST)
Received: by 10.180.24.202 with SMTP id w10mr40437335wif.9.1328705388513;
	Wed, 08 Feb 2012 04:49:48 -0800 (PST)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id ex2sm1933229wib.1.2012.02.08.04.49.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 08 Feb 2012 04:49:47 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1440338.tNHdM1mVy9@helios>
Date: Wed, 8 Feb 2012 13:49:39 +0100
Message-Id: <01352357-6A6C-4926-8623-E463D1103631@dominion.thruhere.net>
References: <1328627573-5217-1-git-send-email-schnitzeltony@googlemail.com>
	<CAP9ODKp7S2+HR3umrnd9RzT5JE0X_T_cjWPzi6S5WUdZ-SAzoQ@mail.gmail.com>
	<jgtov9$fhv$1@dough.gmane.org> <1440338.tNHdM1mVy9@helios>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Mailer: Apple Mail (2.1251.1)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][RFC 00/27] systemd / initmanager rework
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 08 Feb 2012 12:57:51 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 8 feb. 2012, om 13:18 heeft Paul Eggleton het volgende geschreven:

> On Wednesday 08 February 2012 13:14:27 Koen Kooi wrote:
>> Images with sysvinit will be working the same as before, just with
>> libsystemd-logind.so.X being installed.
>=20
> Just out of interest, how large is that file?

A complete overview:

koen@dominion:/OE/tentacle/build/tmp-angstrom_2010_x-eglibc/work$ du =
../deploy/ipk/armv7a/*v40-r16* -hs
8.0K	../deploy/ipk/armv7a/libsystemd-daemon0_v40-r16_armv7a.ipk
12K	../deploy/ipk/armv7a/libsystemd-id128-0_v40-r16_armv7a.ipk
32K	../deploy/ipk/armv7a/libsystemd-journal0_v40-r16_armv7a.ipk
20K	../deploy/ipk/armv7a/libsystemd-login0_v40-r16_armv7a.ipk
4.0K	../deploy/ipk/armv7a/systemd-analyze_v40-r16_armv7a.ipk
5.4M	../deploy/ipk/armv7a/systemd-dbg_v40-r16_armv7a.ipk
16K	../deploy/ipk/armv7a/systemd-dev_v40-r16_armv7a.ipk
16K	../deploy/ipk/armv7a/systemd-doc_v40-r16_armv7a.ipk
4.0K	../deploy/ipk/armv7a/systemd-initramfs_v40-r16_armv7a.ipk
1.1M	../deploy/ipk/armv7a/systemd_v40-r16_armv7a.ipk
20K	../deploy/ipk/armv7a/systemd-vconsole-setup_v40-r16_armv7a.ipk

regards,

Koen=


