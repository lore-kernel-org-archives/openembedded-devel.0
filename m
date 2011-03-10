Received: from mail-px0-f178.google.com ([209.85.212.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <zach.frey@gmail.com>) id 1PxhhM-00029v-0X
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Mar 2011 16:22:44 +0100
Received: by pxi1 with SMTP id 1so446662pxi.9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Mar 2011 07:21:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:date:x-google-sender-auth
	:message-id:subject:from:to:content-type;
	bh=DrPTVy8j/U+mAdTIxJoMysGrX5bFtishtV+S0ea1M60=;
	b=Qz0Y1NcJ8XkjnVB6YA9UU8OA7xvVigQWpIz7yn9zF+iDYh8kv2wktqk5pfWwtL2r0W
	WLsERbB+BkmiYe5EKoXF5+1dxQMG2ny4GLH3phqt7LffPAvnOK6MFHpXt9D95IE+K99v
	0e1wfCVTEsWLDqsXNi++BW/86Afa0BmsMF7qQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type;
	b=bgkpqxhEZrXlpj8JxQRUG3jG42Sc5Xvs2zeSumd/yFdFgEP8Q9Zk+NV8uQuEFpu785
	mcKMjiEFdwXGEEoIBIU511gDzid/XmRngbnnhwnN0wsGL3DKBnjY7A7PxNbMaNWAaz4P
	oV3k+79vI/NPW2lvdPGyn6HoOulzuHKQMJjP8=
MIME-Version: 1.0
Received: by 10.143.157.1 with SMTP id j1mr6483901wfo.407.1299770462786; Thu,
	10 Mar 2011 07:21:02 -0800 (PST)
Sender: zach.frey@gmail.com
Received: by 10.143.31.21 with HTTP; Thu, 10 Mar 2011 07:21:02 -0800 (PST)
Date: Thu, 10 Mar 2011 10:21:02 -0500
X-Google-Sender-Auth: LeBaO8sDLf7emPX9aGqwQ4gvkc8
Message-ID: <AANLkTikdwVG8D6v20mDMEfLcLbgLOHUHdYSVp9_LVxDU@mail.gmail.com>
From: Zach Frey <zach@znfrey.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: dbus-1.4.1 do_fetch fails
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
X-List-Received-Date: Thu, 10 Mar 2011 15:22:44 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

I'm seeing the following with today's pull:

Build Configuration:
BB_VERSION        = "1.10.2"
METADATA_BRANCH   = "master"
METADATA_REVISION = "40a8506"
TARGET_ARCH       = "arm"
TARGET_OS         = "linux-gnueabi"
MACHINE           = "omapzoom2"
DISTRO            = "angstrom"
DISTRO_VERSION    = "v20110310"
TARGET_FPU        = "hard"
NOTE: Resolving any missing task queue dependencies
NOTE: Preparing runqueue
NOTE: Executing runqueue
FATAL: dbus-native-1.4.1:
http://dbus.freedesktop.org/releases/dbus/dbus-1.4.1.tar.gz cannot check
archive integrity
ERROR: Error in executing python function in:
/home/PHOENIX/frey/OE/openembedded/recipes/dbus/dbus_1.4.1.bb
ERROR: Exception:<type 'exceptions.SystemExit'> Message:1
ERROR: Printing the environment of the function
ERROR: Function base_do_fetch failed
ERROR: TaskFailed event exception, aborting
ERROR: Build of
virtual:native:/home/PHOENIX/frey/OE/openembedded/recipes/dbus/dbus_1.4.1.bbdo_fetch
failed
NOTE: Running task 748 of 8673 (ID: 8190,
virtual:native:/home/PHOENIX/frey/OE/openembedded/recipes/dbus/dbus_1.4.1.bb,
do_fetch)
ERROR: Task 8190
(virtual:native:/home/PHOENIX/frey/OE/openembedded/recipes/dbus/
dbus_1.4.1.bb, do_fetch) failed with 256
ERROR: 'virtual:native:/home/PHOENIX/frey/OE/openembedded/recipes/dbus/
dbus_1.4.1.bb' failed
NOTE: package dbus-native-1.4.1-r20.0: task do_fetch: Started
NOTE: The checksums for
'/home/PHOENIX/frey/OE/build/tmp/downloads/dbus-1.4.1.tar.gz' did not match.
Expected MD5: '99cb057700c0455fb68f8d57902f77ac' and Got:
'4f3cb09d463197535a7934eff8d0eea8'
Expected SHA256:
'caa1a0ded2d0f2e95c1d4ec7e3c8bd44834928c5b0ed41a7189963f3593983bd' and Got:
'c8dea9aa33ea3669ad5fb3ff277332e380f70fc768c7e39c8b2a1e278eeec66b'
NOTE: Your checksums:
SRC_URI[md5sum] = "4f3cb09d463197535a7934eff8d0eea8"
SRC_URI[sha256sum] =
"c8dea9aa33ea3669ad5fb3ff277332e380f70fc768c7e39c8b2a1e278eeec66b"

FATAL: dbus-native-1.4.1:
http://dbus.freedesktop.org/releases/dbus/dbus-1.4.1.tar.gz cannot check
archive integrity
ERROR: 'virtual:native:/home/PHOENIX/frey/OE/openembedded/recipes/dbus/
dbus_1.4.1.bb' failed


Downloading http://dbus.freedesktop.org/releases/dbus/dbus-1.4.1.tar.gzdirectly
and doing untar/configure/make seems to indicate that the source
archive isn't corrupted.

What is the next step?  Is there anything more I should report for this
error?

Thanks,
Zach

