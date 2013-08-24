Return-Path: <trevor.woerner@linaro.org>
Received: from mail-ee0-f48.google.com (mail-ee0-f48.google.com [74.125.83.48])
	by mail.openembedded.org (Postfix) with ESMTP id 144CF60896
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Aug 2013 01:29:09 +0000 (UTC)
Received: by mail-ee0-f48.google.com with SMTP id l10so568424eei.21
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Aug 2013 18:29:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=aDV47MZ2lI/N3MuAx2L1KzX44Z1ccc399FsrAMadfFQ=;
	b=FfdXflC1hgVNEdYxJa8A8tRoWHY2Z6EgyWAEJvf5RYZGdFK/hBNrceqwfPD40J4Wf9
	lPDmKcQD090PO/u5FZHhbbGRzCAKJ/PV4XLAnz0H2Kh1hSa8NnK0/Z4uD/3OHJWhDw9N
	K8F1hZYUQL8mxsmwOKaMFbw9Kr0bSIZY9/WZjUvgKVk3sQI05WJ7yn1+TsPlpRjYLBA5
	ALP4NKmCp3TwYHmPJob1JqDfpsDa+lODv5GYAZ/45Mw+4PPuSJmgzpZGp7snlXDSJCNF
	eoEYcT3bFP2AfQId1YUxjh2ApP6IFK7cxxyovJDdnktL4bUAN+vHbsRzW1b2ouB0K93P
	FmRw==
X-Gm-Message-State: ALoCoQmkyYGJdTOjJdvZNBR8DCsT0qX7k+Qvjx5lXb8xR4XNMQKINtzyRSwTRd/kWWkjhyBAJW38
MIME-Version: 1.0
X-Received: by 10.14.115.133 with SMTP id e5mr3367401eeh.27.1377307749381;
	Fri, 23 Aug 2013 18:29:09 -0700 (PDT)
Received: by 10.14.117.67 with HTTP; Fri, 23 Aug 2013 18:29:09 -0700 (PDT)
In-Reply-To: <CALmOhgkdXWZ8rtY5-TgPEMMdmoBD74L9s0RDP-vv07PAU+1c0A@mail.gmail.com>
References: <CALmOhgkdXWZ8rtY5-TgPEMMdmoBD74L9s0RDP-vv07PAU+1c0A@mail.gmail.com>
Date: Fri, 23 Aug 2013 21:29:09 -0400
Message-ID: <CALmOhgnuBkNyJJFxrRCrZeLCnM8NUUMde6uRdv7froP5Gi0Gng@mail.gmail.com>
From: Trevor Woerner <trevor.woerner@linaro.org>
To: openembedded-devel@lists.openembedded.org
Subject: Re: building and running a qt5 application
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
X-List-Received-Date: Sat, 24 Aug 2013 01:29:11 -0000
Content-Type: text/plain; charset=ISO-8859-1

After finding the answers to these questions I'll update this email in
case others come asking the same questions.

On 16 August 2013 00:13, Trevor Woerner <trevor.woerner@linaro.org> wrote:
> If the build system knows it's going to be putting the qt5 header
> files in $sysroot/usr/include/qt5/etc, why not simply use that instead
> of requiring the users to update the include paths themselves in all
> their recipes?

This is so that qt4 and qt5 applications can co-exist in the same
image. My assumption had been that if you were using qt4 then
everything would need to be qt4 and if you were using qt5 everything
would need to be qt5. Apparently this is not so. Apparently qt4 and
qt5 applications can mingle. To support this mingling the qt5 headers
are placed in their own qt5 subdirectory.

If, as occurred in my case, you're only using qt5 then you can use the
line I provided above in your recipe to make the qt5 includes the
default:

    OE_QMAKE_PATH_HEADERS = "${OE_QMAKE_PATH_QT_HEADERS}"

> Secondly, I added both "qtbase" and my package to IMAGE_INSTALL, added
> the "meta-qt5" layer to "bblayers.conf", specified "QT5_VERSION" as
> "5.0.2", and then built. When I tried to run my application I received:
>
>     Failed to load platform plugin "xcb". Available platforms are:
>
>     Aborted

To fix this I needed to add "qtbase-plugins" to my image in addition
to what I had done above.

