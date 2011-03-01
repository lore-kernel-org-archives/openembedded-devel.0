Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1PuT0A-0001YT-Ry
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Mar 2011 18:04:46 +0100
Received: by bwz10 with SMTP id 10so4736518bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Mar 2011 09:03:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=SWSRd4PiK2aVJqpUZecp3QtsPbKBpZ8E30MnYxv2wfk=;
	b=pq+5PkusU6izKrNCBBPvzVBj9yGDznYZ0O8Zq+YyO1NTLxVzN1WDQa/pPmbBVGxhC2
	SNnq77QlP32UBO1UX4KHoaRxVHa+wo5Qf7PeUzriwJ1xuWx34ah4nOv+iQa2z/CzcS0i
	Jw6xwZQF7KlGjozFqJW6mz7NFCmjz/XF/0oqI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=ICx1VNaxx/cP6oWVVQ132zw4Iv3FMvV832YxUdMxk2Gl334DegiYd2kuJpXHS9+XBI
	MdC58PQvDwkdNrlVXikWF3HiLgFV6TpICTm1gZq11fDYgvYpKNhj+UJ/sagYyTN+wSIq
	MzrmxmW3asN1Z/2PA9HRfgHloKKmHajiPNgZg=
MIME-Version: 1.0
Received: by 10.204.64.139 with SMTP id e11mr6295662bki.97.1298998999971; Tue,
	01 Mar 2011 09:03:19 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.119.207 with HTTP; Tue, 1 Mar 2011 09:03:19 -0800 (PST)
In-Reply-To: <4D6D19AD.5010505@mentor.com>
References: <1298970609-4974-1-git-send-email-Martin.Jansa@gmail.com>
	<4D6D19AD.5010505@mentor.com>
Date: Tue, 1 Mar 2011 17:03:19 +0000
X-Google-Sender-Auth: S2ExuvRqMb7_frWj4JOuRCr6oUM
Message-ID: <AANLkTinXnoSaJDqBSMHp2V0xA1Wbku1ktx3UKh37KV8=@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] sane-toolchain-*: add -g to FULL_OPTIMIZATION to make -dbg packages more usefull
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
X-List-Received-Date: Tue, 01 Mar 2011 17:04:47 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 1, 2011 at 16:07, Tom Rini <tom_rini@mentor.com> wrote:
> On 03/01/2011 02:10 AM, Martin Jansa wrote:
...
> And personally I'd like to see the -g flag (for both target and the rest)=
 be
> a variable that can be tweaked as needed (for more or less debug in the
> area).

Having -g shouldn't hurt since the debugging symbols end up on the
-dbg packages. Why having it "disabled" by default?

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


