Received: from [212.27.42.91] (helo=wmproxy1-g27.free.fr)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <alain2210@free.fr>) id 1MqvWr-0007y1-F3
	for openembedded-devel@openembedded.org; Thu, 24 Sep 2009 23:07:08 +0200
Received: from wmproxy1-g27.free.fr (localhost [127.0.0.1])
	by wmproxy1-g27.free.fr (Postfix) with ESMTP id 0D47234A1;
	Thu, 24 Sep 2009 23:06:23 +0200 (CEST)
Received: from UNKNOWN (imp2-g19.priv.proxad.net [172.20.243.132])
	by wmproxy1-g27.free.fr (Postfix) with ESMTP id 83B64341C;
	Thu, 24 Sep 2009 23:06:22 +0200 (CEST)
Received: by UNKNOWN (Postfix, from userid 0)
	id 83122449084FF; Thu, 24 Sep 2009 23:06:22 +0200 (CEST)
Received: from  ([82.123.18.65]) by imp.free.fr (IMP) with HTTP 
	for <alain2210@172.20.243.55>; Thu, 24 Sep 2009 23:06:22 +0200
Message-ID: <1253826382.4abbdf4e7a566@imp.free.fr>
Date: Thu, 24 Sep 2009 23:06:22 +0200
From: Alain2210 <alain2210@free.fr>
To: openembedded-devel@lists.openembedded.org, Phil Blundell <philb@gnu.org>
References: <1253437328.4ab5ef902b12f@imp.free.fr>
	<19c1b8a90909200807u66d5d12bh345139ce4c4302ad@mail.gmail.com>
	<1253472330.4ab6784a8f36c@imp.free.fr>
	<1253535870.4942.11.camel@lenovo.internal.reciva.com>
In-Reply-To: <1253535870.4942.11.camel@lenovo.internal.reciva.com>
MIME-Version: 1.0
User-Agent: Internet Messaging Program (IMP) 3.2.8
X-Originating-IP: 82.123.18.65
X-Virus-Scanned: ClamAV using ClamSMTP
X-SA-Exim-Connect-IP: 212.27.42.91
X-SA-Exim-Mail-From: alain2210@free.fr
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: openembedded-devel@openembedded.org
Subject: Re: minimo not building
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
X-List-Received-Date: Thu, 24 Sep 2009 21:07:08 -0000
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable

Hello,

Selon Phil Blundell <philb@gnu.org>:

> On Sun, 2009-09-20 at 20:45 +0200, Alain2210 wrote:
> > Thanks for the explanation. How can I make minimo build again ? (and =
do you
> have
> > an idea why fennec with the same code can be built ?)
>
> Fennec uses mozilla.inc, which sets ARM_INSTRUCTION_SET =3D "arm".  Thi=
s
> is a somewhat sucky workaround since it will force the entire program t=
o
> be built as ARM, but it would at least avoid the problem you're seeing.

Sorry, for the late answer. I can confirm that with this instruction mini=
mo
builds on my laptop and works on my ipaq. Perhaps could it be put in oe.d=
ev.

> A better fix would be to identify the source of the offending
> instructions and either convert them to Thumb or put them out of line.

Sure, but it is far beyond my knowledges.

Thanks for the explanation.

Sincerely,

Alain


