Received: from [64.233.162.227] (helo=nz-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <papercrane@gmail.com>) id 1HegGb-0007lK-4B
	for openembedded-devel@lists.openembedded.org;
	Fri, 20 Apr 2007 01:42:21 +0200
Received: by nz-out-0506.google.com with SMTP id m22so567958nzf
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Apr 2007 16:42:20 -0700 (PDT)
Received: by 10.114.185.8 with SMTP id i8mr995429waf.1177026139855;
	Thu, 19 Apr 2007 16:42:19 -0700 (PDT)
Received: by 10.115.92.3 with HTTP; Thu, 19 Apr 2007 16:42:19 -0700 (PDT)
Message-ID: <432beae0704191642m79afc9aaia85466716ee744af@mail.gmail.com>
Date: Thu, 19 Apr 2007 16:42:19 -0700
From: "Justin Patrin" <papercrane@gmail.com>
To: "Using the OpenEmbedded metadata to build Distributions"
	<openembedded-devel@lists.openembedded.org>
In-Reply-To: <200704192334.00169.patrick.steiner@a1.net>
MIME-Version: 1.0
References: <200704192334.00169.patrick.steiner@a1.net>
Subject: Re: strange build errors after (Checking Package:...)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 19 Apr 2007 23:42:21 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 4/19/07, Patrick Steiner <patrick.steiner@a1.net> wrote:
> hi,
>
> i have some problems with latest OE (bitbake)
>
> i currently try to build a gpephone image but i get some errors on every
> package.
>
> NOTE: Running task 321 of 3196 (ID:
> 1373, /home/pat/devel/oe/oe/org.openembedded.dev_typhoon/packages/xorg-lib/libxdmcp_1.0.2.bb,
> do_qa_configure)
> NOTE: package libxdmcp-1.0.2: started
> NOTE: package libxdmcp-1_1.0.2-r0: task do_qa_configure: started
> NOTE: Checking sanity of the config.log file
> NOTE: package libxdmcp-1_1.0.2-r0: task do_qa_configure: completed
> NOTE: package libxdmcp-1.0.2: completed
> NOTE: Running task 322 of 3196 (ID:
> 1366, /home/pat/devel/oe/oe/org.openembedded.dev_typhoon/packages/xorg-lib/libxdmcp_1.0.2.bb,
> do_compile)
> NOTE: package libxdmcp-1.0.2: started
> NOTE: package libxdmcp-1_1.0.2-r0: task do_compile: started
> NOTE: package libxdmcp-1_1.0.2-r0: task do_compile: completed
> NOTE: package libxdmcp-1.0.2: completed
> NOTE: Running task 323 of 3196 (ID:
> 1367, /home/pat/devel/oe/oe/org.openembedded.dev_typhoon/packages/xorg-lib/libxdmcp_1.0.2.bb,
> do_install)
> NOTE: package libxdmcp-1.0.2: started
> NOTE: package libxdmcp-1_1.0.2-r0: task do_install: started
> NOTE: package libxdmcp-1_1.0.2-r0: task do_install: completed
> NOTE: package libxdmcp-1.0.2: completed
> NOTE: Running task 324 of 3196 (ID:
> 1371, /home/pat/devel/oe/oe/org.openembedded.dev_typhoon/packages/xorg-lib/libxdmcp_1.0.2.bb,
> do_package)
> NOTE: package libxdmcp-1.0.2: started
> NOTE: package libxdmcp-1_1.0.2-r0: task do_package: started
> NOTE: Couldn't find shared library provider for libc.so.6
> NOTE: Couldn't find shared library provider for libc.so.6
> NOTE: couldn't find pkgconfig module 'xproto' in any package
> NOTE: DO PACKAGE QA
> NOTE: Checking Package: libxdmcp-dbg
> ERROR: Can not check RPATH scanelf not found
> ERROR: Error in executing:
> ERROR: Exception:exceptions.SystemExit Message:1
> ERROR: Printing the environment of the function
> ERROR: Error in executing:
> ERROR: Exception:exceptions.SystemExit Message:1
> ERROR: Printing the environment of the function
> ERROR: Error in executing:
> ERROR: Exception:exceptions.SystemExit Message:1
> ERROR: Printing the environment of the function
> ERROR: Error in executing:
> ERROR: Exception:exceptions.SystemExit Message:1
> ERROR: Printing the environment of the function
> ERROR: Build
> of /home/pat/devel/oe/oe/org.openembedded.dev_typhoon/packages/xorg-lib/libxdmcp_1.0.2.bb
> do_package failed
> ERROR: Task 1371
> (/home/pat/devel/oe/oe/org.openembedded.dev_typhoon/packages/xorg-lib/libxdmcp_1.0.2.bb,
> do_package) failed
> ERROR: '/home/pat/devel/oe/oe/org.openembedded.dev_typhoon/packages/xorg-lib/libxdmcp_1.0.2.bb'
> failed
>
>
> if i restart bitbake gpephone-image the package works an another one exits
> with this error. has anyone a ideas what happens?
>
> here is my oe build config:
> OE Build Configuration:
> BB_VERSION     = "1.8.0"
> OE_REVISION    = "<unknown>"
> TARGET_ARCH    = "arm"
> TARGET_OS      = "linux-gnueabi"
> MACHINE        = "htctornado"
> DISTRO         = "angstrom"
> DISTRO_VERSION = "test-20070419"
> TARGET_FPU     = "soft"
>
> regards,
>
>  patrick (law)
>

Sounds to me like a missing native dep on whatever package scanelf comes from.


-- 
Justin Patrin


