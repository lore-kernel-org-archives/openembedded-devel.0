Return-Path: <switesh.fulpagare@mindastoneridge.com>
Received: from mail-vc0-f176.google.com (mail-vc0-f176.google.com
	[209.85.220.176])
	by mail.openembedded.org (Postfix) with ESMTP id 276EF65D58
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Sep 2014 10:15:04 +0000 (UTC)
Received: by mail-vc0-f176.google.com with SMTP id la4so3835911vcb.35
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Sep 2014 03:15:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=lovIIwGwVRssMOsJkEOxx0tB44i4gj4BwMFsmJC6R2s=;
	b=c6H5786+8/ho7lYo+QXtJo6TbLYNLYRk/qMYfGYZOPuaPXG+RbOCB4SspmZYOuXUCJ
	ix+VIL/8z/J7XuZtyCuM23Pwjl2X1oM9TO6jon5YhCGISITJOSE1LahfaRUk6XogjhKA
	UJFmOOCv1IRuXmLlmKtelbpqTLHfqqj4uieTeC0kOxpZBGQjnM7KqVvitTtNN4oIEiiY
	aTx6cTfeLzRWMkCR8bjR59AQccbBhXX1x+YslSozXIaRA4GBNla47K6OXqVXPFQ1Fn5B
	PwFU+AbSjqa4YwwvNFfRlJFbVKqV8GOQPvCRHgg6b8K42M3qI50qvXcutONPWDjF5iq3
	gnrA==
X-Gm-Message-State: ALoCoQnHLfNBpgRZHBlEHKdoqz27i3zAgB593RjuZcu3LNXGb5MqZDHS2BZmMFkM48dF+8dLEWuMCeg0DpGFOuPBMdAZSrTn1FWOxr1+mHr++qIFYVL7MlQPkI30A2y/qqTgjt/7Rs6qYs45SETgBxYReqdhRpPngw==
MIME-Version: 1.0
X-Received: by 10.220.186.196 with SMTP id ct4mr33129vcb.51.1410430505482;
	Thu, 11 Sep 2014 03:15:05 -0700 (PDT)
Received: by 10.52.245.73 with HTTP; Thu, 11 Sep 2014 03:15:05 -0700 (PDT)
In-Reply-To: <54107627.9060100@phoenixsoftware.it>
References: <54107627.9060100@phoenixsoftware.it>
Date: Thu, 11 Sep 2014 15:45:05 +0530
Message-ID: <CALRGHr-E87NH+oyB0o5mASWTn3vffzBVF6_8d_uA9KfC4=wFGQ@mail.gmail.com>
From: Switesh Fulpagare <switesh.fulpagare@mindastoneridge.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-qt5] [daisy] qtwayland fetch fail
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
X-List-Received-Date: Thu, 11 Sep 2014 10:15:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Pierluigi,
  Thanks for this patch, it is working and my problem of
qtwayland-native_git.bb, do_fetch
qtwayland_git.bb, do_fetch
is solved now.

Thank you.

On Wed, Sep 10, 2014 at 9:32 PM, Pierluigi Passaro <
pierluigi.passaro@phoenixsoftware.it> wrote:

> Hi all,
> working on daisy, it looks like the fetching url of qtwayland is no longe=
r
> available.
>
> The following patch helped me to solve the problem, hope it will help...
>
> Regards
> Pierluigi
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> diff --git a/recipes-qt/qt5/qtwayland-native_git.bb b/recipes-qt/qt5/
> qtwayland-native_git.bb
> index 988aa98..64485de 100644
> --- a/recipes-qt/qt5/qtwayland-native_git.bb
> +++ b/recipes-qt/qt5/qtwayland-native_git.bb
> @@ -4,4 +4,5 @@ require ${PN}.inc
>  # qtwayland wasn't released yet, last tag before this SRCREV is
> 5.0.0-beta1
>  # qt5-git PV is only to indicate that this recipe is compatible with qt5
> 5.2.1
>
> -SRCREV =3D "a237778666666ab77c4e8e6b501cf0fbe7c9223e"
> +QT_MODULE_BRANCH =3D "dev"
> +SRCREV =3D "573d0ee5ba86d99095f217ea9e19172bfc5e75fd"
> diff --git a/recipes-qt/qt5/qtwayland_git.bb b/recipes-qt/qt5/qtwayland_
> git.bb
> index 789a882..c192914 100644
> --- a/recipes-qt/qt5/qtwayland_git.bb
> +++ b/recipes-qt/qt5/qtwayland_git.bb
> @@ -4,6 +4,7 @@ require ${PN}.inc
>  # qtwayland wasn't released yet, last tag before this SRCREV is
> 5.0.0-beta1
>  # qt5-git PV is only to indicate that this recipe is compatible with qt5
> 5.2.1
>
> +QT_MODULE_BRANCH =3D "dev"
>  SRCREV =3D "573d0ee5ba86d99095f217ea9e19172bfc5e75fd"
>
>  SRC_URI +=3D " \
>
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

