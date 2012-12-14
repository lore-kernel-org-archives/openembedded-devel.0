Received: from mail-vb0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1TjJCC-0001Py-RL
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 Dec 2012 01:32:09 +0100
Received: by mail-vb0-f47.google.com with SMTP id e21so3103200vbm.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Dec 2012 16:17:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:from:date
	:message-id:subject:to:content-type:x-gm-message-state;
	bh=XMIq2yFl7dYMT0XsExwjKsq2VNoVEQv6FR2aZiD9two=;
	b=c+D5heP+9jg6duGjP/zsmcv7B1sGNtyFppR+4xirvr1FZ++6V7o7VcoANU3mA8o/Tx
	+RcwMtZhjxg5/ueY+qXYouyviQEhVr42tcNLf1NuQ6jUuxC56BZAnkWnJ6eMwD44FLu2
	+oYgRozAIIU7E0gN3pQd/CdruFJ7V2SwXuavFwfIwN3yhahyeE8grKKPsnYvmAQL2ETg
	zfqYbnAvwTb1WHTjCxN58dGhZL5rqK+B4EW0zYFLe9V8qVDjOPXEqRXANqZjBLZtJcmp
	XHdI2gitugld9lt9nB0DL9eF+Rsq2Cc5RNKruWrq53s18M1jKT6/LSkXRXt7rIRVklfd
	wtSA==
Received: by 10.220.8.195 with SMTP id i3mr6381345vci.44.1355444248722; Thu,
	13 Dec 2012 16:17:28 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.102.132 with HTTP; Thu, 13 Dec 2012 16:17:08 -0800 (PST)
X-Originating-IP: [5.13.218.224]
In-Reply-To: <CA+chaQeSWd8=5iuVQa1Sy-zvKS4LBqba90oCAk8QyVmdeLVE6A@mail.gmail.com>
References: <1355437295-27710-1-git-send-email-andrei.gherzan@windriver.com>
	<CA+chaQeSWd8=5iuVQa1Sy-zvKS4LBqba90oCAk8QyVmdeLVE6A@mail.gmail.com>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Fri, 14 Dec 2012 02:17:08 +0200
Message-ID: <CAK18fxH9-VGmsqrtWOEhdB81PcJudaTTW=cdFgC73yg9dE=G7A@mail.gmail.com>
To: openembedded <openembedded-devel@lists.openembedded.org>
X-Gm-Message-State: ALoCoQl8RBnxQCnTU8WiiLsSrMgYzz+7T9eTXW7sOtSMzYMHTiTGei4Vb9vOZnaE4GBLqGZhRvHy
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [meta-oe][PATCH] pixman: Sync with version from oe-core
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
X-List-Received-Date: Fri, 14 Dec 2012 00:32:09 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Dec 14, 2012 at 2:12 AM, Martin Jansa <martin.jansa@gmail.com>wrote:

> On Thu, Dec 13, 2012 at 11:21 PM, Andrei Gherzan
> <andrei.gherzan@windriver.com> wrote:
> > Signed-off-by: Andrei Gherzan <andrei.gherzan@windriver.com>
> > ---
> >  .../xorg-lib/pixman_0.27.2.bbappend                |    1 -
> >  .../xorg-lib/pixman_0.28.0.bbappend                |    1 +
> >  2 files changed, 1 insertion(+), 1 deletion(-)
> >  delete mode 100644
> meta-oe/recipes-graphics/xorg-lib/pixman_0.27.2.bbappend
> >  create mode 100644
> meta-oe/recipes-graphics/xorg-lib/pixman_0.28.0.bbappend
> >
> > diff --git a/meta-oe/recipes-graphics/xorg-lib/pixman_0.27.2.bbappend
> b/meta-oe/recipes-graphics/xorg-lib/pixman_0.27.2.bbappend
> > deleted file mode 100644
> > index d9f1c29..0000000
> > --- a/meta-oe/recipes-graphics/xorg-lib/pixman_0.27.2.bbappend
> > +++ /dev/null
> > @@ -1 +0,0 @@
> > -PRINC := "${@int(PRINC) + 1}"
> > diff --git a/meta-oe/recipes-graphics/xorg-lib/pixman_0.28.0.bbappend
> b/meta-oe/recipes-graphics/xorg-lib/pixman_0.28.0.bbappend
> > new file mode 100644
> > index 0000000..d9f1c29
> > --- /dev/null
> > +++ b/meta-oe/recipes-graphics/xorg-lib/pixman_0.28.0.bbappend
> > @@ -0,0 +1 @@
> > +PRINC := "${@int(PRINC) + 1}"
> > --
> > 1.7.9.5
>
> http://patchwork.openembedded.org/patch/40949/
>
>
>
Searched for a patch and nothing was uploaded at that time.
Makes sense to remove the bbappend so yours win.

ag

