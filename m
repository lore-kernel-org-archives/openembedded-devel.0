Received: from mail-iw0-f197.google.com ([209.85.223.197])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NZJL4-0000W4-Bv
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Jan 2010 08:26:25 +0100
Received: by iwn35 with SMTP id 35so1052511iwn.4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Jan 2010 23:24:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=cvYdK5sbQd79hLFY3r/wNVqtebqxYLlg1EQy0rpz4PY=;
	b=Enwr8scTGZwm2rnnRsW2Gfk5H/dEI6223ykYL55GpCuRUyCPgcSxD502VFZoT1Lkoa
	J9yHPQxB3/5wnGL+Rxp1IgoteBfLuS1gc76lIwTyi6d5sLhABcUFSji1uig9B8ThYzEo
	LeKoLvOHOHS/j60Jdt2vaobmq1Squh7Nz/Pis=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=eaJZsglMx+Pmc/ZJZz6ztccMOjVCHpKJ7EublOeYQAtaNTI9CTalTHBf3etMz9MZx6
	tSSCQLHLrllmbZu4W5uJHy7qRI0wO8FCCeujxP1OAw48WJ422lfSvD7mggaD+SsY8UJo
	6vF3Qi0R1gGxQyvmVKrIB+kZV2W32ho9m0luY=
MIME-Version: 1.0
Received: by 10.231.148.16 with SMTP id n16mr1084502ibv.37.1264404241514; Sun, 
	24 Jan 2010 23:24:01 -0800 (PST)
In-Reply-To: <20100125015636.GA9855@denix.org>
References: <1264277173.3738.74.camel@mattotaupa.wohnung.familie-menzel.net>
	<20100124070602.GA8642@denix.org> <hjh7f3$6v0$2@ger.gmane.org>
	<20100125015636.GA9855@denix.org>
Date: Sun, 24 Jan 2010 23:24:01 -0800
Message-ID: <19c1b8a91001242324g1883a0c2ib4d00576e1f1ff67@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.197
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Official policy to list checksums
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
X-List-Received-Date: Mon, 25 Jan 2010 07:26:25 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sun, Jan 24, 2010 at 5:56 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> On Sun, Jan 24, 2010 at 11:29:56AM +0100, Koen Kooi wrote:
>> On 24-01-10 08:06, Denys Dmytriyenko wrote:
>> > On Sat, Jan 23, 2010 at 09:06:13PM +0100, Paul Menzel wrote:
>> >> does [1] still describe the official policy to add checksums? Or is
>> >
>> > No
>> >
>> >> putting them into the recipes preferred nowadays?
>> >
>> > Yes
>>
>> I think not! The new format:
>>
>> * is not documented
>
> I think there were plenty of emails describing the new format. Need to put it
> all in a Wiki page, agree.
>
>> * it has no tools to autogenerate it
>
> Give me few minutes - I'll send something to address this point.
>
>> * has not been agreed on in any way.
>
> Actually, specifying checksums in corresponding recipes was agreed on during
> the OEDEM in November. Using additional variable flags in base.bbclass was
> added by Phil, since bitbake cannot handle SHA256 sums in SRC_URI. Although,
> Richard mentioned he'd like to get it implemented in bitbake at some point:
> http://thread.gmane.org/gmane.comp.sysutils.bitbake.devel/1089/focus=1115
>
>> As an experiment I tried to use it for a branch at work and I
>> *absolutely* hate the workflow needed for the new format.
>
> You should have warned me! :) I thought you completely switched to the new
> method and liked it... :)

I think it saves unneeded complete parse just for adding
 one checksum to the checksum.ini file. While the old method
has tools and workflow in place. Same could be
done for new method too.

>
> --
> Denys
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


