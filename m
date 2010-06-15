Received: from smtp-68.nebula.fi ([83.145.220.68])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <henri.bragge@dcombus.com>) id 1OOQna-0003cQ-JH
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Jun 2010 09:43:07 +0200
Received: from [100.100.100.68] (unknown [83.150.95.26])
	by smtp-68.nebula.fi (Postfix) with ESMTP id 058C243F09FC
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Jun 2010 10:38:31 +0300 (EEST)
Message-ID: <4C172F19.30005@dcombus.com>
Date: Tue, 15 Jun 2010 10:43:21 +0300
From: Henri Bragge <henri.bragge@dcombus.com>
User-Agent: Thunderbird 2.0.0.24 (X11/20100317)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <61003.195.148.62.38.1276533099.squirrel@webmail3.nebula.fi>
	<1276584950-22168-1-git-send-email-sledz@dresearch.de>
In-Reply-To: <1276584950-22168-1-git-send-email-sledz@dresearch.de>
X-SA-Exim-Connect-IP: 83.145.220.68
X-SA-Exim-Mail-From: henri.bragge@dcombus.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH v2] busybox-1.11.3/busybox-1.13.2: enable backgrounding for udhcpc
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
X-List-Received-Date: Tue, 15 Jun 2010 07:43:07 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Steffen Sledz wrote:
> * The former default behaviour was to exit with failure if lease is not
>   immediately obtained. This results in permanent network disconnect if DHCP
>   server is (accidentally) not available at boot time. :(
>
> * Since bb 1.14 this is no longer hardcoded and can be configured.

Works for me. I'm still not sure if -b should be hardcoded (it could be 
passed through udhcpc_opts). On the other hand, if someone does not want 
to leave udhcpc in the background they can just pass -n to it, which 
seems to override -b. So this fix seems fine.


