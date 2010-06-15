Received: from smtp-68.nebula.fi ([83.145.220.68])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <henri.bragge@dcombus.com>) id 1OOQW9-0001dW-Az
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Jun 2010 09:25:06 +0200
Received: from [100.100.100.68] (unknown [83.150.95.26])
	by smtp-68.nebula.fi (Postfix) with ESMTP id 7255E43F0584;
	Tue, 15 Jun 2010 10:20:37 +0300 (EEST)
Message-ID: <4C172AE7.3020106@dcombus.com>
Date: Tue, 15 Jun 2010 10:25:27 +0300
From: Henri Bragge <henri.bragge@dcombus.com>
User-Agent: Thunderbird 2.0.0.24 (X11/20100317)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4c168f9c.02afcc0a.1a9e.7e1c@mx.google.com>
In-Reply-To: <4c168f9c.02afcc0a.1a9e.7e1c@mx.google.com>
X-SA-Exim-Connect-IP: 83.145.220.68
X-SA-Exim-Mail-From: henri.bragge@dcombus.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Leon Woestenberg <leon@sidebranch.com>
Subject: Re: [PATCH] udev/{acl, attr}: Fix install. Wanted to install to host /usr/bin/.
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
X-List-Received-Date: Tue, 15 Jun 2010 07:25:06 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Leon Woestenberg wrote:
> The subdirectory Makefile includes a file, that overrides the
> variables inherited from the parent Makefile. Those where provided
> to the parent make through '-e'.
>
> Make sure the subdir makes also use '-e'.
>   

Works here!


