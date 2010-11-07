Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PF21k-0005Pw-8R
	for openembedded-devel@lists.openembedded.org;
	Sun, 07 Nov 2010 10:59:10 +0100
Received: by gwaa11 with SMTP id a11so3016682gwa.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 07 Nov 2010 01:58:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:cc:content-type
	:content-transfer-encoding;
	bh=OqriqcXJ+nILWuMjz6oJNa0o+PIuMzcUrcjQN8AGRqY=;
	b=q6P6cQQemxb6li+3TVFguFSIK+6PM4f4OjJ9yf6m/ALRXx7dIzppky44B3COHwV47B
	yb+8iocwVzSPfIU8CneiviSbc4BB5RNZxfXVAQQJbiqFWdH9HxeJJif+HN6JfdEyqyq/
	jRrz0f9CSQXFHEyvKIV+EaUwAZ3XNb72fDdyU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=tW5B1Rfh7nGqg2ivQ6LEUkDt5d7oWS6b3zuMT1M/q/2JkifXLyeFlpGE+J26y070Aw
	eeBRJ7u5yB9qHBsDfAWEaahdpPSsat4ypMLys68xSbvvnlHbVeAYKwqK0s1vbJc3F8nx
	BeyG2etLVtSQV+WyJizvbs8BtnaJT1eIPsF8U=
Received: by 10.91.11.6 with SMTP id o6mr3660594agi.91.1289123890867; Sun, 07
	Nov 2010 01:58:10 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.86.4 with HTTP; Sun, 7 Nov 2010 01:57:50 -0800 (PST)
In-Reply-To: <AANLkTi=i3bg7VdTKhEX4oAkXzX4m3y58F+8+qSfq1qsb@mail.gmail.com>
References: <1289061084-19901-1-git-send-email-moncelier@devlife.org>
	<AANLkTi=L6r1i9yayoo9=j_JNx5Yd+bGhgQYotEp=SJ-s@mail.gmail.com>
	<AANLkTi=i3bg7VdTKhEX4oAkXzX4m3y58F+8+qSfq1qsb@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 7 Nov 2010 01:57:50 -0800
Message-ID: <AANLkTi=c6EsH_dYsZnyNPijJNT5wDqbTCTBjFt-ztVt=@mail.gmail.com>
To: Camille Moncelier <moncelier@devlife.org>
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 01/11] parted: Added parted-native
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
X-List-Received-Date: Sun, 07 Nov 2010 09:59:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 6, 2010 at 3:36 PM, Camille Moncelier <moncelier@devlife.org> w=
rote:
> On Sat, Nov 6, 2010 at 10:48 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> > diff --git a/recipes/parted/parted_2.3.bb b/recipes/parted/parted_2.3.=
bb
>> > index d2ac303..6efb398 100644
>> > --- a/recipes/parted/parted_2.3.bb
>> > +++ b/recipes/parted/parted_2.3.bb
>> > @@ -3,14 +3,18 @@ HOMEPAGE =3D
>> > "http://www.gnu.org/software/parted/parted.html"
>> > =C2=A0LICENSE =3D "GPLv3"
>> > =C2=A0SECTION =3D "console/tools"
>> > =C2=A0DEPENDS =3D "readline util-linux-ng lvm2"
>> > +DEPENDS_virtclass-native =3D "readline-native util-linux-ng-native"
>>
>> this should not be needed.
>
> Are you saying this for DEPENDS_virtclass-native are for the whole recipe=
 ?
>

Just  DEPENDS_virtclass-native
other parts look ok
>
> --
> Camille Moncelier
> http://devlife.org/
>
> If Java had true garbage collection, most programs would
> delete themselves upon execution.
>


