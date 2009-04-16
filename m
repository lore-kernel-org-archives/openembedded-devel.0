Received: from [209.85.132.246] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1LuQrT-00060p-Qk
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Apr 2009 14:38:41 +0200
Received: by an-out-0708.google.com with SMTP id b2so980901ana.42
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Apr 2009 05:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=hubMbu4vE5+OMLZamFrF0QYX3P0vfnKxcDoN9HVQV4E=;
	b=d5UBMp7yQjAlshtLhU58brF9J9WrYyrAsuQUcSJFQMkEWCmeGJqgRnlNQxFiVoL8Ld
	ly2QgOK1fB3+rwEmZ8Qj28v17uYb9t0zibKtiynLKEo7V0fVQcd92FstLbLmq3zBGcZK
	oBZnNoElWVTNDN0/LFAowU6Y5E/CT9uk3evPQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=aaLoKNROE/pWaF7fjz+gpsxuXXPTbAxrFKDZmOXjl+BcDJsrCH+S86L/Y6Pjo3smNQ
	tn/JZNT/lYZTqKBr5ewLozlJ4QPHK6xTBdH0xojUa+tTbaaM4lmKlgIyUhAZBuB4FjI3
	QojQTo29bZl949peapUvyfNKk8IHA6gvvqD8Q=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.100.173.18 with SMTP id v18mr1624614ane.84.1239885275962; Thu, 
	16 Apr 2009 05:34:35 -0700 (PDT)
In-Reply-To: <20090416000646.GB2118@denix.org>
References: <20090414234609.GA27890@denix.org>
	<1239752998-7677-1-git-send-email-denis@denix.org>
	<gs3vuj$8tl$1@ger.gmane.org>
	<200904150854.04328.hs4233@mail.mn-solutions.de>
	<20090416000646.GB2118@denix.org>
Date: Thu, 16 Apr 2009 09:34:35 -0300
X-Google-Sender-Auth: 571d3480c3bdcb00
Message-ID: <be7a9f3d0904160534s3f0c87fep88051546f0184af5@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.132.246
X-SA-Exim-Mail-From: otavio.salvador@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=AWL,BAYES_50,RDNS_NONE
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] udev 124: add cache invalidation logic on kernel change or its bootargs/cmdline
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
X-List-Received-Date: Thu, 16 Apr 2009 12:38:42 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 15, 2009 at 9:06 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> On Wed, Apr 15, 2009 at 08:54:04AM +0200, Holger Schurig wrote:
>> > On 15-04-09 01:49, Denys Dmytriyenko wrote:
>> > > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 mv /tmp/uname /etc/uname
>> > > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 mv /tmp/cmdline /etc/cmdline
>> >
>> > I think we should put those in /etc/udev or /var/lib/udev if
>> > udev will be the only consumer.
>>
>> +1, e.g.
>>
>> /etc/udev/saved.uname
>> /etc/udev/saved.cmdline
>
> Good point, I'll be sending the update. Are there any other
> comments/suggestions?

It would be nice to, while on that, evaluate the possibility
of updating udev; 0.141 fixes a serious security whole
and even if most embedded systems usually runs as root,
there're many that doesn't.

--=20
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


