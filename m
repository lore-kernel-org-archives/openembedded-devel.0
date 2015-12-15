Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pf0-f179.google.com (mail-pf0-f179.google.com
	[209.85.192.179])
	by mail.openembedded.org (Postfix) with ESMTP id 17FF06FF56
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Dec 2015 16:26:56 +0000 (UTC)
Received: by mail-pf0-f179.google.com with SMTP id o64so7249315pfb.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Dec 2015 08:26:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc:content-type;
	bh=gSMsfUnUIjMx1LPTkU1KTOxJ7D2U6lwDXX7p8uvynbU=;
	b=stVmx4Mktox5xm+FuRPmRmGCbqHCWwuHL+g8jzG85yuxhJXwBFe1ALsYNVBd/whfar
	1iMvjr6YORLp9FBehrHp2B72J6Z7yp1wgE+YNnIVt9/jPjPRNojXMvMr16jqoLaX7WAD
	ymjKNv8WKD+L8G/SbvLRn8VEQi1T+4WEZAfSgtUe1x0XGuDJTuJcO1gSTBLbzUC+uUwb
	shBXdB6Igqg1wIkuWoWyMIojr7WCH4eolyrH78ESZHF8739e2S/zcxXGeoTtBPjyb5WR
	/eMSRayE/NGu9wVeVSdC/gWPShe+7VtLmiN7rwnDLRpfS/00TyLviJ5MGsaCyAZ+x26G
	leOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=gSMsfUnUIjMx1LPTkU1KTOxJ7D2U6lwDXX7p8uvynbU=;
	b=GNHonMYJPXHPshFftFZq7GKn2QMYbg+4xanqPPzUfCDndHp+YRVuokG27E76WVdNwA
	4uuyWFRkPzRECC2HVN6XJMNCDnTlQvw+AfNPpMIk+rcYj9QjkPIV589Q2/0Q7I7n0+eU
	+7A1ecgD+k5QBBZxDXyggfCulmVX9Lce5VNZkve3RnaG8NgkaED1Y1IbaNjtMQDwfVu5
	9+PrOP+5rrcttCjRSyIc1vf9oDJ4TQ5Fg1AWM4eJZF0+2d+BPcGI01urPscCOIMlfKYA
	5i+VQtOn6yThgqpDqUGSH9ccbvO7+It/o9tfNMeWI9o3FGTn+rKJ4UDAN6J03PEK8fqP
	kf7A==
X-Gm-Message-State: ALoCoQnW+KQfkcVMwhMbGhZbX8eZ3MNqsxqZnx7D5dAEtmRjkMprBcQULMM9+LMZcf8OS7kslftRmr+kUZ7PwrHMXhrPjWTT2g==
X-Received: by 10.98.15.67 with SMTP id x64mr46414423pfi.67.1450196816927;
	Tue, 15 Dec 2015 08:26:56 -0800 (PST)
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com.
	[209.85.220.48]) by smtp.gmail.com with ESMTPSA id
	q70sm3331817pfa.12.2015.12.15.08.26.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 15 Dec 2015 08:26:55 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-pa0-f48.google.com with SMTP id ur14so7255833pab.0;
	Tue, 15 Dec 2015 08:26:54 -0800 (PST)
MIME-Version: 1.0
X-Received: by 10.66.221.228 with SMTP id qh4mr14402934pac.68.1450196814612;
	Tue, 15 Dec 2015 08:26:54 -0800 (PST)
Received: by 10.66.72.229 with HTTP; Tue, 15 Dec 2015 08:26:54 -0800 (PST)
In-Reply-To: <567039E1.5000205@linux.intel.com>
References: <567039E1.5000205@linux.intel.com>
Date: Tue, 15 Dec 2015 14:26:54 -0200
X-Gmail-Original-Message-ID: <CAP9ODKrRaak7oo5F+u1-g5LwZE0TBAb3GiZ9WuGiKXqXu90Y9g@mail.gmail.com>
Message-ID: <CAP9ODKrRaak7oo5F+u1-g5LwZE0TBAb3GiZ9WuGiKXqXu90Y9g@mail.gmail.com>
To: Mariano Lopez <mariano.lopez@linux.intel.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [RFC] Mark of upstream CVE patches
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
X-List-Received-Date: Tue, 15 Dec 2015 16:26:57 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Dec 15, 2015 at 2:03 PM, Mariano Lopez
<mariano.lopez@linux.intel.com> wrote:
> There is an initiative to track vulnerable software being built (see bugs
> 8119 and 7515). The idea is to have a testing tool that would check the
> recipe versions against CVEs. In order to accomplish such task there is need
> to reliable mark the patches from upstream that solve CVEs.

I support this initiative and I also second the preference for the tag
in the patch header. It is easy to add, grep for, and simple.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

