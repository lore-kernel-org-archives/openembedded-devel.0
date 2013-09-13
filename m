Return-Path: <ml@communistcode.co.uk>
Received: from owm.eumx.net (eumx.net [91.82.101.43])
	by mail.openembedded.org (Postfix) with ESMTP id B326A60FDF
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Sep 2013 14:23:35 +0000 (UTC)
Message-ID: <52331FE8.7040401@communistcode.co.uk>
Date: Fri, 13 Sep 2013 15:23:36 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130806 Thunderbird/17.0.8
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1379078574-23993-1-git-send-email-ml@communistcode.co.uk>
	<l0v6r0$a1c$1@ger.gmane.org>
In-Reply-To: <l0v6r0$a1c$1@ger.gmane.org>
Subject: Re: [meta-oe][PATCHv2] libsoc: new recipe
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
X-List-Received-Date: Fri, 13 Sep 2013 14:23:36 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 13/09/13 15:18, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Op 13-09-13 15:22, Jack Mitchell schreef:
>> From: Jack Mitchell <jack@embed.me.uk>
>>
>> Signed-off-by: Jack Mitchell <jack@embed.me.uk> ---
>>
>> Change from v1: added signed-off-by
>>
>> meta-oe/recipes-support/libsoc/libsoc_0.3.bb | 18 ++++++++++++++++++ 1
>> file changed, 18 insertions(+) create mode 100644
>> meta-oe/recipes-support/libsoc/libsoc_0.3.bb
>>
>> diff --git a/meta-oe/recipes-support/libsoc/libsoc_0.3.bb
>> b/meta-oe/recipes-support/libsoc/libsoc_0.3.bb new file mode 100644 index
>> 0000000..e91e152 --- /dev/null +++
>> b/meta-oe/recipes-support/libsoc/libsoc_0.3.bb @@ -0,0 +1,18 @@ +SUMMARY
>> = "libsoc is a C library for interfacing with common SoC peripherals
>> through generic kernel interfaces" +HOMEPAGE =
>> "https://github.com/jackmitch/libsoc" + +LICENSE = "LGPLv2.1"
>> +LIC_FILES_CHKSUM =
>> "file://COPYING;md5=e0bfebea12a718922225ba987b2126a5" + +inherit
>> autotools + +DEPENDS = "libgcc"
>
> Isn't that automatically implied with gcc-cross?

I wasn't sure, so I thought I would stick it in and see if anyone piped 
up, I'll remove it in v3.

Also on that note I noticed that Apache2 also DEPENDS on libgcc, is that 
also wrong?

>
>> + +SRCREV = "0764ee52b590d5ccb4bd4698f0011496b536ed70" +SRC_URI =
>> "git://github.com/jackmitch/libsoc.git" + +S = "${WORKDIR}/git" +
>> +do_configure_prepend () { +  ./autogen.sh +}
>
> What is autotools.bbclass missing that autogen does?

Apparently nothing, just tested and it built fine.

v3 incoming.

Cheers,

-- 
   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   Cambrideshire, UK
   http://www.embed.me.uk
--

