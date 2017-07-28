Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 8B5837835B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Jul 2017 02:46:41 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id x64so1456407wmg.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Jul 2017 19:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=E0yVBf7no2NcKUJKE2lGPWq8XuvwMvKfvK9hId/uAXo=;
	b=AK7CnFyEbPxJjw8kKPCiBFy+WPiQyP3Su/hWY9JferGdqGcWkFSTv7Ol4825ANHctm
	OX9/WATcHhV9w1uMV/i0nvXzWEnMfwYz6+Otqe90OkVVGIW+BoTwh8pU6kiJlV89Qfgs
	oyJP7XBnI+Sn8PBHTfxxXFoHwf5XYni7QE5vO7HDRvwEco3Kstsj6ypNOcjoz1CuWw12
	cAwVga14Y43q15qHLD3u1xzaxJLBj6na87tIyZdYW9pUUe+yIrz41HJh74k+tpdFkjzA
	6+W00RewAdt/KLPDx+HkpCwZSh5zRZ6w4UH9K3XYOE5klLP53Jslfi3PATKc8DyAEGht
	iDfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=E0yVBf7no2NcKUJKE2lGPWq8XuvwMvKfvK9hId/uAXo=;
	b=Io0PxQlqadVOyzpPAOahcLTRtg2nB3Orms8JNGtoUjuwXdabqXk20HT1AlOTZkrpAI
	S8wOWPT8pGfSJ46CHGOuXYGaOjs09ZzUHJeYUGzokB5DrIOzVB5zPjmm8YhYd3N1xEbe
	3Q4UL5DEq6gP4neR7fmCP0enBcFp1lSovhacXEsozYRgAP/FYW9Fx4GnNTkLTPw53anY
	uvTvHxmxdJBFhJfMLYwyA3hEv+ZY+GWPwJ48b+1uMyJjqEiqYZj7xo1WaudKiIYi/Hes
	O6vsjbOFjBboe0/vm/MxB25Xcd4mfBW2dVm0RM7tewpQ8KDwORpNh6Se63FFpstacX7x
	NrfQ==
X-Gm-Message-State: AIVw110yU+Z4t46z5kusbPr9lH0urzlAKDr+oSL6t+U6JG7ZyvaEFwM3
	NiRVZ7nlBroQ2Xy2j0JwxSWO+soOpw==
X-Received: by 10.80.147.197 with SMTP id o63mr5451271eda.194.1501210001952;
	Thu, 27 Jul 2017 19:46:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.149.181 with HTTP; Thu, 27 Jul 2017 19:46:11 -0700 (PDT)
In-Reply-To: <42b3f02b-8e6f-a75d-287a-2e9fa8d4b777@windriver.com>
References: <cover.1501142861.git.hongxu.jia@windriver.com>
	<CAMKF1sp8PP9sK5PTgeRLBJU7iWgKQtvvWWKiy0d-CjzvoR497w@mail.gmail.com>
	<42b3f02b-8e6f-a75d-287a-2e9fa8d4b777@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 27 Jul 2017 19:46:11 -0700
Message-ID: <CAMKF1sqzSrwFSfmaXKqPPQC6ZuyWc+E5y5AVMyfQaR3Mw6fcuA@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 0/6] add 5 recipes and 1 bug fix
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
X-List-Received-Date: Fri, 28 Jul 2017 02:46:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 27, 2017 at 7:02 PM, Hongxu Jia <hongxu.jia@windriver.com> wrot=
e:
> On 2017=E5=B9=B407=E6=9C=8827=E6=97=A5 21:46, Khem Raj wrote:
>>
>> On Thu, Jul 27, 2017 at 1:44 AM, Hongxu Jia <hongxu.jia@windriver.com>
>> wrote:
>>>
>>> Changed in V2:
>>>
>>> - s/fix contamination on centos7/fix host contamination on centos7/
>>>
>>> //Hongxu
>>>
>>> The following changes since commit
>>> a3a1ff1d411bcee88ed56caf4c9a7148c4a6e54a:
>>>
>>>    usermode: add recipe 1.111 (2017-07-24 21:13:11 -0400)
>>>
>>> are available in the git repository at:
>>>
>>>    git://git.openembedded.org/openembedded-core-contrib
>>> hongxu/add-recipe2
>>>
>>> http://cgit.openembedded.org/openembedded-core-contrib/log/?h=3Dhongxu/=
add-recipe2
>>>
>>> Hongxu Jia (6):
>>>    glade: fix host contamination on centos7
>>>    tigervnc: add recipe 1.8.0
>>>    libreport: add recipe 2.9.1
>>>    libblockdev: add recipe 2.10
>>>    python3-blivet: add recipe 2.2.0
>>>    python3-blivetgui: add recipe 2.1.5see if
>>
>> can you see if they build with musl too?
>
>
> Already done, and 1 fix on libblockdev in this RR.
>
> Build targetvnc and glade success with musl.
>
> The libreport, pyton3-blivet and python3-blivetgui is systemd specific
> which musl does not support.
>

Thanks for confirming.

> //Hongxu
>
>
>>
>>>   meta-oe/recipes-devtools/glade/glade_3.20.0.bb     |   4 +-
>>>   .../0001-fix-configure-and-compile-failures.patch  |  79 ++++
>>>   .../files/0002-remove-python2-support.patch        |  30 ++
>>>   ...emove-dmraid-while-compiling-with-with-dm.patch | 470
>>> +++++++++++++++++++++
>>>   ...ix-compile-failure-against-musl-C-library.patch |  50 +++
>>>   .../libblockdev/libblockdev_2.10.bb                |  50 +++
>>>   .../0001-Makefile.am-remove-doc-and-apidoc.patch   |  28 ++
>>>   ...ac-remove-prog-test-of-xmlto-and-asciidoc.patch |  48 +++
>>>   .../files/0003-without-build-plugins.patch         |  26 ++
>>>   ...configure.ac-remove-prog-test-of-augparse.patch |  36 ++
>>>   .../files/0005-remove-python2-support.patch        | 142 +++++++
>>>   .../recipes-extended/libreport/libreport_2.9.1.bb  |  43 ++
>>>   .../files/0001-tigervnc-remove-includedir.patch    |  50 +++
>>>   .../0002-do-not-build-tests-sub-directory.patch    |  29 ++
>>>   ...missing-dynamic-library-to-FLTK_LIBRARIES.patch |  28 ++
>>>   ...tigervnc-add-fPIC-option-to-COMPILE_FLAGS.patch |  62 +++
>>>   .../recipes-graphics/tigervnc/tigervnc_1.8.0.bb    | 131 ++++++
>>>   .../python3-blivet/0001-comment-out-selinux.patch  |  70 +++
>>>   .../0002-run_program-support-timeout.patch         | 102 +++++
>>>   .../0003-support-infinit-timeout.patch             |  66 +++
>>>   .../0004-Mount-var-volatile-during-install.patch   |  59 +++
>>>   .../0005-update-fstab-by-appending.patch           |  32 ++
>>>   ...0006-fix-new.roots-object-is-not-iterable.patch |  28 ++
>>>   ...correct-timeout-while-system-time-changed.patch |  48 +++
>>>   .../python3-blivet/0008-tweak-btrfs-packages.patch |  45 ++
>>>   ...0009-invoking-mount-with-infinite-timeout.patch |  31 ++
>>>   ...-use-oe-variable-to-replace-hardcoded-dir.patch |  34 ++
>>>   .../0011-invoking-fsck-with-infinite-timeout.patch |  31 ++
>>>   .../0012-invoking-mkfs-with-infinite-timeout.patch |  31 ++
>>>   ...evert-Adapt-to-logging-module-name-change.patch |  30 ++
>>>   .../python-blivet/python3-blivet_2.2.0.bb          |  46 ++
>>>   .../python-blivet/python3-blivetgui_2.1.5.bb       |  27 ++
>>>   32 files changed, 1983 insertions(+), 3 deletions(-)
>>>   create mode 100644
>>> meta-oe/recipes-extended/libblockdev/files/0001-fix-configure-and-compi=
le-failures.patch
>>>   create mode 100644
>>> meta-oe/recipes-extended/libblockdev/files/0002-remove-python2-support.=
patch
>>>   create mode 100644
>>> meta-oe/recipes-extended/libblockdev/files/0003-remove-dmraid-while-com=
piling-with-with-dm.patch
>>>   create mode 100644
>>> meta-oe/recipes-extended/libblockdev/files/0004-fix-compile-failure-aga=
inst-musl-C-library.patch
>>>   create mode 100644
>>> meta-oe/recipes-extended/libblockdev/libblockdev_2.10.bb
>>>   create mode 100644
>>> meta-oe/recipes-extended/libreport/files/0001-Makefile.am-remove-doc-an=
d-apidoc.patch
>>>   create mode 100644
>>> meta-oe/recipes-extended/libreport/files/0002-configure.ac-remove-prog-=
test-of-xmlto-and-asciidoc.patch
>>>   create mode 100644
>>> meta-oe/recipes-extended/libreport/files/0003-without-build-plugins.pat=
ch
>>>   create mode 100644
>>> meta-oe/recipes-extended/libreport/files/0004-configure.ac-remove-prog-=
test-of-augparse.patch
>>>   create mode 100644
>>> meta-oe/recipes-extended/libreport/files/0005-remove-python2-support.pa=
tch
>>>   create mode 100644
>>> meta-oe/recipes-extended/libreport/libreport_2.9.1.bb
>>>   create mode 100644
>>> meta-oe/recipes-graphics/tigervnc/files/0001-tigervnc-remove-includedir=
.patch
>>>   create mode 100644
>>> meta-oe/recipes-graphics/tigervnc/files/0002-do-not-build-tests-sub-dir=
ectory.patch
>>>   create mode 100644
>>> meta-oe/recipes-graphics/tigervnc/files/0003-add-missing-dynamic-librar=
y-to-FLTK_LIBRARIES.patch
>>>   create mode 100644
>>> meta-oe/recipes-graphics/tigervnc/files/0004-tigervnc-add-fPIC-option-t=
o-COMPILE_FLAGS.patch
>>>   create mode 100644 meta-oe/recipes-graphics/tigervnc/tigervnc_1.8.0.b=
b
>>>   create mode 100644
>>> meta-python/recipes-extended/python-blivet/python3-blivet/0001-comment-=
out-selinux.patch
>>>   create mode 100644
>>> meta-python/recipes-extended/python-blivet/python3-blivet/0002-run_prog=
ram-support-timeout.patch
>>>   create mode 100644
>>> meta-python/recipes-extended/python-blivet/python3-blivet/0003-support-=
infinit-timeout.patch
>>>   create mode 100644
>>> meta-python/recipes-extended/python-blivet/python3-blivet/0004-Mount-va=
r-volatile-during-install.patch
>>>   create mode 100644
>>> meta-python/recipes-extended/python-blivet/python3-blivet/0005-update-f=
stab-by-appending.patch
>>>   create mode 100644
>>> meta-python/recipes-extended/python-blivet/python3-blivet/0006-fix-new.=
roots-object-is-not-iterable.patch
>>>   create mode 100644
>>> meta-python/recipes-extended/python-blivet/python3-blivet/0007-fix-inco=
rrect-timeout-while-system-time-changed.patch
>>>   create mode 100644
>>> meta-python/recipes-extended/python-blivet/python3-blivet/0008-tweak-bt=
rfs-packages.patch
>>>   create mode 100644
>>> meta-python/recipes-extended/python-blivet/python3-blivet/0009-invoking=
-mount-with-infinite-timeout.patch
>>>   create mode 100644
>>> meta-python/recipes-extended/python-blivet/python3-blivet/0010-use-oe-v=
ariable-to-replace-hardcoded-dir.patch
>>>   create mode 100644
>>> meta-python/recipes-extended/python-blivet/python3-blivet/0011-invoking=
-fsck-with-infinite-timeout.patch
>>>   create mode 100644
>>> meta-python/recipes-extended/python-blivet/python3-blivet/0012-invoking=
-mkfs-with-infinite-timeout.patch
>>>   create mode 100644
>>> meta-python/recipes-extended/python-blivet/python3-blivet/0013-Revert-A=
dapt-to-logging-module-name-change.patch
>>>   create mode 100644
>>> meta-python/recipes-extended/python-blivet/python3-blivet_2.2.0.bb
>>>   create mode 100644
>>> meta-python/recipes-extended/python-blivet/python3-blivetgui_2.1.5.bb
>>>
>>> --
>>> 2.8.1
>>>
>>> --
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>
>

