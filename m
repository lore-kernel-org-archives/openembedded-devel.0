Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1SKWo7-0004NN-Jw
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Apr 2012 17:28:35 +0200
Received: by wera1 with SMTP id a1so4841632wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Apr 2012 08:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=cwrrR06vY2//BDPHZMIuhAdWAVliE1PSpbE8qcv0w2s=;
	b=AtRpgNg5yT9v7xNoUmAWNRAazVfjmsEDdOUPqBbmkPLfXx6HXxHCDg5HM8p3mhMvoL
	GNJIih4z03d5+O5QplFMavpbLFh3ys0rJ0nuG3ma2qtkH8q9Kyaa0zPYMa1atAehqfF2
	7atuRmxS2QYf+mvlpTjZzvotfMQymbrLv1gThxjTsr/WnZJabw4l87ioJ8hqJ7oRyzji
	P/DS3DUnYNMVygAHct8FlPvYCK7G8p3k0evdBWkzVpHHSfIcKRVgg1zjE6UyvyNK+y/O
	YcVvNHirBThJXpuqg/TiMl6kp+GbXODj88BZC1XiFIRd10TZLV7RXQ/GI7JEUKMERQGO
	FTtQ==
MIME-Version: 1.0
Received: by 10.180.105.69 with SMTP id gk5mr20440122wib.3.1334762347099; Wed,
	18 Apr 2012 08:19:07 -0700 (PDT)
Received: by 10.223.14.149 with HTTP; Wed, 18 Apr 2012 08:19:06 -0700 (PDT)
Date: Wed, 18 Apr 2012 17:19:06 +0200
Message-ID: <CAGiJk9c8ThXrLqsrgYQb03hShObTJynt+fxsRxG9VzYOkOsyUg@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: [meta-kde] Test images (was: Re: [OE-core] RFC: Porting KDE Plasma Active (WIP))
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
X-List-Received-Date: Wed, 18 Apr 2012 15:28:35 -0000
Content-Type: text/plain; charset=UTF-8

2012/4/1 Paul Eggleton <paul.eggleton@linux.intel.com>:
> On Thursday 02 February 2012 12:50:16 Samuel Stirtzel wrote:
>> There are other CMake configure pitfalls (all cross compiling scripts
>> in kdelibs are commented out) but it seems that at least the most of
>> them showed already during build time.
>
> Unfortunately when I tried to build kdelibs4 I got the following:
>
> | cd /home/paul/poky/poky/build-kde/tmp/work/i586-poky-
> linux/kdelibs4-4.8.0+git1+1439483a67135f483632f4c4cd239e96d2ed61fc-
> r0/git/build/kjs && /home/paul/poky/poky/build-kde/tmp/sysroots/x86_64-
> linux/usr/bin/icemaker /home/paul/poky/poky/build-kde/tmp/work/i586-poky-
> linux/kdelibs4-4.8.0+git1+1439483a67135f483632f4c4cd239e96d2ed61fc-
> r0/git/kjs/bytecode
> | /bin/sh: /home/paul/poky/poky/build-kde/tmp/sysroots/x86_64-
> linux/usr/bin/icemaker: No such file or directory
> | make[2]: *** [kjs/opcodes.h] Error 127
> | make[2]: Leaving directory `/home/paul/poky/poky/build-kde/tmp/work/i586-
> poky-linux/kdelibs4-4.8.0+git1+1439483a67135f483632f4c4cd239e96d2ed61fc-
> r0/git/build'
>
> Any ideas? Is this a PARALLEL_MAKE issue?
>
> Cheers,
> Paul
>
> --
>
> Paul Eggleton
> Intel Open Source Technology Centre

Hi,
these issues should now be resolved thanks to Kai Kang.
It requires to rebuild qt4-native, also it is recommended to use Qt 4.8.0


Currently I'm testing the images, so there hopefully won't be any
build errors on them.
Sysvinit images seem to be a bit tougher, since they fail postinsts for me;
So I can't login on them.


As of now I have a working KDE Plasma Desktop image (based on
Angstrom's systemd image) that runs well on my overo.
If anyone wants to try the image, there is a branch at the git
repository [1] named sst-test-images.

It is planned to have Poky standalone images too,
as well as Plasma Active images for both Poky and Angstrom (after
Plasma Active is working).


Feel free to comment on the images.



Notes:
  The Plasma Desktop image for Poky (see [2]) could work too, but I
didn't try to build it on Poky yet.
  This branch will probably not parse on Poky due to the Angstrom
images (I'm working on it).

[1] https://gitorious.org/openembedded-core-layers/meta-kde
[2] https://gitorious.org/openembedded-core-layers/meta-kde/blobs/sst-test-images/recipes-images/plasma-desktop-image.bb


-- 
Regards
Samuel


