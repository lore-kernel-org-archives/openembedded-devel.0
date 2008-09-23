Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Ki5tw-0001QT-89
	for openembedded-devel@openembedded.org; Tue, 23 Sep 2008 13:17:52 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1Ki5qV-0008LR-EA
	for openembedded-devel@openembedded.org; Tue, 23 Sep 2008 11:14:19 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 23 Sep 2008 11:14:19 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 23 Sep 2008 11:14:19 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 23 Sep 2008 13:14:11 +0200
Message-ID: <gbaj23$rup$1@ger.gmane.org>
References: <d1b08f940809230158s78f04a4bq866bf586dce5cafe@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b1pre) Gecko/20080912030722 Shredder/3.0b1pre
In-Reply-To: <d1b08f940809230158s78f04a4bq866bf586dce5cafe@mail.gmail.com>
Sender: news <news@ger.gmane.org>
Subject: Re: QA Logs now on tinderbox
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
X-List-Received-Date: Tue, 23 Sep 2008 11:17:52 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Andrea Adami wrote:
> Hi,
>
> yesterday oestats was expanded and now the QA errors are logged.
>
> Here a first bunch of QA:
>
> These two are the most common:
>
> evil hides inside the .pc, staging,
> /staging/armeb-angstrom-linux-gnueabi/usr/lib/pkgconfig/pycairo.pc
>
> evil hides inside the .pc, staging,
> /staging/armeb-angstrom-linux-gnueabi/usr/lib/pkgconfig/ORBit-2.0.pc

While I applaud the fact that people are starting to take QA seriously, 
I must stress that the current logs are highly misleading to most people.

Take a look at http://tinderbox.openembedded.net/packages/libtool/

The QA log for libtool (on armeb) says:

evil hides inside the .pc, staging, 
/staging/armeb-angstrom-linux-gnueabi/usr/lib/pkgconfig/pycairo.pc
evil hides inside the .pc, staging, 
/staging/armeb-angstrom-linux-gnueabi/usr/lib/pkgconfig/ORBit-2.0.pc

Both of these aren't part of the libtool packages, but part of 
python-pycairo_1.4.0.bb and orbit2_2.14.12.bb respectively.

The staging QA checks inspect the *complete* staging area, not just the 
files the recipe put in there. Some people have already started moving 
recipes to non-working because they didn't bother to look what was 
causing the QA error, but only acted on the last QA log on their screen. 
"Libtool has errors in its QA log, so it must be broken" - Bzzzzt! WRONG!

So please take care when you inspect the QA logs, things aren't always 
what they seem.

regards,

Koen



