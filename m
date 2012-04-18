Received: from hermes.mlbassoc.com ([64.234.241.98] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1SKVjJ-0002hS-A9
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Apr 2012 16:19:33 +0200
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id B96B2F81240; Wed, 18 Apr 2012 08:10:06 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from hermes.chez-thomas.org (localhost.localdomain [127.0.0.1])
	by mail.chez-thomas.org (Postfix) with ESMTP id B077FF8123C;
	Wed, 18 Apr 2012 08:10:05 -0600 (MDT)
Message-ID: <4F8ECB3D.7040200@mlbassoc.com>
Date: Wed, 18 Apr 2012 08:10:05 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <CAOHjBZu=T6TrSomYSOW+Sp5afFwHTu5f4zGKx-3T361gdrJdmg@mail.gmail.com>
In-Reply-To: <CAOHjBZu=T6TrSomYSOW+Sp5afFwHTu5f4zGKx-3T361gdrJdmg@mail.gmail.com>
Subject: Re: [oe-core] build for 32bit architecture
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
X-List-Received-Date: Wed, 18 Apr 2012 14:19:33 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2012-04-18 07:48, Giuseppe Condorelli wrote:
> Hi All,
>
> I need to build the native packages for a 32bit architecture, although I'm
> working on a 64bit machine.
> So I need to pass the -m32 option to the compiler and my question is about
> the right place where to put it
> to be inherited by all native packages.

Why would you need 32bit native packages when your build host is 64bit?
The native packages are only used to provide functionality during the
build and hence (it makes sense to me at least) they should match the
build host native environment.

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


