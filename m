Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1OtPa4-0000dO-0m
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Sep 2010 20:41:13 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1OtPZM-00054P-DE from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Sep 2010 11:40:28 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Wed, 8 Sep 2010 11:40:28 -0700
Received: from [172.30.80.172] ([172.30.80.172]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Wed, 8 Sep 2010 12:40:27 -0600
Message-ID: <4C87D894.9050609@mentor.com>
Date: Wed, 08 Sep 2010 11:40:20 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTi=3gKS1xKPCLJOg0vxpVSgxOwx9N-GmiQS1zO9g@mail.gmail.com>
	<AANLkTi=YqpnwM52LoTsVSb6wZJaGEXfyxrQiV_tMjwSH@mail.gmail.com>
In-Reply-To: <AANLkTi=YqpnwM52LoTsVSb6wZJaGEXfyxrQiV_tMjwSH@mail.gmail.com>
X-OriginalArrivalTime: 08 Sep 2010 18:40:27.0425 (UTC)
	FILETIME=[4E5E7910:01CB4F85]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: recipe simplification questions
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
X-List-Received-Date: Wed, 08 Sep 2010 18:41:13 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Khem Raj wrote:
> On Wed, Sep 8, 2010 at 10:41 AM, Frans Meulenbroeks
> <fransmeulenbroeks@gmail.com> wrote:
>> Hi
>>
>> While browsing through a recipe I stumbled upon the following two functions:
[snip]
>> do_install() {
>>        make install DESTDIR=${D}
>> }
>>
> 
> this if used in a recipe which inherits autotools could be for getting
> parallelism out of context during install but not during compile.
> again this kind of stuff should be avoided.

Not true (but I had to double check just now, so it's quite possible 
some others have assumed this behavior).  If we look at bitbake.conf:
EXTRA_OEMAKE_prepend_task_do_compile = "${PARALLEL_MAKE} "
EXTRA_OEMAKE_prepend_task-compile = "${PARALLEL_MAKE} "

So in the case of literally having DESTDIR=${D}, these can just go away. 
  There are some annoying cases however where it's not DESTDIR but some 
other variable.  IMHO, it's questionable if it'd be cleaner to do a 
custom one line do_install vs EXTRA_OEMAKE_append_task-do_install = 
"PREFIX=${D}"

-- 
Tom Rini
Mentor Graphics Corporation


