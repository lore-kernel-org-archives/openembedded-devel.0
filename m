Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f178.google.com (mail-pd0-f178.google.com
	[209.85.192.178])
	by mail.openembedded.org (Postfix) with ESMTP id 516B3736C1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Mar 2015 02:08:43 +0000 (UTC)
Received: by pddn5 with SMTP id n5so4441875pdd.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Mar 2015 19:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to;
	bh=5pyK83ceVs2PjuDQUgW+4GylafLuyXH7dP2te8rPY/Y=;
	b=FUWjF3FIbVYaP018qxR//FfGEBVV0nnEUbz2Vk+66mMaMxdESP+QcUJYNzf0E+3bKf
	bRfpr0WCKl9dtzDroJo+NeFqHeJDhjy+MhA9qn3OnK16CXHqZ1CMnB2PydFGN8QKMET7
	R3uxsr9P8LN52zLuCA9Dr5iFKUog/KZKB5Z3IRYlO4WwlBnfdBiVp9UXnf5x1PuiMREe
	NhXEdCs6yutWEN/3p5KobczJ549hkP0oQs07f3ZEXykkDqKDoCyupZRkZwtmIyABCw+D
	SbiPrz0LxJdrRJDYIXd9FJ1FOmmbN+FCb2DMnbw97nCQ+AduXNfAv1KYJbAcLk/I4wZw
	kCZg==
X-Received: by 10.70.131.38 with SMTP id oj6mr64240717pdb.150.1427767725336;
	Mon, 30 Mar 2015 19:08:45 -0700 (PDT)
Received: from ?IPv6:2601:9:3580:84c:4995:8e53:6540:74d8?
	([2601:9:3580:84c:4995:8e53:6540:74d8])
	by mx.google.com with ESMTPSA id
	qa3sm11391760pab.16.2015.03.30.19.08.44
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 30 Mar 2015 19:08:44 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2070.6\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAP9ODKrzSGThUHqiV3dCYxbXJk_m-VeCwpVm54c2f2Zu3vmtAQ@mail.gmail.com>
Date: Mon, 30 Mar 2015 19:08:43 -0700
Message-Id: <A6835A71-8AC7-4456-9C50-24015CBB79FA@gmail.com>
References: <1427742371-19160-1-git-send-email-hugo.saldanha@aker.com.br>
	<20150330202507.GA22676@mail.itconsulting-heinold.de>
	<CAP9ODKoLZAv_ae7vJQ1vL_UPTX_mS9t__42Uac7Nf-6ivnNvHg@mail.gmail.com>
	<3AB4D6A9-5462-4A7D-8C7F-0E7FDE38DD18@gmail.com>
	<CAP9ODKrzSGThUHqiV3dCYxbXJk_m-VeCwpVm54c2f2Zu3vmtAQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.2070.6)
Subject: Re: [meta-java][PATCH] cacao: fix problem with internal garbage collector
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 31 Mar 2015 02:08:44 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> On Mar 30, 2015, at 6:42 PM, Otavio Salvador <otavio@ossystems.com.br> =
wrote:
>=20
> On Mon, Mar 30, 2015 at 10:40 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>=20
>>> On Mar 30, 2015, at 5:45 PM, Otavio Salvador =
<otavio@ossystems.com.br> wrote:
>>>=20
>>> On Mon, Mar 30, 2015 at 5:25 PM, Henning Heinold
>>> <henning@itconsulting-heinold.de> wrote:
>>>> if I remember correctly, than the bdwgc inside cacao differs from =
upstream.
>>>=20
>>=20
>> there must be a reason why cacao decided to fork its own copy. Do we =
know ?
>=20
> I don't. We could compare the versions and see if it has any change.
>=20

we should find the reason before we conclude anything and go one  way or =
other
sometimes differences are very subtle=

