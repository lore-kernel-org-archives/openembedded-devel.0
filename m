Received: from [209.85.162.178] (helo=el-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1JWyxk-00017Q-0j
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Mar 2008 20:07:39 +0100
Received: by el-out-1112.google.com with SMTP id r23so2031863elf.20
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Mar 2008 11:06:10 -0800 (PST)
Received: by 10.141.87.13 with SMTP id p13mr1672212rvl.62.1204743969553;
	Wed, 05 Mar 2008 11:06:09 -0800 (PST)
Received: by 10.140.250.18 with HTTP; Wed, 5 Mar 2008 11:06:09 -0800 (PST)
Message-ID: <c384c5ea0803051106he199460k7c9eaf232977e564@mail.gmail.com>
Date: Wed, 5 Mar 2008 20:06:09 +0100
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1204740661.8110.135.camel@dax.rpnet.com>
MIME-Version: 1.0
References: <1204740661.8110.135.camel@dax.rpnet.com>
X-SA-Exim-Connect-IP: 209.85.162.178
X-SA-Exim-Mail-From: leon.woestenberg@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: sdk.bbclass and gcc-cross-sdk
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 05 Mar 2008 19:07:40 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Richard,

On Wed, Mar 5, 2008 at 7:11 PM, Richard Purdie <rpurdie@rpsys.net> wrote:
>  What do I propose as a solution? I think the simplest thing is to would
>  be to do some/all of:
>
>  a) revert my sdk.bbclass changes
>  b) continue with our build == host assumption for gcc-cross-sdk for now
>  c) rename sdk.bbclass cross-sdk.bbclass
>  d) add a "real" sdk.bbclass
>
Before a), I would like to see a description of what we expect the
different classes to do, simply because I have lost track. I
understood we never  supported building Canadian cross-compilers, BTW.

There are other projects that focus on the correctness of building
cross toolchains*, canadian or non-canadian, and if we have clear
requirements for each of our classes, I would like to see if I can
understand what we do (correctly or not).

Regards,

Leon.

*diy-linux.org is the most pedantic about correctness in the toolchain
bootstrap, AFAIK.

Regards,
-- 
Leon


