Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PD3aD-0001ff-VC
	for openembedded-devel@lists.openembedded.org;
	Tue, 02 Nov 2010 00:15:19 +0100
Received: by iwn42 with SMTP id 42so7222418iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Nov 2010 16:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=0PBSpCk6iWRb5UGm45sITn3XyycXVso4Z+7yBkKst3U=;
	b=NAW2T6Z55zABwAl8MurOZrgTjoS5yFYNf45Xb6Ui/9eDU5nOeye/sF40oCvpJdGmpo
	m/nXr/EeBlXtnx7Oa8cYbFeAUnBBYg4Y2Sr3b6uyp8vAteAc1HbpkKXGY+eReyXvsIxs
	1QbOYq+p6wci6LrYILfdFTbitoFVCqbi3ocBY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=OyES0WPYwxoc+VaQXiwf0fIAUoWUR0TE6kF9m1O4/rxNHAxsph8T69u+fsV1hlfLwa
	NCIUM35hPQSePM1OcH6HeCW/iGoCzx4kJL49jkrMkKkf149ShH6nz8NSI//8nsJvbZsJ
	UCjnUAfpLe3je/hU2bxsSaboCEr5sVVunxJxE=
MIME-Version: 1.0
Received: by 10.231.33.71 with SMTP id g7mr257643ibd.54.1288643020408; Mon, 01
	Nov 2010 13:23:40 -0700 (PDT)
Received: by 10.231.40.13 with HTTP; Mon, 1 Nov 2010 13:23:40 -0700 (PDT)
In-Reply-To: <20101101192422.GA11482@gmail.com>
References: <AANLkTin70=KBJDjW8K6ViS5X03ZaE92680oR88hhy9eK@mail.gmail.com>
	<AANLkTimEKL_6r_DZmq_W2i9eqHPgbRFc-oFMftKNFBJv@mail.gmail.com>
	<iakpd7$ja7$1@dough.gmane.org>
	<AANLkTikQvYRyaMspRo9Skt_jmfNjz2MuOT+ff4wv=a82@mail.gmail.com>
	<AANLkTi=zxQ1AxJ9chbFjLJzps1LB8RCyaNkJk5HApTZ=@mail.gmail.com>
	<20101101183327.GD15069@ibawizard.net>
	<AANLkTimN4Rq2bWZXjs84FUtxNgD_BAQy=5=4gXJqfPGe@mail.gmail.com>
	<20101101192422.GA11482@gmail.com>
Date: Mon, 1 Nov 2010 21:23:40 +0100
Message-ID: <AANLkTin2uOUbo6mU4EJD-xyhJ8GU0e4Kch5=FGp5CEc1@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=unavailable version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: testing branch 2010-10-29
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
X-List-Received-Date: Mon, 01 Nov 2010 23:16:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

2010/11/1 Khem Raj <raj.khem@gmail.com>:
> On (01/11/10 19:49), Frans Meulenbroeks wrote:
>> 2010/11/1 Petr =C5=A0tetiar <ynezz@true.cz>:
>> > Khem Raj <raj.khem@gmail.com> [2010-11-01 10:32:53]:
>> >
>> >> We should add another column identifying the build is from clean tmp
>> >> or an incremental one
>> >
>> > No more columns please. I think, that I should receive a PhD just beca=
use I
>> > can update that table :-) It's pure rocket science...
>> >
>> > -- ynezz
>> >
>>
>> Put the table in a spreadsheet?
>> I think google docs can be used to share access to a common sheet (but
>> not fully sure).
>
> Wiki has good support for tables.

Better than what we have now? The layout somewhat sucks. I'd rather
see it as a table while editing, due to the different width of the
fields used, it is at the moment fairly difficult to match your cells
with the column caption (especially if you are near the end of the
table).

>>
>> Disadvantage of an incremental build is that you need to keep all the
>> tmp dirs around, which, at least for me, is probably prohibitive (I'll
>> verify this later)
>
> Disadvantage for you agreed but may not be for others who have space to k=
eep the tmpdir
> and care about saving time on complete rebuilds or upgrade paths etc.

Oh yes, I fully agree, and I definitely do not want to stop anyone
from doing incremental builds.
The more diverse tests we do the more chance we have to find bugs.

FM


