Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OgTJx-0001Pl-O9
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Aug 2010 04:03:10 +0200
Received: by iwn34 with SMTP id 34so5665129iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Aug 2010 19:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=QLPxi8gC2CnRMXUm+mq5pn9iBXGWQddMkokM0WLEG9o=;
	b=wl31MdBfYcF9M1t0V1qqk3NFbOD3c1mSpjmYUKsIT6QCWPwjUphIt6LmkbQXwfHl10
	Mwf/DOIRi1g1JjDU0Eyc2rjl9QKgTla7GpHf05QQjuX1PmcIbvjIABLb8MNrrzDm26if
	iAywbsOtibIW9VZIK7KY7PHK4oDzKAsXdc9W0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=HdxvLx4/tkMglV4aONtUREhZW0Q2muzvOuUIbgOAQIFQ4JZGHVrp6TB85GJq0pGmZ1
	cdUZ67y08heozsxDHms/0jHEW8kAWRWFoYOSTVu2hvGJZMuZvScurs6PgZdPkn5AjkOS
	SDl5NNFNqWYue64tM4ddQ/X2OGqVcTVevyf78=
Received: by 10.231.34.135 with SMTP id l7mr9617038ibd.148.1280887383185; Tue, 
	03 Aug 2010 19:03:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.12.137 with HTTP; Tue, 3 Aug 2010 19:02:43 -0700 (PDT)
In-Reply-To: <20100804001040.GE17391@denix.org>
References: <1280780382-11697-1-git-send-email-fransmeulenbroeks@gmail.com> 
	<i38mr6$ng8$1@dough.gmane.org> <20100803235811.GC17391@denix.org> 
	<20100804001040.GE17391@denix.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 3 Aug 2010 19:02:43 -0700
Message-ID: <AANLkTi=EvHvOcpqYp1rZx-C0hBnQbZneJW2L5og6eBZ4@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] 500+ recipes: remove do_stage
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
X-List-Received-Date: Wed, 04 Aug 2010 02:03:10 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 3, 2010 at 5:10 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> On Tue, Aug 03, 2010 at 07:58:11PM -0400, Denys Dmytriyenko wrote:
>> On Tue, Aug 03, 2010 at 11:17:26AM +0200, Koen Kooi wrote:
>> > -----BEGIN PGP SIGNED MESSAGE-----
>> > Hash: SHA1
>> >
>> > On 02-08-10 22:19, Frans Meulenbroeks wrote:
>> > > This patch removes all occurrences of
>> > > do_stage() {
>> > > =A0 =A0 =A0 =A0 autotools_stage_all
>> > > }
>> > > including all kind of variants w.r.t whitespace
>> >
>> > [..]
>> >
>> > > my proposal would be to apply it, and if there are a
>> > > few recipes broken after that, accept is as collateral damage and fi=
x
>> > > it afterwards.
>> >
>> > Agreed
>> >
>> > Acked-by: Koen Kooi <koen@openembedded.org>
>>
>> First collateral damage - libxcb was broken, due to xcb-proto.inc having
>> do_stage(). Worked with Khem to find the cause and thanks for pushing th=
e fix:
>>

I dont think this has been pushed yet. I have it staged in my tree though
I am building from scratch lets see.

>> http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3Db0061845=
a60d7781f9287ae6955585485f5ba8e9
>
> BTW, just wanted to mention - if corresponding PRs had been bumped, it wo=
uld
> have been spotted sooner and not only by people with clean TMPDIR... :)
>
> --
> Denys
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


