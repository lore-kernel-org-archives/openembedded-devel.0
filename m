Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P5lx3-0007dA-8G
	for openembedded-devel@lists.openembedded.org;
	Tue, 12 Oct 2010 23:00:02 +0200
Received: by iwn2 with SMTP id 2so1541091iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Oct 2010 13:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=FLDXxoZV+GAmByE/6NAFVAumGbXkhuBH1NFHel3GUzI=;
	b=RQlPFEhsko1YkwquKXL1ct+uU3RWDUyO/wmHbiZpw48Ii6rijrLcbmiQinNcFPZOEB
	ljfCkzp7CBOepZoA2WYaWxKvJF3MIP34flvRrf1cg/VajtyQtA8FEVP76kqnnHk7yjKo
	3VJsPhMVAZjiP7UO4En4goYRnVDQT1sg+cR4M=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=V3B3KqZXlvtE9owq1sIMvaRgqE1BktFOfdxcoE7QoC9jk7Dfvjjg+6IDY9PQBY4csm
	zYrLhYmrziTyroO2BnBAVW1wq9QKJW7lBbT+WI+FsLKRUAG6L5Nq9Uchl8D4l8yIUD7g
	UOeJwsTHHbTEbRu9aC14ay1N+qiOhgSWXCNwI=
MIME-Version: 1.0
Received: by 10.231.10.139 with SMTP id p11mr6256733ibp.179.1286917170073;
	Tue, 12 Oct 2010 13:59:30 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Tue, 12 Oct 2010 13:59:29 -0700 (PDT)
In-Reply-To: <4CB494D5.3010900@mentor.com>
References: <4CB48C51.9000403@mentor.com> <i9234d$dh4$1@dough.gmane.org>
	<4CB490CD.50500@balister.org> <4CB494D5.3010900@mentor.com>
Date: Tue, 12 Oct 2010 22:59:29 +0200
Message-ID: <AANLkTikijb=EDX3EKjQ+jaAPbd=_=-E7bvq=ETd87dPA@mail.gmail.com>
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
Subject: Re: [RFC] Remove older freetype versions
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
X-List-Received-Date: Tue, 12 Oct 2010 21:00:03 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/10/12 Tom Rini <tom_rini@mentor.com>:
> Philip Balister wrote:
>>
>> On 10/12/2010 12:41 PM, Koen Kooi wrote:
>>>
>>> -----BEGIN PGP SIGNED MESSAGE-----
>>> Hash: SHA1
>>>
>>> On 12-10-10 18:26, Tom Rini wrote:
>>>>
>>>> Hey all,
>>>>
>>>> I'd like to remove all versions of freetype before 2.4.3. =A0The only =
dist
>>>> which is pinning freetype currently does so via
>>>> conf/distro/include/preferred-opie-versions.inc and that pins to a
>>>> non-existent version (it's using OPIE_VERSION which seems wrong). =A0A=
ll
>>>> of the previous versions have various security issues, including
>>>> remotely exploitable ones. =A0Only the very oldest version we have as =
a
>>>> D_P -1 so everyone was using 2.3.12 and will be going up to 2.4.3
>>>> (libraries are compat).
>>>
>>> Speaking of freetype, the bytecode patent expired, so we can turn that
>>> on and get nicer text :)
>>>
>>> And removing older freetypes is a good idea
>>
>> I'd like to point people at openwmbedded/removal.txt. This would be a go=
od
>> place to schedule things for deletion. As in I added a new version and m=
ade
>> it active, but do not want to delete the older version for a couple of
>> months just in case something crops up. So leave a note in removal.txt t=
o
>> look are removing a recipe on a certain date.
>
> In general, good idea. =A0But we've been doing things a lot quicker more
> recently. =A0And I'd like to not wait for a long time for security relate=
d
> items.

I agree with Tom on this, especially for security related issues.
I'd say removal.txt is mostly for removal of distro's, last versions
of recipes etc.
removal of older minor versions is imho at the discretion of the
maintainer of a recipe (and if there is none known, I feel it is best
judgement)
for majors some additional care is to be taken, but when it comes to
security related issues, I feel we should give priority to security.
Maybe we should discuss the removal policy at OEDEM.

Meanwhile for this proposal:
Acked-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>


