Received: from mail-la0-f41.google.com ([209.85.215.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1UOAu6-00056A-Fz
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Apr 2013 19:58:22 +0200
Received: by mail-la0-f41.google.com with SMTP id fo12so3714835lab.28
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Apr 2013 10:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	bh=sBsFqY8e64G80ydDgaYupngSrO2hQCtQyzyzmvgdDKE=;
	b=XtKg5wEYnFqTU3bVVUApdgYlMmMYsVgufLFhMox7olMckLjdjI6/zOkxOThp4oruUD
	ihxC+rHKRCVXGw5ZWgOFSJEtFlh/5nQ+NU7e46MHyndxNi3zKjsOQVxWYr/F+OTBz4pw
	IanQ0lXa4umrYeUFFwfLxKn6dIvNv6lklJWYTvBlHyxcdCn7sZMWOMLVNL+Qs7j6ib6l
	3W7WxsRZnw/FoUyDm+nqH0RyfxUjekifb3iY3ddmzyQS+r3HFVoc7GQXL2nG+748SjNG
	aKyXBw5C+ytS4R1d7aOL5KLGvrbLUjMLOHpK/aUYBaDd0TXnhL6o+QGFAxp/kE4fMwMQ
	BoCw==
X-Received: by 10.152.104.80 with SMTP id gc16mr6639581lab.49.1365183667693;
	Fri, 05 Apr 2013 10:41:07 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.125.38 with HTTP; Fri, 5 Apr 2013 10:40:47 -0700 (PDT)
In-Reply-To: <CAJTo0LaT0TRzCoVqq+-DLpGdcLzjr75Vu7_MivkHov3mUNxq9w@mail.gmail.com>
References: <1363859339-12187-1-git-send-email-ross.burton@intel.com>
	<20130321140745.4a0683c8@e6520eb>
	<CABcZANkitD_S70HFXiM+xnC73avzC-2LDjRTcezwVMe1VcW+ow@mail.gmail.com>
	<CAJTo0LaT0TRzCoVqq+-DLpGdcLzjr75Vu7_MivkHov3mUNxq9w@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Fri, 5 Apr 2013 10:40:47 -0700
X-Google-Sender-Auth: kjrVfpWuSzTtNlPGzJhn12DQb_k
Message-ID: <CABcZANke4aYfcuuPsQRZMg5Gp5aGwbEqyyQvs_0BSqJHf2H5Dw@mail.gmail.com>
To: Openembedded Discussion <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH][for-danny] guile: remove from meta-oe, there is newer version in oe-core
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
X-List-Received-Date: Fri, 05 Apr 2013 17:58:22 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Apr 5, 2013 at 10:13 AM, Burton, Ross <ross.burton@intel.com> wrote:

> On 5 April 2013 18:02, Chris Larson <clarson@kergoth.com> wrote:
> > bit confused about why this went in. danny is a stable branch, and
> > this is clearly not a bugfix. Did the existence of this recipe actually
> > cause a problem? This just caused a temporary build break for us due to
> > bbappending to a removed recipe. What exactly is the policy for meta-oe's
> > danny branch, if it's not "bugfixes only"?
>
> Yes, it was causing problems, as the guile-native 1.7 was preferred
> over guile 2.0.6's ability to build natively, which meant
> oe-core+meta-oe was unable to build grub.


Fair enough, but in the future please mention this sort of reasoning in the
commit messages, or at the very least the patch series emails. Knowing
*what* a commit does without *why* is much less useful.
-- 
Christopher Larson

