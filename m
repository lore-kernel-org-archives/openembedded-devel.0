Return-Path: <anuj.mittal@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id C686879238
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Aug 2018 06:05:36 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 Aug 2018 23:05:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.53,246,1531810800"; d="scan'208";a="254509786"
Received: from anmitta2-mobl1.png.intel.com (HELO [10.221.21.195])
	([10.221.21.195])
	by fmsmga005.fm.intel.com with ESMTP; 15 Aug 2018 23:05:23 -0700
To: Khem Raj <raj.khem@gmail.com>, ashie@clear-code.com
References: <20180816051257.4465-1-ashie@clear-code.com>
	<CAMKF1sqOZFf5rjWqX0fSRQ+X1S3v5T39JvfZE2OUCo=Z-jVyoQ@mail.gmail.com>
From: Anuj Mittal <anuj.mittal@intel.com>
Message-ID: <2ee375f8-c365-b311-3da4-8413bcb8cce4@intel.com>
Date: Thu, 16 Aug 2018 14:05:21 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAMKF1sqOZFf5rjWqX0fSRQ+X1S3v5T39JvfZE2OUCo=Z-jVyoQ@mail.gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] uim: Fix SRC_URI
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
X-List-Received-Date: Thu, 16 Aug 2018 06:05:36 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 08/16/2018 01:51 PM, Khem Raj wrote:
> On Wed, Aug 15, 2018 at 10:21 PM Takuro Ashie <ashie@clear-code.com> wrote:
>>
>> The place of uim archives has been moved to
>> https://github.com/uim/uim/releases
>>
>> Signed-off-by: Takuro Ashie <ashie@clear-code.com>
>> ---
>>  meta-oe/recipes-support/uim/uim_1.8.6.bb | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta-oe/recipes-support/uim/uim_1.8.6.bb b/meta-oe/recipes-support/uim/uim_1.8.6.bb
>> index af28895ee..1c58d40b1 100644
>> --- a/meta-oe/recipes-support/uim/uim_1.8.6.bb
>> +++ b/meta-oe/recipes-support/uim/uim_1.8.6.bb
>> @@ -4,7 +4,7 @@ LICENSE = "BSD-3-Clause & LGPLv2+"
>>  LIC_FILES_CHKSUM = "file://COPYING;md5=32463fd29aa303fb2360faeeae17256b"
>>  SECTION = "inputmethods"
>>
>> -SRC_URI = "http://uim.googlecode.com/files/uim-${PV}.tar.bz2"
>> +SRC_URI = "https://github.com/uim/uim/releases/download/uim-${PV}/uim-${PV}.tar.bz2"
>>
> 
> can you convert this into a git fetch along with pointing the SRC_URI
> to github, tarballs are not consistent
> and can be regenerated on the fly

But this one is a release tarball and not the archive one ... shouldn't
those be okay?

