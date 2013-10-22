Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f54.google.com (mail-wg0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id F37F86CEB9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Oct 2013 21:31:37 +0000 (UTC)
Received: by mail-wg0-f54.google.com with SMTP id c11so8433913wgh.21
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Oct 2013 14:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=7r3Qao09WjjluAj5J6ExqonAu0zR/ukn1JYE4ULJBGs=;
	b=RiLKK+akoU3+3eExN0kCwgD3sKr4KcUYUyjvAt6OgSMg8liulunBM0r+u94Bd/ozt0
	Elfjlky131cYskHg6GIuFI8jgoS2oD50qvNCcf89mz0J4WlFqnO7pGy+LDfQ4CjOM3s5
	AeFBpNNhKLaFalf9SeRAm1iC6qz0AgQnxyORYxQ4GNhIj7tLCLRBYaisT3cw/7jV14RF
	u7+Hg7LKiZREZTXJ3kRn0dkTOoMQvQO1a5oYPeYwMIawCBsNOY8/E9qWTj7set/QPCI/
	AUEiJ7ahGO8advHY/KmZbhCy84rFtLjanq193hxsskmB2k6AAn4yY2e+/N0mJPDHrJuY
	kJ0g==
MIME-Version: 1.0
X-Received: by 10.180.126.103 with SMTP id mx7mr9836791wib.39.1382477499521;
	Tue, 22 Oct 2013 14:31:39 -0700 (PDT)
Received: by 10.194.179.198 with HTTP; Tue, 22 Oct 2013 14:31:39 -0700 (PDT)
In-Reply-To: <CAP71WjzvGpG3mNf5dEQd1HuBgTc+41iJ6915EDQydUxaX7aoeQ@mail.gmail.com>
References: <1382456281-16216-1-git-send-email-nicolas.dechesne@linaro.org>
	<CAP71WjzvGpG3mNf5dEQd1HuBgTc+41iJ6915EDQydUxaX7aoeQ@mail.gmail.com>
Date: Tue, 22 Oct 2013 22:31:39 +0100
Message-ID: <CA+chaQfeObe0k1HODrGj_V-FFgswcRTPdzuNeb0ig8HLXi3wJg@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] qtwebkit-examples: add missing RDEPENDS for qmlplugins
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
X-List-Received-Date: Tue, 22 Oct 2013 21:31:39 -0000
Content-Type: text/plain; charset=UTF-8

It's OK, but it will take a while until I'm back to actually merge it.


On Tue, Oct 22, 2013 at 4:50 PM, Nicolas Dechesne <
nicolas.dechesne@linaro.org> wrote:

> On Tue, Oct 22, 2013 at 5:38 PM, Nicolas Dechesne
> <nicolas.dechesne@linaro.org> wrote:
> > Some examples require qtwebkit-qmlplugins (flickerview, youtubeview),
> > and this dependency is not automatically added. Without this patch,
> > and without manually adding qtwekbit-qmlplugins, we get errors like
> > this:
> >
> > qrc:///flickrview.qml:42:1: module "QtWebKit" is not installed
> >
> > Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
> > ---
>
> hmm. sorry, i messed up with my git alias and with --subject-prefix...
> the subject i meant to have for this email is
>
> [meta-qt5 master&dora][PATCH] qtwebkit-examples: add missing RDEPENDS
> for qmlplugins
>
> let me know if i need to resend. the key thing here is that I'd like
> this patch to be applied on master and dora branch.
>
> thanks
>

