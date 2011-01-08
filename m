Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1PbY8T-0007Yq-CH
	for openembedded-devel@lists.openembedded.org;
	Sat, 08 Jan 2011 13:43:09 +0100
Received: by bwz10 with SMTP id 10so17273632bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 08 Jan 2011 04:42:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:sender:received
	:in-reply-to:references:date:x-google-sender-auth:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=5ekUBGv/bm5pKh3t8SVsC1EjUJIJmfv4kdNtKMeJ3EQ=;
	b=tj9dlUWzhpptByt0L/6TsWySl6TSfu1r9rJo6/8u6psb5z5KGASqc9cbCsR3/ifbaH
	g4wYwXB+g+Dw70VRwx7dn1Fi0bc7a3BpUelo9wXwbepAxBi9vfxeYSOraLmzxuvVjFU6
	FJdZStu4TPqVsdBaeVEbRauFl97nur+wsPaio=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=W639WIurhtnTWnT9eLNkS2hGKhMvp9PtQmrJY/7NEvo6HpHcFjoqj6ItX5qeH1feeO
	fWkdEiOwMBvIE2L0Gpb83txywZkGWo9FrjInzIYbkkNiNeoD14QLulfmzp+LUrhau0tH
	giCgAHcEGdW/Y2wip3vzZXVyrO9lDvsT+J6NE=
MIME-Version: 1.0
Received: by 10.204.71.141 with SMTP id h13mr7900783bkj.180.1294490563699;
	Sat, 08 Jan 2011 04:42:43 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.59.147 with HTTP; Sat, 8 Jan 2011 04:42:43 -0800 (PST)
In-Reply-To: <AANLkTimTMhbbVskXqkdejGREQFhZe8aayNY8S2D_8L6C@mail.gmail.com>
References: <1294392497-24747-1-git-send-email-raj.khem@gmail.com>
	<AANLkTi=UUDxkTNDoWBoOxaCPDyupG8BazYtt6nGs3-7E@mail.gmail.com>
	<4D272079.5000402@opendreambox.org>
	<AANLkTikTFe9ytvKcD1T=_L8GFiPo5bqBQ2o29McmzYU4@mail.gmail.com>
	<AANLkTi=SAg9i3VVH4Ac81ap0EtjXuMhs918uPyEsCknv@mail.gmail.com>
	<AANLkTimTMhbbVskXqkdejGREQFhZe8aayNY8S2D_8L6C@mail.gmail.com>
Date: Sat, 8 Jan 2011 10:42:43 -0200
X-Google-Sender-Auth: bwid4UNOZgECBy6_QpydpkXtAq4
Message-ID: <AANLkTikLTLXRDQuMX8ag4zjY5QsNg5eBkaciN8Nmekvv@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] eglibc: Make it configurable by tuning eglibc options
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
X-List-Received-Date: Sat, 08 Jan 2011 12:43:09 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 7, 2011 at 17:29, Khem Raj <raj.khem@gmail.com> wrote:
> On Fri, Jan 7, 2011 at 10:15 AM, Otavio Salvador
>> We can use DISTRO_EGLIBC_FEATURES or DISTRO_LIBC_FEATURES (so we can
>> add to uclibc support for it too). Spliting it from DISTRO_FEATURES
>> makes sense IMO since we'd use the same concept to recipes (as
>> busybox) that are ofthen customized.
>
> so what would be difference between DISTRO_FEATURES and DISTRO_EGLIBC_FEA=
TURES
> and what will be their relation

I think makes more clear it is distro related.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


