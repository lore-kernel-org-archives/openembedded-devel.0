Return-Path: <switesh.fulpagare@mindastoneridge.com>
Received: from mail-vc0-f179.google.com (mail-vc0-f179.google.com
	[209.85.220.179])
	by mail.openembedded.org (Postfix) with ESMTP id 3D9B560703
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Sep 2014 05:31:48 +0000 (UTC)
Received: by mail-vc0-f179.google.com with SMTP id im17so2168027vcb.10
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Sep 2014 22:31:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=ESIeEj+zv40z1XjYnRgvyLEb6eXflvuh2Lc5hW64gyQ=;
	b=AnosnCPVOYFi6tGuCShk5xNZLi8OGzJhDv+l91vZIr202P1srrsQ6AuBUITOXOMc1L
	NO54X9TOhrt/iD+BMdsRAsg7R2mm+ay1bD8mb1GGTUD3+rqNXSuk3TKeIomAeZbMHPWw
	AZfSw2rrSMU2qJi62jeAXfuwWaiXc+nsUat3HnchFvkMFyYiN0x8zKJC1AF5+0fyupGB
	JHILbJZg8l/ygsXZdcyNFEp9S9sNioyvaYRGoaX4M1bsWs96EjHijjmNZlfnoYnBRNUO
	/9orn0+TdOQ4eKNpNqh7yaP8Dg6Eo5dVwU5yZy/M488h3IC32SGNz/l/LKXxG5i+f7mQ
	gSRg==
X-Gm-Message-State: ALoCoQnCbxPk3spFR+zsYENNE0uwnKxZg8YyoFwr4Yy0eKcW7QDfWVH2BbRhtXdkqAvURRl1gfqouGi2XMSsWJuqp93yv6FLa3xlPqbEi+MaLSPakpluXBhZOnzI4tXbLabjw0gk7aj9yLTb3mhsfIlux+S8Ue9IQg==
MIME-Version: 1.0
X-Received: by 10.220.95.132 with SMTP id d4mr13556542vcn.33.1410240709452;
	Mon, 08 Sep 2014 22:31:49 -0700 (PDT)
Received: by 10.52.245.73 with HTTP; Mon, 8 Sep 2014 22:31:49 -0700 (PDT)
In-Reply-To: <CAP9ODKoBFp7Pskwch4nLq4mkJOB-uFh1m2w7zz46LZ=CUp5JAg@mail.gmail.com>
References: <CALRGHr-x0HHMz8paVPVFxmoZ41zRGBZ4GmY3N35VKfYx57v6Lg@mail.gmail.com>
	<CAP9ODKqZyLwdSGVSResWqOsxTLfPMXhGbh9a1mZL16RTG8nPsQ@mail.gmail.com>
	<CALRGHr9ts28vt-JN2v4SPKjd7-btmWrqVd7G=_cfcv4bGD_z1g@mail.gmail.com>
	<CALRGHr_u5LULhoxx0NLYK6Uux4uZ5Kr7+ikOY-TKqMvDfUfYmg@mail.gmail.com>
	<CAP9ODKp=xaS+WoQe-zKTpcKiqmdk4mHteoZ8a9BqO1w96hcbxg@mail.gmail.com>
	<CALRGHr_OiFeW60BsKxe0XdrBbkcXAE+usv3-=pHnhXCzONK_vg@mail.gmail.com>
	<CAP9ODKoBFp7Pskwch4nLq4mkJOB-uFh1m2w7zz46LZ=CUp5JAg@mail.gmail.com>
Date: Tue, 9 Sep 2014 11:01:49 +0530
Message-ID: <CALRGHr9iRe3j9j0ce2RnOz7TP+1UzaPqtE5vsooBze_A0fAuyA@mail.gmail.com>
From: Switesh Fulpagare <switesh.fulpagare@mindastoneridge.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: Error while bitbake meta-toolchain-qt5
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
X-List-Received-Date: Tue, 09 Sep 2014 05:31:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Otavio,
   Now i have clean build all and using core-image-x11 i can able to
observe CinematicExperience on the monitor by

$ Qt5_CinematicExperience

Now while

Cross compile Qt5 for QtCreator  (
http://wiki.wandboard.org/index.php/Building_Qt5_using_yocto_on_Wandboard )

at

$ bitbake meta-toolchain-qt5

following errors are resolved

1. qtwayland_git.bb, do_fetch
2. qtwayland_git.bb, do_unpack

But now only one error is encountering as qtwayland_git.bb, do_unpack

pls see the log at
http://pastebin.com/ikXVV2Wc

if it is again related to patch, can please tell me how to apply the patch?

I am working very first time in this Linux environment so might not
knowing some basics.

Thanking you Otavio.





On Sat, Sep 6, 2014 at 11:21 PM, Otavio Salvador <otavio@ossystems.com.br>
wrote:

> On Sat, Sep 6, 2014 at 12:55 AM, Switesh Fulpagare
> <switesh.fulpagare@mindastoneridge.com> wrote:
> > Hi Otavio,
> >      Thanks for your mail.
> > Yes, Otavio you are right.
> > There is  / at the end of DL_DIR in the local.conf file.
> > I had removed that and once again given bitbake meta-toolchain-qt5
> > but as result as earlier. See the link below.
> >
> > http://pastebin.com/a8VjfKXh
>
> WARNING: Failed to fetch URL
> git://qt.gitorious.org/qt/qtwayland.git;branch=3Dstable, attempting
> MIRRORS if available
> ERROR: Fetcher failure: Unable to find revision
> a237778666666ab77c4e8e6b501cf0fbe7c9223e in branch stable even from
> upstream
> ERROR: Function failed: Fetcher failure for URL:
> 'git://qt.gitorious.org/qt/qtwayland.git;branch=3Dstable'. Unable to
> fetch URL from any source.
>
> It seems you didn't apply the patch.
>
> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

--=20
=E2=80=9CThe contents of this e-mail message and any attachments are confid=
ential=20
and are intended solely for addressee. The information may also be legally=
=20
privileged. This transmission is sent in trust, for the sole purpose of=20
delivery to the intended recipient. If you have received this transmission=
=20
in error, any use, reproduction or dissemination of this transmission is=20
strictly prohibited. If you are not the intended recipient, please=20
immediately notify the sender by reply e-mail or phone and delete this=20
message and its attachments, if any.=E2=80=9D

