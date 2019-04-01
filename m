Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
	[209.85.128.45])
	by mail.openembedded.org (Postfix) with ESMTP id 817037D1FE
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Apr 2019 23:02:16 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id h18so1268709wml.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Apr 2019 16:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=HWGAAl7WtaTiZd4Vof15KqNwSVInIF3sVCqEASwCX2o=;
	b=grqphSS0rHEOMaJ8yMH1B4MV6iSmofZjWJH8LUkymO5lTe2Va6Afk+wdT0BZBdTfS1
	FOuvl3bNsr967mI2sZW68S+j84tsAEhad/+HuFBrlvppUZLp9lTXzYSmoWTEqVcrns5v
	7sk7g4BzyoReN7sCZ8aBJfM8nWr9QfWIulAXs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=HWGAAl7WtaTiZd4Vof15KqNwSVInIF3sVCqEASwCX2o=;
	b=iVoGCt1rtNwZzJLVbrAVytla65EMNN5ulknmbHTwFeHDBtcGeOmjY8/GJiXEyRsHA+
	/c2bYB40p8IvTwYX32839eLz+44RS5ikIzqih8pQtt5iWMZInHUxjJoSYPImqimFmufV
	OQG9BSnuTwUh1UBhUzExGmvVNVuiXmo7A3pGdOGHTwe772WjI8mT/eLtAtGjEaHwjPDk
	RzVEswVPTIJERdtkTd1IZ7FoVH4vfCuStsI0kqN8bewpGE4/bnD2FNCqmkqT/cYBCt79
	PlkAAC668phPaADPMwzQRLd8pKMZcs7CCXB4WeMyzDSuUyiU3twig/ERqNBYM7gCNXuq
	6Pvg==
X-Gm-Message-State: APjAAAWej0LktkAysJCywOkQDzIXNeRLjOdWgydjHToW/mFWLWpp+dBT
	RkCRB0hGG6Y888gCeqj6WAdMhw==
X-Google-Smtp-Source: APXvYqxS+ipspA/mwgMdKKuasDh4SNIVq41UoSYIuz9zAvMCEL8n48d3ah1X4XrN7P5bIsyblSj0Pg==
X-Received: by 2002:a1c:cf83:: with SMTP id f125mr603293wmg.96.1554159737244; 
	Mon, 01 Apr 2019 16:02:17 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	j11sm13219422wrw.85.2019.04.01.16.02.15
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 01 Apr 2019 16:02:16 -0700 (PDT)
Message-ID: <b08083fc2f63f6324a652706f8343a0b8defe209.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: akuster808 <akuster808@gmail.com>, Patches and discussions about the
	oe-core layer <openembedded-core@lists.openembedded.org>, OpenEmbedded
	Devel List <openembedded-devel@lists.openembedded.org>,
	"yocto@yoctoproject.org" <yocto@yoctoproject.org>
Date: Tue, 02 Apr 2019 00:02:15 +0100
In-Reply-To: <854544cb-aab1-1a9d-9e98-0f39663ca621@gmail.com>
References: <854544cb-aab1-1a9d-9e98-0f39663ca621@gmail.com>
User-Agent: Evolution 3.32.0-1 
MIME-Version: 1.0
Subject: Re: [OE-core] Git commit process question.
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
X-List-Received-Date: Mon, 01 Apr 2019 23:02:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2019-04-01 at 15:33 -0700, akuster808 wrote:
> Hello,
> 
> I have noticed a large number of git commits with no header
> information being accepted.

Can you be more specific about what "no header information" means? You
mean a shortlog and no full log message?

Cheers,

Richard


