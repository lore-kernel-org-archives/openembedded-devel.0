Return-Path: <adam.yh.lee@gmail.com>
Received: from mail-yk0-f171.google.com (mail-yk0-f171.google.com
	[209.85.160.171])
	by mail.openembedded.org (Postfix) with ESMTP id B22E071633;
	Wed, 26 Aug 2015 03:23:19 +0000 (UTC)
Received: by ykdt205 with SMTP id t205so175086764ykd.1;
	Tue, 25 Aug 2015 20:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-type;
	bh=M+YqfSzadarFxVi/5gm7HwSLb5G6VIv9CZpCiNLrlcY=;
	b=P8imvowBC758DTJ4VRvn8qZTqRJQYK1a5VnfBsV2+AEG51xPr64cclX+6qJEVESBF4
	L1D1L1ZEnUMMt8k9tYdNAd+lJmswQOqGA8QCClzhgP4/eg0FizjGeUoOspFduGunMY/L
	Lz4kfCkbvU0GIj6QdQDRJsttwl8bYhP4gCi3SjxlliIU5BBYR8XDAQ+/CUeBlOqNbEiq
	+r04GYskA0UC+pU77JIhxxB0oIqaIfQsSGLxN7LAsEvR4+ogM0vIeZWoVf3b+LzKoUOK
	s9XgSYiDC5tMniaWlCmVIbRGDj0I8og7TawWcFZYDJyDH8b/OPt6Qj/GmbRTyWq/G68Z
	go9w==
X-Received: by 10.13.216.19 with SMTP id a19mr42339373ywe.5.1440559399377;
	Tue, 25 Aug 2015 20:23:19 -0700 (PDT)
MIME-Version: 1.0
References: <CAFeBWL6xGuzEcOR5B1sfEgZR=i-T=EZ-b-TKPT9DGZpCmDPy4g@mail.gmail.com>
	<5607133.YNgYITpZsc@peggleto-mobl.ger.corp.intel.com>
	<CAFeBWL4as4_aeTWOZox+V=NB_s7LriLof-sYNc04PB6vjDRBnw@mail.gmail.com>
	<CAP5N7XGHHKD7A+cWZaFyxiZR+NMrzPF0_1wW2pT-ion=T6PoXw@mail.gmail.com>
In-Reply-To: <CAP5N7XGHHKD7A+cWZaFyxiZR+NMrzPF0_1wW2pT-ion=T6PoXw@mail.gmail.com>
From: Adam Lee <adam.yh.lee@gmail.com>
Date: Wed, 26 Aug 2015 03:23:09 +0000
Message-ID: <CAFeBWL4+AQo=pr7+CVdY9bB-V9YHPoBfZC2c8V+pqzyo4rLoFw@mail.gmail.com>
To: Randy Witt <rewitt@declaratino.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] Extensible SDK install errors
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
X-List-Received-Date: Wed, 26 Aug 2015 03:23:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Great, thanks Randy for the pointer. No need for apology. I fully
understand this is a work-in-progress.
I just want to stay on par with the development!

On Tue, Aug 25, 2015 at 7:33 PM Randy Witt <rewitt@declaratino.com> wrote:

> On Tue, Aug 25, 2015 at 6:11 PM, Adam Lee <adam.yh.lee@gmail.com> wrote:
>
>> Thanks for your comments. I was not running the installer as root.
>> I tried again and specified the install path in my home directory.
>> This time it seems to have gone further, but still failed with this:
>>
>> "error: Can't install packagegroup-core-boot-1.0-r17.0@qemuarm: no
>> package provides systemd"
>>
>> Perhaps I need to disable systemd from distro features?
>>
>>
> You could do that, however there is a patch on the list to fix this kind
> of problem.
>
> http://patchwork.openembedded.org/patch/101213/
>
> It may fix your problem until the next release comes out. I'm sorry you'v=
e
> had this trouble. It was just something that was missed in the first
> version of the extensible sdk.
>
>
>> I will also check my user's permission to solve the permission error.
>>
>> On Mon, Aug 24, 2015 at 4:11 AM Paul Eggleton <
>> paul.eggleton@linux.intel.com> wrote:
>>
>>> Hi Adam,
>>>
>>> On Friday 21 August 2015 15:06:25 Adam Lee wrote:
>>> > Hello, I built the Extensible SDK on Fido (bitbake core-image-minimal
>>> -c
>>> > populate_sdk_ext).
>>> >
>>> > During the installation I get this permission error:
>>> >
>>> > $ ./poky-glibc-x86_64-core-image-minimal-armv5e-toolchain-ext-1.8.sh
>>> >
>>> > > Enter target directory for SDK (default: /opt/poky/1.8):
>>> > > You are about to install the SDK to "/opt/poky/1.8". Proceed[Y/n]?
>>> > > Extracting SDK...done
>>> > > Setting it up...
>>> > > Extracting buildtools...
>>> > > ./poky-glibc-x86_64-core-image-minimal-armv5e-toolchain-ext-1.8.sh:
>>> line
>>> > > 148: /opt/poky/1.8/environment-setup-armv5e-poky-linux-gnueabi:
>>> Permission
>>> > > denied
>>> > > ./poky-glibc-x86_64-core-image-minimal-armv5e-toolchain-ext-1.8.sh:
>>> line
>>> > > 151: /opt/poky/1.8/environment-setup-armv5e-poky-linux-gnueabi:
>>> Permission
>>> > > denied
>>> > > ./poky-glibc-x86_64-core-image-minimal-armv5e-toolchain-ext-1.8.sh:
>>> line
>>> > > 155: /opt/poky/1.8/environment-setup-armv5e-poky-linux-gnueabi:
>>> Permission
>>> > > denied
>>> > > mv: cannot move =E2=80=98x86_64-nativesdk-libc.tar.bz2=E2=80=99 to
>>> > > =E2=80=98/opt/poky/1.8/layers/poky/x86_64-nativesdk-libc.tar.bz2=E2=
=80=99: Permission
>>> > > denied Preparing build system...
>>> > > sh: 1: cannot create preparing_build_system.log: Permission denied
>>> > > SDK preparation failed: see /opt/poky/1.8/preparing_build_system.lo=
g
>>> >
>>> >  It looks like `/opt/poky/1.8/layers/poky` directory belongs to the
>>> root
>>> > user:
>>> >
>>> > $ ls -l /opt/poky/1.8/layers/
>>> >
>>> > > total 36
>>> > > drwxrwxr-x 9 root root 4096 Jun 16 10:25 meta-gnome
>>> > > drwxrwxr-x 9 root root 4096 Jun 15 10:44 meta-multimedia
>>> > > drwxrwxr-x 11 root root 4096 Jun 15 10:44 meta-networking
>>> > > drwxrwxr-x 20 root root 4096 Jun 15 10:44 meta-oe
>>> > > drwxrwxr-x 7 root root 4096 Jun 15 10:44 meta-python
>>> > > drwxrwxr-x 5 root root 4096 Jun 15 10:44 meta-ruby
>>> > > drwxrwxr-x 5 root root 4096 Jun 15 10:44 meta-systemd
>>> > > drwxrwxr-x 11 root root 4096 Jun 15 10:44 meta-xfce
>>> > > drwxrwxr-x 13 root root 4096 Aug 21 14:46 poky
>>> >
>>> >  I may have missed something obvious. Has anyone seen this?
>>>
>>> Basically you shouldn't be installing the extensible SDK as root. We
>>> ought to
>>> be telling you about this up front and we should have a more reasonable
>>> default path - these are open bugs and patches are in review on the lis=
t
>>> to fix
>>> them.
>>>
>>> Cheers,
>>> Paul
>>>
>>> --
>>>
>>> Paul Eggleton
>>> Intel Open Source Technology Centre
>>>
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>>

