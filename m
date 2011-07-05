Received: from slow3-v.mail.gandi.net ([217.70.178.89])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <a.sappia@biotechware.com>) id 1Qe0A6-0001Uo-P6
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Jul 2011 09:35:15 +0200
X-WhiteListed: mail was accepted with no delay
X-WhiteListed: mail was accepted with no delay
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
	[217.70.183.196])
	by slow3-v.mail.gandi.net (Postfix) with ESMTP id 3DB12858B0
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Jul 2011 09:26:27 +0200 (CEST)
X-Originating-IP: 217.70.178.134
Received: from mfilter4-d.gandi.net (mfilter4-d.gandi.net [217.70.178.134])
	by relay4-d.mail.gandi.net (Postfix) with ESMTP id B7C4C172089
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Jul 2011 09:26:03 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mfilter4-d.gandi.net
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by mfilter4-d.gandi.net (mfilter4-d.gandi.net [10.0.15.180])
	(amavisd-new, port 10024) with ESMTP id HxSbXousVsUE
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Jul 2011 09:26:01 +0200 (CEST)
X-Originating-IP: 87.241.57.98
Received: from [192.168.8.53] (fireone.i3p.it [87.241.57.98])
	(Authenticated sender: a.sappia@biotechware.com)
	by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 1D77D172074
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Jul 2011 09:26:00 +0200 (CEST)
From: Alessandro Sappia <a.sappia@biotechware.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <CA+2YH7uyJUNWuvcNEC5jnsqkZs9Hnri7sxq0aZXWf1r88tU_qw@mail.gmail.com>
References: <1309803629.20865.8.camel@BTW1>
	<CA+2YH7uyJUNWuvcNEC5jnsqkZs9Hnri7sxq0aZXWf1r88tU_qw@mail.gmail.com>
Organization: Biotechware srl
Date: Tue, 05 Jul 2011 09:25:58 +0200
Message-ID: <1309850758.24550.19.camel@BTW1>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Cannot compile helloworld-image
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
X-List-Received-Date: Tue, 05 Jul 2011 07:35:15 -0000
X-Groupsio-MsgNum: 32980
Content-Type: multipart/related; type="multipart/alternative";
	boundary="=-7s84qlueMiRYAZ/q97Hj"

--=-7s84qlueMiRYAZ/q97Hj
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit


-- 

Alessandro Sappia
CEO

________________________________________________________________________

Biotechware srl 
C.so Castelfidardo, 30/A c/o I3P
10129 Torino (TO) Italy
Tel: +39 011 0903260
Fax: +39 011 0905126
http://www.biotechware.com/ 

Il giorno lun, 04/07/2011 alle 22.05 +0200, Enrico ha scritto:

> On Mon, Jul 4, 2011 at 8:20 PM, Alessandro Sappia
> <a.sappia@biotechware.com> wrote:
> > Hi all,
> > I just configured OE on my box and I tried to compile helloworld-image
> > to check if everything is fine.
> > I'm actually unable to complete with success this build because of this
> > error:
> > -----------------------------
> 
> Try with:
> 
> BB_NUMBER_THREADS = "1"
> 
> and have a look at the thread "[oe] gettext-native fails to build" of
> some days ago to know where i copied this hint from! (and maybe try
> oe-core branch too).
> 

[outout cut]
m4
-I /home/alessandro/oe/build/tmp/work/x86_64-linux/gettext-native-0.18-r6/gettext-0.18/gettext-tools/m4 -I /home/alessandro/oe/build/tmp/sysroots/x86_64-linux/usr/share/aclocal-1.11 -I /home/alessandro/oe/build/tmp/sysroots/x86_64-linux/usr/share/aclocal -I /home/alessandro/oe/build/tmp/work/x86_64-linux/gettext-native-0.18-r6/gettext-0.18/gnulib-local/m4/ -I /home/alessandro/oe/build/tmp/work/x86_64-linux/gettext-native-0.18-r6/gettext-0.18/gettext-runtime/m4 -I /home/alessandro/oe/build/tmp/work/x86_64-linux/gettext-native-0.18-r6/gettext-0.18/gettext-tools/m4 -I /home/alessandro/oe/build/tmp/sysroots/x86_64-linux/usr/share/aclocal-1.11 -I /home/alessandro/oe/build/tmp/sysroots/x86_64-linux/usr/share/aclocal --force -I ../../m4 -I ../m4 -I gnulib-m4
| autoreconf: running: libtoolize --copy --force
| autoreconf: failed to run libtoolize: No such file or directory
| autoreconf: libtoolize is needed because this package uses Libtool
| + oefatal 'autoreconf execution failed.'
| + echo FATAL: 'autoreconf execution failed.'
| FATAL: autoreconf execution failed.
| + exit 1
NOTE: package gettext-native-0.18-r6: task do_configure: Failed
ERROR: Task 435
(virtual:native:/home/alessandro/oe/openembedded/recipes/gettext/gettext_0.18.bb, do_configure) failed with exit code '1'
ERROR:
'virtual:native:/home/alessandro/oe/openembedded/recipes/gettext/gettext_0.18.bb' failed


It didn't work, but thanks.

Ciao,

Alessandro

--=-7s84qlueMiRYAZ/q97Hj
Content-ID: <1309850758.24550.18.camel@BTW1>
Content-Disposition: attachment; filename="BTW_143x59.png"
Content-Type: image/png; name="BTW_143x59.png"
Content-Transfer-Encoding: base64

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

--=-7s84qlueMiRYAZ/q97Hj--
