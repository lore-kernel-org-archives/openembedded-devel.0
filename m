Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PKQJA-0002o6-79
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Nov 2010 07:55:24 +0100
Received: by iwn38 with SMTP id 38so2898733iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Nov 2010 22:54:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=mDpN5KYMONCKd8gedPFMXXz6oOLGzsuwXWV4RM3MYzw=;
	b=FtwZRVD8SbguxclMkW+HE2/yh2D7kNDlw/UGbjLr99mpgfcw7PFno9N8wZKh7NTvAP
	/MQ64YgzQkYi1ktZB2eZZN9iIr3rUh/T1QRxapvJizOBS6ZqRWRmb/Lz6uT/AdMAVin4
	S1p/PQNis7QcTA+8fYC/KwjJZPxJVa0ahaKXU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=MmChqPLpWGD9Hbdx7fKA0lwfe7pcA3xK/0MxebjbQdVKyG33lmsnve7gIgasfd+OQX
	9nXk56qRNs7WYoKnM3aXn+5tlH6NbkIfvCOeLr2G4zwPSMW5nzWSfucIEp+wnht+IQol
	cLGH1fi3yNXQunXYNtRYEcRLzTaDphpXSSzPQ=
MIME-Version: 1.0
Received: by 10.231.144.21 with SMTP id x21mr6412283ibu.126.1290408853306;
	Sun, 21 Nov 2010 22:54:13 -0800 (PST)
Received: by 10.231.33.4 with HTTP; Sun, 21 Nov 2010 22:54:13 -0800 (PST)
In-Reply-To: <AANLkTi=pUsWJCyV8ARjfkvKzHK-gGz+e4Ea8VdOcm3JU@mail.gmail.com>
References: <AANLkTinXYcNN=iozP-aXPDuFzQqM13KDf5my1W6DTap6@mail.gmail.com>
	<4CC500A2.7020702@gmail.com>
	<AANLkTikzjkHxbXd3iCBny0yoNPBVTH4_LyhuYfSpg-SV@mail.gmail.com>
	<AANLkTimXqxS4rCPXuxx=_MhdKfG1yTA8gbnowUEYB0vn@mail.gmail.com>
	<AANLkTimHfcqX1ZkbD+c2gx5ujupyw-hA2mpUf=LJvjcY@mail.gmail.com>
	<AANLkTi=Z8jNP+cQUqNppkju7Fe0K6rEB8nn_GYzuRh6A@mail.gmail.com>
	<AANLkTi=pUsWJCyV8ARjfkvKzHK-gGz+e4Ea8VdOcm3JU@mail.gmail.com>
Date: Mon, 22 Nov 2010 07:54:13 +0100
Message-ID: <AANLkTinM80VFshaN2ZevB9kmLJ6BfLPjLV+UpinCMoyB@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Race issues (lzma-native)
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
X-List-Received-Date: Mon, 22 Nov 2010 06:55:24 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/11/22 Graham Gower <graham.gower@gmail.com>:
> On 22 November 2010 10:42, Andrea Adami <andrea.adami@gmail.com> wrote:
>> I though tthe issue had disappeared (in the meanwhile I remove an
>> obsolete dependency on zlib)
>> but yesterday again...
>>
>> run.SRC_DISTRIBUTECOMMAND was malformed, broken at line 122 (export
>> docdir="/oe/bu ).
>>
>> On second build the size is much bigger (1102 lines).
>>
>> Retrying..
>> Andrea
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>
> With pstaging disabled, do_fetch is called twice. The second do_fetch
> races with do_unpack. Presumably we see a problem in lzma-native
> because it does oe.process.run() in do_unpack_append. I can't see
> exactly *what* is racing though.
>
> I previously spoke to Kergoth about it on IRC and he suggested making
> bb.build.exec_func("do_fetch", d) conditional on whether the do_fetch
> stamp file exists... I've not gotten around to doing that (bad me).
> Want to try it?

Hm.
I don't know the exact details, but this looks like a bandage, not
like a fix for the root problem.
Why is do_fetch called twice in the first place. I would expect this
not to happen.

Frans


