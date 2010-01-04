Received: from mail-gx0-f215.google.com ([209.85.217.215])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <camelguo@gmail.com>) id 1NRdou-0006OK-CR
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Jan 2010 04:41:31 +0100
Received: by gxk7 with SMTP id 7so8686901gxk.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 03 Jan 2010 19:39:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:content-type:to:subject
	:references:date:mime-version:content-transfer-encoding:from
	:organization:message-id:in-reply-to:user-agent;
	bh=xsYPSl83mvs51Uz2bJb0cpzI//GdpDQuh0ii4QDAgpc=;
	b=HRzF3oM4EVq1RIpR5L3+cyHtP6z3WwpnEfBcOJ3jZwha7elSUwh8hExPaa0F+BeQae
	m24UNNlhstBEx+VDZtnN+4buHdmZpiskGhP8N+t5M+0/1mKCek4ACFERgPM2yw2d8Kwh
	lnapd8br6zeakU0E5HtDrDTtOpGGz4batM5yo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=content-type:to:subject:references:date:mime-version
	:content-transfer-encoding:from:organization:message-id:in-reply-to
	:user-agent;
	b=s956U0b48RiaBmokZ6xa4SjSpymIFbHqmSDqKbovZXqarhln9DDCqEURyd2r/1kh9U
	vrX0Vne121tVqMYGt+HIr/oAMe/e5VddUqMviLlYKa87vkRytQkvbCypAVp9Z0jaCIz+
	Cl/5MSrFiwEh/EflJq7gC8nexsqPSVzwhhdpE=
Received: by 10.90.6.12 with SMTP id 12mr9388226agf.119.1262576365355;
	Sun, 03 Jan 2010 19:39:25 -0800 (PST)
Received: from guohr-laptop-ubuntu ([123.54.101.56])
	by mx.google.com with ESMTPS id 35sm7043535yxh.15.2010.01.03.19.39.21
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 03 Jan 2010 19:39:23 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <op.u5zi1ghgmn1qzu@guohr-laptop-ubuntu>
	<201001040357.33204.holger+oe@freyther.de>
Date: Mon, 04 Jan 2010 11:39:15 +0800
MIME-Version: 1.0
From: "Guo Hongruan" <camelguo@gmail.com>
Organization: Gulessoft, Inc
Message-ID: <op.u5zofpdimn1qzu@guohr-laptop-ubuntu>
In-Reply-To: <201001040357.33204.holger+oe@freyther.de>
User-Agent: Opera Mail/10.10 (Linux)
X-SA-Exim-Connect-IP: 209.85.217.215
X-SA-Exim-Mail-From: camelguo@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: why we don't setup a buildbot for openembedded QA?
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
X-List-Received-Date: Mon, 04 Jan 2010 03:41:31 -0000
Content-Type: text/plain; charset=utf-8; format=flowed; delsp=yes
Content-Transfer-Encoding: Quoted-Printable

=E5=9C=A8 Mon, 04 Jan 2010 10:57:33 +0800=EF=BC=8CHolger Hans Peter Frey=
ther  =

<holger+oe@freyther.de> =E5=86=99=E9=81=93:

> On Monday 04 January 2010 02:42:42 Guo Hongruan wrote:
>> Hi guys,
>>    I think we had better set up a continuous integration tool buildbo=
t  =

>> to
>> automate the compile/test cycle required to validate changes to the
>> project code base.
>>
>> It can help openembedded user to save time on failed building.
>
> You make one assumption. You assume that the user config is the same a=
s  =

> the
> build slaves (this includes different host distros, host machine, targ=
et
> machine, target distro and packages to be built).

Yes, you are right. it is impossible to cover every combinations.
But I think it is better that nothing. We can classify the varioubles  =

which affect the building and make a test plan. Of course, we can not ma=
ke  =

it perfect at the first time. But we can make it better and better.

>
>
>> Without buildbot, any volunteers can provide their available machine =
as
>> buildslave and the continuous integration environment will be really
>> scalable.
>
> This is not different from the tinderbox setup. On top of the buildbot=
  =

> we do
> get much more information about the build, including the log files of =
 =

> each and
> every task.

With buildbot, we can still use tinderbox to record every task and their=
  =

log files. buildbot and tinderbot can work together smoothly.

>
>
> The basic problem is there are so many different possible configuratio=
ns  =

> that
> they can not be tested with each commit. What can be done and is done =
is  =

> that
> the paths that are walked frequently will work better than the paths  =

> that are
> not walked as frequently. E.g. creating a new distribution will be a l=
ot
> harder than building Angstrom for the Beagleboard.
>

If there are enough buildslavers, we can test most of different possible=
  =

configurations with each commit. After all, it is distributed and can  =

scale dynamically.

> Now what one should do if one is interested in a specific path is to  =

> user the
> tinderclient and regularily build, test (and fix) the path one is  =

> interested
> in. For me this includes the meta-toolchain-qte target.
>
>
> The other is the tinderbox setup will soon gain a waterfall view and  =

> then it
> becomes a s social problem to fix the (selected) builds whenever they =
 =

> break.
>

builtbot can also show a waterfail view and through periodic building, w=
e  =

can find the bug as early as possible. everyone can access the buildbot =
 =

website to get to know which building failed and to get to know which ho=
w  =

to reproduce the failed building. Throught tinderbox, it is difficutl to=
  =

do that, for some developers build openembedded at their own branches, a=
nd  =

tinderbox can not record the complete local modification and setting.

>
> regards
> 	holger
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel=



-- =

Guo Hongruan, Embedded Linux Consultant
Skype: camelguo
Twitter: camelguo
http://www.gulessoft.com


