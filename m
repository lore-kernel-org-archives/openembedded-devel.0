Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f176.google.com (mail-io0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id 9A43E77142
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Feb 2016 05:44:00 +0000 (UTC)
Received: by mail-io0-f176.google.com with SMTP id d63so43923011ioj.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 02 Feb 2016 21:44:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=UGhVOMS7s3jsQp41crbnzs8Lp6/3f9XYS9+0hpuAynM=;
	b=L9LM7pODxYUxrUo1J7hQu/GML3+hSoiq3eGnLZi2gxhlvpZGhwtFQ7E2qEhwvoREIT
	BLz79/zbcGB60ofR33qAihKfBrcm26IoF+aVJpxrwmpaBHJ1nwdkHgd4HTSnDWQN5FJk
	xFQ1NgL9VBPRaZpzb3MRPgJIelk/UVedFO3009TsjOQ50WXbCVF1V3UqI5vaEhhPc8Xi
	8I6ZkWr9d9Skx4W/R/rN/vB9opkysP2Zs7d6qFawYfztYWQ75eZxDN6qEYumCz3vVP79
	1fFSAjYlliUWXjOIUQcSfDwbJAQG2KZVGKbugXHFMS4bXcgXwFcKqXyw0zhgYSaa11FO
	/rEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=UGhVOMS7s3jsQp41crbnzs8Lp6/3f9XYS9+0hpuAynM=;
	b=VfBr/5MuJvaMlqEuCd5qbq06Xd/FoAdZ9JPXz54VaXH1LwBM4a9eFPXa6FpBtci3iq
	0N+aoh0gP+0qLJdth7MskkNGBsd0AQFcOmb5LuWQU20AoCqU31Dl7hueQfkADNemuF33
	qpUPwGdFSYhT0/HNfO5KIqWKBLsSJF+LeFFCb3fN7mGOG/ytGopuvypJr4FQxpy5pUcO
	5EAgvOIA2AjM6Omdlqjv+3HzhpmeKmSwLppshFDVdKWOyyzqjvjdVU59ltkA1bSGGpI1
	8YyrRdroftaQ4Uu40LfktH2Y3eyYFI8uJoYueqXylfDwMle5KAInOjunDM76woBpzCDi
	kpfA==
X-Gm-Message-State: AG10YOQrMSbS+LVypL3qVele7lT8WicIW4GnrUygI8C0SHNBR9fkzWGbb0E287nAu+9rWyvO2taC5+6fBG0t1w==
X-Received: by 10.107.34.79 with SMTP id i76mr1867136ioi.195.1454478240936;
	Tue, 02 Feb 2016 21:44:00 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.46.219 with HTTP; Tue, 2 Feb 2016 21:43:31 -0800 (PST)
In-Reply-To: <1454465517-24926-1-git-send-email-alejandro.joya.cruz@intel.com>
References: <1454465517-24926-1-git-send-email-alejandro.joya.cruz@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 2 Feb 2016 21:43:31 -0800
Message-ID: <CAMKF1spJ+xeuV_iiyswkfWSkFiQ84t0qBDQsesrGBCyWiO5yHQ@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] toybox: upgrade to 0.7.0
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
X-List-Received-Date: Wed, 03 Feb 2016 05:44:00 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Feb 2, 2016 at 6:11 PM, Alejandro Joya
<alejandro.joya.cruz@intel.com> wrote:
> +CFLAGS_prepend = "-I ${STAGING_DIR_HOST}${includedir_native}"

why is a native include dir needed here ?

