Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id 81FC660043
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Aug 2015 12:46:10 +0000 (UTC)
Received: by wicne3 with SMTP id ne3so73807529wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Aug 2015 05:46:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:content-type;
	bh=U4uSF/4Y8uCk6WAtkhU7C55qSluL0Tu2DCQEWPvr0BI=;
	b=D6S7X4w+CA+3uECn6P0ZiYlbI+QP9iuEYbR0l3x7uZ3J6Bef6KYS9hMLfNAReWFWXT
	TPpVDlOWZBw4WjE0B1fDcwdGOdAh1C8nQv0Os2chTVTOKHgwe067wU59c5Ps0v2AmdM0
	O1PdBVHcvXb3PccAFU3kiPZd72Q0MAp2mGQMIHoZ33yydgvwxNDb7kZgZ9JNo4gdeoKe
	WH+jv6rrv7s4++QMFfoZwdnyciHD2ZfxZt2m4tBF1kuo0PdGqHUtGVhWb+yFhG/kuFwk
	+nBsOB1r1lG1hRVjHrSOz0CLI8pGT92U+yFdcDUGvxTU6Y44seVPtP9XhJkb/KPTJ1X2
	EdUA==
X-Gm-Message-State: ALoCoQm8y4EpJiHEA93Tu5wXDktTF8uRe3oA2CXUtllVjPGXAZRCDQMLQOHwHH22x5UTCD/9avte
X-Received: by 10.180.80.200 with SMTP id t8mr18579140wix.18.1440679570677;
	Thu, 27 Aug 2015 05:46:10 -0700 (PDT)
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com.
	[209.85.212.181])
	by smtp.gmail.com with ESMTPSA id fn8sm3488205wib.2.2015.08.27.05.46.09
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Aug 2015 05:46:09 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by wicne3 with SMTP id ne3so73807110wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Aug 2015 05:46:09 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.194.120.198 with SMTP id le6mr4689012wjb.133.1440679569778; 
	Thu, 27 Aug 2015 05:46:09 -0700 (PDT)
Received: by 10.28.135.72 with HTTP; Thu, 27 Aug 2015 05:46:09 -0700 (PDT)
In-Reply-To: <1440633769-19691-1-git-send-email-raj.khem@gmail.com>
References: <1440633769-19691-1-git-send-email-raj.khem@gmail.com>
Date: Thu, 27 Aug 2015 09:46:09 -0300
Message-ID: <CAP9ODKoUaLm8yUiS1idtr+Neyth_oBufdME1XSJGdR2S7XbdzA@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH] layer.conf: define LAYERDEPENDS
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
X-List-Received-Date: Thu, 27 Aug 2015 12:46:11 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Aug 26, 2015 at 9:02 PM, Khem Raj <raj.khem@gmail.com> wrote:
> qtwebkit needs ruby-native which comes from meta-ruby
> this patch adds initial set of layer dependencies there may be more
> that can be added but its a start
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

This is only when someone uses QtWebkit; a lot of people does not use
it so it is not a real dependency.

We could make it dependent on the collection availability?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

