Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1TaVtV-0003kW-TC
	for openembedded-devel@lists.openembedded.org;
	Mon, 19 Nov 2012 19:16:29 +0100
Received: by mail-ee0-f47.google.com with SMTP id l10so2886143eei.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Nov 2012 10:02:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=VRJ4aZnd6WFIx+PyVugs0A2mrftoFUUjm/VWF41XLa0=;
	b=bRuZsvXRrPOrcs1NfMBO/gQH2mFQXkh97rpBjbRhRCs+QeamFTfW2eHL9e23jMen90
	gb+StFO07GLqG0DAnqGqEJqHCLDXRZa8v6M6rUFkbXaJ0Il2f6JsV5ex7TncjbxHhVUX
	fdZHkjJfunqfdzBTgKBY4u8InqWyk5AMqH7CmG3FvN4b2V2/ir9OR0yALO2ipl1R6nhZ
	5rptuO9/TElTkhN3xutJB0vLE6ehGLYa4HmV80rWDFUjefi1G8SKXjO6ONLJVcFQNQtH
	31yJk1GutDwucPDuKoV2Et3tg5DHUvofdkLJ8usfLFeBuCL4T6936RcxJQi0YS7MY0aG
	eSgQ==
Received: by 10.14.205.198 with SMTP id j46mr26391053eeo.27.1353348147354;
	Mon, 19 Nov 2012 10:02:27 -0800 (PST)
Received: from [172.20.0.10] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id b44sm25425698eep.12.2012.11.19.10.02.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 19 Nov 2012 10:02:26 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 6.1 \(1498\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <5887051.MbDNksKi0G@helios>
Date: Mon, 19 Nov 2012 19:02:28 +0100
Message-Id: <3B28C997-2AE1-47AD-9C48-F7DAEC62C2D5@dominion.thruhere.net>
References: <cover.1353345006.git.paul.eggleton@linux.intel.com>
	<738d5da6dd36ec7c495cb2ed90d969095e99b8fb.1353345006.git.paul.eggleton@linux.intel.com>
	<k8drqf$id4$1@ger.gmane.org> <5887051.MbDNksKi0G@helios>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Mailer: Apple Mail (2.1498)
X-Gm-Message-State: ALoCoQlzVU71pTNAmEysMldJY3c0zzxfC27itJ7f8VVfNKtGxE++Iqjy8TpYyA11Qn8mw/jwDT7p
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH 3/8] quagga: add from OE-Classic, update and tidy-up
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
X-List-Received-Date: Mon, 19 Nov 2012 18:16:30 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 19 nov. 2012, om 19:00 heeft Paul Eggleton =
<paul.eggleton@linux.intel.com> het volgende geschreven:

> On Monday 19 November 2012 18:55:33 Koen Kooi wrote:
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>=20
>> Op 19-11-12 18:11, Paul Eggleton schreef:
>>> * Update to 0.99.21 * Fix SRC_URI to point to a working download
>>> location * Make LICENSE more accurate * Add LIC_FILES_CHKSUM * Add =
old
>>> gentoo patch to fix libcap linking errors * Put binaries in sbindir =
* Use
>>> useradd.bbclass to create user/groups * Add LSB headers to init =
script
>>> (borrowed from debian) * Tidy up packaging and directory references =
* Add
>>> SUMMARY
>>>=20
>>> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com> ---
>>=20
>> dd94a
>>=20
>>> --- /dev/null +++
>>> b/meta-networking/recipes-protocols/quagga/files/watchquagga.init @@ =
-0,0
>>> +1,64 @@ +#!/bin/sh +# +### BEGIN INIT INFO +# Provides: watchquagga =
+#
>>> Required-Start: $local_fs $network $remote_fs $syslog +# =
Required-Stop:
>>> $local_fs $network $remote_fs $syslog +# Default-Start:  2 3 4 5 +#
>>> Default-Stop: 0 1 6 +# Short-Description: start and stop the Quagga
>>> watchdog +### END INIT INFO + +PATH=3D/bin:/usr/bin:/sbin:/usr/sbin =
+ +#
>>> Load configuration +test -f /etc/default/watchquagga && .
>>> /etc/default/watchquagga
>>=20
>> hardcoded $sysconfdir
>>=20
>>> + +# Check that there are daemons to be monitored. +[ -z =
"$watch_daemons"
>>> ] && exit 0 + +pidfile=3D"/var/run/quagga/watchquagga.pid"
>>=20
>> hardcoded $localstatedir
>>=20
>>> + +case "$1" in +    start) +	echo -n "Starting quagga =
watchdog daemon:
>>> watchquagga" +	start-stop-daemon --start \ +		=
--pidfile $pidfile \ +
>>> --exec /usr/sbin/watchquagga \
>>=20
>> hardcoded $sbindir
>>=20
>> [..]
>>=20
>> etc.
>=20
> Sure I can fix these, but you're aware there are a ton of these in =
meta-oe...?

Sadly, yes. I try to fix them when I run into those, but it's slow going =
and most of the time I just add native systemd support to fix startup.

regards,

Koen=


