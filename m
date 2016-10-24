Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ua0-f196.google.com (mail-ua0-f196.google.com
	[209.85.217.196])
	by mail.openembedded.org (Postfix) with ESMTP id 7DFD8719AC
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Oct 2016 10:36:37 +0000 (UTC)
Received: by mail-ua0-f196.google.com with SMTP id m11so1160255uab.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Oct 2016 03:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=vLc0VNC8agHCKihIyoTfmV+ZIRowRnKudmpxDHEVjXk=;
	b=CAbX0sYk9JWF/4j8SlQSGScBxlF+yQG22XIRS4LsX6zQR6MiupUKp/FPrAd95i89aA
	7SbjnTLv7MDFcvudzGXPxg/frEfqOxsYTkLZHhXEMnPWIiZg93y61acxYtD5tJEBLuba
	mxLZpsbFq+nStGb7Ep5pIn+t9IgJHGuUI6RrmdYeFYO+NXnH4QDa+gotYePOrFWozcyR
	DekVUVskJGf5tnx8DPlGedymN5+a5Li43RYQwC/OCeuKmK/QB7zcmQPJynt5r3K2gzBB
	fXV6PksNUu5UxVgAGXpLrO+mg3GNXxKXYqmNHKBLhgymdazmu/ThJ/PS+TBPVIkWNCz1
	iEWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=vLc0VNC8agHCKihIyoTfmV+ZIRowRnKudmpxDHEVjXk=;
	b=IrfBYW6+EVXxohuUxg6EXfwlZC+ilICG5mj3enTdK/CQm6GiMdy0EG92zMNMxARIRR
	obXYsBsgskDdtvl5lsbL2xiVSuoJf+Ti+EI2KnaF+r7dGQgEldQpgYRHAXjn/Oduyh4h
	Sw7uhABH6KPdGOZJXjZIP0uJdicoaBqVsJEjMGL/EgNO7v9g2C5PRlaBj2z+jUweWY6B
	oQqHlhfNzp5gvHi1j7xG3OBMDUmFUVdPgFkZBEawmJ97TKVPjdVlf9NFd5FEcJCcac+o
	o7/+E8Htl9ZEEFjBv3FymeE/I+nyXx+FVCN9EeZa5uXCwNZDh0ZOrwOmc3hq4sZqiEAh
	yi8Q==
X-Gm-Message-State: ABUngveTapruScnrKaie+d0+c7pW+bU+zJzADXqoqEQopO6EDfKUhTQwRTWvQVo80E09Hg==
X-Received: by 10.176.69.195 with SMTP id u61mr6515070uau.106.1477305398180;
	Mon, 24 Oct 2016 03:36:38 -0700 (PDT)
Received: from mail-vk0-f49.google.com (mail-vk0-f49.google.com.
	[209.85.213.49])
	by smtp.gmail.com with ESMTPSA id b5sm3504202uab.15.2016.10.24.03.36.36
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 24 Oct 2016 03:36:37 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-vk0-f49.google.com with SMTP id 2so167196329vkb.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Oct 2016 03:36:36 -0700 (PDT)
X-Received: by 10.31.108.70 with SMTP id h67mr8218338vkc.163.1477305396546;
	Mon, 24 Oct 2016 03:36:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.49.82 with HTTP; Mon, 24 Oct 2016 03:36:35 -0700 (PDT)
In-Reply-To: <CAP9ODKoOwCfNrC9tWD+1phO0Sw=hr_OYRFVNXmjM2pH1vYV60g@mail.gmail.com>
References: <20161020164624.12103-1-otavio@ossystems.com.br>
	<CAP9ODKpCA6tuXf7Kv=RA5kabS85ju50zt8zaCrzu0kXm6CnvNw@mail.gmail.com>
	<9d63d09b-a249-6a77-197a-15f84f2bce44@qt.io>
	<CAP9ODKoOwCfNrC9tWD+1phO0Sw=hr_OYRFVNXmjM2pH1vYV60g@mail.gmail.com>
Date: Mon, 24 Oct 2016 08:36:35 -0200
X-Gmail-Original-Message-ID: <CAP9ODKp=dp6NhBN4PEPAjKw04G==BBO4MN+WCCy3BvxZ-NW5AA@mail.gmail.com>
Message-ID: <CAP9ODKp=dp6NhBN4PEPAjKw04G==BBO4MN+WCCy3BvxZ-NW5AA@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>,
	Samuli Piippo <samuli.piippo@theqtcompany.com>
Subject: Re: [meta-qt5 PATCH] qmake5_paths.bbclass: Fix fonts installation path
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 24 Oct 2016 10:36:37 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Oct 21, 2016 at 9:58 AM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> On Fri, Oct 21, 2016 at 4:47 AM, Samuli Piippo <samuli.piippo@qt.io> wrote:
>> That looks like the correct path to use, but how does this fix the problem?
>> OE_QMAKE_PATH_QT_FONTS doesn't seem to used anywhere in meta-qt5 any more
>> and probably should have been removed together with the font packaging bits.
>
> It did not fix it, indeed. We had a left over from a test so it hided
> the issue. We are checking it now.

This change ought to be ignored; the Qt QPA has a hardcoded path which
can be overridden using an environment var and this seems to be the
standard practice for people not using fontconfig support.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

