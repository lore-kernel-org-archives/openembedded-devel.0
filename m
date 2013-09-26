Return-Path: <ross.burton@intel.com>
Received: from mail-ve0-f173.google.com (mail-ve0-f173.google.com
	[209.85.128.173])
	by mail.openembedded.org (Postfix) with ESMTP id 250EB61105
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Sep 2013 09:58:57 +0000 (UTC)
Received: by mail-ve0-f173.google.com with SMTP id cz12so687362veb.32
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Sep 2013 02:58:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=5XlDDc2siqp3jPxrzQbZtlcpi48G8IIVfVYo2/3d4Ss=;
	b=Pym+u1m1x/02vHlcL5pifQd/QXitRekbmzRLIh59OY3+yrEjWdmCOCZTX7emJEXxNR
	F4UEQ7WtDaBq4/0oNlcXZF71oB/q1zNliCOw1x/alTBHUtOLrh8TlkEI2fJJLQkZ0pDu
	p+smOHjOxX4VmW20Ca01S053y4C1awwjYDcdJBFM577feVniXyr+lLvq+tsH+yCQG8hp
	r56LUgnTtv5P6JY1HgXVvCXSfz3liLSE2agPM3jyQWlPgJ/O55PLqAhbQyHNd1XMsFS2
	fayobHz9/o+x3PeJl7opwx9n+5vfFLVrPL/jMlqfTcPpyZW59BBCWuNBj2QwbWXIRBaJ
	EWSw==
X-Gm-Message-State: ALoCoQkU6dBqXUwtuz7Xmh4MnrdxtboNUfvJI7EfnJAARlmJSIQ1OOOh2jjvHwgodZX/eWNusi1x
X-Received: by 10.52.111.196 with SMTP id ik4mr37797vdb.58.1380189538540; Thu,
	26 Sep 2013 02:58:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Thu, 26 Sep 2013 02:58:38 -0700 (PDT)
In-Reply-To: <52440392.5080908@communistcode.co.uk>
References: <1380188747-9731-1-git-send-email-schnitzeltony@googlemail.com>
	<52440392.5080908@communistcode.co.uk>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 26 Sep 2013 10:58:38 +0100
Message-ID: <CAJTo0LagmtFYtGFzRGs5yxc8Ua60zFH298SyKwFKYrPH41Drvw@mail.gmail.com>
To: OE-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5] fix do_rootfs for images with dev-pkgs in IMAGE_FEATURES
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
X-List-Received-Date: Thu, 26 Sep 2013 09:58:58 -0000
Content-Type: text/plain; charset=UTF-8

On 26 September 2013 10:51, Jack Mitchell <ml@communistcode.co.uk> wrote:
> I ran into this problem the other day, and after speaking to Ross
> Burton, he suggested that the better way to fix this is with:
>
> RDEPENDS_${PN}-dev = ""
>
> I'm starting to get the feeling that the dev-pkgs feature is also a
> little broken, as it seems as though it doesn't handle cases where
> sub-packages are installed, but the main package is not.

Well, the problem is the default dependency on the main package in the
-dev package, which happens whether or not the main package even
exists.  That's why I prefer removing the dependency instead of
creating empty packages just for the bad dependency.

Ross

