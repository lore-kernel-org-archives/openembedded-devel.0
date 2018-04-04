Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 9E73674BAB
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Apr 2018 16:34:43 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Apr 2018 09:34:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,407,1517904000"; d="scan'208";a="40667777"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 04 Apr 2018 09:34:43 -0700
To: Armin Kuster <akuster808@gmail.com>,
	openembedded-devel@lists.openembedded.org
References: <1522850964-2056-1-git-send-email-akuster808@gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <2dbfe46b-f90e-9f4e-d8eb-e93f969fb45e@linux.intel.com>
Date: Wed, 4 Apr 2018 19:28:19 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <1522850964-2056-1-git-send-email-akuster808@gmail.com>
Subject: Re: [meta-networking][PATCH] wireshark: update to 2.4.6 and add upstream check
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
X-List-Received-Date: Wed, 04 Apr 2018 16:34:43 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 04/04/2018 05:09 PM, Armin Kuster wrote:

> +UPSTREAM_CHECK_REGEX = "wireshark-(?P<pver>2\.4(\.\d+)+)\.tar\.xz"

Why restrict the version to only 2.4.x ?
(also including .xz at the end may not be a good idea if upstream 
decides to use a different compressor)

Alex

