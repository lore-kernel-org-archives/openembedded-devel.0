Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <a.sappia@gmail.com>) id 1PNPJL-0003Wz-7t
	for openembedded-devel@lists.openembedded.org;
	Tue, 30 Nov 2010 13:27:55 +0100
Received: by qwg5 with SMTP id 5so4340742qwg.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Nov 2010 04:26:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=amCczaHIIZpAbgImmMmKEUqt1ek8yNj1z69JQDAS5Zc=;
	b=SHQR/KxfJrWM19mFWmY6U2Uk6MlbvTri362RM5UzH3tWGZ0r85Yw5qUe1N6QKdGio/
	Ji7t/TWM3xYo0x92pSRtc7Q9GsBvy98HeFnE5FC8X1PXz8ZW++UwqY9mYRO3sXpvODiI
	WjOipkA418tmcxxVd7fhHwQT8BdTz1D43MRCI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=Rmsko83NNVQpc/U2F7a60nCA497mz1pj3bcaeQGNGDpTz22Irl0SSnw7Ek61Y/HiES
	zwp7cxza/gumjmPFtHvRfI0sMS0uh5C+iATPr/F8Ep5+tReFRFqgY003uUtFxzD6enB9
	ImJZNDiuw+hy6gv0fv2LsHaL9QX1a7uwfo1fs=
Received: by 10.229.82.80 with SMTP id a16mr5958025qcl.241.1291119990627; Tue,
	30 Nov 2010 04:26:30 -0800 (PST)
MIME-Version: 1.0
Received: by 10.229.10.201 with HTTP; Tue, 30 Nov 2010 04:26:10 -0800 (PST)
In-Reply-To: <AANLkTin1JXvNc0t-HmrQs5z6KbD=2qm+QUTnkWb1BbiG@mail.gmail.com>
References: <AANLkTinNZPKsoML=dAyuXOQ=o_hH=memq8t2eq1P8WD=@mail.gmail.com>
	<AANLkTin1JXvNc0t-HmrQs5z6KbD=2qm+QUTnkWb1BbiG@mail.gmail.com>
From: Alessandro Sappia <a.sappia@gmail.com>
Date: Tue, 30 Nov 2010 13:26:10 +0100
Message-ID: <AANLkTint1-ANmxL57DbtJijjL7tSLTkwj9Cf7MUJCom7@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.216.47
X-SA-Exim-Mail-From: a.sappia@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: psplash customization
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
X-List-Received-Date: Tue, 30 Nov 2010 12:27:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

2010/11/29 Robert Foerster <robert@erafx.com>:
> On Sun, Nov 28, 2010 at 8:51 PM, Alessandro Sappia <a.sappia@gmail.com>wr=
ote:
>
> Alternative packages are chosen based on the ALTERNATIVE_PRIORITY. =C2=A0=
You have
> given yours the same as psplash-angstrom. Increase your priority so it wi=
ll
> be the preferred alternative.
>
> Additionally, you should look into amend.inc for cases such as this. =C2=
=A0It
> allows you to tweak recipes in your overlay without duplicating the entir=
e
> recipe.

didn't find any doc for it. (just some mail archives talking about
amend.bbclass)
do you have any more information on amend ?

Regards

Alessandro

--
Alessandro Sappia
a.sappia@gmail.com


