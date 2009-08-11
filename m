Received: from [80.67.172.39] (helo=webmail.no-log.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <GNUtoo@no-log.org>) id 1Mandx-0000Nt-TA
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Aug 2009 11:27:45 +0200
Received: by webmail.no-log.org (Postfix, from userid 33)
	id 2F48D4C327; Tue, 11 Aug 2009 11:11:28 +0200 (CEST)
X-Squirrel-UserHash: c3wyGAAN
X-Squirrel-FromHash: AQQEWAkADC8=
Message-ID: <56726.AQQEWAkADC8=.1249981888.squirrel@webmail.no-log.org>
In-Reply-To: <19c1b8a90908110109x6f2bf329ib8794224b1ee98a@mail.gmail.com>
References: <1248042838-7496-1-git-send-email-otavio@ossystems.com.br>
	<1248042838-7496-2-git-send-email-otavio@ossystems.com.br>
	<200908110501.11808.holger+oe@freyther.de>
	<19c1b8a90908110109x6f2bf329ib8794224b1ee98a@mail.gmail.com>
Date: Tue, 11 Aug 2009 11:11:28 +0200 (CEST)
From: "GNUtoo" <GNUtoo@no-log.org>
To: openembedded-devel@lists.openembedded.org
User-Agent: SquirrelMail/1.4.9a
MIME-Version: 1.0
X-Priority: 3 (Normal)
Importance: Normal
Subject: Re: [PATCH 2/3] uClibc: use __always_inline instead of __inline__
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
X-List-Received-Date: Tue, 11 Aug 2009 09:27:46 -0000
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

> On Mon, Aug 10, 2009 at 8:01 PM, Holger Hans Peter
> Freyther<holger+oe@freyther.de> wrote:
>> On Monday 20 July 2009 00:33:57 Otavio Salvador wrote:
>>> From: Mario Domenech Goulart <mario@ossystems.com.br>
>>>
>>> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>>
>> Why? what does it fix?
>
> For now I think it fixes nothing. just replaces __inline__ with
> __inline which essentially has same semantics
> but probably  it is intended to have a 'must inline' semantics for
> these functions. in this case we need to fix
> the defines in uclibc. I will see to it
There was a problem with some gcc version + uclibc on MIPS
basically some functions should have been inlined and they weren't
that made all programs using shared libs segfault in ld-uClibc.so.0
Denis.



