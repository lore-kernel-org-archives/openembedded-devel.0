Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MDvcT-0004X5-4N
	for openembedded-devel@openembedded.org; Tue, 09 Jun 2009 09:19:41 +0200
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1MDvT8-0006IV-LT
	for openembedded-devel@openembedded.org; Tue, 09 Jun 2009 07:10:02 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 09 Jun 2009 07:10:02 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 09 Jun 2009 07:10:02 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 09 Jun 2009 09:09:43 +0200
Message-ID: <h0l1rn$gld$2@ger.gmane.org>
References: <loom.20090609T035246-124@post.gmane.org>
	<200906090820.43460.g.eismann@gmx.net>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1pre) Gecko/20090531 Shredder/3.0b3pre
In-Reply-To: <200906090820.43460.g.eismann@gmx.net>
Sender: news <news@ger.gmane.org>
Subject: Re: BitBake error: "python-native_2.6.1.bb failed"
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
X-List-Received-Date: Tue, 09 Jun 2009 07:19:41 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 09-06-09 08:20, G. Eismann wrote:
> On Martes 09 Junio 2009 06:01:44 Nikolas escribió:
>> Hello all,
>>
>> Just started with OE, trying to build first Angstrom distro. After 470
>> tasks completed, bitbake fails as follows:
>
>
>> Compiling /home/nicolae/overo-oe/tmp/work/i686-linux/python-native-2.6.1-
>> ml3.1/temp-staging/home/nicolae/overo-oe/tmp/staging/i686-
>> linux//usr/lib/python2.6/zipfile.py ...
>> make: *** [libinstall] Error 1
>> FATAL: oe_runmake failed
>>
>> Can anybody help, please.
>
> I dont know about the error, but you can use your native python installed in
> your system adding this line to build/conf/local.conf:
> ASSUME_PROVIDED += "python-native"

And then start complaining when various python modules don't build....



