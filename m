Received: from mail-yw0-f176.google.com ([209.85.211.176])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Nr70a-00038y-AL
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Mar 2010 10:55:02 +0100
Received: by ywh6 with SMTP id 6so1777666ywh.16
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Mar 2010 02:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=oW9ezytv0qmwIqUd8p4X6oLb+wjecZlosuNSKNTbK9o=;
	b=atVXvmYOLdB/Ut//m3rHRLvOf//q/4xYm34QB76c27KVb4SBJeAOOYefVc2O/22kk6
	Z8fNjIX9+N9D/HQObLFwBu/qKIRsgsl/DcIXoyQJiWu1f/NOBi0yFsm7RuVxQHMZzDi0
	Tqey/u+r8KaM8TSLnw7ucsWjl5CVDFkscsDUI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=rLeO+j4Hlk9/YYKoT0eioyv/0BVWwjV3Cb2MquYR/pYl0nibgTdETA78mKV3XAVobQ
	KawguZ1dyNp+1df2GSdx6n2SdrV26NRxuXbWx6WzOHVs96Oeahccm+72SYpthfdAXXUI
	07QgNKrKkKn7uDtOL54WrZ4q6HC1MrhOsKNkc=
MIME-Version: 1.0
Received: by 10.101.175.31 with SMTP id c31mr5366291anp.99.1268646693936; Mon, 
	15 Mar 2010 02:51:33 -0700 (PDT)
In-Reply-To: <hnkunp$sju$1@dough.gmane.org>
References: <201003081300.19058.holger+oe@freyther.de>
	<201003150446.26284.holger+oe@freyther.de>
	<ac9c93b11003150030i69015e69t78a3b16e6c11d2e5@mail.gmail.com>
	<201003150846.33517.holger+oe@freyther.de>
	<hnkunp$sju$1@dough.gmane.org>
Date: Mon, 15 Mar 2010 10:51:33 +0100
Message-ID: <ac9c93b11003150251w3ca229d6uedc63c4dae21e52f@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.211.176
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: samba-essential upgrade or remove?
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
X-List-Received-Date: Mon, 15 Mar 2010 09:55:05 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/3/15 Koen Kooi <k.kooi@student.utwente.nl>:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 15-03-10 08:46, Holger Hans Peter Freyther wrote:
>>
>> I think we have at least three options on how to deal with it:
>>
>> 1.) Put a big fat warning on Openembedded.org saying it should not be used for
>> users that have network connectivity or might put a SDcard/Storage with
>> content on a device as we don't care about fixing vulnerable software.
>>
>> 2.) Adopt a policy of addressing vulnerabilities in our defaults right away..
>>
>> 3.) Remove recipes for vulnerable software when no one is updating them in
>> time... This can be combined with option 2...
>
> I don't think 1) is a realistic option, if we go with that, we should
> just redirect oe.org to buildroot.org and go home.

Why is it not realistic.
Lots of driver code I get from commercial vendors, contain statements like
"this is sample code only, not intended for use in products, proceed
at own risk, bla bla bla".

And frankly speaking I doubt that we have the resources to actually
make sure that we fix all known security vulnerabilities shortly after
a fix becomes available.

So a +1 for having a warning on the OE website. Actually I would
suggest repeating the message on the getting started page
(http://wiki.openembedded.net/index.php/Getting_Started)

(and of course each distro can decide on their own whether they want
to have such a warning on their website or not).

Frans

>
> I my vote goes to 2) and I like 3) as well.
>

> regards,
>
> Koen


