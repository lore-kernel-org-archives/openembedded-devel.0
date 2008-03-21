Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1JcVcG-0004Tc-7N
	for openembedded-devel@openembedded.org; Fri, 21 Mar 2008 02:00:19 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m2L10FA1002016
	for <openembedded-devel@openembedded.org>; Fri, 21 Mar 2008 01:00:15 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 01883-02 for <openembedded-devel@openembedded.org>;
	Fri, 21 Mar 2008 01:00:06 +0000 (GMT)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m2L103Gp002007
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>; Fri, 21 Mar 2008 01:00:03 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <bdb0025f0803201438v1950602ci25b2b4d54ad359f@mail.gmail.com>
References: <bdb0025f0803201438v1950602ci25b2b4d54ad359f@mail.gmail.com>
Date: Fri, 21 Mar 2008 01:00:05 +0000
Message-Id: <1206061205.4549.125.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
X-SA-Exim-Connect-IP: 194.106.48.114
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=AWL,BAYES_50,RDNS_NONE
	autolearn=no version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: problems when using overrides...
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
X-List-Received-Date: Fri, 21 Mar 2008 01:00:19 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi,

On Thu, 2008-03-20 at 18:38 -0300, Rodrigo Vivi wrote:
> I'm trying without success to use
> BB_NUMBER_THREADS_icecc = "8" in my local.conf
> 
> I've already checked with mickeyl help that all variables are set correctly:
> 
> OVERRIDES="local:icecc:nokia800:mamona:linux-gnueabi:arm:build-linux:fail-fast:pn-bitbake"
> 
> BB_NUMBER_THREADS="8"
> 
> but it is not working...
> 
> It starts only one thread. But when I remove the "_icecc" it really
> starts 8 threads.
> 
> Does someone have any idea?
> 
> Holger? Richard?
> 
> btw I'm trying to set up other 3 variables with this icecc overrides:
> 
> PARALLEL_MAKE_icecc
> INHERIT_append_icecc
> ICECC_ENV_EXEC_icecc
> 
> but no one seems to be working...

Override expansion only takes place at a certain point in bitbake
execution. I suspect some of these variables are being accessed without
override expansion taking place, I'm nearly sure of that happening in
the BB_NUMBER_THREADS case since its a bitbake internal variable.

PARALLEL_MAKE_icecc should work
INHERIT_append_icecc could be problematic, since bitbake handles INHERIT as a special case
ICECC_ENV_EXEC_icecc should work

Regards,

Richard



