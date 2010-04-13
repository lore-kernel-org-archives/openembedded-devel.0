Received: from mail-yw0-f197.google.com ([209.85.211.197])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ttkrpink@gmail.com>) id 1O1ke3-0004Rc-4I
	for openembedded-devel@lists.openembedded.org;
	Tue, 13 Apr 2010 20:15:32 +0200
Received: by ywh35 with SMTP id 35so2646163ywh.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Apr 2010 11:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:received:message-id:subject:from:to:content-type;
	bh=YVyZOcReG8Ve0889ssdLEXHh4khpgCenvCG8jALlRWQ=;
	b=XFB0w7brJUTs28lLJ0Jh6rPjPsqw/TUDq39KcgughCQT2/oRZ6tF6wBdPW9SNCeJye
	fu1OrLm3t1t6Ml8XwS43KOAC+V/qNfc47mu0mTeSiBX83X9x6EfxY6XrGJ6ToZWCrGiK
	jHLJVfsN1uOyY16gZ9ve1TjTZmJsk3rFkmsgI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=dxL7eN8BA1AWqWUUIX4H0+U+10+1L764JeEpb7BgUPnYauivAYNTP5q05eHPtH8+w9
	+50HiruV9EL7Z22LKhdyxhZ+JvFx/Q2a+JS6Lsh6mO3HOpSVvon2MkVAmxmkAnaVxDlG
	RSgMSaeklZDF2flhCEWpCJyO8bqGkydr/xU34=
MIME-Version: 1.0
Received: by 10.100.152.3 with HTTP; Tue, 13 Apr 2010 11:12:02 -0700 (PDT)
In-Reply-To: <p2nbc36f8ed1004130541g42d4993eh41ec17dc46ca07ec@mail.gmail.com>
References: <s2ud2a86f8e1004122027pf357420tc3cc7d0aea062740@mail.gmail.com>
	<201004130929.43327.roman@khimov.ru>
	<g2hd2a86f8e1004130509sf3133ec2hb730e20abf586cf@mail.gmail.com>
	<p2nbc36f8ed1004130541g42d4993eh41ec17dc46ca07ec@mail.gmail.com>
Date: Tue, 13 Apr 2010 13:12:02 -0500
Received: by 10.101.211.25 with SMTP id n25mr11465995anq.169.1271182322090; 
	Tue, 13 Apr 2010 11:12:02 -0700 (PDT)
Message-ID: <k2ud2a86f8e1004131112h485013d3i8483b9cf794bf0b6@mail.gmail.com>
From: ttk rpink <ttkrpink@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.211.197
X-SA-Exim-Mail-From: ttkrpink@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: OE failed at task 8045 of 8046
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
X-List-Received-Date: Tue, 13 Apr 2010 18:15:32 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Mickael,

Thanks for your info.

When I used IMAGE_LINGUAS =3D "en-us" in the bb file, I had that error
message. So I put the default value back, IMAGE_LINGUAS =3D "de-de fr-fr en=
-gb
en-us pt-br es-es kn-in ml-in ta-in". It does not complain about opkg-cl
anymore, even though other error is showing now.

Thanks again for answer my question.

ttk



On Tue, Apr 13, 2010 at 7:41 AM, Mickael Chazaux
<mickael.chazaux@gmail.com>wrote:

> Hi,
>
> 2010/4/13 ttk rpink <ttkrpink@gmail.com>:
> > | + xargs opkg-cl -f
> /home/setup/stuff/tmp/staging/i686-linux/etc/opkg.conf
> > -o /home/setup/stuff/tmp/rootfs/beagleboard-demo-image -t
> > /home/setup/stuff/tmp/rootfs/beagleboard-demo-image-tmp -nodeps install
>
> I had a simuilar issue a few time ago. I reported it here :
> http://bugzilla.openembedded.org/show_bug.cgi?id=3D5397
>
> Hope this helps,
>
> Regards,
>
> Mickael Chazaux
>
> Adeneo Embedded - Adetel Group
> 2, chemin du Ruisseau
> 69134 ECULLY - FRANCE
> T=E9l. : +33 (0)4 72 18 08 40 - Fax : +33 (0)4 72 18 08 41
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

