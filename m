Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NAIc9-00018q-AX for openembedded-devel@lists.openembedded.org;
	Tue, 17 Nov 2009 08:36:41 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1NAIap-0003Px-SU
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Nov 2009 08:35:15 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Nov 2009 08:35:15 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Nov 2009 08:35:15 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 17 Nov 2009 08:34:53 +0100
Message-ID: <hdtjmt$rcf$1@ger.gmane.org>
References: <4AFAEDC3.80404@mlbassoc.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.6pre) Gecko/20091109 Shredder/3.0pre
In-Reply-To: <4AFAEDC3.80404@mlbassoc.com>
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Prebuilt toolchains
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
X-List-Received-Date: Tue, 17 Nov 2009 07:36:42 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11-11-09 18:00, Gary Thomas wrote:
> I'd like to use my own toolchains when building OpenEmbedded.
> I've tried to follow the information at:
> http://docs.openembedded.org/usermanual/usermanual.html#commonuse_prebuilt_toolchain
>
> It's a bit terse and confusing, so I'm just trying to see
> what I need (I think the section tries to discuss too many
> concepts at once)

If you're using angstrom and want to use a prebuilt CSL toolchain, you 
only need to add this to local.conf (I suspect thunderbird will linewrap 
it):

# Black magic to automatically set SDK_PATH out of PATH - don't touch this!
# Works with pretty much any external toolchain, like CS Lite or MV Pro 5
# Handles cross-toolchain vs. native toolchain
# SDK_PATH can be overwritten externally by META_SDK_PATH, e.g. for SDK
TOOLCHAIN_SYSPATH = "${@bb.data.getVar('TARGET_ARCH', d, 1) != 
bb.data.getVar('BUILD_ARCH', d, 1) and 
os.path.abspath(os.path.dirname(bb.which(bb.data.getVar('PATH', d, 1), 
bb.data.getVar('TARGET_PREFIX', d, 
1)+'cpp'))+'/../'+bb.data.getVar('TARGET_SYS', d, 1)) or ''}"
TOOLCHAIN_PATH = "${@bool(bb.data.getVar('TOOLCHAIN_SYSPATH', d, 1)) and 
(os.path.exists(bb.data.getVar('TOOLCHAIN_SYSPATH', d, 1)) and 
os.path.dirname(bb.data.getVar('TOOLCHAIN_SYSPATH', d, 1)) or 
bb.fatal('No valid toolchain in PATH')) or ''}"
SDK_PATH = "${@[bb.data.getVar('TOOLCHAIN_PATH', d, 1), 
bb.data.getVar('META_SDK_PATH', d, 
1)][bool(bb.data.getVar('META_SDK_PATH', d, 1))]}"

# Set the necessary variables to use binary CodeSourcery Lite
TARGET_VENDOR = "-none"
TARGET_CPPFLAGS_append = " -I${SDK_PATH}/${TARGET_SYS}/libc/usr/include "
TARGET_LDFLAGS_prepend = " -L${SDK_PATH}/${TARGET_SYS}/libc/lib 
-Wl,-rpath-link,${SDK_PATH}/${TARGET_SYS}/libc/lib "
TOOLCHAIN_TYPE = "external"
TOOLCHAIN_BRAND = "csl"

regards,

Koen



