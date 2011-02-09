Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PnGMP-00012m-2d for openembedded-devel@lists.openembedded.org;
	Wed, 09 Feb 2011 21:09:57 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PnGLP-0005so-Jf for openembedded-devel@lists.openembedded.org;
	Wed, 09 Feb 2011 21:08:55 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Feb 2011 21:08:55 +0100
Received: from k.kooi by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Feb 2011 21:08:55 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 09 Feb 2011 21:08:43 +0100
Message-ID: <iius8b$ke3$1@dough.gmane.org>
References: <1297187904-19841-1-git-send-email-coolaj86@gmail.com>
	<4D52EEA1.6040503@mentor.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <4D52EEA1.6040503@mentor.com>
X-Enigmail-Version: 1.0.1
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
X-List-Received-Date: Wed, 09 Feb 2011 20:09:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 09-02-11 20:44, Tom Rini wrote:
> On 02/08/2011 10:58 AM, AJ ONeal wrote:
>> * added version number to patches
>> * libev-cross-cc_0.2.6.patch - turns off execution so that
>> cross-compile succeeds
>> * node-cross-cc_0.2.6.patch - enables cross-compiling of v8 for x86,
>> x86_64, arm, and mips
> 
> I didn't touch it in patchwork but (and I see these aren't all new issues):
> 
>> diff --git a/recipes/nodejs/nodejs_0.2.6.bb
>> b/recipes/nodejs/nodejs_0.2.6.bb
>> new file mode 100644
>> index 0000000..560adc6
>> --- /dev/null
>> +++ b/recipes/nodejs/nodejs_0.2.6.bb
>> @@ -0,0 +1,32 @@
>> +DESCRIPTION = "nodeJS Evented I/O for V8 JavaScript"
>> +HOMEPAGE = "http://nodejs.org"
>> +LICENSE = "MIT"
>> +
>> +DEPENDS = "openssl"
>> +
>> +SRC_URI = " \
>> +  http://nodejs.org/dist/node-v${PV}.tar.gz \
>> +  file://libev-cross-cc-v${PV}.patch \
>> +  file://node-cross-cc-v${PV}.patch \
>> +"
>> +SRC_URI[md5sum] = "b1c50ceb43bee1b221be210b7bc7a216"
>> +SRC_URI[sha256sum] =
>> "e97fe9c81ff4b569ae9a0d46e64a0572a1f171293573a5b5290bcc3996a19701"
>> +
>> +S = "${WORKDIR}/node-v${PV}"
>> +
>> +# v8 errors out if you have set CCACHE
>> +CCACHE = ""
>> +
>> +do_configure () {
>> +  ./configure --prefix=${prefix} --without-snapshot
>> +}
> 
> Why isn't this just EXTRA_OECONF = "--without-snapshot" and using the
> default do_configure, compile and install?

It's one of those python abominations that try to look like autotools :(
And as usual, it has even more bugs than autotools when you try to
crosscompile
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNUvRLMkyGM64RGpERAqflAJ9qHXDkf6jGOs1y/x+FtJ5VOEFD3gCfXaYW
NV5mosMuAhYDfZVMEzXGYjE=
=pRYh
-----END PGP SIGNATURE-----



