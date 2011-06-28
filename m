Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Qbbxo-0004Ij-OZ
	for openembedded-devel@lists.openembedded.org;
	Tue, 28 Jun 2011 19:20:40 +0200
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1QbbuE-0002lh-AO from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 28 Jun 2011 10:16:58 -0700
Received: from SVR-ORW-FEM-03.mgc.mentorg.com ([147.34.97.39]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Tue, 28 Jun 2011 10:16:58 -0700
Received: from [172.30.80.197] (147.34.91.1) by svr-orw-fem-03.mgc.mentorg.com
	(147.34.97.39) with Microsoft SMTP Server id 14.1.289.1;
	Tue, 28 Jun 2011 10:16:57 -0700
Message-ID: <4E0A0C85.80103@mentor.com>
Date: Tue, 28 Jun 2011 10:16:53 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <cover.1309272010.git.otavio@ossystems.com.br>	<iucpq7$uav$1@dough.gmane.org>	<BANLkTinqwZhxLGtp997dgKh9BmAD02LU-A@mail.gmail.com>	<iucsbb$gp2$1@dough.gmane.org>	<BANLkTimmBeR1COc-BRuASQf3O3g20uhkxg@mail.gmail.com>	<iud0mc$e52$1@dough.gmane.org>
	<BANLkTikUF5FUaoyWDzJ61dnj7JmNo876eA@mail.gmail.com>
In-Reply-To: <BANLkTikUF5FUaoyWDzJ61dnj7JmNo876eA@mail.gmail.com>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 28 Jun 2011 17:16:58.0168 (UTC)
	FILETIME=[2FA74380:01CC35B7]
Subject: Re: [meta-oe][PATCH 0/2] Fix parse errors
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
X-List-Received-Date: Tue, 28 Jun 2011 17:20:41 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 06/28/2011 09:54 AM, Otavio Salvador wrote:
> On Tue, Jun 28, 2011 at 13:49, Koen Kooi <koen@dominion.thruhere.net> wrote:
>>> Can you describe a use case?
>>
>> Rolling out a fix for the generic package without having to rebuild it N
>> times.
> 
> When doing this fix you should bump PR, right? in this case, this will
> be (or ought to be) rebuild for all machines thus for me seems it will
> be the same end result.

It will be, yes.  What Koen is saying is that if you're a feed using
distribution you don't NEED to kick off the build for N machines, just N
architectures (since you can use sysvinit-getty-r2 and sysvinit-r3 just
fine, if there weren't any changes to the getty subpackage).

-- 
Tom Rini
Mentor Graphics Corporation


