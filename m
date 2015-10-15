Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-io0-f170.google.com (mail-io0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id 9D206770E7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Oct 2015 13:29:56 +0000 (UTC)
Received: by iow1 with SMTP id 1so89985460iow.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Oct 2015 06:29:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=K1XKGxkJfnK+U8fLJduxLkYmh+CWS6I6XCnlWKgktws=;
	b=DQVqZBmVVcWIOCm0nxtPc9P7v6A0KxXHvLKvN4biw075Dh1f4Gj5GM0j2KOKra4naF
	i35PlzWlc4MoJEoXbNJnjy7U9WTNabo2Ylgg9S44bdgJUIoQpP8e1s4rmt3BkYYSfNfi
	T2M6KTyRxSJ0WwxETLv4tfyKYKq2/NLPA2PJnembInrvqdswYnN6NK8sgXMqi65kWAgh
	BUABqRRAE0ZsxEdHUnKcswVLRtmto8wAR/CMxMw2VZE/vidKEmnfhvYfF3z9CsPzdHzW
	mFOLMshF/0Nq2zJwjk8zpdaBvtDpYlwJWZgklOSoG7cVnZy8jl1DUiyEh7M6p8zRHTmF
	g8PA==
X-Gm-Message-State: ALoCoQnT5HUie6VKl2FVKApWxlLYPQ34TN/J/561Oj0tuDiqWJtDbYeU/c0qPBkZlaHk5Op8MFhx
X-Received: by 10.107.33.17 with SMTP id h17mr9512524ioh.108.1444915796896;
	Thu, 15 Oct 2015 06:29:56 -0700 (PDT)
Received: from mail-io0-f176.google.com (mail-io0-f176.google.com.
	[209.85.223.176])
	by smtp.gmail.com with ESMTPSA id yq9sm5627498igb.6.2015.10.15.06.29.55
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 15 Oct 2015 06:29:55 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by iofl186 with SMTP id l186so89656190iof.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Oct 2015 06:29:55 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.107.131.147 with SMTP id n19mr9997948ioi.192.1444915795134; 
	Thu, 15 Oct 2015 06:29:55 -0700 (PDT)
Received: by 10.36.218.7 with HTTP; Thu, 15 Oct 2015 06:29:55 -0700 (PDT)
In-Reply-To: <5FCE9374-DB04-488F-B863-A2CA6B6629B5@gmail.com>
References: <5FCE9374-DB04-488F-B863-A2CA6B6629B5@gmail.com>
Date: Thu, 15 Oct 2015 10:29:55 -0300
Message-ID: <CAP9ODKr5N8SqRD42z4KU_51cpd3STEXcwTPT+Ai5sDb=gSSJVQ@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [meta-java][PATCH 6/6] openjdk-8: fix build error with gcc5
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
X-List-Received-Date: Thu, 15 Oct 2015 13:29:58 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Oct 15, 2015 at 8:55 AM, Jens Rehsack <rehsack@gmail.com> wrote:
>
> Applying a fix from openjdk-9 repository which fixes build issues using gcc5
>
> Signed-off-by: Jens Rehsack <sno@netbsd.org>

Please squash this onto the previous commit. It is good to cite the
patch backport but there is no need to be another commit.

Please also add Upstream-Status field for every patch included in the recipe.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

