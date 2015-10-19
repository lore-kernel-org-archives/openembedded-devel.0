Return-Path: <anders@chargestorm.se>
Received: from mail-lb0-f174.google.com (mail-lb0-f174.google.com
	[209.85.217.174])
	by mail.openembedded.org (Postfix) with ESMTP id 444FF77070
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Oct 2015 06:20:07 +0000 (UTC)
Received: by lbbwb3 with SMTP id wb3so72279453lbb.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Oct 2015 23:20:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:subject:message-id:mail-followup-to
	:references:mime-version:content-type:content-disposition
	:in-reply-to:organization:user-agent;
	bh=A35oXkHNY45BL8xegRbVEB4zT71z5en3y82kIasfqPM=;
	b=TGpCQT9o8J4XZDKCCvVpSBX5b2ztQCVgR14ZYwzG2/jls4iW05c03v8ZpNgD+IXMQY
	1KfYeLBGYw0/LAibWX/98D9b1L9ypclQmAwL4IcsVPX8U1dF2fMiihYlwG6taovsS8AZ
	3iAiIx9n2yfpOScFrdKzTOmJq3N/3cUskaCbZY39VNGUAJaO5TBM5RejveCW4M+WeS8Z
	0+fVbPKe3xhOlYJX1OpiRU0svNyJiBs2RpMdlyFJB1rFXgiSHVxxTHopI8V2mwQ9gRSB
	BmTJbMoKYO81bxnqQEnq20iyDT+ZIN3FvFFTIuW0D15z3Qzb5JU2+vHA3Y0Rw4BN38ti
	1DfQ==
X-Gm-Message-State: ALoCoQl9q8d64unsrznkdQJrLga+SKZROprY4Bg9AZE/eBeheQwgv98QvlhzF87Ax32qVo5iaKgB
X-Received: by 10.112.132.74 with SMTP id os10mr13608636lbb.40.1445235607423; 
	Sun, 18 Oct 2015 23:20:07 -0700 (PDT)
Received: from ad.chargestorm.se (213-64-219-84-no126.business.telia.com.
	[213.64.219.84]) by smtp.gmail.com with ESMTPSA id
	d82sm5079544lfg.22.2015.10.18.23.20.06
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 18 Oct 2015 23:20:06 -0700 (PDT)
Date: Mon, 19 Oct 2015 08:20:05 +0200
From: Anders Darander <anders@chargestorm.se>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20151019062005.GB16160@ad.chargestorm.se>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <1445235425-19527-1-git-send-email-anders@chargestorm.se>
MIME-Version: 1.0
In-Reply-To: <1445235425-19527-1-git-send-email-anders@chargestorm.se>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [meta-qt5][PATCH v2] qtbase: fix QA warning of host uid leakage
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
X-List-Received-Date: Mon, 19 Oct 2015 06:20:08 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

* Anders Darander <anders@chargestorm.se> [151019 08:17]:

>      fi
> -    cp -a ${B}/lib/libqt* ${D}${libdir}
> +    install -m 0644 ${B}/lib/libqt* ${D}${libdir}

V2 changes cp directly to install, instead of running chown. (As was
done in V1).

Cheers,
Anders

>      # Remove example.pro file as it is useless
>      rm -f ${D}${OE_QMAKE_PATH_EXAMPLES}/examples.pro
-- 
Anders Darander
ChargeStorm AB / eStorm AB

