Return-Path: <net147@gmail.com>
Received: from mail-pd0-f174.google.com (mail-pd0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id 4223E60577
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  7 Apr 2014 10:32:11 +0000 (UTC)
Received: by mail-pd0-f174.google.com with SMTP id y13so6394180pdi.33
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Apr 2014 03:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=u+q4r0qAN8JHBFN7Ym5BSc61yHfFxOBk/rXCNOBAH3Y=;
	b=apvCuP0NzbxU64U6yjtCdIqr6AleG1db9CQRg8lp0V8wI8fTWsnoYrDEtOCdxPg92l
	UdFhn0u49ZLzaop89PNv/dTUkjOCCCwo8e68RCgJ+aH7WttSRS65aU+ffJHat6BQNbM8
	KbVg4q6blgcBNULnoLci7RLny39d3fqAd8TW0HLI8f1dRknVxBtaQnCPIXKvo/mvv+3K
	3PXMaoUqvWMU0H41VsGr5EKMWTQ2m978AWALQ9SGD+wY01JcbNNIuNkABl+WAiy3e8kz
	2jYBoSX45HL+paygy2z0O6j1OaSnccn48A8dez3/I8At+N7jsdmSBL7jePHEbwjNlcjF
	8leA==
X-Received: by 10.67.23.135 with SMTP id ia7mr30101904pad.5.1396866732258;
	Mon, 07 Apr 2014 03:32:12 -0700 (PDT)
Received: from [192.168.0.2] (60-242-179-244.static.tpgi.com.au.
	[60.242.179.244]) by mx.google.com with ESMTPSA id
	te2sm84019137pac.25.2014.04.07.03.32.10 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 07 Apr 2014 03:32:11 -0700 (PDT)
Message-ID: <53427E93.6020800@gmail.com>
Date: Mon, 07 Apr 2014 20:31:47 +1000
From: Jonathan Liu <net147@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Andreas Oberritter <obi@opendreambox.org>
References: <1396643181-21871-1-git-send-email-obi@opendreambox.org>
In-Reply-To: <1396643181-21871-1-git-send-email-obi@opendreambox.org>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-qt5][PATCH] qtwebkit: fix packageconfig
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
X-List-Received-Date: Mon, 07 Apr 2014 10:32:14 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 5/04/2014 7:26 AM, Andreas Oberritter wrote:
> Arguments passed to the qmake command-line were ignored by prf
> files, which get evaluated first. QtWebKit offers QMAKE_CACHE_EVAL,
> which can be used to inject a qmake snippet before anything else
> gets parsed.
>
> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> ---
>   recipes-qt/qt5/qtwebkit.inc | 14 +++++---------
>   1 file changed, 5 insertions(+), 9 deletions(-)
Please rebase against 
https://github.com/meta-qt5/meta-qt5/commit/34f4f849ea0ee85f0f5f30ac1cf5e1657f59e655 
in master-next branch of meta-qt5.

Regards,
Jonathan

