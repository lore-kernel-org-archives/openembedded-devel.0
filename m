Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LmC6p-0006fZ-Uy
	for openembedded-devel@openembedded.org; Tue, 24 Mar 2009 20:16:24 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LmC5O-0007Ji-KP
	for openembedded-devel@openembedded.org; Tue, 24 Mar 2009 19:14:54 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 24 Mar 2009 19:14:54 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 24 Mar 2009 19:14:54 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 24 Mar 2009 20:14:43 +0100
Message-ID: <gqbbf3$jak$1@ger.gmane.org>
References: <b6ebd0a50903171218i7f5716afifd99177982b6df5b@mail.gmail.com>	<b6ebd0a50903231335y1ddfcb3bpd447b646e18d439a@mail.gmail.com>	<1237885606.5348.8.camel@dax.rpnet.com>	<b6ebd0a50903240808p4e07c61g6a088df634e161b2@mail.gmail.com>	<ac9c93b10903241136q779fe115sa595c31200b707c6@mail.gmail.com>
	<b6ebd0a50903241155u7743eaads81be33e350925b7a@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b4pre) Gecko/20090316 Shredder/3.0b3pre
In-Reply-To: <b6ebd0a50903241155u7743eaads81be33e350925b7a@mail.gmail.com>
Sender: news <news@ger.gmane.org>
Subject: Re: Package Maintenance
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
X-List-Received-Date: Tue, 24 Mar 2009 19:16:24 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24-03-09 19:55, Chris Larson wrote:
> On Tue, Mar 24, 2009 at 11:36 AM, Frans Meulenbroeks
> <fransmeulenbroeks@gmail.com>  wrote:
>> Disadvantage of a Maintainers file is that it is yet another file to
>> update when you create a package (adjacent to the checksums file and
>> of course the package recipe). Guess it will be forgotten regularly.
>>
>> Also I fear we're going to end up with a lot of orphaned packages.
>
> The point I'm trying to make is that we have a lot of orphaned
> packages today, we just aren't being honest about it.  90% of the
> recipes in the tree don't get the attention they should.

I suspect we have approx 100 properly maintained recipes, which is 
approx 1.5%. The rest is 'unmaintained' due to dormant upstream, or 
because it builds and works just well enough for people to ignore it.
Also, having people put their name down as maintainer doesn't help when 
they have no interest in QA at all.

What about recording when a recipe has been 'vetted' and the results of 
the 'vetting':

# foo_1.0.bb vetting record:
# 2008/10/31  -  koen@openembedded.org
# 	beagleboard/angstrom-2008.1
#		fails to build with gcc >= 4.3.0
#	tosa/angstrom-2008.1
#		works
# 2006/5/16 - hrw@openembedded.org
#	tosa/openzaurus-3.5.3
#		works

thoughts?

regards,

Koen



