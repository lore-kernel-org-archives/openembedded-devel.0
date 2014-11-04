Return-Path: <sven.ebenfeld@gmail.com>
Received: from mail-ie0-f179.google.com (mail-ie0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id 732DA71F62
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  4 Nov 2014 12:39:40 +0000 (UTC)
Received: by mail-ie0-f179.google.com with SMTP id rl12so7400936iec.38
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 Nov 2014 04:39:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=OJvtarebKXC8F14nXxvaNKNAQ2TRZCqfuK93DEOJXMQ=;
	b=Z6Bzybn9Z7WzTVp1fb2q2S8RiDEr5soJPJAw8YhukvQNBfOqQme1GvTglxFlxLC59o
	zC975DT6f4c8bq6SntSOCFYAW9q6GsYW6TPCCGiLSUP4ynC1B67HjmDDhHWi2VKSmYFl
	otw49AhjMc29B0M06r4G61ocN7Cl+JoqnMg37QnbG29lD3DrNGPipAX3dUjIn8ut7Q23
	LKNN7Oxpi/DqPcOoBPXZDL+KuwuT2+VauD6zSN0ZZIAISeB1Nt2JhT9VkjPfMmkN9gJx
	Q3AelGPltXkFT0ezhNpHyaAo5m2jAQybhWdd644iJGHJBqhFpcvDnKo+z/6fY5cjzoQs
	tUoA==
MIME-Version: 1.0
X-Received: by 10.107.131.85 with SMTP id f82mr41774457iod.31.1415104780529;
	Tue, 04 Nov 2014 04:39:40 -0800 (PST)
Received: by 10.107.148.76 with HTTP; Tue, 4 Nov 2014 04:39:40 -0800 (PST)
Date: Tue, 4 Nov 2014 13:39:40 +0100
Message-ID: <CAD0=qkJvNV7h1B=VmXxAuCYFrNG3=ZqL9tJRP3eYk=4DMFXcxw@mail.gmail.com>
From: Sven Ebenfeld <sven.ebenfeld@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Systemd and read-only-rootfs
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 04 Nov 2014 12:39:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

I have some issues with systemd since I've switched to dizzy release.
I've created my own machine configuration based on wandboard-solo and
my own Image based on console-systemd-Image.

After building everything, I get following error Messages during boot:
[...]
[    2.521774] systemd-sysv-generator[70]: Could not find init script
for umountnfs.service
[    2.530219] systemd-sysv-generator[70]: Could not find init script
for mountnfs.service
[    2.538489] systemd-sysv-generator[70]: Could not find init script
for rmnologin.service
[    2.546865] systemd-sysv-generator[70]: Could not find init script
for mountnfs.service
[    2.555089] systemd-sysv-generator[70]: Could not find init script
for rmnologin.service
[    2.563444] systemd-sysv-generator[70]: Could not find init script
for mountnfs.service
[    2.571643] systemd-sysv-generator[70]: Could not find init script
for rmnologin.service
[    2.580011] systemd-sysv-generator[70]: Could not find init script
for mountnfs.service
[    2.588217] systemd-sysv-generator[70]: Could not find init script
for rmnologin.service
[    2.596577] systemd-sysv-generator[70]: Could not find init script
for banner.service
[    2.604595] systemd-sysv-generator[70]: Could not find init script
for sysfs.service
[    2.612512] systemd-sysv-generator[70]: Could not find init script
for mountall.service
[    2.620721] systemd-sysv-generator[70]: Could not find init script
for checkroot.service
[    2.629087] systemd-sysv-generator[70]: Could not find init script
for urandom.service
[    2.637235] systemd-sysv-generator[70]: Could not find init script
for populate-volatile.service
[    2.646214] systemd-sysv-generator[70]: Could not find init script
for devpts.service
[    2.654231] systemd-sysv-generator[70]: Could not find init script
for hostname.service
[    2.664782] systemd-sysv-generator[70]: Could not find init script
for bootmisc.service
[    2.673093] systemd-sysv-generator[70]: Could not find init script
for sendsigs.service
[    2.681567] systemd-sysv-generator[70]: Could not find init script
for save-rtc.service
[    2.689753] systemd-sysv-generator[70]: Could not find init script
for urandom.service
[    2.697799] systemd-sysv-generator[70]: Could not find init script
for umountnfs.service
[    2.706939] systemd-sysv-generator[70]: Could not find init script
for umountfs.service
[    2.715201] systemd-sysv-generator[70]: Could not find init script
for halt.service
[    2.723411] systemd-sysv-generator[70]: Could not find init script
for sendsigs.service
[    2.731671] systemd-sysv-generator[70]: Could not find init script
for save-rtc.service
[    2.739895] systemd-sysv-generator[70]: Could not find init script
for urandom.service
[    2.748019] systemd-sysv-generator[70]: Could not find init script
for umountnfs.service
[    2.756292] systemd-sysv-generator[70]: Could not find init script
for umountfs.Service
[...]
         Starting Create Volatile Files and Directories...
         Starting Load/Save Random Seed...
[  OK  [    9.292509] systemd-journald[87]: Received request to flush
runtime journal from PID 1
] Started Trigger Flushing of Journal to Persistent Storage.
[FAILED] Failed to start Create Volatile Files and Directories.
See 'systemctl status systemd-tmpfiles-setup.service' for details.
[...]

The Output of the mentioned command Shows the following:

=C3=A2 systemd-tmpfiles-setup.service - Create Volatile Files and Directori=
es
   Loaded: loaded (/lib/systemd/system/systemd-tmpfiles-setup.service; stat=
ic)
   Active: failed (Result: exit-code) since Thu 1970-01-01 00:00:09
UTC; 44 years 10 months ago
     Docs: man:tmpfiles.d(5)
           man:systemd-tmpfiles(8)
 Main PID: 309 (code=3Dexited, status=3D1/FAILURE)
Jan 01 00:00:09 wandboard-cd2 systemd-tmpfiles[309]:
[/usr/lib/tmpfiles.d/systemd-remote.conf:10] Unknown group
'systemd-journal-remote'.
Jan 01 00:00:09 wandboard-cd2 systemd-tmpfiles[309]:
[/usr/lib/tmpfiles.d/systemd-remote.conf:11] Unknown group
'systemd-journal-remote'.
Jan 01 00:00:09 wandboard-cd2 systemd-tmpfiles[309]:
[/usr/lib/tmpfiles.d/systemd.conf:19] Unknown user 'systemd-network'.
Jan 01 00:00:09 wandboard-cd2 systemd-tmpfiles[309]:
[/usr/lib/tmpfiles.d/systemd.conf:20] Unknown user 'systemd-network'.
Jan 01 00:00:09 wandboard-cd2 systemd-tmpfiles[309]:
[/usr/lib/tmpfiles.d/systemd.conf:21] Unknown user 'systemd-network'.
Jan 01 00:00:09 wandboard-cd2 systemd-tmpfiles[309]:
symlink(../proc/self/mounts, /etc/mtab) failed: Read-only file system
Jan 01 00:00:09 wandboard-cd2 systemd[1]:
systemd-tmpfiles-setup.service: main process exited, code=3Dexited,
status=3D1/FAILURE
Jan 01 00:00:09 wandboard-cd2 systemd[1]: Failed to start Create
Volatile Files and Directories.
Jan 01 00:00:09 wandboard-cd2 systemd[1]: Unit
systemd-tmpfiles-setup.service entered failed state.

Can anybody help me where I should look or what I should Change in my
Image recipe to get read-only rootfs working?

Mit freundlichen Gr=C3=BC=C3=9Fen,
Sven Ebenfeld

