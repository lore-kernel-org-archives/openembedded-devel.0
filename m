Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1ObjGe-00044h-O8
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Jul 2010 02:04:07 +0200
Received: by iwn34 with SMTP id 34so7449963iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Jul 2010 17:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=2teUuiJuV3WipONYyFl3uiZYW0dGqMBYGVb4KTdq8eE=;
	b=elHQHEU8q4JHq4DUP5/hPZGoaBVPjXAu0PcZ801B5aL9H3XxBazvxEei87jPiEUzc4
	alzx/OJQ7oIcyxXIfaOYWk1CrJ4aLct8n5qYHE0EoAoIZCrYAzSx4F3HP2TBChtVaLE2
	gY64j9fBMutx1wZnafyo87bSEsShVnyBRKwHo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=g9XUHpQIU7ReekZyHRlWjJ3o+0gDPj0vDcqXNkR6kT+X39Wz4oYfTdk3cXmSg9M1oI
	gCPIP7Ss2SFty6nqj9qqQNkgIrm6cNijdROiRVWpQHdOnTYU8xW8a/3GXTZTug1re/g+
	jtdeWIh+TnSyUwMkF1Z0FyKXPDJHIzjqQcOFA=
MIME-Version: 1.0
Received: by 10.231.183.10 with SMTP id ce10mr772944ibb.96.1279757034696; Wed, 
	21 Jul 2010 17:03:54 -0700 (PDT)
Received: by 10.231.145.77 with HTTP; Wed, 21 Jul 2010 17:03:54 -0700 (PDT)
In-Reply-To: <4C475AC4.6010302@gmail.com>
References: <4C4704CB.2010204@gmail.com> <i275t3$65g$1@dough.gmane.org>
	<4C475AC4.6010302@gmail.com>
Date: Thu, 22 Jul 2010 09:33:54 +0930
Message-ID: <AANLkTimMZU5mXUn1ZSFJ0_8aDu8ykWYDXMD55iZW8s7A@mail.gmail.com>
From: Graham Gower <graham.gower@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: opkg : angstrom fails console-image build
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
X-List-Received-Date: Thu, 22 Jul 2010 00:04:08 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 22 July 2010 06:08, Marco Cavallini <koansoftware@gmail.com> wrote:
> Koen Kooi ha scritto, Il 21/07/2010 18:05:
>> On 21-07-10 16:31, Marco Cavallini wrote:
>>> Anybody could explain what's happening with opkg in OE recently please?
>>> I saw a patch in ML and I wonder if it will be pushed in order to solve
>>> this problem.

I assume you're referring to my cleanup patch. This patch doesn't fix
any breakages, its just a simplification.

>>
>>> =A0http://pastebin.com/NhtAP0Re
>>
>> It looks like you have a local diff to install 'opkg' as well as
>> 'opkg-nogpg-nocurl', which breaks. Solution: remove your local diff.
>
> Thank you for answering.
>
> I'm sorry but I dont' understand what do you mean with "local diff", I'm
> using a clean OE org.openembedded.dev branch.

You have an 'opkg' package and an 'opkg-nogpg-nocurl' package. As far
as I can tell, if you had built from a clean dev tree then there would
be no 'opkg' package. Angstrom currently uses opkg-nogpg-nocurl, so
that is the only package you should have.

This indicates that you have a non clean dev tree, or have had a non
clean dev tree in the past. If you've done a build in the past with
patches applied, then you've reverted the patches, you probably need
to remove your temp dir and start the build again.

-Graham


