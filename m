Received: from [65.182.109.77] (helo=mta8.brinkster.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <John.Willis@Distant-earth.com>) id 1M9FJ8-0003EQ-5F
	for openembedded-devel@lists.openembedded.org;
	Wed, 27 May 2009 11:20:22 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mta8.brinkster.com (Postfix) with ESMTP id DE916715013
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 May 2009 05:12:03 -0400 (EDT)
X-Virus-Scanned: amavisd-new at 
X-Spam-Flag: NO
X-Spam-Score: 0.383
X-Spam-Level: 
X-Spam-Status: No, score=0.383 tagged_above=-10 required=5 tests=[AWL=-0.349, 
	BAYES_00=-2.599, MSGID_MULTIPLE_AT=1.449, RCVD_IN_PBL=0.905,
	RCVD_IN_SORBS_DUL=0.877, RDNS_DYNAMIC=0.1]
Received: from mta8.brinkster.com ([127.0.0.1])
	by localhost (mta8.brinkster.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jkvKjhb8fLr8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 May 2009 05:11:57 -0400 (EDT)
Received: from MareImbrium (82-46-19-72.cable.ubr02.bath.blueyonder.co.uk
	[82.46.19.72])
	by mta8.brinkster.com (Postfix) with ESMTP id CBA89714C90
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 May 2009 05:11:56 -0400 (EDT)
From: "John Willis" <John.Willis@Distant-earth.com>
To: <openembedded-devel@lists.openembedded.org>
References: <4A1C49B6.5050108@soundmetrics.com>
In-Reply-To: <4A1C49B6.5050108@soundmetrics.com>
Date: Wed, 27 May 2009 10:11:29 +0100
Message-ID: <00a001c9deab$21665be0$643313a0$@Willis@Distant-earth.com>
MIME-Version: 1.0
X-Mailer: Microsoft Office Outlook 12.0
Thread-Index: AcnePNY1zaKSwuMqQ0yNVudtM59U0QAardNA
Subject: Re: [PATCH] PowerVR init script
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
X-List-Received-Date: Wed, 27 May 2009 09:20:24 -0000
X-Groupsio-MsgNum: 10779
Content-Type: multipart/mixed;
	boundary="----=_NextPart_000_00A1_01C9DEB3.832AC3E0"
Content-Language: en-us

------=_NextPart_000_00A1_01C9DEB3.832AC3E0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

> Hello,
> Please review the attached patch which lets the PowerVR init script
> handle start, stop and restart.

Hi John,

I could have sworn I pushed this as a patch some time ago but it must have
got lost. 
This is the PowerVR init script we have been using for some time without
issue on the Beagle and Pandora.

It supports start/stop/restart/force-reload and modprobes the modules rather
than the insmod/find combo. 
Other than that it is comparable to your patch.

One other note is that you will need to bump the PR on the libgles-omap3_*
recipes (esp. 3.00.00.06 as that is the one in common use) so that the new
script gets baked in.

Regards,

John Willis

------=_NextPart_000_00A1_01C9DEB3.832AC3E0
Content-Type: application/octet-stream;
	name="rc.pvr"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="rc.pvr"

#!/bin/sh

DESC=3D"PowerVR SGX driver"
NAME=3D"PVRSRV"


d_stop() {
	if [ -e /dev/pvrsrvkm ] ; then=20
		rm -f /dev/pvrsrvkm
	fi

	if `grep -q pvrsrv /proc/modules` ; then
		rmmod omaplfb 2>/dev/null
		rmmod pvrsrvkm 2>/dev/null
	fi
}

d_start() {
	if `grep -q pvrsrv /proc/modules` ; then
		echo " ... already started."
		exit 1
	fi

	modprobe pvrsrvkm
	modprobe omaplfb

	pvr_maj=3D`grep "pvrsrvkm$" /proc/devices | cut -b1,2,3`

	mknod /dev/pvrsrvkm c $pvr_maj 0=20
	chmod 666 /dev/pvrsrvkm

	/usr/bin/pvrsrvinit

	# Set SGX to full speed
	# Temp fix to OMAP clocks are sorted.
	devmem2 0x48004b40 w 0
}


case "$1" in
  start)
	echo -n "Starting $DESC: $NAME"
	d_start
	echo "."
	;;
  stop)
	echo -n "Stopping $DESC: $NAME"
	d_stop
	echo "."
	;;
  restart|force-reload)
	echo -n "Restarting $DESC: $NAME"
	d_stop
	sleep 1
	d_start
	echo "."
	;;
  *)
	echo "Usage: $0 {start|stop|restart|force-reload}" >&2
	exit 1
	;;
esac

exit 0

------=_NextPart_000_00A1_01C9DEB3.832AC3E0--
