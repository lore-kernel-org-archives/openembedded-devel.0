Return-Path: <trevor.woerner@linaro.org>
Received: from mail-ee0-f42.google.com (mail-ee0-f42.google.com [74.125.83.42])
	by mail.openembedded.org (Postfix) with ESMTP id 4EB506CE72
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Oct 2013 15:47:57 +0000 (UTC)
Received: by mail-ee0-f42.google.com with SMTP id b45so4173871eek.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Oct 2013 08:47:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=p3hbeNHDqIUdm7/wzYJZapEMUHRFwampMgZEPorkf0o=;
	b=bClypoX/WY0OvWjVOIdVZE/nxa9im2SygKraVbQDH99rj6fTfWxusDcrBK0XTTAMEL
	nIVUk78tfAujpjU6AgVqN+mK9Ng1vKGSgYtXuSa88YuSv+iNQGvhWHiGhQr4A+N9r7eI
	d9arWtlaAR+BHXRJ0FRE1RR9pdgkiI0iKP28M1xXyk9EeCXoWCt/DgPqP966j7cgCYBB
	Aj2pQFpA12cVPS6gDIa6RAKQT2Mo4ZhnVdqVdLGnvgIpZfNhGYIK22+8qz3/L+MSzHdL
	jb5QnTYtLULGH32wggcT2hRDcJIYMIhkSfsmhryz8BTTDxdlnINx5IoS3Dv8zbs7nkCO
	cWBw==
X-Gm-Message-State: ALoCoQlGX5K0qRhW0cAdOCgeQkf9mVQ/zhzr1DSzGg4VmSFcdLEm5yVH4Yvc0tcjN4Owm2kVP2RF
MIME-Version: 1.0
X-Received: by 10.14.109.66 with SMTP id r42mr3357438eeg.43.1381247278241;
	Tue, 08 Oct 2013 08:47:58 -0700 (PDT)
Received: by 10.14.117.67 with HTTP; Tue, 8 Oct 2013 08:47:58 -0700 (PDT)
In-Reply-To: <20131008133918.GB2872@jama>
References: <20131007194922.GE18775@denix.org> <20131007201536.GU6240@jama>
	<20131007202336.GF18775@denix.org>
	<CAOMwXhMpx8KjDyq_4fD949owFWE8r1O61E7D085+U31=fR5kNg@mail.gmail.com>
	<20131007203527.GG18775@denix.org>
	<CAOMwXhORbuT7J8B6evLhcJSx2Z8BUCoAeXKGDe=twQsuY-wtOQ@mail.gmail.com>
	<20131008132109.GA22340@denix.org>
	<CAOMwXhN4C=Lob8ow9utU6hnqDOUjpt=PGj+Rp6W-pbnY5uky1g@mail.gmail.com>
	<20131008132609.GB22340@denix.org>
	<CAOMwXhP_EobkzYT91BQGLjqWWOtsvTwzYSPk9MJHsMRm1q7otQ@mail.gmail.com>
	<20131008133918.GB2872@jama>
Date: Tue, 8 Oct 2013 11:47:58 -0400
Message-ID: <CALmOhgmaCJQkmrZuSHjBV4EY8rtNr_-gCBGo6SnX9wP7py5VDg@mail.gmail.com>
From: Trevor Woerner <trevor.woerner@linaro.org>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-qt5] Update to 5.1.1?
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
X-List-Received-Date: Tue, 08 Oct 2013 15:47:58 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 8 October 2013 09:39, Martin Jansa <martin.jansa@gmail.com> wrote:
> So the same branch names are the only supported combination, if you want
> to use meta-qt5/master with oe-core/dylan then you're on your own. It
> works now, but only because we're lucky.

I have been experimenting with using meta-qt5's master with oe-core's
dylan and have noticed the following:

1) master now has a nice PACKAGECONFIG, so if you were setting/using
any configuration settings you'll need to update your .bbappend (or
whatever) to use the new facility

2) if all you want is qtbase then this doesn't apply; but if you want
other qt components you'll need to explicitly enable ICU in qtbase
(this wasn't required in dylan)

3) if you want to enable support for DirectFB you'll find that the
version of DirectFB in oe-core's dylan branch isn't high enough

But other than that, yes it works.

