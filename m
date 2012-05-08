Received: from smtprelay-b11.telenor.se ([62.127.194.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <openembedded@emagii.com>) id 1SRs6Q-0005hZ-4Y
	for openembedded-devel@lists.openembedded.org;
	Tue, 08 May 2012 23:37:50 +0200
Received: from ipb2.telenor.se (ipb2.telenor.se [195.54.127.165])
	by smtprelay-b11.telenor.se (Postfix) with ESMTP id 0DDC9DE7E
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 May 2012 23:08:19 +0200 (CEST)
X-SENDER-IP: [83.227.58.214]
X-LISTENER: [smtp.bredband.net]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AoobAPuKqU9T4zrWPGdsb2JhbAANN7NEAQEBATeCQAEBAQEDAQEBNTYKEQsYCRYPCQMCAQIBFQEbFBMGAgEBiBW7H41vgyYEk0+CL4ERkhw
X-IronPort-AV: E=Sophos;i="4.75,553,1330902000"; d="scan'208";a="329516710"
Received: from c-d63ae353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	[10.175.196.243]) ([83.227.58.214])
	by ipb2.telenor.se with ESMTP; 08 May 2012 23:08:18 +0200
Message-ID: <4FA98B43.3090200@emagii.com>
Date: Tue, 08 May 2012 23:08:19 +0200
From: Ulf Samuelsson <openembedded@emagii.com>
Organization: eMagii
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <0C757E680E33864AB113392C7E83F910BE52CF@GSX300A.mxchg.m.corp>
	<20120305225422.GD2030@denix.org>
	<0C757E680E33864AB113392C7E83F910BE52D2@GSX300A.mxchg.m.corp>
In-Reply-To: <0C757E680E33864AB113392C7E83F910BE52D2@GSX300A.mxchg.m.corp>
Subject: Re: Disable GNU Hash check ?
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
X-List-Received-Date: Tue, 08 May 2012 21:37:50 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2012-03-06 11:08, Hauser, Wolfgang (external) wrote:
> Thanks for that hint, but it is
>
> INSANE_SKIP_${PN} = True
> INSANE_SKIP_${PN}-dev = True
> INSANE_SKIP_${PN}-dbg = True
>
> That solves the problem.
>
> Regards
> Wolfgang
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

Had this problem with a source package containing both a kernel driver 
and applications.
The GNU Hash problem occured on the applications but not on the kernel 
modules.

The way it works, is that you create a configuration file, and then call 
make without parameters
so you build both the kernel and the apps in one step.

Added         TARGET_CC_ARCH+="${LDFLAGS}", as recommended in some 
mails, without effect.

Adding

INSANE_SKIP_${PN} = True
INSANE_SKIP_${PN}-dev = True
INSANE_SKIP_${PN}-dbg = True

makes the symptom go away.

The core of the recipe is:
----------------------------------------------
inherit module

EXTRA_OEMAKE = ' \
         KLIB=${STAGING_KERNEL_DIR} \
         KLIB_BUILD=${STAGING_KERNEL_DIR} \
         KERNEL_VERSION=${KERNEL_VERSION} \
         TARGET_CC_ARCH+="${LDFLAGS}" \
         '

do_compile () {
         unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS CC LD CPP
         oe_runmake
}
-----------------------------------------------

While the kernel modules seems to build OK,
I have a feeling that it is not right to build the applications this way
and this is why I get the error messages.

I'd rather fix the root cause than do the workaround,
but splitting up the build into two steps is really not supported by the 
package.

Would appreciate some comments.


-- 
Best Regards
Ulf Samuelsson
ulf@emagii.com
+46 722 427437



