Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1Oqole-0002kS-4P
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Sep 2010 16:59:02 +0200
Received: by ewy7 with SMTP id 7so4401844ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Sep 2010 07:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=h4kELIbfLpqS+PkHUicYIX+3TuHcMw5SKkdYfkw/bO8=;
	b=PgaIMZ06X9A8wDDZtVKhgUN9rwhEpqA9ZD2SRTEWNK4g/HgY7VO1S8JLGGf/ze/0Tv
	1vsPa9jmn3sHTYjKSEi2vQxNsaskiOSB6OIEyTYLFWaePuvYYCU2r56nbbaiezTEGSo1
	DdkNy4driS8jGo4Y0oTNCAon3mCdxMjNHKATM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=CuIetpF8CYjXPk9xkImYUiNduhGaTX/WiMqxU+fw8y9Pywsa4UaXZ3+TgXJN3jXe2l
	Ezpw7W6nycl8KPRmzZhJfYQiORD/MzdHDlubrq1dxJAU5E279CpXLm5IGrhlFni8gvl8
	nEhBnb2Loyg9MyogAaBxKd0dkIxsWr67m2KAs=
Received: by 10.216.237.100 with SMTP id x78mr7882358weq.114.1283353073228;
	Wed, 01 Sep 2010 07:57:53 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.237.167 with HTTP; Wed, 1 Sep 2010 07:57:33 -0700 (PDT)
In-Reply-To: <1283352730-17975-1-git-send-email-clarson@kergoth.com>
References: <1283352730-17975-1-git-send-email-clarson@kergoth.com>
From: Chris Larson <clarson@kergoth.com>
Date: Wed, 1 Sep 2010 07:57:33 -0700
X-Google-Sender-Auth: StSlmPQBNrtC363Bx0gQQSUlBPY
Message-ID: <AANLkTi=U6qLKy-Oxk_05YF4p+9BJxx0d5=O3cRr4OiZQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.215.47
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH] do_unpack, do_patch: shift some responsibility around, clean things up
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
X-List-Received-Date: Wed, 01 Sep 2010 14:59:02 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Sep 1, 2010 at 7:52 AM, Chris Larson <clarson@kergoth.com> wrote:

> - Move unpack functions from classes into oe.patch


Why do I never notice the typos until after sending it to the list?  This
should be oe.unpack, of course.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

