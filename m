Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 0B98576643
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Mar 2016 12:42:05 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 03 Mar 2016 04:42:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,532,1449561600"; d="scan'208";a="663154943"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 03 Mar 2016 04:42:05 -0800
To: openembedded-devel@lists.openembedded.org
References: <1456935672-15538-1-git-send-email-Martin.Jansa@gmail.com>
	<1456935672-15538-4-git-send-email-Martin.Jansa@gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <56D83036.9020909@linux.intel.com>
Date: Thu, 3 Mar 2016 14:38:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.6.0
MIME-Version: 1.0
In-Reply-To: <1456935672-15538-4-git-send-email-Martin.Jansa@gmail.com>
Subject: Re: [PATCH][meta-oe 4/5] gst-ffmpeg: blacklist, not compatible with currently used ffmpeg 3
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
X-List-Received-Date: Thu, 03 Mar 2016 12:42:06 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 03/02/2016 06:21 PM, Martin Jansa wrote:

> +# http://errors.yoctoproject.org/Errors/Details/40736/
> +PNBLACKLIST[gst-ffmpeg] ?= "Not compatible with currently used ffmpeg 3"

Before blacklisting, you should try switching to gst-ffmpeg's internal 
copy of that library, and see if it helps:

PACKAGECONFIG ??= "external-libav"
PACKAGECONFIG[external-libav] = "--with-system-ffmpeg,,libav"

So drop external-libav from PACKAGECONFIG.

Alex


