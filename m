Received: from mail-vb0-f49.google.com ([209.85.212.49])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1U2MfV-0003Lq-5O
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Feb 2013 15:05:09 +0100
Received: by mail-vb0-f49.google.com with SMTP id s24so3880517vbi.36
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Feb 2013 05:49:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=b1QT+VQDDRdom5SWHABDIvUoIVoWTL7//tpHXwQqzb8=;
	b=N0GCsErZo+5k2h9kLd/18LutTTTkle11JECe1p+D+Y0mX9GZH875BHJ4GNp1aEp27h
	sTyWozXe61BvYdiQTLY3bzlz3T7WISQZ3zyx0i8pCCpoeCFht6LCWyr3Ro7lXM+oPlxz
	W7SLnHBI2TuEVLmoYGGHaDZtDJlnzTUHeCNHlwxEY+WIhMsduCKvxUYk9+QzOgxx1/N6
	RrIjPyXEtGJRfS2N1ZzQwMaQBxXea+Vc0BgRt4wvQMpvaf6n0xKzPIrGZgHMwtPDqmaG
	F6Vd6qFR6JTrkskB8NlLWoQP9o4VoSDLraXZs7f3DIIx7a0lsBOPpAIttycy1X3HBO/0
	7f6A==
MIME-Version: 1.0
X-Received: by 10.52.32.230 with SMTP id m6mr5121099vdi.83.1359985760486; Mon,
	04 Feb 2013 05:49:20 -0800 (PST)
Received: by 10.52.95.243 with HTTP; Mon, 4 Feb 2013 05:49:20 -0800 (PST)
In-Reply-To: <20130204120212.GA3271@jama>
References: <1359982426-9836-1-git-send-email-mario@ossystems.com.br>
	<20130204120212.GA3271@jama>
Date: Mon, 4 Feb 2013 14:49:20 +0100
Message-ID: <CALbNGRRYh06qkphJ-sJx=Qn46cpdh2=vcDNu097e5ACYxhZa5g@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Mario Domenech Goulart <mario@ossystems.com.br>
Subject: Re: [PATCH] xinput-calibrator: add --boot-mode comand line option to wrapper script
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
X-List-Received-Date: Mon, 04 Feb 2013 14:05:10 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Feb 4, 2013 at 1:02 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Mon, Feb 04, 2013 at 10:53:46AM -0200, Mario Domenech Goulart wrote:
>> xinput_calibrator_once.sh has been renamed to
>> run-xinput-calibrator.sh, which now also handles the --boot-mode
>> command line option.
>>
>> When in boot mode (i.e., when --boot-mode is provided on the command
>> line), the script exits if calibration data is found in the
>> calibration data file.  When not in boot mode (i.e., no command line
>> option), the script runs xinput-calibrator and creates/overwrites the
>> calibration data file.
>>
>> This change allows other applications to use a common wrapper
>> (run-xinput-calibrator.sh) for xinput-calibrator.
>
> Did you send this upstream?
>
> Can you provide Upstream-Status?
>
> Cheers,
>
>> Signed-off-by: Mario Domenech Goulart <mario@ossystems.com.br>
>> ---
>>  .../xinput-calibrator/boot-mode.patch              |   35 ++++++++++++++++++++
>>  .../xinput-calibrator/xinput-calibrator_git.bb     |    9 +++--
>>  2 files changed, 40 insertions(+), 4 deletions(-)
>>  create mode 100644 meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator/boot-mode.patch
>>
>> diff --git a/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator/boot-mode.patch b/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator/boot-mode.patch
>> new file mode 100644
>> index 0000000..8af9fc4
>> --- /dev/null
>> +++ b/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator/boot-mode.patch
>> @@ -0,0 +1,35 @@
>> +diff --git a/scripts/xinput_calibrator_pointercal.sh b/scripts/xinput_calibrator_pointercal.sh
>> +index fccb197..253455b 100755
>> +--- a/scripts/xinput_calibrator_pointercal.sh
>> ++++ b/scripts/xinput_calibrator_pointercal.sh
>> +@@ -7,6 +7,7 @@
>> + # original script: Martin Jansa <Martin.Jansa@gmail.com>, 2010-01-31
>> + # updated by Tias Guns <tias@ulyssis.org>, 2010-02-15
>> + # updated by Koen Kooi <koen@dominion.thruhere.net>, 2012-02-28
>> ++# updated by Mario Domenech Goulart <mario@ossystems.com.br>, 2013-02-01
>> +
>> + PATH="/usr/bin:$PATH"
>> +
>> +@@ -14,13 +15,21 @@ BINARY="xinput_calibrator"
>> + CALFILE="/etc/pointercal.xinput"
>> + LOGFILE="/var/log/xinput_calibrator.pointercal.log"
>> +
>> ++# In boot mode, this script exits if calibration data is found in
>> ++# $CALFILE.  If not in boot-mode, it runs the calibrator and
>> ++# creates/overwrites $CALFILE (in other words: it always recalibrate).
>> ++if [ "$1" = "--boot-mode" ]; then
>> ++    BOOT_MODE=1
>> ++fi
>> ++
>> + if [ -e $CALFILE ] ; then
>> +   if grep replace $CALFILE ; then
>> +     echo "Empty calibration file found, removing it"
>> +     rm $CALFILE
>> +   else
>> +     echo "Using calibration data stored in $CALFILE"
>> +-    . $CALFILE && exit 0
>> ++    . $CALFILE
>> ++    [ -z "$BOOT_MODE" ] || exit 0
>> +   fi
>> + fi
>> +
>> diff --git a/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb b/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
>> index 97f9343..21fd382 100644
>> --- a/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
>> +++ b/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
>> @@ -5,12 +5,13 @@ LIC_FILES_CHKSUM = "file://src/calibrator.cpp;endline=22;md5=1bcba08f67cdb56f340
>>  DEPENDS = "virtual/libx11 libxi"
>>
>>  PV = "0.7.5+git${SRCPV}"
>> -PR = "r1"
>> +PR = "r2"
>>
>>  inherit autotools
>>
>>  SRCREV = "c01c5af807cb4b0157b882ab07a893df9a810111"
>> -SRC_URI = "git://github.com/tias/xinput_calibrator.git;protocol=git"
>> +SRC_URI = "git://github.com/tias/xinput_calibrator.git;protocol=git \
>> +           file://boot-mode.patch"
>>
>>  S = "${WORKDIR}/git"
>>
>> @@ -19,10 +20,10 @@ EXTRA_OECONF += "--with-gui=x11"
>>
>>  do_install_append() {
>>          install -d ${D}${bindir}
>> -        install -m 0755 scripts/xinput_calibrator_pointercal.sh ${D}${bindir}/xinput_calibrator_once.sh
>> +        install -m 0755 scripts/xinput_calibrator_pointercal.sh ${D}${bindir}/run-xinput-calibrator.sh
>>
>>          install -d ${D}${sysconfdir}/xdg/autostart
>> -        sed -i -e 's,^Exec=.*,Exec=${bindir}/xinput_calibrator_once.sh,' scripts/xinput_calibrator.desktop
>> +        sed -i -e 's,^Exec=.*,Exec=${bindir}/run-xinput-calibrator.sh --boot-mode,' scripts/xinput_calibrator.desktop
>>          install -m 0644 scripts/xinput_calibrator.desktop ${D}${sysconfdir}/xdg/autostart
>>  }
>>
>> --
>> 1.7.2.5
>>
>>
I can't see what this patch fixes. From my point of view we have currently:

* two conflicting/racing start types systemd and xdg/autostart
* systemd service fails always - it doesn't know which display to use
(error message something like 'cannot connect to xserver')
* xdg/autostart sometimes fails because the touchscreen devices are
not yet known to xserver (error message something like 'no devices to
calibrate devices found'). This causes calibration being started from
time to time.

I am working on a complete different solution (udev/systemd automatic
start) but need a few days to iron out & test. Can we wait few days
before applying this to give me the chance to send an alternative?
Sorry for this but I spent of efforts till now and wand to avoid
rebasing.

Andreas

[1]


