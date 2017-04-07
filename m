Return-Path: <jaragunde@igalia.com>
X-Greylist: delayed 2250 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 07 Apr 2017 18:46:00 UTC
Received: from fanzine.igalia.com (fanzine.igalia.com [91.117.99.155])
	by mail.openembedded.org (Postfix) with ESMTP id 5022377E3E
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Apr 2017 18:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; 
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject;
	bh=Fcho22O9OXwa7ekG8JFOwJYULD7j+tb5QrqkieOey0s=; 
	b=KtNhxBevgQJm4wJ7OpLzSVw5UH4PabmWFXIfqupEhTtB/jxScrFaf2g6Y2Upo3vaZXP/e9EC1eMk8CoA+RXdOMHtPNWumasgUOkNNf693DqOul+cJGuomtNYPYfqW+JgvBa/Cy314IyvySZ1Xhkgc8aC2nyu/U/Wq7WGSFVb3fHFlmqeXpDcKbmDyOtuZqLD2nmVUPHor1ny9ILDeuB6JlcnLWmWD9jvU5aJUNQH3JJw+Txe022U7UEM1qoo35GmZP2zhn6RjALmn8p7XtEhybxDoL7wKuVyvbh7kX334VoDdCWaljSoIyyt2RRrQN4boGW1E1SGEcVquqgV1XGtTA==;
Received: from [192.168.10.200] by fanzine.igalia.com with esmtpsa 
	(Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
	id 1cwYJC-0004De-OQ; Fri, 07 Apr 2017 20:08:30 +0200
To: openembedded-devel@lists.openembedded.org,
	Trevor Woerner <twoerner@gmail.com>
References: <20170403183815.2997-1-twoerner@gmail.com>
	<CA+chaQeaHRpRBQ_AEe7GDM2fxHZc81jkYcJbfBsf72XGEu_aeA@mail.gmail.com>
	<CAHUNapR=5Tj+jAF5_hMgZ1MMSaEiGbNRrj36YL12zcETqhzBYA@mail.gmail.com>
From: =?UTF-8?Q?Jacobo_Aragunde_P=c3=a9rez?= <jaragunde@igalia.com>
Message-ID: <620eadc5-9119-633e-f937-1f906fea1408@igalia.com>
Date: Fri, 7 Apr 2017 20:08:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <CAHUNapR=5Tj+jAF5_hMgZ1MMSaEiGbNRrj36YL12zcETqhzBYA@mail.gmail.com>
Subject: Re: [meta-browser][PATCH] chromium: 52.0.2743.76 -> 54.0.2810.2
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
X-List-Received-Date: Fri, 07 Apr 2017 18:46:03 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

Hi Trevor,

On 06/04/17 22:37, Trevor Woerner wrote:
> ...
> Currently I'm trying to figure out how to move past this version.
> After 53.0.2810.2 the current method OE uses to build chromium starts
> to fail because (as is my understanding) it was around this point that
> the chromium build switched from gyp+ninja (what we're using in OE) to
> gn+ninja (ninja is like "make" and gyp/gn are like the autotools)
> Therefore the gyp support starts to break down due to lack of upstream
> maintainership. I'm starting to be able to do successful chromium
> builds from tarballs on the cmdline (outside of OE) up to
> 57.0.2987.133 but I need to figure out how to translate that into a
> recipe.
> 

Some colleagues here have modified the recipe to build Chromium up to
version 57 using the new GN build system, targeting R-Car Gen.3 boards.
Unfortunately, the solution would still need a lot of cleanup before
being able to submit it.

Still, if you want to take a look and use it as an example, even reuse
parts of it in your own patch, feel free to do it.

Layer is here: https://github.com/Igalia/meta-browser

Best,
-- 
Jacobo Aragunde
Software Engineer at Igalia

