Return-Path: <jason.wessel@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id E47397520F
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Jun 2018 13:27:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w5GDQVJI008007
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sat, 16 Jun 2018 06:26:46 -0700
Received: from [172.25.59.212] (172.25.59.212) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.399.0;
	Sat, 16 Jun 2018 06:26:20 -0700
To: "Jeremy A. Puhlman" <jpuhlman@mvista.com>, akuster808
	<akuster808@gmail.com>, <openembedded-devel@lists.openembedded.org>
References: <1528499179-8589-1-git-send-email-jpuhlman@mvista.com>
	<e0d37e88-7135-4bd8-2f0e-3b8faca30b79@gmail.com>
	<d1f1d05a-7bed-7bf2-9813-52c7f42e33ea@mvista.com>
From: Jason Wessel <jason.wessel@windriver.com>
Message-ID: <1da9d7a8-fbcf-4fb8-71fa-f5a693dbe9a8@windriver.com>
Date: Sat, 16 Jun 2018 08:26:20 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <d1f1d05a-7bed-7bf2-9813-52c7f42e33ea@mvista.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-networking][PATCH] spice: Update to git hash to pick up gcc8 fixes.
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
X-List-Received-Date: Sat, 16 Jun 2018 13:27:22 -0000
Content-Language: en-GB
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 06/09/2018 10:52 AM, Jeremy A. Puhlman wrote:
>
> On 6/9/2018 7:39 AM, akuster808 wrote:
>> On 06/08/2018 04:06 PM, Jeremy Puhlman wrote:
>>> Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
>>> ---
>>>    meta-networking/recipes-support/spice/spice_git.bb | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/meta-networking/recipes-support/spice/spice_git.bb b/meta-networking/recipes-support/spice/spice_git.bb
>>> index 35482ca..508bb36 100644
>>> --- a/meta-networking/recipes-support/spice/spice_git.bb
>>> +++ b/meta-networking/recipes-support/spice/spice_git.bb
>>> @@ -15,7 +15,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
>>>    
>>>    PV = "0.14.0+git${SRCPV}"
>> Is it still at version "0.14.0" ?
> There does not appear to be another release branch. So its 0.14.0+git
> additions.
>
>>>    
>>> -SRCREV_spice = "2a3d5624382ba49c4eb906e69697b92f79d06cf4"
>>> +SRCREV_spice = "33d9c38554b41dab1390914ef79594b57218b06b"
>>>    SRCREV_spice-common = "4c2d0e977272c5540634d24f485dd64c424f6748"
>>>    
>>>    SRCREV_FORMAT = "spice_spice-common"

It doesn't appear that this fix has been applied to the tree yet.  I have a newer version, which also fixes the upstream changes for libopus, which I just posted to the list "[oe] [meta-networking][PATCH] spice: Uprev to fix compile errors from gcc 8.1.0".


Jason.


