Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1Oh1EF-0003N0-KA
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 Aug 2010 16:15:28 +0200
Received: by wwi17 with SMTP id 17so158068wwi.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Aug 2010 07:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=D7731O1hMQG4mEY1VaGeNzQk0xwpCr+nVELGoQzB3y8=;
	b=HF1BOj1X9WMv2T9wPZxGT2StJVsmtE+K5c3AAAbW+gkwYHZpEIiUJderXmYyT+P+aM
	XheaiChu8s1hUCTNHaWJOjd6n8PwWJXZQCWx1rXWNN6xOqSdjeGupnWpRNxkF0cJL1XI
	GLYCEsUK+uJECZjNETAFjIbyE8dlFByKzoQLQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=r0TDK2mBwGxKS5G36pMlIPyKSlGvq1CEzKu1vok1pq3QeplfZUAXhf/T2l9xS0dkv+
	V+rpNvcawXBI+fUI8UJI8bKefMh+UYF1Up/up1x7Ze94so8ZlA8IYEuw8LnQriNO615z
	BXAEpkrdEe1n4sMQxBopiEkrnqJwB/K4evx68=
Received: by 10.216.236.42 with SMTP id v42mr3523281weq.10.1281017715262; Thu, 
	05 Aug 2010 07:15:15 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.16.204 with HTTP; Thu, 5 Aug 2010 07:14:55 -0700 (PDT)
In-Reply-To: <20100805072047.GD29578@jama>
References: <4C5A5AD6.9090409@gmail.com> <20100805072047.GD29578@jama>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 5 Aug 2010 07:14:55 -0700
X-Google-Sender-Auth: yndSw7R7E-cQXvlew7OvSlCpOU4
Message-ID: <AANLkTikeoKbRiV9onw5_Q4A8AO5pUCup=68xPq2ecyiu@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH] package_ipk.bbclass: add lists_dir to sysroots' /etc/opkg.conf
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
X-List-Received-Date: Thu, 05 Aug 2010 14:15:28 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Aug 5, 2010 at 12:20 AM, Martin Jansa <martin.jansa@gmail.com>wrote:

> On Thu, Aug 05, 2010 at 04:01:50PM +0930, Graham Gower wrote:
> > This makes the sysroots' /etc/opkg.conf agree with opkg-collateral on
> where
> > the package lists database should be found. Fixes a problem whereby opkg
> > cannot find the package lists after opkg-collateral is installed.
> >
> > This fixes the same problem as acc720fa80227d08fd15764117e0c34e2387e804.
> > But since that doesn't take into account other dependencies bringing
> > opkg-collateral into the image, it doesn't solve the problem in all
> > cases and could probably be reverted.
>
> Agreed about revert, because for ONLINE_PACKAGE_MANAGEMENT == "none" it
> calls "opkg-cl ${IPKG_ARGS} install " without package name and image
> creation fails.
>

Thanks, Graham, I appreciate your looking into this.  Your commit for this
should definitely go in.  I expected my commit was a workaround at best :)
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

