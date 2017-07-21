Return-Path: <martin.jansa@gmail.com>
Received: from mail-yw0-f180.google.com (mail-yw0-f180.google.com
	[209.85.161.180])
	by mail.openembedded.org (Postfix) with ESMTP id 0B32E71984
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Jul 2017 09:06:22 +0000 (UTC)
Received: by mail-yw0-f180.google.com with SMTP id x125so22403555ywa.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Jul 2017 02:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=eSIZvV9qaA1WaiDcwLt/+jA4nDhyipxgBoOr3fNcnQA=;
	b=Yzq8l6Lj8YtOynj/mufUx5y7wx/BAJViiY09j1cPKCV41GJaFYT30q8cMQlUn2Omfh
	JpVW+kkvjelXg6X0QPs1SFXjp8BDe+pxb+2OWotLGI9mNx9nNbO9JEuT+wnWWaO735cr
	1MOdeXYAvrgqpxafZ5Vj9s2LlTqTNJCjIsBWkQaH8g5v81MxFOceb/q3UPEFkj1XNbk9
	GL2LmNqFt6dkp1PaE5AHzoCmwdLpjQHpW77sshNeEJ7FsBasklnE/sehiFekmKBFqarW
	CqwyFO6CqLLYTJbpBtC0SIBS0iJT38YNw5aZZ6Cs8uIBevzt66NPvJOJFyvBQ+Yzq1Ig
	vFyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=eSIZvV9qaA1WaiDcwLt/+jA4nDhyipxgBoOr3fNcnQA=;
	b=YjURruMLYn5UjxRmabL/lVV+8Pu+AmJd2VRn1LCM6T24/cQcwRwbr0lpeoOaQzqk1G
	A/bkkiq+JDvtuanKpGwBz41wzUOdPQJzBm3USHD2cNTImxckEuhhYo2Pxe7+z8cQko3z
	IxW8ym8VAB12sUuAPF9m8Ljk59NpaXI5jI77OnNO54Gkway2VRatDSTIeZhy+1Dmt6Xz
	rprkGxUy/HVgg7OHekHyyqc3GMbR5LUmg+bGz9o7pjFMq1f9+CWe4vHFS7EL6RdYpbZd
	vE4OB0iQN+oPXH2A3ii0QmLzc0ofnVoAjVq6uC6Lm80q5EXuLFLUeM5io1Xc83kv0PBw
	3X7w==
X-Gm-Message-State: AIVw111aVhZVfyLl4j5sFqQm/ldiyIof1yPul2D18wxMJMyuQYe9kJZh
	YHlBNAvzd5YbExqCqVic0ez02qzJXg==
X-Received: by 10.13.207.67 with SMTP id r64mr6084880ywd.244.1500627984175;
	Fri, 21 Jul 2017 02:06:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.77.4 with HTTP; Fri, 21 Jul 2017 02:06:23 -0700 (PDT)
In-Reply-To: <04626822-4244-2cfa-fc5b-14998f4691a7@windriver.com>
References: <cover.1500621886.git.hongxu.jia@windriver.com>
	<CA+chaQcQYv4xtjOLvowSTsGA3rTn8Y92Xz-zX5ixqD2Kvm7ukQ@mail.gmail.com>
	<04626822-4244-2cfa-fc5b-14998f4691a7@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 21 Jul 2017 11:06:23 +0200
Message-ID: <CA+chaQepvE6PLAe5-+kj8CuqTK+djKCZ+91Q6D-WJ6cCm_LdMA@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH V2 00/10] add 9 recipes & upgrade 1 recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 21 Jul 2017 09:06:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Because I've already updated them manually when cherry-picking to
master-next..

On Fri, Jul 21, 2017 at 11:03 AM, Hongxu Jia <hongxu.jia@windriver.com>
wrote:

> On 2017=E5=B9=B407=E6=9C=8821=E6=97=A5 16:54, Martin Jansa wrote:
>
> Thanks for changes, next time please update status on patchwork when
> sending such mostly duplicated set of patches.
>
>
> OK, with a simple search in patchwork, none of these patches in patchwork=
.
>
> https://patchwork.openembedded.org/project/oe/
> series/?ordering=3D-last_updated
>
> //Hongxu
>
>
> On Fri, Jul 21, 2017 at 9:34 AM, Hongxu Jia <hongxu.jia@windriver.com>
> wrote:
>
>> Changed in V2:
>>
>> - xmlrpc-c, satyr, usermode: fix compile failure against musl C library
>>
>> - add recipe keybinder and volume-key
>>
>> - Build on qemux86, qemux86-64, qemumips, qemuarm64,
>>   qemux86 + musl, qemux86-64 + musl
>>
>> //Hongxu
>>
>> The following changes since commit 1cbd1bc195017312ba8cf670b340f6
>> 1a2ac6207b:
>>
>>   unionfs-fuse: 0.26 -> 2.0 (2017-07-14 23:45:53 +0200)
>>
>> are available in the git repository at:
>>
>>   git://git.openembedded.org/openembedded-core-contrib hongxu/add-recipe=
2
>>   http://cgit.openembedded.org/openembedded-core-contrib/log/?
>> h=3Dhongxu/add-recipe2
>>
>> Hongxu Jia (10):
>>   keybinder: add recipe 3.0
>>   volume-key: add recipe 0.3.9
>>   libgnomekbd: 2.32 -> 3.22
>>   python3-pykickstart: add recipe 2.35
>>   python3-meh: add recipe 0.45
>>   usermode: add recipe 1.111
>>   isomd5sum: add recipe 1.2.1
>>   satyr: add recipe 0.23
>>   libtar: add recipe 1.2.20
>>   xmlrpc-c: add recipe 1.31.0
>>
>>  .../gnome-settings-daemon_2.32.1.bb                |   3 -
>>  .../recipes-gnome/libgnome/libgnomekbd_2.32.0.bb   |  20 ---
>>  .../recipes-gnome/libgnome/libgnomekbd_3.22.0.bb   |  17 +++
>>  .../recipes-support/keybinder/keybinder_3.0.bb     |  26 ++++
>>  ...ix-compile-failure-against-musl-C-library.patch |  27 ++++
>>  .../recipes-support/usermode/usermode_1.111.bb     |  27 ++++
>>  meta-oe/licenses/X11                               |  23 ++++
>>  ...ix-compile-failure-against-musl-C-library.patch |  52 +++++++
>>  .../recipes-devtools/xmlrpc-c/xmlrpc-c_1.31.0.bb   |  23 ++++
>>  .../files/0001-tweak-install-prefix.patch          |  60 ++++++++
>>  .../isomd5sum/files/0002-fix-parallel-error.patch  |  33 +++++
>>  .../recipes-extended/isomd5sum/isomd5sum_1.2.1.bb  |  35 +++++
>>  ...-explicitly-support-python3-by-pkg-config.patch |  56 ++++++++
>>  .../volume_key/volume-key_0.3.9.bb                 |  34 +++++
>>  .../libtar/files/0002-Do-not-strip-libtar.patch    |  25 ++++
>>  .../libtar/files/fix_libtool_sysroot.patch         |  19 +++
>>  meta-oe/recipes-support/libtar/libtar_1.2.20.bb    |  21 +++
>>  .../satyr/files/0001-do-not-support-python2.patch  |  84 ++++++++++++
>>  ...ix-compile-failure-against-musl-C-library.patch |  28 ++++
>>  meta-oe/recipes-support/satyr/satyr_0.23.bb        |  33 +++++
>>  .../files/tweak-native-language-support.patch      |  44 ++++++
>>  .../python-meh/python3-meh_0.45.bb                 |  17 +++
>>  ...0001-support-authentication-for-kickstart.patch | 151
>> +++++++++++++++++++++
>>  ...-parser.py-add-lock-for-readKickstart-and.patch |  76 +++++++++++
>>  ...-sections-shutdown-and-environment-in-gen.patch |  48 +++++++
>>  ...d.py-retry-to-invoke-request-with-timeout.patch |  82 +++++++++++
>>  .../python-pykickstart/python3-pykickstart_2.35.bb |  26 ++++
>>  27 files changed, 1067 insertions(+), 23 deletions(-)
>>  delete mode 100644 meta-gnome/recipes-gnome/libgnome/
>> libgnomekbd_2.32.0.bb
>>  create mode 100644 meta-gnome/recipes-gnome/libgnome/
>> libgnomekbd_3.22.0.bb
>>  create mode 100644 meta-gnome/recipes-support/keybinder/keybinder_3.0.b=
b
>>  create mode 100644 meta-gnome/recipes-support/use
>> rmode/usermode/0001-fix-compile-failure-against-musl-C-library.patch
>>  create mode 100644 meta-gnome/recipes-support/usermode/usermode_1.111.b=
b
>>  create mode 100644 meta-oe/licenses/X11
>>  create mode 100644 meta-oe/recipes-devtools/xmlrp
>> c-c/xmlrpc-c/0001-fix-compile-failure-against-musl-C-library.patch
>>  create mode 100644 meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.31.0.bb
>>  create mode 100644 meta-oe/recipes-extended/isomd
>> 5sum/files/0001-tweak-install-prefix.patch
>>  create mode 100644 meta-oe/recipes-extended/isomd
>> 5sum/files/0002-fix-parallel-error.patch
>>  create mode 100644 meta-oe/recipes-extended/isomd5sum/isomd5sum_1.2.1.b=
b
>>  create mode 100644 meta-oe/recipes-extended/volum
>> e_key/files/0001-explicitly-support-python3-by-pkg-config.patch
>>  create mode 100644 meta-oe/recipes-extended/volume_key/
>> volume-key_0.3.9.bb
>>  create mode 100644 meta-oe/recipes-support/libtar
>> /files/0002-Do-not-strip-libtar.patch
>>  create mode 100644 meta-oe/recipes-support/libtar
>> /files/fix_libtool_sysroot.patch
>>  create mode 100644 meta-oe/recipes-support/libtar/libtar_1.2.20.bb
>>  create mode 100644 meta-oe/recipes-support/satyr/
>> files/0001-do-not-support-python2.patch
>>  create mode 100644 meta-oe/recipes-support/satyr/
>> files/0002-fix-compile-failure-against-musl-C-library.patch
>>  create mode 100644 meta-oe/recipes-support/satyr/satyr_0.23.bb
>>  create mode 100644 meta-python/recipes-extended/p
>> ython-meh/files/tweak-native-language-support.patch
>>  create mode 100644 meta-python/recipes-extended/python-meh/
>> python3-meh_0.45.bb
>>  create mode 100644 meta-python/recipes-extended/p
>> ython-pykickstart/files/0001-support-authentication-for-kickstart.patch
>>  create mode 100644 meta-python/recipes-extended/p
>> ython-pykickstart/files/0002-pykickstart-parser.py-add-lock-
>> for-readKickstart-and.patch
>>  create mode 100644 meta-python/recipes-extended/p
>> ython-pykickstart/files/0003-comment-out-sections-shutdown-a
>> nd-environment-in-gen.patch
>>  create mode 100644 meta-python/recipes-extended/p
>> ython-pykickstart/files/0004-load.py-retry-to-invoke-request
>> -with-timeout.patch
>>  create mode 100644 meta-python/recipes-extended/python-pykickstart/
>> python3-pykickstart_2.35.bb
>>
>> --
>> 2.8.1
>>
>>
>
>

