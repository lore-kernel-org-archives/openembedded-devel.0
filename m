Return-Path: <sebastientaylor@gmail.com>
Received: from mail-pd0-f181.google.com (mail-pd0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id F27397018D
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Jul 2014 17:16:12 +0000 (UTC)
Received: by mail-pd0-f181.google.com with SMTP id v10so7502444pde.40
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Jul 2014 10:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to;
	bh=ZzCE2sfAgmUJyS6ErjBBEfQrwN3FDBixB1lKvJ+1InE=;
	b=Np/ViBiCdEfQvAdLZjtDCa0MqIhaZZbN8zUYXxv70x/bElRiJ8GIjFlJj/TVvrxvyl
	3I7Hrq1X/Vwg/08pHtbnNe7KT9KJY+5jEXnC3jR7BdiJzlXt5cf5LEPZby3T7feYel8K
	w7Y8oQzun6Ux8/de+oTzF2NVnx12TyawfdjF++gFu2rziEKwjm5hvWNISebxbzsVgNuB
	8/Qcol8DZT8ZBBKKGMqlmbxvGxRX9YP8sdEWFasDp4LHmsmIZg6vlJqh3/aqEoJpGcwV
	w5mO+8hzBo4iEUH2ZGos7WLUBBDgENp6yMr3JHB0wdi26tQ4M0/PXb2pl5dl0864QmHX
	8vpg==
X-Received: by 10.68.136.226 with SMTP id qd2mr36580619pbb.72.1404839773261;
	Tue, 08 Jul 2014 10:16:13 -0700 (PDT)
Received: from [192.168.1.196] (mail.au-zone.com. [184.70.109.50])
	by mx.google.com with ESMTPSA id
	st5sm42604861pbc.68.2014.07.08.10.16.12
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 08 Jul 2014 10:16:12 -0700 (PDT)
Sender: =?UTF-8?Q?S=C3=A9bastien_Taylor?= <sebastientaylor@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
From: =?iso-8859-1?Q?S=E9bastien_Taylor?= <me@staylor.ca>
In-Reply-To: <CAP9ODKqbMvZ0E8OG1ZoE4EZ0W-iidAJnVSHbeV6JckFacPtAYg@mail.gmail.com>
Date: Tue, 8 Jul 2014 11:16:10 -0600
Message-Id: <FF669780-3DE7-4341-97CF-7B5D673421CD@staylor.ca>
References: <75D00F71-5F69-4506-9190-96C8BD98220F@staylor.ca>
	<90368C38-4B94-4896-A8CA-2B982448700D@staylor.ca>
	<CAP9ODKqbMvZ0E8OG1ZoE4EZ0W-iidAJnVSHbeV6JckFacPtAYg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.1878.6)
Subject: Re: [meta-qt5] populate_sdk_qt5 qconfig.pri
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
X-List-Received-Date: Tue, 08 Jul 2014 17:16:16 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

I have a manual work around that I've been using, I haven't yet looked =
into integrating it with the relocation script for the SDK installation. =
 I'll probably get a chance to do that this week and I'll post an =
update.

I was hoping someone more familiar with meta-qt5 would have a comment on =
it though, is pkg-config with qmake simply not something that has been =
looked at to this point?


On Jul 5, 2014, at 4:12 PM, Otavio Salvador <otavio@ossystems.com.br> =
wrote:

> On Fri, Jun 27, 2014 at 1:01 PM, S=E9bastien Taylor <me@staylor.ca> =
wrote:
>> Hasn't been any feedback on this so just curious if that's because =
this isn't happening for others or they're simply not using features =
that trigger this issue.  This makes using qmake with pkg-config (a good =
way to pull in non-Qt modules into a project) unusable until the =
qconfig.pri file in the SDK installation is manually corrected.
>=20
> Have you fix it?
>=20
> --=20
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


