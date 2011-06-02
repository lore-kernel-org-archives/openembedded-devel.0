Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1QRvpv-0004Ae-Om
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Jun 2011 02:32:32 +0200
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1QRvmr-0004PE-B2 from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Jun 2011 17:29:21 -0700
Received: from SVR-ORW-FEM-02.mgc.mentorg.com ([147.34.96.206]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Wed, 1 Jun 2011 17:25:46 -0700
Received: from [172.30.80.84] (147.34.91.1) by svr-orw-fem-02.mgc.mentorg.com
	(147.34.96.168) with Microsoft SMTP Server id 14.1.289.1;
	Wed, 1 Jun 2011 17:29:20 -0700
Message-ID: <4DE6D95E.5080205@mentor.com>
Date: Wed, 1 Jun 2011 17:29:18 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1306782450.4106.481.camel@mattotaupa>
In-Reply-To: <1306782450.4106.481.camel@mattotaupa>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 02 Jun 2011 00:25:46.0204 (UTC)
	FILETIME=[9D9AC1C0:01CC20BB]
Subject: Re: base.bbclass: Why is `oe_runmake install` not the default for `do_install()`?
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
X-List-Received-Date: Thu, 02 Jun 2011 00:32:32 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 05/30/2011 12:07 PM, Paul Menzel wrote:
> Dear OE folks,
> 
> 
> editing the `tiobench` recipe I was wondering why `do_install()` has no
> default like `oe_runmake install` set in `base.bbclass`.

There's not a common enough way to make sure it tries to write to ${D}
when we don't know what the build system is, other than someones Makefile.

-- 
Tom Rini
Mentor Graphics Corporation


