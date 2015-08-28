Return-Path: <prvs=675da3d15=Richard.Leitner@skidata.com>
Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
	by mail.openembedded.org (Postfix) with ESMTP id 868CA76DAA
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Aug 2015 07:12:57 +0000 (UTC)
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: ApwEAJ0J4FWsEApK/2dsb2JhbABdhF7DHIJYAoIQAQEBAQEBgQuEJAEBBDIBRQEQCw0LCRYPCQMCAQIBRQYNAQcCiC/GIQEBAQEBBQEBAQEehm2EdYULBxeEFQEElT2OPYcuF41pg2uEJ4I3gQUBAQE
X-IPAS-Result: ApwEAJ0J4FWsEApK/2dsb2JhbABdhF7DHIJYAoIQAQEBAQEBgQuEJAEBBDIBRQEQCw0LCRYPCQMCAQIBRQYNAQcCiC/GIQEBAQEBBQEBAQEehm2EdYULBxeEFQEElT2OPYcuF41pg2uEJ4I3gQUBAQE
Message-ID: <55E009D2.6010106@skidata.com>
Date: Fri, 28 Aug 2015 09:12:18 +0200
From: Richard Leitner <richard.leitner@skidata.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.8.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1440724441-692-1-git-send-email-vinay.k.awasthi@intel.com>
In-Reply-To: <1440724441-692-1-git-send-email-vinay.k.awasthi@intel.com>
X-Originating-IP: [172.16.60.30]
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [meta-java][PATCH] OpenJDK-8: For x86 and ARM
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
X-List-Received-Date: Fri, 28 Aug 2015 07:13:00 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 8bit

Hi Vinay,
thanks for working on that!

On 08/28/2015 03:14 AM, Vinay K. Awasthi wrote:
> Rebased it again with latest change-set and tested it on oe-core master with latest mate-openembedded.
> 
> There is no change in recipe.
> 
> This enables OpenJDK-8 jre/jdk for x86 and ARM.
> 
> This recipe is tested for arm (zero VM) and x86 (hotspot vm).
> 
> To build just use bitbake openjdk-8.

I successfully compiled and tested it for/on an ARMv7 Cortex A9 CPU:
# /usr/lib/jvm/java-8-openjdk/jre/bin/java -version
openjdk version "1.8.0-internal"
OpenJDK Runtime Environment (build 1.8.0-internal-leri_2015_08_28_08_47-b00)
OpenJDK Zero VM (build 25.60-b23, interpreted mode)

Also X11/awt/swing works fine! Only problem for me is that ZeroVM is
running in "interpreted mode". Therefore my programs are running really
slow.

Was the "mixed mode" available/working in your tests?

IMHO a working JIT (=> mixed-mode) is a must-have for merging this patch
upstream. What do you think Otavio?

thanks & regards,
Richard L

