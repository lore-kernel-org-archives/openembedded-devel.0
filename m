Return-Path: <ml@communistcode.co.uk>
Received: from owm.eumx.net (eumx.net [91.82.101.43])
	by mail.openembedded.org (Postfix) with ESMTP id 85C0B6C76F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Oct 2013 08:46:48 +0000 (UTC)
Message-ID: <5260F57F.90502@communistcode.co.uk>
Date: Fri, 18 Oct 2013 09:46:55 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1381760413-15098-1-git-send-email-ml@communistcode.co.uk>	<1381760413-15098-2-git-send-email-ml@communistcode.co.uk>
	<20131017153405.GC3930@jama>
In-Reply-To: <20131017153405.GC3930@jama>
Subject: Re: [meta-oe][PATCHv3 1/3] json-c: add 0.11
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 18 Oct 2013 08:46:48 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 17/10/13 16:34, Martin Jansa wrote:
> On Mon, Oct 14, 2013 at 03:20:11PM +0100, Jack Mitchell wrote:
>> From: Jack Mitchell <jmitchell@cbnl.com>
>>
>> Signed-off-by: Jack Mitchell <jmitchell@cbnl.com>
>> ---
>>  meta-oe/recipes-support/json-c/json-c_0.11.bb | 13 +++++++++++++
>>  1 file changed, 13 insertions(+)
>>  create mode 100644 meta-oe/recipes-support/json-c/json-c_0.11.bb
>>
>> diff --git a/meta-oe/recipes-support/json-c/json-c_0.11.bb b/meta-oe/recipes-support/json-c/json-c_0.11.bb
>> new file mode 100644
>> index 0000000..e0391f5
>> --- /dev/null
>> +++ b/meta-oe/recipes-support/json-c/json-c_0.11.bb
>> @@ -0,0 +1,13 @@
>> +SUMMARY = "JSON-C implements a reference counting object model that allows you to easily construct JSON objects in C"
>> +HOMEPAGE = "https://github.com/json-c/json-c/wiki"
>> +LICENSE = "MIT"
>> +LIC_FILES_CHKSUM = "file://COPYING;md5=de54b60fbbc35123ba193fea8ee216f2"
>> +
>> +SRC_URI = "https://s3.amazonaws.com/json-c_releases/releases/${P}.tar.gz"
>> +
>> +SRC_URI[md5sum] = "aa02367d2f7a830bf1e3376f77881e98"
>> +SRC_URI[sha256sum] = "28dfc65145dc0d4df1dfe7701ac173c4e5f9347176c8983edbfac9149494448c"
>> +
>> +PARALLEL_MAKE = ""
>> +
>> +inherit autotools
> 
> It conflicts with libjson from oe-core:
> WARNING: libjson-0.9 is already registered as shlib
> provider for libjson.so.0, ignoring json-c-0.11 trying to register the
> same
> 
> openembedded-core/meta/recipes-devtools/libjson/libjson_0.9.bb
> 
> You probably want to upgrade libjson in oe-core if it's the same json-c...
> 
> 

Ah, that's not confusing at all eh!

I've sent a patch to oe-core, if they take it i'll ping you about
pulling the libestr and rsyslogd.

Thanks JaMa!

-- 
  Jack Mitchell (jack@embed.me.uk)
  Embedded Systems Engineer
  Cambridgeshire, UK
  http://www.embed.me.uk
-- 

