Return-Path: <otavio.salvador@gmail.com>
Received: from mail-we0-f169.google.com (mail-we0-f169.google.com
	[74.125.82.169])
	by mail.openembedded.org (Postfix) with ESMTP id B109171633
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Feb 2015 17:06:41 +0000 (UTC)
Received: by wevk48 with SMTP id k48so26561923wev.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Feb 2015 09:06:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=BlbrKSR+CqEzP6HCfCQSCcSbzIIVqEpRKxICGCe/ApU=;
	b=x11Cn59pp0nBAXFH1oLn66qsM+e/6VERbvm+fnIlDueHa8f+YYXFD4kZPNmyk/FMKn
	iCNLtCciq9Aq+VMAMqhZLrsS23MW/ubCZhKlGPksMzJSjlCZdYcmTv3kir6a7PPnoC2p
	QlQ8GVWimnrNizgJy7ZWz5Sk8cdNWnZ1b8JMFSxmuS6izv1e7WKVVPMZ+8ZiXXCeFgzL
	xUreqgbZ6feUAqpw4TCenIixWOSILyW9tH/+nDPuD9q6NHNkdYXYHDURxBO8NMylQK85
	yEJyWe85a5nCt2+hP7UaPvY4m6/FTYdmiMquXS7s3+KaCjV0k7RFp80Ao1Ju1EJQRmpH
	39uw==
MIME-Version: 1.0
X-Received: by 10.180.104.3 with SMTP id ga3mr31409282wib.66.1424797601837;
	Tue, 24 Feb 2015 09:06:41 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.27.11.18 with HTTP; Tue, 24 Feb 2015 09:06:41 -0800 (PST)
In-Reply-To: <F81DC1078564A34BB4DA30CAE03814D127697625@ORSMSX104.amr.corp.intel.com>
References: <F81DC1078564A34BB4DA30CAE03814D127697625@ORSMSX104.amr.corp.intel.com>
Date: Tue, 24 Feb 2015 14:06:41 -0300
X-Google-Sender-Auth: KHTGwO1wPJ26L4_JmTBQPRgKYt4
Message-ID: <CAP9ODKpdNS16hMUpiuogNna=YpO-m8LgCD5O87XBKFysKeQH3Q@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: Why no recipe for openjdk-headless?
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
X-List-Received-Date: Tue, 24 Feb 2015 17:06:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 24, 2015 at 4:00 AM, Bruce, Henry <henry.bruce@intel.com> wrote=
:
> I'm putting together an OS image that includes  a Java headless applicati=
on. Having used the openjdk7-jre-headless package on Ubuntu I was hoping to=
 find a matching recipe, but sadly none exist,.  The openjdk7-jre recipe re=
quires the X11 distro feature which adds unnecessary luggage for a small fo=
otprint IoT solution. Thanks to a bbappend from https://github.com/woglinde=
/meta-java/issues/45 I can minimize footprint, but a headless recipe would =
be a better solution.  I'm fairly new to Yocto so could someone explain the=
 challenges of a headless recipe and where one might start when creating on=
e?

Patches are welcome. I think the link you posted has a good base of
work done so you could start there and later follow the README file to
post the patches here.

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

