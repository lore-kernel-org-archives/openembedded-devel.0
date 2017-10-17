Return-Path: <mikko.ylinen@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id D5EEE782C6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Oct 2017 12:12:07 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga105.jf.intel.com with ESMTP; 17 Oct 2017 05:12:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.43,390,1503385200"; d="scan'208";a="324168356"
Received: from summit.tm.intel.com (HELO [10.237.55.126]) ([10.237.55.126])
	by fmsmga004.fm.intel.com with ESMTP; 17 Oct 2017 05:12:07 -0700
To: Martin Jansa <martin.jansa@gmail.com>
References: <20171017105132.GB4387@jama>
	<20171017115539.13778-1-mikko.ylinen@linux.intel.com>
	<20171017120705.GC4387@jama>
From: Mikko Ylinen <mikko.ylinen@linux.intel.com>
Message-ID: <25ca8a10-6ade-4852-c9e4-bb36b65e2fd6@linux.intel.com>
Date: Tue, 17 Oct 2017 15:12:06 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20171017120705.GC4387@jama>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH v3] mraa/upm: enable nodejs bindings by default
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
X-List-Received-Date: Tue, 17 Oct 2017 12:12:08 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi,


On 17/10/17 15:07, Martin Jansa wrote:
> On Tue, Oct 17, 2017 at 02:55:39PM +0300, Mikko Ylinen wrote:
>> HAVE_NODEJS is a leftover from meta-refkit-core where the
>> layer had to adapt to different BBLAYER combinations (some
>> where nodejs wasn't available but mraa/upm were).
>>
>> Since that check is no longer needed and nodejs is in fact
>> part of meta-oe, nodejs bindings can be enabled by default
>> (with exceptions for armv4 and armv5 where nodejs isn't
>> available).
>>
>> Signed-off-by: Mikko Ylinen <mikko.ylinen@linux.intel.com>
>> ---
>>   meta-oe/recipes-extended/mraa/mraa_git.bb | 6 +++++-
>>   meta-oe/recipes-extended/upm/upm_git.bb   | 6 +++++-
>>   2 files changed, 10 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta-oe/recipes-extended/mraa/mraa_git.bb b/meta-oe/recipes-extended/mraa/mraa_git.bb
>> index 616048fac..b93fd72c8 100644
>> --- a/meta-oe/recipes-extended/mraa/mraa_git.bb
>> +++ b/meta-oe/recipes-extended/mraa/mraa_git.bb
>> @@ -31,7 +31,11 @@ FILES_${PN}-utils = "${bindir}/"
>>   # override this in local.conf to get needed bindings.
>>   # BINDINGS_pn-mraa="python"
>>   # will result in only the python bindings being built/packaged.
>> -BINDINGS ??= "python ${@ 'nodejs' if oe.types.boolean(d.getVar('HAVE_NODEJS') or '0') else '' }"
>> +BINDINGS ??= "python nodejs"
>> +
>> +# nodejs isn't available for armv4/armv5 architectures
>> +BINDINGS_armv4 ??= "python"
>> +BINDINGS_armv5 ??= "python"
> Still missing one, aren't you?
>

With qemumips64 I got:

ERROR: Nothing PROVIDES 'mraa'
mraa was skipped: incompatible with host mips64-refkit-linux (not in 
COMPATIBLE_HOST)

So I left it out.

-- Mikko

