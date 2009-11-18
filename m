Received: from hermes.mlbassoc.com ([76.76.67.137] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gary@mlbassoc.com>) id 1NAkmk-0002cy-JP
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Nov 2009 14:41:29 +0100
Received: by mail.chez-thomas.org (Postfix, from userid 999)
	id 5D6AD166081F; Wed, 18 Nov 2009 06:40:02 -0700 (MST)
Received: from hermes.chez-thomas.org (hermes_local [192.168.1.101])
	by mail.chez-thomas.org (Postfix) with ESMTP id C603E166081B;
	Wed, 18 Nov 2009 06:40:01 -0700 (MST)
Message-ID: <4B03F931.70501@mlbassoc.com>
Date: Wed, 18 Nov 2009 06:40:01 -0700
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.5) Gecko/20091117 Shredder/3.0.1pre
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4AFAEDC3.80404@mlbassoc.com> <hdtjmt$rcf$1@ger.gmane.org>
In-Reply-To: <hdtjmt$rcf$1@ger.gmane.org>
X-SA-Exim-Connect-IP: 76.76.67.137
X-SA-Exim-Mail-From: gary@mlbassoc.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: Koen Kooi <k.kooi@student.utwente.nl>
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
X-List-Received-Date: Wed, 18 Nov 2009 13:41:29 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/17/2009 12:34 AM, Koen Kooi wrote:
> On 11-11-09 18:00, Gary Thomas wrote:
>> I'd like to use my own toolchains when building OpenEmbedded.
>> I've tried to follow the information at:
>> http://docs.openembedded.org/usermanual/usermanual.html#commonuse_prebuilt_toolchain
>>
>>
>> It's a bit terse and confusing, so I'm just trying to see
>> what I need (I think the section tries to discuss too many
>> concepts at once)
>
> If you're using angstrom and want to use a prebuilt CSL toolchain, you
> only need to add this to local.conf (I suspect thunderbird will linewrap
> it):
>
> # Black magic to automatically set SDK_PATH out of PATH - don't touch this!
> # Works with pretty much any external toolchain, like CS Lite or MV Pro 5
> # Handles cross-toolchain vs. native toolchain
> # SDK_PATH can be overwritten externally by META_SDK_PATH, e.g. for SDK
> TOOLCHAIN_SYSPATH = "${@bb.data.getVar('TARGET_ARCH', d, 1) !=
> bb.data.getVar('BUILD_ARCH', d, 1) and
> os.path.abspath(os.path.dirname(bb.which(bb.data.getVar('PATH', d, 1),
> bb.data.getVar('TARGET_PREFIX', d,
> 1)+'cpp'))+'/../'+bb.data.getVar('TARGET_SYS', d, 1)) or ''}"
> TOOLCHAIN_PATH = "${@bool(bb.data.getVar('TOOLCHAIN_SYSPATH', d, 1)) and
> (os.path.exists(bb.data.getVar('TOOLCHAIN_SYSPATH', d, 1)) and
> os.path.dirname(bb.data.getVar('TOOLCHAIN_SYSPATH', d, 1)) or
> bb.fatal('No valid toolchain in PATH')) or ''}"
> SDK_PATH = "${@[bb.data.getVar('TOOLCHAIN_PATH', d, 1),
> bb.data.getVar('META_SDK_PATH', d,
> 1)][bool(bb.data.getVar('META_SDK_PATH', d, 1))]}"
>
> # Set the necessary variables to use binary CodeSourcery Lite
> TARGET_VENDOR = "-none"
> TARGET_CPPFLAGS_append = " -I${SDK_PATH}/${TARGET_SYS}/libc/usr/include "
> TARGET_LDFLAGS_prepend = " -L${SDK_PATH}/${TARGET_SYS}/libc/lib
> -Wl,-rpath-link,${SDK_PATH}/${TARGET_SYS}/libc/lib "
> TOOLCHAIN_TYPE = "external"
> TOOLCHAIN_BRAND = "csl"

Thanks, this looks like something to try.

I'm having a bit of trouble with the setting of 'TOOLCHAIN_SYSPATH'
(my toolchain is home-grown. not CSL).  Is there some way to debug this
line, e.g. print out the components and results?

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


