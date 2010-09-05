Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OsBPy-000291-8l
	for openembedded-devel@lists.openembedded.org;
	Sun, 05 Sep 2010 11:21:45 +0200
Received: by iwn2 with SMTP id 2so3080230iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 05 Sep 2010 02:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=QtQiSOWNMDHNzeDPq9CHqolhE1A3Q0587SBQahQjfnU=;
	b=u/m7ogaoWzkuuJKQdJnxFqFIWyeJNwN5Zqth4BqauyLKd19+uMNV5z5Nq+NLwb+1wk
	k8BJ+gV+21brbFWiHgT1Ha6Se0uNq5UoSJhTp8qMmaUB5IA1QUyLl1yoQ+SrRbKEybOl
	jhwm0Ptr9lBUW6A2oIvRnM5nH2NIekN/qUwaA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=inIr5qGj24GoxfGtKeFjXridKA+Aj+YSHURtBJpdDwI8rji4aXd2oqsu6BCDCBwV58
	joWYasm0Od8FAsSR9Ghz9ejC3V8RoItdf4eOiCGqOVH4HFHCurhHUlBiCn+jMTUIg7Kq
	5PTPpc9M8rqf7nTdQ12zJNGZP9b9unthfUvAk=
MIME-Version: 1.0
Received: by 10.231.12.2 with SMTP id v2mr4144901ibv.99.1283678465038; Sun, 05
	Sep 2010 02:21:05 -0700 (PDT)
Received: by 10.231.208.17 with HTTP; Sun, 5 Sep 2010 02:21:04 -0700 (PDT)
In-Reply-To: <4C835C8E.1000008@eukrea.com>
References: <AANLkTi=j4E6ZLet=qemx-Ec1CaySKLCuzZMDriX9WQ=T@mail.gmail.com>
	<4C835C8E.1000008@eukrea.com>
Date: Sun, 5 Sep 2010 11:21:04 +0200
Message-ID: <AANLkTi=GrTNa2H+UZjM6RrYU6xAx-DZg2KwDix8MzOgM@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL, BAYES_00, SPF_PASS,
	URI_HEX autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: ushare_hg (the leading ushare recipe) does not fetch
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
X-List-Received-Date: Sun, 05 Sep 2010 09:21:45 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/9/5 Eric B=E9nard <eric@eukrea.com>:
> Hi Frans,
>
> Le 05/09/2010 10:41, Frans Meulenbroeks a =E9crit :
>>
>> I tried to build ushare, but it fails to fetch the source.
>> This source is at http://hg.geexbox.org/ushare/summary
>>
>> II'm not a mercurial wiz, still tried a few things, but can't seem to
>> be able to resolve it.
>> Can someone with more hg knowledge peek into this?
>>
>> Meanwhile, I suggest adding a DP of =A0-1 to the hg version. The 1.1a
>> version still builds properly.
>>
> does the attached patch to bitbake fix this for you ?
> (you need to delete the directory in downloads :hg/hg.geexbox.org/ushare
> before).
>
> Eric
>
> diff --git a/lib/bb/fetch/hg.py b/lib/bb/fetch/hg.py
> index d075638..bb156ed 100644
> --- a/lib/bb/fetch/hg.py
> +++ b/lib/bb/fetch/hg.py
> @@ -138,6 +138,7 @@ class Hg(Fetch):
> =A0 =A0 =A0 =A0# Even when we clone (fetch), we still need to update as h=
g's clone
> =A0 =A0 =A0 =A0# won't checkout the specified revision if its on a branch
> =A0 =A0 =A0 =A0 updatecmd =3D self._buildhgcommand(ud, d, "update")
> + =A0 =A0 =A0 =A0os.chdir(ud.moddir)
> =A0 =A0 =A0 =A0 bb.msg.debug(1, bb.msg.domain.Fetcher, "Running %s" % upd=
atecmd)
> =A0 =A0 =A0 =A0 runfetchcmd(updatecmd, d)
>

Alas, this did not help.

NOTE: Running task 520 of 759 (ID: 5,
/home/frans/oe/openembedded/recipes/ushare/ushare_hg.bb, do_fetch)
NOTE: package ushare-1.1a-r1+hg2e40e513a4a0: task do_fetch: Started
NOTE: Fetch hg://hg.geexbox.org;proto=3Dhttp;module=3Dushare;rev=3D2e40e513=
a4a0
NOTE: Task failed: Unknown fetch Error: [Errno 2] No such file or
directory: '/home/frans/oe/downloads/ushare__hg.geexbox.org_2e40e513a4a0.ta=
r.gz'
ERROR: TaskFailed event exception, aborting

This is after removing the downloads/hg dir and all downloads/ushare* files

I have also tried without the proto=3Dhttp; part (as that did not appear
in other recipes using hg://) but that did not make a difference
either.
I have checked and the rev exists.

Frans


