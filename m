Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f178.google.com (mail-wr0-f178.google.com
	[209.85.128.178])
	by mail.openembedded.org (Postfix) with ESMTP id 249EC787BA;
	Sat, 20 Jan 2018 23:51:25 +0000 (UTC)
Received: by mail-wr0-f178.google.com with SMTP id f11so4819713wre.4;
	Sat, 20 Jan 2018 15:51:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=369KJ6qP7Ma8kJf7cUdeUN0evzNYW8/mo21OH/H0tNM=;
	b=ruG0zetjBy7VfeKkJmA1Ps1TZ2160so2iJ1IpXxseAiewXu22QatsJOGPc/N8TrQXe
	TIh3iwwp5pZfEZOik2P/V1fTUOAGR3Jh65qWKK/yRTuqASHakGXykXeOYDDQs10C2XV/
	kZQKGs2OriyXhRhSkTtmmbcK6DL7FaCwxMedYAZI12/GEWbkzmBubsVR2jHHlZ2Filxc
	kw4//kyiDvSKU06U5DDOIHJeixF5nmnJBlH0brjdZRST0XelG1Q+QQLCL8JK4x0Wi2eb
	0RJWOz4UivjJX2rVMYP3zXL6+nr/uAoYohlUW8UFcLTPbx/4YqKmk+HbBvokvMTnNE6v
	oz7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=369KJ6qP7Ma8kJf7cUdeUN0evzNYW8/mo21OH/H0tNM=;
	b=ukVXaP1AEeuKUZJWeUHz5yq638J5y19KId5z/EGUD3f3lhJHU8GvF0/7XQf5+mz4Fs
	w+rcTqoEzyP5f8oVYCYIbEz1TfTmDzKpC7koGbRtt5J3f5A5N0fZ1yCcXLicjQw/HoD8
	RqHjk3MSJshmENJBnri2AUm94gg+dSmVCJjmh+MX8tykHkIeFoi4jdVhll3gwRWGBpXY
	n1uxLoB+PI/cMVOIqypeVDdpvDDZgPvZoolT1op+ggY7/CG6rmwmjep+tOpij+B5COXt
	69dulR7IW56zIWfEvVVZgrcymB6My/iu3pQnbBtV1sNmDxlHukLeI134z/59aDtFDFTV
	y7Ig==
X-Gm-Message-State: AKwxytfMf7vNPzSyDVyOXXRsCUHxla5NLQGujRXjmUrdTf0F7v8XDgDV
	LuTILelPT7JNH/lEtYJbs3ljGvHjmMaHEDzLFzeuhw==
X-Google-Smtp-Source: AH8x227ZvzoF7hYYZmFb6ITLPy1sUwWU+B6r68Xtth8JLEZGrE/GHLWQGhXAu9qU7KjxLA00oF5khM/smtLKlcQNgsc=
X-Received: by 10.223.177.158 with SMTP id q30mr2531339wra.206.1516492286722; 
	Sat, 20 Jan 2018 15:51:26 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.74.211 with HTTP; Sat, 20 Jan 2018 15:51:26 -0800 (PST)
In-Reply-To: <151648740023.29293.16416809305382382616@git.openembedded.org>
References: <151648740023.29293.16416809305382382616@git.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sun, 21 Jan 2018 00:51:26 +0100
Message-ID: <CA+chaQcFLf+SuwaPq+Jg=8B11w_StoWE2iHzXjXDUynT8MyqQg@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] [openembedded-core] branch morty updated: image: Expand PV to avoid AUTOREV parsing failures
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
X-List-Received-Date: Sat, 20 Jan 2018 23:51:26 -0000
Content-Type: text/plain; charset="UTF-8"

This causes:

Exception: TypeError: getVar() missing 1 required positional argument:
'expand'

On Sat, Jan 20, 2018 at 11:30 PM, <git@git.openembedded.org> wrote:

> This is an automated email from the git hooks/post-receive script.
>
> rpurdie pushed a commit to branch morty
> in repository openembedded-core.
>
> The following commit(s) were added to refs/heads/morty by this push:
>      new 9ce26c1  image: Expand PV to avoid AUTOREV parsing failures
> 9ce26c1 is described below
>
> commit 9ce26c121f52d5194732be34f93e86128e1fdeaf
> Author: Richard Purdie <richard.purdie@linuxfoundation.org>
> AuthorDate: Mon Jan 8 17:41:27 2018 +0000
>
>     image: Expand PV to avoid AUTOREV parsing failures
>
>     Currently, setting PV to include SRCPV for build-appliance results in:
>
>     bb.data_smart.ExpansionError: Failure expanding variable SRCPV,
> expression was
>     ${@bb.fetch2.get_srcrev(d)} which triggered exception FetchError:
> Fetcher
>     failure: Fetch command export ftp_proxy="http://proxy.yocto.io:5187/";
> export
>     FTP_PROXY="http://proxy.yocto.io:5187/"; export PATH="${TMPDIR}/work/
>     qemux86_64-poky-linux/build-appliance-image/fetcheravoidrecurse-r0/
>     recipe-sysroot-native/usr/bin/python3-native:${TMPDIR}/work/
>     qemux86_64-poky-linux/build-appliance-image/fetcheravoidrecurse-r0/
>     recipe-sysroot-native/usr/bin/python3-native:${TMPDIR}/work/
>     qemux86_64-poky-linux/build-appliance-image/fetcheravoidrecurse-r0/
>     recipe-sysroot-native/usr/bin/python3-native:/home/pokybuild/
>     yocto-autobuilder/yocto-worker/buildtools/build/scripts:${TMPDIR}/
>     work/qemux86_64-poky-linux/build-appliance-image/
> fetcheravoidrecurse-r0/
>     recipe-sysroot-native/usr/bin/x86_64-poky-linux:${TMPDIR}/work/
>     qemux86_64-poky-linux/build-appliance-image/fetcheravoidrecurse-r0/
>     recipe-sysroot/usr/bin/crossscripts:${TMPDIR}/work/
> qemux86_64-poky-linux/
>     build-appliance-image/fetcheravoidrecurse-r0/recipe-
> sysroot-native/usr/sbin:
>     ${TMPDIR}/work/qemux86_64-poky-linux/build-appliance-image/
>     fetcheravoidrecurse-r0/recipe-sysroot-native/usr/bin:${TMPDIR}/work/
>     qemux86_64-poky-linux/build-appliance-image/fetcheravoidrecurse-r0/
>     recipe-sysroot-native/sbin:${TMPDIR}/work/qemux86_64-poky-linux/
>     build-appliance-image/fetcheravoidrecurse-r0/recipe-
> sysroot-native/bin:/home/
>     pokybuild/yocto-autobuilder/yocto-worker/buildtools/build/
> bitbake/bin:${TMPDIR}
>     /hosttools"; export HOME="/home/pokybuild"; git -c
> core.fsyncobjectfiles=0
>     ls-remote git://git.yoctoproject.org/poky  failed with exit code 127,
> output:
>     /bin/sh: 1: git: not found
>
>     This is because PV is being expanded when TMPDIR is unset.
>
>     Expand PV in advance to avoid this problem.
>
>     Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/classes/image.bbclass | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> index a9ab2fa..3e6b6e1 100644
> --- a/meta/classes/image.bbclass
> +++ b/meta/classes/image.bbclass
> @@ -439,6 +439,8 @@ python () {
>          # This means the task's hash can be stable rather than having
> hardcoded
>          # date/time values. It will get expanded at execution time.
>          # Similarly TMPDIR since otherwise we see QA stamp comparision
> problems
> +        # Expand PV else it can trigger get_srcrev which can fail due to
> these variables being unset
> +        localdata.setVar('PV', d.getVar('PV'))
>          localdata.delVar('DATETIME')
>          localdata.delVar('TMPDIR')
>
>
> --
> To stop receiving notification emails like this one, please contact
> the administrator of this repository.
> --
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits
>

