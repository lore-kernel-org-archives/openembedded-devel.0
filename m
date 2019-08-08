Return-Path: <andrej.valek@siemens.com>
Received: from goliath.siemens.de (goliath.siemens.de [192.35.17.28])
	by mail.openembedded.org (Postfix) with ESMTP id D17867E31D
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Aug 2019 06:31:28 +0000 (UTC)
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id x786VR8j007377
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Thu, 8 Aug 2019 08:31:28 +0200
Received: from [192.168.20.128] ([163.242.58.54])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x786VRp8005731;
	Thu, 8 Aug 2019 08:31:27 +0200
To: Khem Raj <raj.khem@gmail.com>, "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
References: <20190806064731.17490-1-andrej.valek@siemens.com>
	<76644068-fffd-3398-0898-e00db5a9f026@gmail.com>
From: Andrej Valek <andrej.valek@siemens.com>
Openpgp: preference=signencrypt
Message-ID: <233c3c9c-9cd6-aead-3ddf-3adfb6d7d554@siemens.com>
Date: Thu, 8 Aug 2019 08:31:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <76644068-fffd-3398-0898-e00db5a9f026@gmail.com>
Subject: Re: [meta-oe][PATCH] nodejs: 10.16.0 -> 10.16.1
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
X-List-Received-Date: Thu, 08 Aug 2019 06:31:29 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Khem!

I have checked the task, what you mentioned, but there is no errors on
my side.

DEBUG: Executing python function do_package_qa
NOTE: DO PACKAGE QA
DEBUG: Executing python function read_subpackage_metadata
DEBUG: Python function read_subpackage_metadata finished
NOTE: Checking Package: nodejs-doc
NOTE: Checking Package: nodejs
NOTE: mips-poky-linux-objdump -p .../packages-split/nodejs/usr/bin/node
NOTE: Checking Package: nodejs-locale
NOTE: Checking Package: nodejs-staticdev
NOTE: Checking Package: nodejs-src
NOTE: Checking Package: nodejs-systemtap
NOTE: Checking Package: nodejs-dev
NOTE: Checking Package: nodejs-dbg
NOTE: mips-poky-linux-objdump -p
.../packages-split/nodejs-dbg/usr/bin/.debug/node
NOTE: Checking Package: nodejs-npm
NOTE: DONE with PACKAGE QA
DEBUG: Python function do_package_qa finished
DEBUG: Executing python function sstate_task_postfunc
NOTE: Using umask 0o002 (not 22) for sstate packaging
DEBUG: Executing python function sstate_hardcode_path
NOTE: Removing hardcoded paths from sstate package: ...
DEBUG: Python function sstate_hardcode_path finished
DEBUG: Executing python function sstate_report_unihash
DEBUG: Python function sstate_report_unihash finished
DEBUG: Executing shell function sstate_create_package
DEBUG: Shell function sstate_create_package finished
DEBUG: Executing python function sstate_sign_package
DEBUG: Python function sstate_sign_package finished
DEBUG: Executing python function sstate_hardcode_path_unpack
DEBUG: Python function sstate_hardcode_path_unpack finished
DEBUG: Executing python function uninative_changeinterp
DEBUG: Python function uninative_changeinterp finished
DEBUG: Python function sstate_task_postfunc finished


What is your testing setup?
Is it fully reproducible? Could you please run only package_qa task?

Regards,
Andrej

On 8/8/19 6:32 AM, Khem Raj wrote:
> Hi Andrej
> 
> I am seeing
> 
> ERROR: nodejs-10.16.1-r0 do_package_qa: QA Issue:
> /usr/lib/node_modules/npm/node_modules/node-gyp/gyp/samples/samples
> contained in package nodejs-npm requires /usr/bin/python, but no
> providers found in RDEPENDS_nodejs-npm? [file-rdeps]
> 
> Can you see whats going on ?
> 
> On 8/5/19 11:47 PM, Andrej Valek wrote:
>> Update nodejs to active 10.x LTS release 10.16.1.
>>
>> Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
>> ---
>>  .../recipes-devtools/nodejs/{nodejs_10.16.0.bb => nodejs_10.16.1.bb}  | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>  rename meta-oe/recipes-devtools/nodejs/{nodejs_10.16.0.bb => nodejs_10.16.1.bb} (97%)
>>
>> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_10.16.0.bb b/meta-oe/recipes-devtools/nodejs/nodejs_10.16.1.bb
>> similarity index 97%
>> rename from meta-oe/recipes-devtools/nodejs/nodejs_10.16.0.bb
>> rename to meta-oe/recipes-devtools/nodejs/nodejs_10.16.1.bb
>> index aaa1da0aa..8c7795c76 100644
>> --- a/meta-oe/recipes-devtools/nodejs/nodejs_10.16.0.bb
>> +++ b/meta-oe/recipes-devtools/nodejs/nodejs_10.16.1.bb
>> @@ -23,8 +23,8 @@ SRC_URI_append_class-target = " \
>>             file://0002-Using-native-torque.patch \
>>             "
>>  
>> -SRC_URI[md5sum] = "c9a7ab43f8b50c8a4d5545de307b7540"
>> -SRC_URI[sha256sum] = "18e37f891d10ea7fbc8f6410c444c2b1d9cc3cbbb1d35aa9c41f761816956608"
>> +SRC_URI[md5sum] = "009e079ce7e2d695642fb61372459a77"
>> +SRC_URI[sha256sum] = "6268319c8dddfdaa7886ea3f253ac5c2d133a6c682c00786296227e03f322009"
>>  
>>  S = "${WORKDIR}/node-v${PV}"
>>  
>>

