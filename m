Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PKzMs-0005lg-DU
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Nov 2010 21:21:35 +0100
Received: by ywo32 with SMTP id 32so658934ywo.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Nov 2010 12:20:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=0xIKnxYodYzJocNSx45FY9xaKUF+oaxlH1dwiIFWlBc=;
	b=N/K/8aqzLqKtYagEvSrZr0D+FWKD4BdiIRIOj/23YVkJag7hPplF+/arNvmhVL5DJb
	bUb8KHc4XRXonGG4AnQsfq+yTLe/6A8uL+s+FpQkpWr3c/usQbpGAc1jpNzoDLRzoz++
	jIvtOFLtsTjfEYbUsl4WHxz3gZJdQh+6INHt8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=p4+Qwzbjik5STxUcYDGYZjYYoQjB8O510XAR5xOye1YhU1941Qw3zbo8cYceFH4A9l
	7g7iEGM9NNPgVU4a7XhQ9tVKUlhBL4TKtRx6/0+mNvVayAiE7sY1shCkSbwYnop7viCV
	8Ht3iw48WN/uImx3zaeqnENQZcAnr7Vrf45MU=
Received: by 10.91.12.18 with SMTP id p18mr7840665agi.48.1290543619463; Tue,
	23 Nov 2010 12:20:19 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.120.8 with HTTP; Tue, 23 Nov 2010 12:19:59 -0800 (PST)
In-Reply-To: <4CEC1E17.1030208@sensortherm.de>
References: <4CEC1E17.1030208@sensortherm.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 23 Nov 2010 12:19:59 -0800
Message-ID: <AANLkTinhykFBHcgJR5suXU8Q7op+FOxofExY-d42XmYw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: I've downloaded oe
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
X-List-Received-Date: Tue, 23 Nov 2010 20:21:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 23, 2010 at 12:03 PM, Klaus Schwarzkopf
<schwarzkopf@sensortherm.de> wrote:
> Hi,
>
> i've downloaded oe with this script (thanks frans):
>
> #!/bin/sh
>
> export OE=3D/home/klaus/development/oe/
> export BBPATH=3D${OE}build:${OE}openembedded
> export PATH=3D${OE}bitbake/bin:${PATH}
> export MACHINE=3Ddm355-evm
>
> RECIPES=3D"${OE}/openembedded/recipes"
> LOGFILE=3D"fetchsrc.log"
>
> #Find recipes how changed this week
> #FIND_OPTIONS=3D"-atime 7"
>
> for i in $(find ${RECIPES} -name '*.bb' -type f ${FIND_OPTIONS} | sort )
> do
> =C2=A0 =C2=A0 =C2=A0 =C2=A0echo $i
> =C2=A0 =C2=A0 =C2=A0 =C2=A0bitbake -c fetch -b $i
> done > ${LOGFILE} 2>&1
>
> egrep -n 'ERROR.*bb..failed' ${LOGFILE}
> egrep -n 'KeyError' ${LOGFILE}
>
>
>
>
>
> I found a lot of errors, see attachment! The whole logfile is on my
> homepage:
> http://fbi.hooster.de/download/sonstiges/oe/fetchsrc.log.tar.gz
>
> How can i/we fix this errors?
>

You should ignore nonworking and obsolete dirs and some errors are due
to hh.org going AWOL too


>
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>


