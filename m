Return-Path: <jan.kiszka@siemens.com>
Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
	by mail.openembedded.org (Postfix) with ESMTP id 6C2EE6FEFE
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 May 2017 05:53:02 +0000 (UTC)
Received: from mail1.siemens.de (mail1.siemens.de [139.23.33.14])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id v4A5r3Y7016746
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Wed, 10 May 2017 07:53:03 +0200
Received: from md1f2u6c.ww002.siemens.net ([146.254.78.60])
	by mail1.siemens.de (8.15.2/8.15.2) with ESMTP id v4A5r2Bx005068;
	Wed, 10 May 2017 07:53:03 +0200
To: Khem Raj <raj.khem@gmail.com>
References: <e9ec2489-e51f-222b-a4e0-2f537eff1e7d@siemens.com>
	<CAMKF1sqbD4106u6rkQUTkAyzhqXyR6yMMByrLqFVyZGAS9KeNQ@mail.gmail.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <20e4f085-fa4f-bc37-9133-fcf3891fd9b3@siemens.com>
Date: Wed, 10 May 2017 07:53:02 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
	Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <CAMKF1sqbD4106u6rkQUTkAyzhqXyR6yMMByrLqFVyZGAS9KeNQ@mail.gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: meta-java: Building openjre-8 on a non-gcc-6 host
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
X-List-Received-Date: Wed, 10 May 2017 05:53:03 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 2017-05-10 07:46, Khem Raj wrote:
> On Tue, May 9, 2017 at 10:34 PM, Jan Kiszka <jan.kiszka@siemens.com> wrote:
>> Hi all,
>>
>> seems like the current cross rules for openjre-8 at least break if the
>> host compiler < gcc-6: -fno-lifetime-dse gets injected based on the
>> cross compiler version, which is 6, but is also used for the few native
>> pieces of that build.
>>
>> Any suggestions how to fix that properly? I had to temporarily redirect
>> my default gcc from 4.8 to gcc-6.
>>
> 
> see if you can check  -fno-lifetime-dse options is supported in
> Makefiles before using the option, that way you can ensure that its
> only used with
> compilers which support it

OK, that means another patch to openjdk, right? OTH, the injection comes
from the recipes. Are you synchronizing with upstream on the those
cross-build issues?

Jan

-- 
Siemens AG, Corporate Technology, CT RDA ITP SES-DE
Corporate Competence Center Embedded Linux

