Return-Path: <martin.jansa@gmail.com>
Received: from mail-vk0-f41.google.com (mail-vk0-f41.google.com
	[209.85.213.41])
	by mail.openembedded.org (Postfix) with ESMTP id D4F6B6612D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Aug 2017 10:49:34 +0000 (UTC)
Received: by mail-vk0-f41.google.com with SMTP id s199so359215vke.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Aug 2017 03:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=tJLNokvUSOx12BPqrfnl8B5pXBvp2FbkHtvhs+BPxGY=;
	b=g0PRowxA0UEcXw/adb65VUScDhbGnYad6ll9y688EHKHbZVsFXx/cShkUefrqwXOkc
	RhvoGfUuRYVi9EXDl0aFSWBr2AuUfj2sb77OAF6EUwjTDRAsrfRJO0FujcuKbuOEqF2y
	ZpAFS7+AHkfePENVOgb+VCJN1zZxCcCtOMKWfyghsfmzlQpo0bGV8lAKfd3ZMQAxkiA7
	a+lb11wrIJU6CwDLupFYA8rAIzITTMc6YIF9NhqQwjdFEQ1mEScevVw2kTAIN/j4CfzP
	u/1r0hUiww9CfRiXCQAWuu33+N1cKpS98dULOq0xfCxd0v5/x6UHs4oAhkPqTMFbfhDh
	/7RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=tJLNokvUSOx12BPqrfnl8B5pXBvp2FbkHtvhs+BPxGY=;
	b=eDUvKGk20fIYlM4COwj4HwJJ6kXCAsm1/NdCv0qK9DWzuRonXp0WYK6Z4ks5ZVhjtL
	7VYCO/waqKGQse2fIfM6G3jW0MtgXL91PKkaAb4mOUUTHnZ1fr4ShwfzAymXOnu2HMSu
	6J20lumjDtHG5VGhGogUNQayy0FnpvTzY08FohLgwTmywcq0S5lw/LQUTeLMhkozeXaS
	1X7Awawvlny4zOXm9CkWPN9xP0bGUj52iXgpGwpSEAtAF/DYwelOVaHmY6B6YEsSSOVR
	Gz69GoRBH8i8Z6TA2mps8SvFbZwSkZep0YBbAkZ532BhW5JV2E68hMQoeuHBLoK/PKWm
	nkig==
X-Gm-Message-State: AHYfb5h27E5Sxu2AA4lg7hhraPqnhGbyKK8tlC/uH3L6JbmX8BM+AyOY
	wMyGyE1vh2vyo3LhgaxqiVD+gK26Rg==
X-Received: by 10.31.169.9 with SMTP id s9mr89830vke.90.1503917375861; Mon, 28
	Aug 2017 03:49:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.50.144 with HTTP; Mon, 28 Aug 2017 03:49:35 -0700 (PDT)
In-Reply-To: <CALbNGRSx+DxNwt52kik9+_Adm-2vWaqHMHf2WJMYk=dcHzxZmw@mail.gmail.com>
References: <1496925018-5300-1-git-send-email-samuli.piippo@qt.io>
	<91dc3ff5-ad3a-ff4c-163a-4b82bb721422@gmail.com>
	<CA+chaQe9JFMTrZ8HcOPyVqj7VDvg4N_8VKGRf3X3vDuwC37f8w@mail.gmail.com>
	<CA+chaQe=8hRDdymjoqn0wRo03XUF0cTdvNiLQTUuvqzLsL2Q2w@mail.gmail.com>
	<CABXoSoWZBLfn4K2DcHED90U3Bvcj8GRLX9Qa5XL844hZB0+Tzg@mail.gmail.com>
	<CA+chaQc8V+tVZ4g+B7CAeR49wbDgs4+Uo+B++8ieKgG8HA4Zig@mail.gmail.com>
	<CAHUNapTL=U_t4EwTKkQ8B8A7j+=WKCU64u_MFeioB0yv_VfACA@mail.gmail.com>
	<20170622193547.GT28053@denix.org>
	<CAHUNapTJJfR8R7aUvuJDOV+KbcpkRb_dGEFO=k2a9Y+OQye3rA@mail.gmail.com>
	<CALbNGRSx+DxNwt52kik9+_Adm-2vWaqHMHf2WJMYk=dcHzxZmw@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 28 Aug 2017 12:49:35 +0200
Message-ID: <CA+chaQcSVSm-eGcaRq-=LUQrGs4oDwYrEM5Ahvu6xth83FPO1w@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH v3] Upgrade to Qt 5.9.0
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
X-List-Received-Date: Mon, 28 Aug 2017 10:49:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I've fixed the gcc7 + security_flags.inc issues in 5.8.0, that's now merged
in master.

Then I've rebased Samuli's upgrade to 5.9.0 to build on top of that and
added another upgrade to 5.9.2. That's currently in master-next branch.

But there is still this issue with qemux86 on x86_64 builders, so I'm not
going to merge this all until it's fixed in qtwebengine's chromium.
https://bugreports.qt.io/browse/QTBUG-59504
maybe we could just revert:
https://codereview.qt-project.org/#/c/189044/2/src/buildtools/configure_tar=
get.pro
but someone with deeper mksnapshot knowledge should confirm if the
requirement for multilib toolchain isn't valid after all, some of the
comments make some sense to me, so maybe the meta-browser fix actually
breaks mksnapshot, but nobody noticed it as we don't have good tests for it
in runtime.

Regards,

On Fri, Jun 30, 2017 at 1:43 PM, Andreas M=C3=BCller <
schnitzeltony@googlemail.com> wrote:

> On Fri, Jun 23, 2017 at 2:58 AM, Trevor Woerner <twoerner@gmail.com>
> wrote:
> > On Thu, Jun 22, 2017 at 3:35 PM, Denys Dmytriyenko <denis@denix.org>
> wrote:
> >> On Thu, Jun 15, 2017 at 01:25:12AM -0400, Trevor Woerner wrote:
> >>> On Fri, Jun 9, 2017 at 4:16 AM, Martin Jansa <martin.jansa@gmail.com>
> wrote:
> >>> > Then why does it work for chromium which used to have the same issu=
e?
> >>>
> >>> https://github.com/OSSystems/meta-browser/blob/master/
> recipes-browser/chromium/chromium/chromium/m32.patch
> >>
> >> Hmm, I'm wondering who comes up with such nonsense upstream that we
> have to
> >> patch it out? Is it due to laziness or are there some real limitations=
?
> >
> > Unfortunately genius and insanity are virtually indistinguishable from
> > each other ;-)
> > --
> Is anybody still working on Qt5.9 (or better on 5.9.1 which just
> arrived)? I want to avoid double efforts fixing qtwebengine/gcc7 on
> 5.8 or creating patches for 5.9.1 based on this series.
>
> Andreas
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

