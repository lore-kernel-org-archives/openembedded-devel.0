Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 4CD177719C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Sep 2016 18:00:31 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id b187so14715858wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Sep 2016 11:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=TcDGmO1h9L7oMBoKIksbA9QC6TJg0/lv20pMv5F25bM=;
	b=c/CBhXjIzvTq6Lq0l8yaMDekdy+PTDVY05IvujWTDBDzfBvW7OzxVhMpFktMxrGU3D
	exYOj4KheKxo4wyWfIIZI0I5LoqtNJyDr/GxA3Z/slCtLzvirhIi/c4Ex3iaYxGd2D/U
	9knJPF9RsteSAlUZBeVrj53qvVOn6E73+CckSE8CLSSW8kcUBhzz+ebrwtOQ2dktP00S
	Dcofpc8UHO70n7HCNksUyVJGsSatDBizlJ1+bizSDrBCTyqgVk3xWX+Y13ZeHOmIXEkM
	ohx3fQ2UdfYO33Jw/IsoCrBAR9WTlCeQ/+aDnXpKrK3LkRmmj8Kzg95OO87v8Ve4aDtU
	UCdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=TcDGmO1h9L7oMBoKIksbA9QC6TJg0/lv20pMv5F25bM=;
	b=A1aIFciQ5xFl3HKbSnDFULJCV3EKdDwM9zlqbjhKt8xiZkhfDlQhz+TvOVgL3xp90F
	SCcGyCwfSA7ZC6pidtFYb34TIxhtM1vqzbMxVOR4HiCeXYfJuVLSvpGwYTv1VBOXNlcJ
	WlaY+MB82CZWhUdt4lDniScXi9xe1PZyG+EMLmaRHll/q+jSZRRXIGkY2BQ31Iz80EKJ
	Y/5zhm91T7YRX/ms5hKbzoPP7TwD/EF3jzUR52bsOuarjkRbFrGAtKQw8scWtdy5r7zm
	dV87Z8Q44Y+5HExD8p0LMflouH/KQSlzb8pZtRaK610gaLjoyMpqzsXH1wSbm1s4twR3
	mvvQ==
X-Gm-Message-State: AE9vXwOD2/K4N3GR8ZXMhbGCwVO7ydDUQKOciWm0aw3deZi9gC7/V0wsYYgwzc8nE68MMGNUBBt5xyMsr+KBdQ==
X-Received: by 10.194.84.234 with SMTP id c10mr16191622wjz.34.1473703231072;
	Mon, 12 Sep 2016 11:00:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.154.225 with HTTP; Mon, 12 Sep 2016 11:00:30 -0700 (PDT)
In-Reply-To: <bdbed90b-1aa2-b42e-2279-716cb2259bef@gmail.com>
References: <20160912170647.14289-1-Martin.Jansa@gmail.com>
	<CAMKF1sqY8tOj5y0kMNkVESWfZcddU3p9Lw2ZrxFOETGMC6rY8Q@mail.gmail.com>
	<bdbed90b-1aa2-b42e-2279-716cb2259bef@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 12 Sep 2016 20:00:30 +0200
Message-ID: <CA+chaQfs2hsvgLM=S8oYPHGNX=iGOt3-XnjugGA+iiKTXiMxYw@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][meta-networking][PATCH] iscsitarget, netmap-moduls, vboxguestdrivers: Blacklist, not compatible with default kernel version 4.8
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
X-List-Received-Date: Mon, 12 Sep 2016 18:00:32 -0000
Content-Type: text/plain; charset=UTF-8

linux-libc-headers are 4.8% by default since:
http://git.openembedded.org/openembedded-core/commit/?id=253bf0332bd979b9fd9cf6fdc44682892f0bacf7

qemuarm is using 4.8% by default for kernel as well, since:
http://git.openembedded.org/openembedded-core/commit/?id=fd31e30f97ee9bd128d5b7b748987b0a6427b279

That's why it's now failing in world builds...

On Mon, Sep 12, 2016 at 7:33 PM, akuster808 <akuster808@gmail.com> wrote:

>
>
> On 09/12/2016 10:12 AM, Khem Raj wrote:
>
>> 4.8 isnt released yet. So I would suggest to wait merging this until its
>> released
>>
>
> 4.8-rc5 is so this patch is valid IMHO.
>
> -armin
>
> On Sep 12, 2016 10:07 AM, "Martin Jansa" <martin.jansa@gmail.com> wrote:
>>
>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>>> ---
>>>   .../recipes-extended/iscsitarget/iscsitarget_1.4.20.3+svn502.bb
>>>   |
>>> 3 +++
>>>   meta-networking/recipes-kernel/netmap/netmap-modules_git.bb
>>>   |
>>> 3 +++
>>>   meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.1.4.bb
>>>  |
>>> 3 +++
>>>   3 files changed, 9 insertions(+)
>>>
>>> diff --git a/meta-networking/recipes-extended/iscsitarget/
>>> iscsitarget_1.4.20.3+svn502.bb b/meta-networking/recipes-
>>> extended/iscsitarget/iscsitarget_1.4.20.3+svn502.bb
>>> index ba51c25..4b5622b 100644
>>> --- a/meta-networking/recipes-extended/iscsitarget/iscsitarget_1.4.20.3+
>>> svn502.bb
>>> +++ b/meta-networking/recipes-extended/iscsitarget/iscsitarget_1.4.20.3+
>>> svn502.bb
>>> @@ -56,3 +56,6 @@ FILES_${PN} += "${sbindir} \
>>>
>>>   RDEPENDS_${PN} = "kernel-module-iscsi-trgt"
>>>   RRECOMMENDS_${PN} = "kernel-module-crc32c kernel-module-libcrc32c"
>>> +
>>> +# http://errors.yoctoproject.org/Errors/Details/83334/
>>> +PNBLACKLIST[iscsitarget] ?= "BROKEN: not compatible with default kernel
>>> version 4.8"
>>> diff --git a/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb
>>> b/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb
>>> index 6544bb5..e9eea56 100644
>>> --- a/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb
>>> +++ b/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb
>>> @@ -87,3 +87,6 @@ do_install () {
>>>       cd ${S}/LINUX
>>>       oe_runmake install
>>>   }
>>> +
>>> +# http://errors.yoctoproject.org/Errors/Details/83335/
>>> +PNBLACKLIST[netmap-modules] ?= "BROKEN: not compatible with default
>>> kernel version 4.8"
>>> diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdriv
>>> ers_5.1.4.bb b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdriv
>>> ers_5.1.4.bb
>>> index 66068d1..1d1b1d8 100644
>>> --- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.1.4.bb
>>> +++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.1.4.bb
>>> @@ -63,3 +63,6 @@ FILES_${PN} = "${base_sbindir}"
>>>
>>>   # autoload if installed
>>>   KERNEL_MODULE_AUTOLOAD += "vboxguest vboxsf vboxvideo"
>>> +
>>> +# http://errors.yoctoproject.org/Errors/Details/83333/
>>> +PNBLACKLIST[vboxguestdrivers] ?= "BROKEN: not compatible with default
>>> kernel version 4.8"
>>> --
>>> 2.10.0
>>>
>>> --
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>>
>>>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

