Received: from mail-fx0-f42.google.com ([209.85.161.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <coolaj86@gmail.com>) id 1PVSxA-0001Rj-0c
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Dec 2010 18:58:20 +0100
Received: by fxm11 with SMTP id 11so5183457fxm.29
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Dec 2010 09:58:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:from:date
	:message-id:subject:to:content-type;
	bh=48X7wbXCBeEgPG+5zum9dOf1md9NwgaTl8a1brbh0ts=;
	b=JNPpxMWIKd8/SxaBijwU5kZVbQVInaapMRxXfRQ32EPomqVL3Gjr9aU6aMcPRuAuB6
	ptYy/xcynIkUtWAXo0KpRQNtrBpFNN/xw4dDXcC+7e9Drx5dJ3SOTCTFYFA30NlN08+V
	OVZTBRmc1dMP66rkdDM8E5xW1J4n+G0pufa9o=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:from:date:message-id:subject:to:content-type;
	b=Uk0lFBA+9tV7iF2+3dAac4AtCBIdBlC2ExrZEn1U3myBo5XlxP+GFgdeLf5/BM564g
	b5pk3qElQKM1Vaomi4p0UpmEKbJnnO0JS+sWDuPvdfzVN4IemMa+2NUwV3ROyyNoT1WE
	Qmwz3F/McEO8mOSlFOAJ4inQqDTUhYxhwyuew=
Received: by 10.223.71.194 with SMTP id i2mr3199562faj.15.1293040692308; Wed,
	22 Dec 2010 09:58:12 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.42.18 with HTTP; Wed, 22 Dec 2010 09:57:51 -0800 (PST)
From: AJ ONeal <coolaj86@gmail.com>
Date: Wed, 22 Dec 2010 10:57:51 -0700
Message-ID: <AANLkTimDyv3ouBLRCvrfR9Ywudwf_TqOrBztwmxWLa3x@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Subversion depends on Apache2
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
X-List-Received-Date: Wed, 22 Dec 2010 17:58:20 -0000
Content-Type: text/plain; charset=ISO-8859-1

Overkill?

root@overo:~# opkg install subversion
Installing subversion (1.6.5-r0.5) to root...
Downloading
http://www.gumstix.net/feeds/unstable/ipk/glibc/armv7a/base/subversion_1.6.5-r0.5_armv7a.ipk
.
Installing libneon25 (0.25.5-r4.5) to root...
Downloading
http://www.gumstix.net/feeds/unstable/ipk/glibc/armv7a/base/libneon25_0.25.5-r4.5_armv7a.ipk
.
Installing libsqlite3-0 (3.6.23.1-r1.0.5) to root...
Downloading
http://www.gumstix.net/feeds/unstable/ipk/glibc/armv7a/base/libsqlite3-0_3.6.23.1-r1.0.5_armv7a.ipk
.
Installing libaprutil-1-0 (1.3.4-r5.5) to root...
Downloading
http://www.gumstix.net/feeds/unstable/ipk/glibc/armv7a/base/libaprutil-1-0_1.3.4-r5.5_armv7a.ipk
.
Installing apache2 (2.2.14-r0.5) to root...
Downloading
http://www.gumstix.net/feeds/unstable/ipk/glibc/armv7a/base/apache2_2.2.14-r0.5_armv7a.ipk
.
Configuring libsqlite3-0.
Configuring libneon25.
Configuring libaprutil-1-0.
Collected errors:
 * check_data_file_clashes: Package apache2 wants to install file
/usr/lib/libaprutil-1.so.0
    But that file is already provided by package  * libaprutil-1-0
 * opkg_install_cmd: Cannot install package subversion.

root@overo:~# opkg install subversion --force-overwrite
Installing subversion (1.6.5-r0.5) to root...
Downloading
http://www.gumstix.net/feeds/unstable/ipk/glibc/armv7a/base/subversion_1.6.5-r0.5_armv7a.ipk
.
Installing apache2 (2.2.14-r0.5) to root...
Downloading
http://www.gumstix.net/feeds/unstable/ipk/glibc/armv7a/base/apache2_2.2.14-r0.5_armv7a.ipk
.
Installing libssl0.9.8 (0.9.8m-r12.0.5) to root...
Downloading
http://www.gumstix.net/feeds/unstable/ipk/glibc/armv7a/base/libssl0.9.8_0.9.8m-r12.0.5_armv7a.ipk
.
Configuring libssl0.9.8.
Configuring apache2.
 Adding system startup for /etc/init.d/apache2.
ln: /etc/rc3.d/S91apache2: File exists
ln: /etc/rc4.d/S91apache2: File exists
ln: /etc/rc5.d/S91apache2: File exists
Starting web server: apache2.
Configuring subversion.

AJ ONeal

