Received: from mail-ve0-f175.google.com ([209.85.128.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1U5vZX-0008Qt-7K
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Feb 2013 10:57:46 +0100
Received: by mail-ve0-f175.google.com with SMTP id cy12so1911064veb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Feb 2013 01:41:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type:content-transfer-encoding;
	bh=4obobqrr+JIBXr0uo6GYflOXZDlDdLTlUHCQmC9LMyM=;
	b=xQEpL+FK7m9hVE7NXzlQ5x0yUJRWWwrm9Glu/A/WePoKU6HF2Z3+3YlCWd4qp1QzZd
	yk5MtwuVkDKUGNr6n9uMd32NpgRzL9u5g2Y6Qmps11XJxecO/geR1ric+I35iBzAnm9j
	QvB2eetlwY+A9Ti+cCsIVbFs8uFmUk26b2/l+J4JHykOjIEfmvh1BsWZEyWVxvd9mKb6
	8F6ZtJHZcq92H45x8mIQqZRN1WummmXtp6pTrn2/+GhpASFHF10JKAXrKoSFd+b13kBv
	l/HyyP/vxxuW74Yqf0T1NYW/f154Z3Hao2Xv1KTZbb80kTVFs7zvv0UJfT54LxTLbumO
	dTog==
MIME-Version: 1.0
X-Received: by 10.58.50.7 with SMTP id y7mr33665888ven.24.1360834900823; Thu,
	14 Feb 2013 01:41:40 -0800 (PST)
Received: by 10.52.95.243 with HTTP; Thu, 14 Feb 2013 01:41:40 -0800 (PST)
In-Reply-To: <CALbNGRRcVyv3198HCRvCT-tx2bzxRLFV+XZwFtfe_00YJ_rAmg@mail.gmail.com>
References: <1360102723-27891-1-git-send-email-schnitzeltony@googlemail.com>
	<kevubg$t7s$1@ger.gmane.org>
	<CALbNGRRcVyv3198HCRvCT-tx2bzxRLFV+XZwFtfe_00YJ_rAmg@mail.gmail.com>
Date: Thu, 14 Feb 2013 10:41:40 +0100
Message-ID: <CALbNGRSZT_yP7To8X_diXKPfj1O09EKDeWzF0txKij=N8Fm_hA@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Cc: koen@dominion.thruhere.net, tias@ulyssis.org
Subject: Re: [meta-oe-meta-systemd 0/5] xinput-calibrator rework
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
X-List-Received-Date: Thu, 14 Feb 2013 09:57:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 8, 2013 at 11:10 PM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> On Thu, Feb 7, 2013 at 11:06 AM, Koen Kooi <koen@dominion.thruhere.net> w=
rote:
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> Op 05-02-13 23:18, Andreas M=C3=BCller schreef:
>>> * Implemented are 3 modes of invocation: 1. udev/systemd 2.
>>> /etc/xdg/autostart 3. manual 1/2 are selected upon DISTRO_FEATURES
>>> containing systemd or not
>>>
>>> * The calibration is stored in
>>> /etc/X11/xorg.conf.d/99-<name-of-touchscreen>.conf Herby support for
>>> multiple touchsceen devices is prepared.
>>>
>>> * The script detects upon parameter information how it was called and
>>> waits for xserver to come up / detect connected touchsceen devices. If =
no
>>> matching calibration file is found, the xinput_calibrator is called for
>>> this device. For systemd invocation the default display is choosen.
>>>
>>> * For manual invocation and multiple touchscreen devices attached, the
>>> operator can select which device to calibrate interactively.
>>>
>>> * Multiple touchscreen support is prepared - the following open issues
>>> are known: * Multiple touchscreens with same device name will get same
>>> calibration values. An unique device identifier could not be found yet.=
 *
>>> systemd startup with multiple device cause multiple instances of
>>> xinput_calibrator being started without information for which device th=
e
>>> calibration is performed.
>>>
>>> * Many many tests were performed: 2 automatic invocation types * (1st +
>>> 2nd startup) * (0, 1, 2 touchscreens)
>>>
>>> * Other layers need alignment for pointercal removement. If accepted I
>>> can take care (this is NOT an extortion :)
>>
>> At FOSDEM I found out that the Tias wearing the FOSDEM organization hood=
ie
>> is actually the same Tias who maintains xinput-calibrator. Long story sh=
ort:
>> we should send all out patches upstream and he'll have a look at them. H=
e is
>> a big fan of the xorg conf snippet that this patchset introduces.
> I will append the script/udev-rule/systemd service to the patchset.
> With the systemd/udev stuff I would like to wait a bit until our users
> have collected experience. After sending this series I saw that on
> some images at first start xinput-calibrator is hidden by the greeter
> application of dm. Up to now I did not yet find a good way to have
> xinput_calibrator 'always on top'.
>
> Andreas
After using this solution for a while I see the following issues:

1. User rights: Currently only users with write permission on
/etc/X11/xorg.conf.d/ can make the calibration permanent. This can be
avoided by a single calibration file for all devices which is owned by
a new group 'touchcal'. Nice side effect: A single file reduces the
modifications on pointercal-xinput (for shipping default calibration
values).
2. udev/systemd invocation: On some of my images the display manager's
greeter starts after touchscreen_calibration and thereby hides it.
Since systemd cannot help me here, I think about a workaround like
this: If xinput_calibrator detects that it loses focus, it pushes
itself back to top. To avoid dead-loops in case the other application
follows same strategy the maximum number of regaining the focus is
limited to e.g 3.
3. Multiple instances of devices with same device-name / different
touch devices on same controller: Have no idea how to give X this
additional information.

My suggestion:

I will rework for 1+2. This leads to a much better solution than we
have currently. For 3 I am open on suggestions.

Andreas


