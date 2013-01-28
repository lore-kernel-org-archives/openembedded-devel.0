Received: from mail-ve0-f177.google.com ([209.85.128.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TzpBM-000769-Rc
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Jan 2013 14:55:34 +0100
Received: by mail-ve0-f177.google.com with SMTP id m1so1311031ves.36
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Jan 2013 05:39:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:content-type:content-transfer-encoding;
	bh=i5wtYyHwMp/ZZHp0+H0MWyw64lY5hgrVTH7qIOjG2tM=;
	b=AZqq/CLvmXQ7W7BfcArn0cMvTQKr0dA/S21DDcUaUAqrG7cZYmpD6Ay6/ByRBmzTJn
	bzAreYCPQro6URv4Ub6d2kn9LrBPoTE2fyjgV/GTrSOSPKvfBS3jutspHWgHNC9J3JgQ
	TVo3Hu4XFGZGpwfkEEJ2zVyPfBOlZ60jjnJtTs5E2u9tzM/uc0Z3/6IBZ7AduWjjCzs2
	sgUXJcCzNHv/AfpQTn94WQ274KiNG+5/kIcorzE3TkVPmD9sERp3C5hgWf08hQ5jFnse
	Dkh8EkBXKQHucl5DUJCHqnaoS6Hk5oRpPE4AfEfs8lR5dNdEOoQ5LVq3cwnrphesxd0c
	9tVQ==
MIME-Version: 1.0
X-Received: by 10.52.32.39 with SMTP id f7mr12496759vdi.92.1359380394042; Mon,
	28 Jan 2013 05:39:54 -0800 (PST)
Received: by 10.52.95.243 with HTTP; Mon, 28 Jan 2013 05:39:53 -0800 (PST)
In-Reply-To: <1359378724-18026-1-git-send-email-schnitzeltony@googlemail.com>
References: <1359378724-18026-1-git-send-email-schnitzeltony@googlemail.com>
Date: Mon, 28 Jan 2013 14:39:53 +0100
Message-ID: <CALbNGRSkOUohkGQRALsfPhYTCK2GMw_cDFf=UE+W8gk_DPi_kQ@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-systemd 0/2] remove systemd core images
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
X-List-Received-Date: Mon, 28 Jan 2013 13:55:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 28, 2013 at 2:12 PM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> The following changes since commit 164caa34458ed2c145dfa2e4d2d207f8ce47a0=
57:
>
>   python-smbus: add 3.0.3 (2013-01-27 23:54:10 +0100)
>
> are available in the git repository at:
>   git://gitorious.org/schnitzeltony-oe-meta/meta-openembedded.git patches
>
> Andreas M=C3=BCller (2):
>       systemd: remove core recipes - they migrated to oe-core
>       systemd-speed-hacks: remove
>
>  .../recipes-core/systemd/systemd-compat-units.bb   |   59 ----
>  .../systemd/systemd-compat-units/machineid.service |   16 -
>  .../systemd-compat-units/run-postinsts.service     |   17 -
>  .../recipes-core/systemd/systemd-serialgetty.bb    |   46 ---
>  .../systemd/systemd-serialgetty/LICENSE            |  339 --------------=
------
>  .../systemd-serialgetty/serial-getty@.service      |   32 --
>  .../recipes-core/systemd/systemd-speed-hacks.bb    |   18 -
>  .../systemd/systemd-systemctl-native.bb            |   18 -
>  .../systemd/systemd-systemctl-native/systemctl     |  126 --------
>  ...emd-analyze-use-argparse-instead-of-getop.patch |  103 ------
>  ...-analyze-use-GDBus-instead-of-dbus-python.patch |   91 ------
>  .../recipes-core/systemd/systemd/gtk-doc.make      |  230 -------------
>  .../recipes-core/systemd/systemd/modprobe.rules    |   17 -
>  .../systemd/systemd/optional_secure_getenv.patch   |   19 --
>  .../systemd-pam-configure-check-uclibc.patch       |   26 --
>  .../systemd/systemd/systemd-pam-fix-execvpe.patch  |   26 --
>  .../systemd/systemd-pam-fix-fallocate.patch        |   82 -----
>  .../systemd/systemd-pam-fix-getty-unit.patch       |   35 --
>  .../systemd/systemd/systemd-pam-fix-mkostemp.patch |  166 ----------
>  .../systemd/systemd/systemd-pam-fix-msformat.patch |  335 --------------=
-----
>  .../recipes-core/systemd/systemd/touchscreen.rules |   18 -
>  .../recipes-core/systemd/systemd/var-run.conf      |    4 -
>  meta-systemd/recipes-core/systemd/systemd_git.bb   |  263 --------------=
-
>  23 files changed, 0 insertions(+), 2086 deletions(-)
>  delete mode 100644 meta-systemd/recipes-core/systemd/systemd-compat-unit=
s.bb
>  delete mode 100644 meta-systemd/recipes-core/systemd/systemd-compat-unit=
s/machineid.service
>  delete mode 100644 meta-systemd/recipes-core/systemd/systemd-compat-unit=
s/run-postinsts.service
>  delete mode 100644 meta-systemd/recipes-core/systemd/systemd-serialgetty=
.bb
>  delete mode 100644 meta-systemd/recipes-core/systemd/systemd-serialgetty=
/LICENSE
>  delete mode 100644 meta-systemd/recipes-core/systemd/systemd-serialgetty=
/serial-getty@.service
>  delete mode 100644 meta-systemd/recipes-core/systemd/systemd-speed-hacks=
.bb
>  delete mode 100644 meta-systemd/recipes-core/systemd/systemd-systemctl-n=
ative.bb
>  delete mode 100755 meta-systemd/recipes-core/systemd/systemd-systemctl-n=
ative/systemctl
>  delete mode 100644 meta-systemd/recipes-core/systemd/systemd/0001-Revert=
-systemd-analyze-use-argparse-instead-of-getop.patch
>  delete mode 100644 meta-systemd/recipes-core/systemd/systemd/0002-Revert=
-analyze-use-GDBus-instead-of-dbus-python.patch
>  delete mode 100644 meta-systemd/recipes-core/systemd/systemd/gtk-doc.mak=
e
>  delete mode 100644 meta-systemd/recipes-core/systemd/systemd/modprobe.ru=
les
>  delete mode 100644 meta-systemd/recipes-core/systemd/systemd/optional_se=
cure_getenv.patch
>  delete mode 100644 meta-systemd/recipes-core/systemd/systemd/systemd-pam=
-configure-check-uclibc.patch
>  delete mode 100644 meta-systemd/recipes-core/systemd/systemd/systemd-pam=
-fix-execvpe.patch
>  delete mode 100644 meta-systemd/recipes-core/systemd/systemd/systemd-pam=
-fix-fallocate.patch
>  delete mode 100644 meta-systemd/recipes-core/systemd/systemd/systemd-pam=
-fix-getty-unit.patch
>  delete mode 100644 meta-systemd/recipes-core/systemd/systemd/systemd-pam=
-fix-mkostemp.patch
>  delete mode 100644 meta-systemd/recipes-core/systemd/systemd/systemd-pam=
-fix-msformat.patch
>  delete mode 100644 meta-systemd/recipes-core/systemd/systemd/touchscreen=
.rules
>  delete mode 100644 meta-systemd/recipes-core/systemd/systemd/var-run.con=
f
>  delete mode 100644 meta-systemd/recipes-core/systemd/systemd_git.bb
>
> --
> 1.7.6.5
>
Will send out V2 in a few minutes with updated appends for dhcp & util-linu=
x

Andreas


