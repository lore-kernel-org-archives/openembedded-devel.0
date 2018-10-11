Return-Path: <james.feist@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 5C05E60237
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Oct 2018 20:41:27 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Oct 2018 13:41:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.54,369,1534834800"; d="scan'208";a="78099351"
Received: from jfeist-mobl1.amr.corp.intel.com (HELO [10.241.245.65])
	([10.241.245.65])
	by fmsmga008.fm.intel.com with ESMTP; 11 Oct 2018 13:41:14 -0700
To: Khem Raj <raj.khem@gmail.com>
References: <20181011171418.35757-1-james.feist@linux.intel.com>
	<CAMKF1spEhWhnGzvePs5QDZspaT6u=rMg3T_n=QtuuZ87EJWB6A@mail.gmail.com>
From: "Feist, James" <james.feist@linux.intel.com>
Message-ID: <6ddccc38-c256-1ab9-e01f-360febf6cfe9@linux.intel.com>
Date: Thu, 11 Oct 2018 13:41:13 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAMKF1spEhWhnGzvePs5QDZspaT6u=rMg3T_n=QtuuZ87EJWB6A@mail.gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] nlohmann-json: Add symlink to json.hpp and update to 3.3.0
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
X-List-Received-Date: Thu, 11 Oct 2018 20:41:27 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 10/11/2018 1:33 PM, Khem Raj wrote:
> Hi James
> 
> It seems this srcrev does not exist on master branch but on develop
> branch probably
> we need to add branch=develop to SRC_URI as well.
> 
> see
> 
> http://errors.yoctoproject.org/Errors/Build/69670/

My mistake, clicking the tag in github jumped my branch, I'll fix
the revision and resubmit.

Thanks,

James
> On Thu, Oct 11, 2018 at 10:15 AM James Feist
> <james.feist@linux.intel.com> wrote:
>>
>> nlohmann-json has examples in their repo that refer to
>> the header as json.hpp directly, as such many packages
>> that require nlohmann-json expect json.hpp and not
>> nlohmann/json.hpp as the cmake file installs. Create symlink
>> so that access is available by either option. Also update
>> to release 3.3.0.
>>
>> Signed-off-by: James Feist <james.feist@linux.intel.com>
>> ---
>>   .../nlohmann-json/nlohmann-json_git.bb                 | 10 ++++++++--
>>   1 file changed, 8 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_git.bb b/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_git.bb
>> index a89b659ae..c1e108b38 100644
>> --- a/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_git.bb
>> +++ b/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_git.bb
>> @@ -6,9 +6,9 @@ LIC_FILES_CHKSUM = "file://LICENSE.MIT;md5=9a8ae1c2d606c432a2aa2e2de15be22a"
>>
>>   SRC_URI = "git://github.com/nlohmann/json.git"
>>
>> -PV = "3.2.0+git${SRCPV}"
>> +PV = "3.3.0+git${SRCPV}"
>>
>> -SRCREV = "8c20571136f2d5351b379a06ad6591bd980880fe"
>> +SRCREV = "f1768a540a7b7c5cc30cdcd6be9e9ef91083719b"
>>
>>   S = "${WORKDIR}/git"
>>
>> @@ -21,3 +21,9 @@ EXTRA_OECMAKE += "-DJSON_BuildTests=OFF"
>>   RDEPENDS_${PN}-dev = ""
>>
>>   BBCLASSEXTEND = "native nativesdk"
>> +
>> +# other packages commonly reference the file directly as "json.hpp"
>> +# create symlink to allow this usage
>> +do_install_append() {
>> +    ln -s nlohmann/json.hpp ${D}${includedir}/json.hpp
>> +}
>> --
>> 2.17.1
>>

