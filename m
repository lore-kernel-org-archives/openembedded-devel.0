Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1PnFyx-0000AY-Vf
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Feb 2011 20:45:44 +0100
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1PnFxv-0000B8-Gz from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Feb 2011 11:44:39 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Wed, 9 Feb 2011 11:44:38 -0800
Received: from [172.30.80.130] ([172.30.80.130]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Wed, 9 Feb 2011 12:44:38 -0700
Message-ID: <4D52EEA1.6040503@mentor.com>
Date: Wed, 09 Feb 2011 12:44:33 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1297187904-19841-1-git-send-email-coolaj86@gmail.com>
In-Reply-To: <1297187904-19841-1-git-send-email-coolaj86@gmail.com>
X-OriginalArrivalTime: 09 Feb 2011 19:44:38.0380 (UTC)
	FILETIME=[C95512C0:01CBC891]
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
X-List-Received-Date: Wed, 09 Feb 2011 19:45:44 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/08/2011 10:58 AM, AJ ONeal wrote:
> * added version number to patches
> * libev-cross-cc_0.2.6.patch - turns off execution so that cross-compile succeeds
> * node-cross-cc_0.2.6.patch - enables cross-compiling of v8 for x86, x86_64, arm, and mips

I didn't touch it in patchwork but (and I see these aren't all new issues):

> diff --git a/recipes/nodejs/nodejs_0.2.6.bb b/recipes/nodejs/nodejs_0.2.6.bb
> new file mode 100644
> index 0000000..560adc6
> --- /dev/null
> +++ b/recipes/nodejs/nodejs_0.2.6.bb
> @@ -0,0 +1,32 @@
> +DESCRIPTION = "nodeJS Evented I/O for V8 JavaScript"
> +HOMEPAGE = "http://nodejs.org"
> +LICENSE = "MIT"
> +
> +DEPENDS = "openssl"
> +
> +SRC_URI = " \
> +  http://nodejs.org/dist/node-v${PV}.tar.gz \
> +  file://libev-cross-cc-v${PV}.patch \
> +  file://node-cross-cc-v${PV}.patch \
> +"
> +SRC_URI[md5sum] = "b1c50ceb43bee1b221be210b7bc7a216"
> +SRC_URI[sha256sum] = "e97fe9c81ff4b569ae9a0d46e64a0572a1f171293573a5b5290bcc3996a19701"
> +
> +S = "${WORKDIR}/node-v${PV}"
> +
> +# v8 errors out if you have set CCACHE
> +CCACHE = ""
> +
> +do_configure () {
> +  ./configure --prefix=${prefix} --without-snapshot
> +}

Why isn't this just EXTRA_OECONF = "--without-snapshot" and using the 
default do_configure, compile and install?

-- 
Tom Rini
Mentor Graphics Corporation


