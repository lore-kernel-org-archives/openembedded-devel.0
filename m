Received: from [209.85.222.185] (helo=mail-pz0-f185.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1N8HDk-0005Hb-G8
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Nov 2009 18:43:07 +0100
Received: by pzk15 with SMTP id 15so976001pzk.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Nov 2009 09:41:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=InCGUaPtiajaGZXXKmO8wxFC+xeWVIpL+5lEdJ/8IQU=;
	b=uIvPY/ecfwEDbY3NuutWzrdOI0KxV4Y+qcV5g54+lL1siUrcnF5bZ/7xWyog0/mva9
	LmYrDJ8L/YbVMcWAauBcFHze9T9sG92kkkhI8oOqJGNApytodAVcoJxiz5st0Pwo/qmW
	jrHGmEkPlpKl2SWhgpQmYA+U2CjICMqZEadQk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=VketbKopa0ePaOBJrrSccOVhVdSP6Ei5GOBApmVN8NcrRWBy21+01ZsDjp6Pwqesll
	Z2bgcvS+ucp0729v+kXAlEowkTZjT9+MjIQbWun1pUysw9u/0+kueFf0VOS7/pnUOLRC
	JIacEZ8S1Vyadyww2xFlI2q+EUSRg27KRBtIE=
MIME-Version: 1.0
Received: by 10.140.165.21 with SMTP id n21mr102838rve.20.1257961305283; Wed, 
	11 Nov 2009 09:41:45 -0800 (PST)
In-Reply-To: <1257960636.25369.404.camel@lenovo.internal.reciva.com>
References: <4AF963A3.1050906@balister.org> <20091110131554.GA25450@denix.org>
	<4AF996BE.2080904@balister.org> <20091111161608.GA3246@denix.org>
	<1257960636.25369.404.camel@lenovo.internal.reciva.com>
Date: Wed, 11 Nov 2009 18:41:45 +0100
Message-ID: <d1b08f940911110941h3b145988s3afe5fe109b938b@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.222.185
X-SA-Exim-Mail-From: andrea.adami@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Mailing lists
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
X-List-Received-Date: Wed, 11 Nov 2009 17:43:07 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

FWIW I experience since some days strange delays, probably caused by
greylisting.
I suspect all gmail users are affected.

On my server I use following whitelist_dsname table for greylist demon
(policyd):
bigfish.com  	# bigfish.com has smtp servers behind multiple ips
google.com 	# Google for GMail 	^^^

Regards

Andrea


On Wed, Nov 11, 2009 at 6:30 PM, Phil Blundell <philb@gnu.org> wrote:
> On Wed, 2009-11-11 at 11:16 -0500, Denys Dmytriyenko wrote:
>> On Tue, Nov 10, 2009 at 11:37:18AM -0500, Philip Balister wrote:
>> > On 11/10/2009 08:15 AM, Denys Dmytriyenko wrote:
>> >> On Tue, Nov 10, 2009 at 12:59:15PM +0000, Philip Balister wrote:
>> >>> We have made some changes to DNS to try and sort out the oe.org vers=
us
>> >>> www.oe.org issue (and a few other nits). If the mailing list stops
>> >>> working,
>> >>> send me an email direct and we will try and get things going again A=
SAP.
>> >>> I
>> >>> think we have the correct DNS incantation this time.
>> >>
>> >> Ah, nice! Thanks. Have you added rewrite rules in exim to avoid
>> >> duplication of
>> >> mails sent to lists.oe.org vs oe.org? Let me try it with this email..=
. :)
>> >
>> > It will take some time for this to take effect and for us to fix anyth=
ing
>> > that needs fixing :)
>> >
>> > I still do not see the DNS change. Dotster is low to copy updates made=
 on
>> > their website to actual DNS.
>>
>> DNS seems to work fine, but it still takes hours to bounce an email...
>
> This particular mail of yours was delayed for an hour due to
> greylisting; this happens the first time you try to send mail to the
> list from a particular host (vms173001.mailsrvcs.net in this case). =A0I
> haven't seen any instances recently of mail taking any more than that,
> and for folks who aren't greylisted it should only be a minute or two.
>
> If you are routinely seeing round-trip times of "hours", please send me
> a copy of the headers for one of the offending messages and I will take
> a look at it.
>
> p.
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


