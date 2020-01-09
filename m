Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2DE7A7FEE7
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Jan 2020 22:01:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 009M1OPT025637
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL);
	Thu, 9 Jan 2020 14:01:34 -0800
Received: from [128.224.56.214] (128.224.56.214) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Thu, 9 Jan 2020 14:01:13 -0800
To: =?UTF-8?Q?Andreas_M=c3=bcller?= <schnitzeltony@gmail.com>,
	<openembedded-devel@lists.openembedded.org>
References: <20200109210518.22451-1-schnitzeltony@gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <bc6e63b4-17f5-4d2c-761b-abe8ef476551@windriver.com>
Date: Thu, 9 Jan 2020 17:01:12 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200109210518.22451-1-schnitzeltony@gmail.com>
X-Originating-IP: [128.224.56.214]
Cc: matthew.zeng@windriver.com
Subject: Re: [PATCH 1/9] poppler: upgrade 0.82.0 -> 0.84.0
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
X-List-Received-Date: Thu, 09 Jan 2020 22:01:59 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: 8bit

On 1/9/20 4:05 PM, Andreas Müller wrote:
>  From announcements:
> 
> Release 0.84.0:
> core:
>   * Fix crash when converting from Unicode to ASCII-7
>   * Splash::scaleImageYdXu: Protect against crash if srcWidth is too big
>   * JBIG2Stream: fix potential crash in malformed documents
>   * JBIG2Stream: fix leak in reset() if called several times
>   * Internal code improvements
> 
> utils:
>   * pdfimages: Add error message if first page is larger then number of pages.
>   * pdfinfo: Improved paper size recognition
>   * pdfsig: Fix exit code when dumping signatures
>   * pdftocairo: Error out when even/odd selects 0 pages
>   * pdftohtml: Fix memory leak
>   * pdftoppm: Add an option to scale before rotate
>   * pdftoppm: Add -hide-annotations option
>   * pdftoppm: Error out when even/odd selects 0 pages
>   * pdftops: Improve -optimizecolorspace
> 
> qt5:
>   * Code cleanups
> 
> glib:
>   * Fix compiler warnings
> 
> Release 0.83.0:
> core:
>   * Improve when a file is recognized as Linearized
>   * Improve const-ness of the code
>   * Make code a bit more readable/maintanable
>   * Fix uninitialized memory uses in broken files
> 
> utils:
>   * pdffonts: Make code a bit more readable/maintanable
>   * pdftohtml: Make code a bit more readable/maintanable
> 
> qt5:
>   * Remove a bunch of unused internal functions
>   * trUtf8 -> tr (less warnings)
> 
> build system:
>   * make-glib-api-docs: switch to python3

Nice.

Andreas,

Have you by chance tried to add ptest coverage for poppler?
If not, Matthew may do that.


-- 
# Randy MacLeod
# Wind River Linux

