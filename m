Received: from ptmx.org ([178.63.28.110])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dv@pseudoterminal.org>) id 1UVqPw-0002kg-Fb
	for openembedded-devel@lists.openembedded.org;
	Fri, 26 Apr 2013 23:43:00 +0200
Received: from [192.168.178.14] (chello080108009040.14.11.vie.surfer.at
	[80.108.9.40]) by ptmx.org (Postfix) with ESMTPSA id 362FF20024
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Apr 2013 23:25:13 +0200 (CEST)
Message-ID: <517AF0C7.2060201@pseudoterminal.org>
Date: Fri, 26 Apr 2013 23:25:27 +0200
From: Carlos Rafael Giani <dv@pseudoterminal.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130403 Thunderbird/17.0.5
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: Question about multiple recipe versions for the same package
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
X-List-Received-Date: Fri, 26 Apr 2013 21:43:00 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

if I have a package foo, I wrote a recipe for foo release 1.0 , and 
another for building directly from its git repository
(in other terms, there are two .bb files, foo_1.0.bb and foo_git.bb ),
which one is preferred? I would like for the 1.0 one to be used by default.

And if 1.0 is preferred, how can I explicitely select the git version? 
Is adding this line to local.conf:
   PREFERRED_VERSION_foo = "git"

correct? It would be nice if "git" were enough, instead of something 
like "1.0+gitr${SRCREV}" .

cheers


