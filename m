Received: from smtpauth20.prod.mesa1.secureserver.net ([64.202.165.36])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <mike@mwester.net>) id 1NXESo-0000el-Dm
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Jan 2010 14:49:49 +0100
Received: (qmail 18049 invoked from network); 19 Jan 2010 13:47:30 -0000
Received: from unknown (209.242.7.187)
	by smtpauth20.prod.mesa1.secureserver.net (64.202.165.36) with ESMTP;
	19 Jan 2010 13:47:30 -0000
Message-ID: <4B55B7E7.70205@mwester.net>
Date: Tue, 19 Jan 2010 07:47:19 -0600
From: Mike Westerhof <mike@mwester.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.8.1.23) Gecko/20090812 Thunderbird/2.0.0.23 Mnenhy/0.7.6.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1263904767-23489-1-git-send-email-sgh@sgh.dk>
In-Reply-To: <1263904767-23489-1-git-send-email-sgh@sgh.dk>
X-SA-Exim-Connect-IP: 64.202.165.36
X-SA-Exim-Mail-From: mike@mwester.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: =?UTF-8?B?U8O4cmVuIEhvbG0=?= <sh@mikrofyn.com>
Subject: Re: [PATCH] Make perl-native_* depend on make-native.
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
X-List-Received-Date: Tue, 19 Jan 2010 13:49:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

sgh@sgh.dk wrote:

> -DEPENDS = "virtual/db-native gdbm-native"
> +DEPENDS = "virtual/db-native gdbm-native make-native"

I don't doubt that perl needs make to build -- but then, so does
everything!  I wonder if we can just add a note to the appropriate wiki
that in addition to gcc, you need to have make installed on the host.
But then, how did OE get to building perl without make in the first place?

-Mike (mwester)


