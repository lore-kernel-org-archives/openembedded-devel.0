Received: from [209.85.211.175] (helo=mail-yw0-f175.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <perezmeyer@gmail.com>) id 1MgTgO-0004N8-NV
	for openembedded-devel@lists.openembedded.org;
	Thu, 27 Aug 2009 03:21:45 +0200
Received: by ywh5 with SMTP id 5so807462ywh.13
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Aug 2009 18:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:mime-version:received:date
	:delivered-to:message-id:subject:from:to:x-uid:x-length:x-face
	:content-type:content-transfer-encoding;
	bh=Dyk4MDAjxxsgkuNfHlMPRFHxfhb9yASzyPmSkZohPGQ=;
	b=G4hiqwnBppWwZ1X+q7znxI23agg/hVptOt4bBbNdej9Nh5yRI6gdo7IfpbQkhJC4Mt
	SaR7p3vIJ/3s2gZNwQ0NENQOSA98KkkHkQWK1mCtSKahEViHJHQb4GqUDKwNbUrAkM8K
	ZR4tLXAQPC/IbxiwlbeBf8jHip1qBfLuVcuI4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:delivered-to:message-id:subject:from:to:x-uid
	:x-length:x-face:content-type:content-transfer-encoding;
	b=UAnFrErTBpI2T3V9Nq6cqHD80tPA6cim0PwK3DdlMZqMT3CoY1eBlrTOl4KuZS5n42
	+upbuZaRiEtLC8S7t9w/OdVXX5jE+KHdThLKILY2jepCPRO63pCwK3G3UolhUOu9qiaD
	Dw/a9nEw4Rpx2Ums4i2A7CogRHUiLimNVNtrY=
Received: by 10.90.226.13 with SMTP id y13mr6529683agg.107.1251335021307;
	Wed, 26 Aug 2009 18:03:41 -0700 (PDT)
Received: from luna.localnet ([190.1.23.136])
	by mx.google.com with ESMTPS id 4sm3787364agc.40.2009.08.26.18.03.40
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 26 Aug 2009 18:03:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.108.7 with HTTP; Wed, 26 Aug 2009 12:50:36 -0700 (PDT)
Date: Wed, 26 Aug 2009 22:03:00 -0300
Message-Id: <200908262203.01153.perezmeyer@gmail.com>
From: Lisandro =?utf-8?q?Dami=C3=A1n_Nicanor_P=C3=A9rez_Meyer?=
	<perezmeyer@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-UID: 85
X-Length: 1879
X-Face: &O7POA^t$8Gq0El|^zM9V:*jgn,ETU\1A73; Zdeojd,G(a"; /Y0Fu|/*_jQF+@3';
	#.O@ =?UTF-8?q?=26=0A=09=2ET?="FaLh+5o_F,\lrKg~{JYYVM20<P[J.ve7:7m;
	51A=i@"XBI].=`ZFX4h@tGL> =?UTF-8?q?Q1I=26fUN=0A=094?=<\TGcR5=
Subject: Message error when mounting for the first time, missing files
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
X-List-Received-Date: Thu, 27 Aug 2009 01:21:46 -0000
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello everyone! I am using angstrom/stable2009 with "few" modifications
(mainly a proper kernel for my board, an Econ's eSOM270, kernel 2.6.25). Wh=
en
I mount the first time the jffs2 image, I get this error:

INFO: task mount:1823 blocked for more than 120 seconds.
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
mount         D c02d4150     0  1823   1816
[<c02d3f00>] (schedule+0x0/0x298) from [<c02d5240>]
(__down_write_nested+0xc8/0x
dc)
[<c02d5178>] (__down_write_nested+0x0/0xdc) from [<c02d5268>]
(__down_write+0x14
/0x18)
 r5:c7ebdef0 r4:c7d5a400
[<c02d5254>] (__down_write+0x0/0x18) from [<c02d4b74>] (down_write+0x10/0x1=
4)
[<c02d4b64>] (down_write+0x0/0x14) from [<c008d938>] (do_remount+0x78/0xb0)
[<c008d8c0>] (do_remount+0x0/0xb0) from [<c008e388>] (do_mount+0x104/0x190)
[<c008e284>] (do_mount+0x0/0x190) from [<c008e4a0>] (sys_mount+0x8c/0xd4)
[<c008e414>] (sys_mount+0x0/0xd4) from [<c0020a40>]
(ret_fast_syscall+0x0/0x2c)
 r7:00000015 r6:bec00b38 r5:bec00b04 r4:00000000

This happens just the first time. Also I cannot find /usr/lib/libdbus* nor
/usr/lib/libdaemon*, which are in the jffs2 image before flashing :-/

Any hints?

Regards, Lisandro.

=2D-=20

Lisandro Dami=C3=A1n Nicanor P=C3=A9rez Meyer
http://perezmeyer.com.ar/
http://perezmeyer.blogspot.com/


