Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1PnGt7-0001ll-Qo
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Feb 2011 21:43:46 +0100
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1PnGs5-0006Vz-Qs from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Feb 2011 12:42:41 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	svr-orw-fem-01.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Wed, 9 Feb 2011 12:42:41 -0800
Received: from [172.30.80.130] ([172.30.80.130]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Wed, 9 Feb 2011 13:42:39 -0700
Message-ID: <4D52FC34.9020401@mentor.com>
Date: Wed, 09 Feb 2011 13:42:28 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1297187904-19841-1-git-send-email-coolaj86@gmail.com>	<4D52EEA1.6040503@mentor.com>
	<iius8b$ke3$1@dough.gmane.org>
In-Reply-To: <iius8b$ke3$1@dough.gmane.org>
X-OriginalArrivalTime: 09 Feb 2011 20:42:40.0637 (UTC)
	FILETIME=[E4EB52D0:01CBC899]
Subject: Re: [PATCH v4] nodejs: updated recipe to v0.2.6
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 09 Feb 2011 20:43:46 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/09/2011 01:08 PM, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 09-02-11 20:44, Tom Rini wrote:
>> On 02/08/2011 10:58 AM, AJ ONeal wrote:
>>> * added version number to patches
>>> * libev-cross-cc_0.2.6.patch - turns off execution so that
>>> cross-compile succeeds
>>> * node-cross-cc_0.2.6.patch - enables cross-compiling of v8 for x86,
>>> x86_64, arm, and mips
>>
>> I didn't touch it in patchwork but (and I see these aren't all new issues):
>>
>>> diff --git a/recipes/nodejs/nodejs_0.2.6.bb
>>> b/recipes/nodejs/nodejs_0.2.6.bb
>>> new file mode 100644
>>> index 0000000..560adc6
>>> --- /dev/null
>>> +++ b/recipes/nodejs/nodejs_0.2.6.bb
>>> @@ -0,0 +1,32 @@
>>> +DESCRIPTION = "nodeJS Evented I/O for V8 JavaScript"
>>> +HOMEPAGE = "http://nodejs.org"
>>> +LICENSE = "MIT"
>>> +
>>> +DEPENDS = "openssl"
>>> +
>>> +SRC_URI = " \
>>> +  http://nodejs.org/dist/node-v${PV}.tar.gz \
>>> +  file://libev-cross-cc-v${PV}.patch \
>>> +  file://node-cross-cc-v${PV}.patch \
>>> +"
>>> +SRC_URI[md5sum] = "b1c50ceb43bee1b221be210b7bc7a216"
>>> +SRC_URI[sha256sum] =
>>> "e97fe9c81ff4b569ae9a0d46e64a0572a1f171293573a5b5290bcc3996a19701"
>>> +
>>> +S = "${WORKDIR}/node-v${PV}"
>>> +
>>> +# v8 errors out if you have set CCACHE
>>> +CCACHE = ""
>>> +
>>> +do_configure () {
>>> +  ./configure --prefix=${prefix} --without-snapshot
>>> +}
>>
>> Why isn't this just EXTRA_OECONF = "--without-snapshot" and using the
>> default do_configure, compile and install?
>
> It's one of those python abominations that try to look like autotools :(
> And as usual, it has even more bugs than autotools when you try to
> crosscompile

Retch.  So, unless someone pops up within the next 24h and says why they 
did something in patchwork or otherwise objects, I'll push this.  Thanks!

-- 
Tom Rini
Mentor Graphics Corporation


