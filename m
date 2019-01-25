Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
	[209.85.222.176])
	by mail.openembedded.org (Postfix) with ESMTP id 78F897C338
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Jan 2019 03:06:53 +0000 (UTC)
Received: by mail-qk1-f176.google.com with SMTP id z18so4634455qkj.10
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Jan 2019 19:06:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=bzn4aF8BC1WMLzCCDlP/lx90z5/ypp80NYkDCI61KUE=;
	b=igKxuvVslr1zF2++Tbg41TgjtvDzRFbCd1uJf+QMcrc9Ca+HYSkmVtNSCo8U1EUNJr
	6e3A102sHsvkGS8bpPMl0uBs0qWsfF5X+1bWoYwR9MHwVj+78/Jj2Y9UCQT2NJIFMtmR
	TFrBT8Q2/SovKLhnv8kkdx+o5cHIM3cEmz2K3ItUa10yp4Pz33Es5c81n9gcmam09Ifl
	UBIPPPhiCw4nZW8TpCW3MU/DX00zzf+zlNsx4v9jaEO4umwyVdC6PRL0DjfEqcSymnR0
	3GZU071bnwkVZY0Nc3UykTcNKQpc9/pp9snDVdOGzSlIkhUChkiEgGpHmfDFMUaig91M
	jDLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=bzn4aF8BC1WMLzCCDlP/lx90z5/ypp80NYkDCI61KUE=;
	b=ljVdhu44OWUSazJfzBQZ1P05bcDPdrloJJ3/cfDmGF/9sgdR8kTJQ+0Y61mLdpUjJY
	8OKha/ZWTaqrGN/tc0osNYJIFMj9meaipN/JgsR7U9crnJ/MZmbJWM25hd62g/oFOmbB
	smbHXJGH0MBZj2yUz22TTIGJ/uqQ8MW7f3dZVKrwM+5teF2Ba0Ur7lASiXFkkuzd9lM9
	XhwKirLYOioQ08tjDWFNy68W8cPJfvtGLZdhyH9AbC9xBYf1c64ixPUiP1lFM8CjZjTa
	HtnxcKhUysCJ/PHPt42bCkmJro4XQxHL60neYai32HQtWrMAFESWY6LxNUFPAu7KJziE
	JNZg==
X-Gm-Message-State: AJcUukfVvvdAP5uRYsqnR5al/zbtozXcTnNFZv8oSXFdLCwd+/QnJQ0p
	DH50pVIYJkFVyzmIcyyWPpzSaNlTLSwTdXLrso8=
X-Google-Smtp-Source: ALg8bN7CgIDua+JZe5TmxFlsuRWZwCfqPIv/XFbMOBB6z5lgiRvU8d71Gpq3iNFNB7N1A+8MpJvMBhTVgEkOUc9q8Yc=
X-Received: by 2002:a37:ac05:: with SMTP id e5mr8363368qkm.102.1548385614013; 
	Thu, 24 Jan 2019 19:06:54 -0800 (PST)
MIME-Version: 1.0
References: <CAGvkhOKAJbq++7QHCU_qOSgDiQWLYusfD9P02Xk8r=a3XpPMkQ@mail.gmail.com>
	<CAMKF1sq2DJqHw07SqC9GBntZzi7HsYoiif7M2aOML-mXt_N5ZQ@mail.gmail.com>
	<CAGvkhOLtisbAX9nnMep-R=d1ycDfVO7K6Uoh7Pd0LxvLvEGpZQ@mail.gmail.com>
In-Reply-To: <CAGvkhOLtisbAX9nnMep-R=d1ycDfVO7K6Uoh7Pd0LxvLvEGpZQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 24 Jan 2019 22:06:27 -0500
Message-ID: <CAMKF1soqmRmxd2RFiXxymWcha-YQqn2Rx+xgte5FbJha61yuiQ@mail.gmail.com>
To: Glenn Stroz <gstroz@uber.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v2] libqmi: Update to 1.22.0
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
X-List-Received-Date: Fri, 25 Jan 2019 03:06:53 -0000
Content-Type: text/plain; charset="UTF-8"

inline is better attachment is ok, github pull is ok too for my workflow

On Thu, Jan 24, 2019 at 9:58 PM Glenn Stroz <gstroz@uber.com> wrote:
>
> Hi Khem,
>
> Yeah it looks like gmail cuts off lines when pasting patches into the web forum - even with plain text. My organization restricts SMTP so I can't use git send-email. Is it possible to attach the patch or does it need to be inline?
>
>
>
> On Thu, Jan 24, 2019 at 8:54 PM Khem Raj <raj.khem@gmail.com> wrote:
>>
>> Hi Glenn
>>
>> Thanks for patch but it does not apply,
>>
>> Applying: libqmi: Update to 1.22.0
>> error: corrupt patch at line 56
>> Patch failed at 0001 libqmi: Update to 1.22.0
>>
>> Can you generate this patch on top of master and
>> use git format-patch to generate the patch and resend it
>>
>> On Thu, Jan 24, 2019 at 5:57 PM Glenn Stroz via Openembedded-devel
>> <openembedded-devel@lists.openembedded.org> wrote:
>> >
>> > Signed-off-by: Glenn Stroz <gstroz@uber.com>
>> > ---
>> >  ...t-create-invalid-wds-start-network-w.patch | 41 -------------------
>> >  .../{libqmi_1.20.2.bb => libqmi_1.22.0.bb}    |  6 +--
>> >  2 files changed, 3 insertions(+), 44 deletions(-)
>> >  delete mode 100644
>> > meta-oe/recipes-connectivity/libqmi/libqmi/0001-qmi-network-Don-t-create-invalid-wds-start-network-w.patch
>> >  rename meta-oe/recipes-connectivity/libqmi/{libqmi_1.20.2.bb =>
>> > libqmi_1.22.0.bb} (78%)
>> >
>> > diff --git a/meta-oe/recipes-connectivity/libqmi/libqmi/0001-qmi-network-Don-t-create-invalid-wds-start-network-w.patch
>> > b/meta-oe/recipes-connectivity/libqmi/libqmi/0001-qmi-network-Don-t-create-invalid-wds-start-network-w.patch
>> > deleted file mode 100644
>> > index d230d6803..000000000
>> > --- a/meta-oe/recipes-connectivity/libqmi/libqmi/0001-qmi-network-Don-t-create-invalid-wds-start-network-w.patch
>> > +++ /dev/null
>> > @@ -1,41 +0,0 @@
>> > -From 8269f4d86927fbe19e78776a12736680fe9169b6 Mon Sep 17 00:00:00 2001
>> > -From: Adrian Bunk <bunk@stusta.de>
>> > -Date: Mon, 1 Oct 2018 16:53:31 +0300
>> > -Subject: [PATCH] qmi-network: Don't create invalid --wds-start-network when
>> > - APN is not set
>> > -
>> > -In 1.20.2 the warning for this was turned into an error.
>> > -
>> > -(cherry picked from commit 289d8ad6419895e2e1fba3d78a54a0db65da521d)
>> > ----
>> > -Upstream-Status: Backport
>> > -
>> > - utils/qmi-network.in | 12 +++++++-----
>> > - 1 file changed, 7 insertions(+), 5 deletions(-)
>> > -
>> > -diff --git a/utils/qmi-network.in b/utils/qmi-network.in
>> > -index bf7bed9..a9e5299 100755
>> > ---- a/utils/qmi-network.in
>> > -+++ b/utils/qmi-network.in
>> > -@@ -334,11 +334,13 @@ start_network ()
>> > -
>> > -     setup_data_format
>> > -
>> > --    START_NETWORK_ARGS="apn='$APN'"
>> > --    if [ -n "$APN_USER" ]; then
>> > --        START_NETWORK_ARGS="${START_NETWORK_ARGS},username='$APN_USER'"
>> > --        if [ -n "$APN_PASS" ]; then
>> > --            START_NETWORK_ARGS="${START_NETWORK_ARGS},password='$APN_PASS'"
>> > -+    if [ -n "$APN" ]; then
>> > -+        START_NETWORK_ARGS="apn='$APN'"
>> > -+        if [ -n "$APN_USER" ]; then
>> > -+            START_NETWORK_ARGS="${START_NETWORK_ARGS},username='$APN_USER'"
>> > -+            if [ -n "$APN_PASS" ]; then
>> > -+
>> > START_NETWORK_ARGS="${START_NETWORK_ARGS},password='$APN_PASS'"
>> > -+            fi
>> > -         fi
>> > -     fi
>> > -
>> > ---
>> > -2.7.4
>> > -
>> > diff --git a/meta-oe/recipes-connectivity/libqmi/libqmi_1.20.2.bb
>> > b/meta-oe/recipes-connectivity/libqmi/libqmi_1.22.0.bb
>> > similarity index 78%
>> > rename from meta-oe/recipes-connectivity/libqmi/libqmi_1.20.2.bb
>> > rename to meta-oe/recipes-connectivity/libqmi/libqmi_1.22.0.bb
>> > index f0bc81cc9..c15dfb472 100644
>> > --- a/meta-oe/recipes-connectivity/libqmi/libqmi_1.20.2.bb
>> > +++ b/meta-oe/recipes-connectivity/libqmi/libqmi_1.22.0.bb
>> > @@ -12,12 +12,12 @@ DEPENDS = "glib-2.0 glib-2.0-native"
>> >  inherit autotools pkgconfig bash-completion
>> >
>> >  SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BPN}-${PV}.tar.xz \
>> > -           file://0001-qmi-network-Don-t-create-invalid-wds-start-network-w.patch
>> > \
>> >             file://0001-Detect-clang.patch \
>> >             "
>> > -SRC_URI[md5sum] = "584214476ab75c394160cb85fbccaa1d"
>> > -SRC_URI[sha256sum] =
>> > "c73459ca8bfe1213f8047858d4946fc1f58e164d4f488a7a6904edee25e2ca44"
>> > +SRC_URI[md5sum] = "35f7e1b03f9b6218a30c78422f72c6ac"
>> > +SRC_URI[sha256sum] =
>> > "21c198b481f1617bb7edb1960d823569de3e38b269dbf513af1b56048cafaa17"
>> >
>> >  PACKAGECONFIG ??= "udev mbim"
>> >  PACKAGECONFIG[udev] = ",--without-udev,libgudev"
>> >  PACKAGECONFIG[mbim] = "--enable-mbim-qmux,--disable-mbim-qmux,libmbim"
>> > +
>> > --
>> > 2.20.1
>> > --
>> > _______________________________________________
>> > Openembedded-devel mailing list
>> > Openembedded-devel@lists.openembedded.org
>> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel

