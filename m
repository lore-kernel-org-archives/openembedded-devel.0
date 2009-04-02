Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LpIlP-00079h-FG
	for openembedded-devel@openembedded.org; Thu, 02 Apr 2009 10:59:12 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LpIj5-0002Dm-P7
	for openembedded-devel@openembedded.org; Thu, 02 Apr 2009 08:56:44 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 02 Apr 2009 08:56:43 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Thu, 02 Apr 2009 08:56:43 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 02 Apr 2009 10:56:29 +0200
Message-ID: <gr1ujt$ga$1@ger.gmane.org>
References: <49D17F70.8020109@dls.net> <49D42B0B.4020505@dls.net>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b4pre) Gecko/20090328 Shredder/3.0b3pre
In-Reply-To: <49D42B0B.4020505@dls.net>
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.2
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW, RDNS_NONE, SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] make preferred openssl version match for -native recipe
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
X-List-Received-Date: Thu, 02 Apr 2009 08:59:12 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02-04-09 05:03, Mike (mwester) wrote:
> Mike (mwester) wrote:
>> I'd like to propose that we remove the "DEFAULT_PREFERENCE = "-1"" line
>> from openssl-native_0.9.8j.bb.
>>
>> This is causing a problem in select cases (for example, python-native
>> fails "import md5"), because we build and stage openssl 0.9.8j, but the
>> corresponding -native that gets built and staged is openssl 0.9.7g.
>>
>> The 0.9.8j version is currently selected as the PREFERRED_VERSION in the
>> preferred-om-2008-versions.inc file, as well as for SlugOS.  I've
>> successfully built it on both 32 and 64 bit hosts.
>>
>> Unless there are objections, I'll commit a fix in a couple of days.
>
> Fix committed. (To dev, not to the new stable branch.)
>
> WARNING!  The "correct" thing to do would probably be to bump up the PR
> on all recipes that might include, directly or indirectly, openssh libs
> -- thus forcing them all to link against the new version...
>
> However, that seemed to be an awful lot of packages, and given that at
> least some of the distros already have over-rides to select matching
> versions for openssl and openssl-native, this would seem to cause more
> problems than it would solve.
>
> So anticipate that your builds may fail if a new version of openssl is
> built; the failure mode would be the inability for the app to find the
> old version of the library in the staging area.

You mean like this: 
/OE/angstrom-dev/staging/x86_64-linux/usr/bin/edje_cc: error while 
loading shared libraries: libssl.so.0.9.7: cannot open shared object 
file: No such file or directory

Could you please do things properly and bump PR for the affected recipes?



