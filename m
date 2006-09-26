Received: from [64.233.166.178] (helo=py-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <pmiscml@gmail.com>) id 1GSBhi-00047n-Df
	for openembedded-devel@lists.openembedded.org;
	Tue, 26 Sep 2006 14:06:26 +0200
Received: by py-out-1112.google.com with SMTP id i75so2705830pye
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Sep 2006 05:01:38 -0700 (PDT)
Received: by 10.35.70.17 with SMTP id x17mr689451pyk;
	Tue, 26 Sep 2006 05:01:37 -0700 (PDT)
Received: from CUBE ( [82.193.96.236])
	by mx.gmail.com with ESMTP id m2sm3035068nzf.2006.09.26.05.01.36;
	Tue, 26 Sep 2006 05:01:37 -0700 (PDT)
Date: Tue, 26 Sep 2006 15:01:38 +0300
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Priority: 3 (Normal)
Message-ID: <1865823264.20060926150138@gmail.com>
To: Joaquim Duran <joaquinduran@adtelecom.es>
In-Reply-To: <45190D58.2020807@adtelecom.es>
References: <45190D58.2020807@adtelecom.es>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: List of dependent packages
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 26 Sep 2006 12:06:26 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Joaquim,

Tuesday, September 26, 2006, 2:22:00 PM, you wrote:

> Dear all,

> Is there any way to know the set of packages to be included in an
> image? Or more generally, how can I list the set of packages (with
> recursion) that are needed for one specified package?

> This should be done once processed the config file and updated the cache
> and before the compilation of packages.

  bitbake --help would the first place to consult. --dry-run,
--verbose, --graphviz swicthes would be of primary interest. And yes,
bitbake still doesn't provide enough insight into its internal
functioning. Patches to improve that (given they cover broad usecases)
would be welcome by Bitbake maintainers, I guess.

> Thanks and Best Regards,
> Joaquim Duran


-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



