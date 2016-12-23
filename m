Return-Path: <mark.hatle@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4E93A77205
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Dec 2016 15:51:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id uBNFpLX7025339
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Fri, 23 Dec 2016 07:51:21 -0800
Received: from soho-mhatle-m.local (172.25.36.231) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 23 Dec 2016 07:51:20 -0800
To: <openembedded-devel@lists.openembedded.org>
References: <1482357220-422-1-git-send-email-mark.asselstine@windriver.com>
	<CABcZANmtther94ZrkEwVn=JYgvLkT2CdTkCLSJPDo7gEHFdaCA@mail.gmail.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <be954776-5d12-dbfb-c782-3f58f1d13361@windriver.com>
Date: Fri, 23 Dec 2016 09:51:20 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <CABcZANmtther94ZrkEwVn=JYgvLkT2CdTkCLSJPDo7gEHFdaCA@mail.gmail.com>
Cc: "paul.eggleton@linux.intel.com" <paul.eggleton@linux.intel.com>
Subject: Re: [meta-webserver][PATCH] apache2: the download has been moved to the 'archives'
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
X-List-Received-Date: Fri, 23 Dec 2016 15:51:33 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On 12/21/16 4:26 PM, Christopher Larson wrote:
> On Wed, Dec 21, 2016 at 2:53 PM, Mark Asselstine <
> mark.asselstine@windriver.com> wrote:
> 
>> This release of apache2 is no longer found in the main downloads area
>> but has been moved to the 'archives'. We should uprev apache2 but for
>> now this will at least get the builds working again.
>>
>> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
>>
> 
> Wouldn’t it make sense to do a recipe-local addition to MIRRORS to
> automatically fall back to the apache archive?
> 

That seems wrong to me.  The recipe should point to the proper upstream location
for the archive.  If the archive moves, then the recipe should be updated to match.

I know you can easily do local workarounds for mirrors and such, but I wouldn't
consider putting them into a recipe directly as a good approach as it will hide
problems from people and make it unclear where the official download location is.

--Mark

