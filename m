Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P4XTk-000613-ND
	for openembedded-devel@lists.openembedded.org;
	Sat, 09 Oct 2010 13:21:13 +0200
Received: by iwn7 with SMTP id 7so669982iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Oct 2010 04:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=q8ULBNBvDR1hoQWdWkDB9yCa1aKXnrL2OiNMYyChwhc=;
	b=oe0vztS+WwdWNfCxaOZDPEpbVb4pvjIjm5QTe+F4RnKMcxcP8P6KF0gGQhVcXb3JKd
	HCVSTNMgeWRinS7paF09nRM2HK4iIpitGHpYVdqlyrwaNqc0ZlrUNuZYF+gH0DpCvtbe
	ze4hJuPI5mDu1PJa25cTmaVYiMDqQNkIvXIjM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=M9KNOL+Ybb2p1j+KQ6L07qRan1MEYjTPTovRrN6aWB7IK8VGnOnHohpAkTfZnVFIw3
	xCPL933K4vyjYxsQDsC0Qp01IrjyaZU404sepKJcX7nKGKKY1dqwaDQd/I6swCf48KPW
	sNyWfXju7UHCbcrACShswKwfgwinuYXcp/5eU=
MIME-Version: 1.0
Received: by 10.231.155.7 with SMTP id q7mr3274331ibw.105.1286623216993; Sat,
	09 Oct 2010 04:20:16 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Sat, 9 Oct 2010 04:20:16 -0700 (PDT)
In-Reply-To: <i8pgqr$8n1$2@dough.gmane.org>
References: <AANLkTin=ucR4=4zJQg=thwRbqehhCzRa-DE6NwCGb76R@mail.gmail.com>
	<AANLkTi=eg==2A_jTuUcqYtbvE1B6mBtqi28qKetGH9B-@mail.gmail.com>
	<i8pgqr$8n1$2@dough.gmane.org>
Date: Sat, 9 Oct 2010 13:20:16 +0200
Message-ID: <AANLkTins9qf9rSMyH3WpRfV9qqzmDZztFnoLysBQtYhJ@mail.gmail.com>
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
Subject: Re: recipy_sanity experiment
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
X-List-Received-Date: Sat, 09 Oct 2010 11:21:21 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/10/9 Koen Kooi <k.kooi@student.utwente.nl>:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 09-10-10 00:58, Khem Raj wrote:
>> On Fri, Oct 8, 2010 at 1:23 PM, Frans Meulenbroeks
>> <fransmeulenbroeks@gmail.com> wrote:
>>> Dear all,
>>>
>>> as a test I decided to run recipe_sanity on our tree, and here are the =
results
>>> There are 1801 warnings:
>>
>>
>> interesting data
>>
>>>
>>> =A0 =A0954 candidate for removal of S
>>> =A0 =A0373 LICENSE should be defined to something other than default (u=
nknown)
>>
>> this should be fixed first.
>
> Speaking about licenses, we should make recipe sanity complain about
> LICENSE =3D "GPL" as well, since it's important to know wether it's GPLv1=
,
> GPLv2 or GPLv2 (and their "or later" cousins).
>
> regards,
>
> Koen

True. This is an interesting challenge though:
frans@linux-suse:~/oe/openembedded/recipes> grep "\"GPL\"" */* |wc
   1938    5716   87234
They are all LICENSE strings of the format LICENSE =3D "GPL".

I'm starting to think more and more that it might be useful to define
a kind of standard (or minimal requirement or so) for recipes, and
that we should identify these one way or another (e.g. because they
are in a separate dir, or have a header fiield or so).

Frans


