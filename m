Return-Path: <abrestic@google.com>
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
	[209.85.210.68])
	by mail.openembedded.org (Postfix) with ESMTP id C88AF796B1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Sep 2018 16:22:48 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id u20-v6so1797202otk.10
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Sep 2018 09:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=waymo.com; s=google;
	h=mime-version:reply-to:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-transfer-encoding;
	bh=EJ3QHEsozwyKeKVpcYYD1oYNCpLgIswb710uw6NpUWs=;
	b=VwNRQ9/n2Xepe/+v2T5ev0+s53w+3RcYYwTkHcWoMbsojD4fdl75OGvMS3ZDwxaRjS
	GXOs4EXsERmGJgkfg/vBw0VzmH2EjEf6fwaQJg0RhPxcysXz6F77jkne5EAPePgNeVWU
	xgp1yuNMQZlgUBzUDhhOSjuqjxc/nhGZKQ29M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:reply-to:in-reply-to:references
	:from:date:message-id:subject:to:cc:content-transfer-encoding;
	bh=EJ3QHEsozwyKeKVpcYYD1oYNCpLgIswb710uw6NpUWs=;
	b=Udt+UCEf9JEfuvO4tq7Gt4PpmjjswjSTEr5ziRzBAuCIBrbRL70m9oJs+n+ohCNqj1
	ebYdUtslb/sCr4BPYcC0A+nAts+hfkh7LpzhmJpuwa0M77NylTEAGGjpLUE4EuFGdaLD
	9vbG7kqihWCHbk7zrVoILmJtyvjwqmJznlS56Ar/xXWJaOj4oKLdunnlb6mONoNe/F/K
	tUqjL2IaK7gOWmk5dsHLoWy64DB8rTi35OKF4GUPlynPikSTIYxIn7MiBMm/Wd6oi9l7
	uLlV+gmrUQxeRho56s6ZHRABCdaTvPKFesP2yS0pz1UJ++iYExjYTSV/CCMONzoc/6GF
	W+SA==
X-Gm-Message-State: APzg51DWVqapCplK3mf3DAJL2G809NKTTDwpElSCLSMbpyr8tZuEiIG0
	jN73NMs40YtR/V7MtzAeWd+jHp+Lu6+JKx3LZVVy
X-Google-Smtp-Source: ANB0VdbEyiyOjgpS7wquMVPqP+Fw6NEldDtJFYod12ZMS/A+vM6x+pcOBNdE1blnWlI1pxbYjmVzK7gXr7CjIplDWtA=
X-Received: by 2002:a9d:2aaa:: with SMTP id
	e39-v6mr1675497otb.381.1536855768957; 
	Thu, 13 Sep 2018 09:22:48 -0700 (PDT)
MIME-Version: 1.0
Reply-To: abrestic@waymo.com
Received: by 2002:ac9:79c7:0:0:0:0:0 with HTTP; Thu, 13 Sep 2018 09:22:48
	-0700 (PDT)
In-Reply-To: <2a92e298-73d6-a5b2-4cc9-88cb6e32d1be@windriver.com>
References: <20180912212255.194513-1-abrestic@waymo.com>
	<2a92e298-73d6-a5b2-4cc9-88cb6e32d1be@windriver.com>
From: Andrew Bresticker <abrestic@waymo.com>
Date: Thu, 13 Sep 2018 09:22:48 -0700
Message-ID: <CAL1qeaHu+AZwF0GgBQ7a=AqRBieuZ0m-ZuxNg57c-L1s+xjEyg@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] libdevmapper: Install dmsetup
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
X-List-Received-Date: Thu, 13 Sep 2018 16:22:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Sep 13, 2018 at 8:22 AM, Hongxu Jia <hongxu.jia@windriver.com> wrot=
e:
> On 2018=E5=B9=B409=E6=9C=8813=E6=97=A5 05:22, Andrew Bresticker wrote:
>
> Commit 6aa1dd223a140 ("lvm2/libdevmapper: fix invoking lvcreate failed")
> accidentally removed installation of dmsetup as part of the libdevmapper
> recipe. Add it back by explicitly installing it in do_install().
>
>
> Why? I am afraid your fix will cause `invoking lvcreate failed'

Because presently users have no way to install the 'dmsetup' binary.
Commit 7f17da154372 ("lvm2: separate libdevmapper to avoid circular
dependency") moved installation of dmsetup from lvm2 to the
libdevmapper package, and then your commit removes installation of
dmsetup entirely (and in fact adds a patch to explicitly disable
installation of it as part of the lvm2 package).

It looks like the cause of the 'invoking lvcreate failed' issue was a
mismatch in EXTRA_OECONF/PACKAGECONFIG between lvm2 and libdevmapper,
which was fixed in your patch. The installation of an unrelated binary
(dmsetup) doesn't undo that.

Thanks,
Andrew

>
> Here is the original log of `Commit 6aa1dd223a140',
> I quess the `---' cuased the log truncate in git
>
> Previously, libdevmapper is separated from lvm2 in the following commit:
> ---
> commit 7f17da154372b5ec33947766783444961e8aa67c
> Author: Chen Qi <Qi.Chen@windriver.com>
> Date:   Mon Apr 24 16:06:41 2017 +0800
>
>     lvm2: separate libdevmapper to avoid circular dependency
> ---
>
> It caused invoking lvcreate failed:
> ---
> root@qemux86-64:~# lvm pvcreate /dev/sda
>   Physical volume "/dev/sda" successfully created.
> root@qemux86-64:~# lvm vgcreate -s 4096K wrl /dev/sda
>   Volume group "wrl" successfully created
> root@qemux86-64:~# lvm lvcreate -n swap -L 2293648K -y --type linear wrl
>   Rounding up size to full physical extent 2.19 GiB
>   /dev/wrl/swap: not found: device not cleared
>   Aborting. Failed to wipe start of new LV.
> ---
>
> The lvm2 and libdevmapper should use the same PACKAGECONFIG
> and EXTRA_OECONF.
>
> And do not manually remove useless files.
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>
> //Hongxu
>
>
>
> Signed-off-by: Andrew Bresticker <abrestic@waymo.com>
> ---
>  meta-oe/recipes-support/lvm2/libdevmapper_2.02.180.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta-oe/recipes-support/lvm2/libdevmapper_2.02.180.bb
> b/meta-oe/recipes-support/lvm2/libdevmapper_2.02.180.bb
> index f3f11ef64..26af3275d 100644
> --- a/meta-oe/recipes-support/lvm2/libdevmapper_2.02.180.bb
> +++ b/meta-oe/recipes-support/lvm2/libdevmapper_2.02.180.bb
> @@ -9,6 +9,7 @@ TARGET_CC_ARCH +=3D "${LDFLAGS}"
>
>  do_install() {
>      oe_runmake 'DESTDIR=3D${D}' -C libdm install
> +    oe_runmake 'DESTDIR=3D${D}' -C tools install_device-mapper
>  }
>
>  RRECOMMENDS_${PN}_append_class-target =3D " lvm2-udevrules"
>
>

