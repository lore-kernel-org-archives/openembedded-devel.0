Return-Path: <Michael_E_Brown@dell.com>
X-Greylist: delayed 650 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 07 Nov 2014 15:59:07 UTC
Received: from ausxippc101.us.dell.com (ausxippc101.us.dell.com
	[143.166.85.207])
	by mail.openembedded.org (Postfix) with ESMTP id 7F9916017E
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Nov 2014 15:59:07 +0000 (UTC)
DomainKey-Signature: s=smtpout; d=dell.com; c=nofws; q=dns;
	h=X-LoopCount0:X-IronPort-AV:From:To:Date:Subject:
	Thread-Topic:Thread-Index:Message-ID:References:
	In-Reply-To:Accept-Language:Content-Language:
	X-MS-Has-Attach:X-MS-TNEF-Correlator:acceptlanguage:
	Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=UTyNIi3QgqW6Sh2Vi2yT3HogSASWJrWRnow2JGNHONUOYfHlsPVml85H
	5JcE6uKd4t9xZX8XGaJVD97X05e9UouNW7HkOT2suc6Us7R4lOEDYPNoF
	ymP84rFJKugpJKO4VImc3oyIxNUf6kzeDymQJ7y86qCRjWkbv3zR/efJA
	4=;
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=dell.com; i=@dell.com; q=dns/txt; s=smtpout;
	t=1415375949; x=1446911949;
	h=from:to:date:subject:message-id:references:in-reply-to:
	content-transfer-encoding:mime-version;
	bh=+NccJiFZpFrVW3r0TO6tSOHqq96mfdWNYmEJD5qne7k=;
	b=aKdmR/VHeiufzjccgL6auDMcf8okTSBYX7yhuOHOp6OKSDxHr9eFKo3U
	Fo/PDuZEl0O8148p+7liDg2132/TpHt5WAUcX0YFPofgHoMa08sSjidSj
	NwCTWe4IVCm0SIs7pEer4XHyKAT0UQ9h8thjFLhvT7Q34CuEimn659DEZ M=;
X-LoopCount0: from 10.175.216.251
X-IronPort-AV: E=Sophos;i="5.07,333,1413262800"; d="scan'208";a="586286106"
From: <Michael_E_Brown@Dell.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 7 Nov 2014 09:46:16 -0600
Thread-Topic: PRINC migration questions
Thread-Index: Ac/6ioposBgxHVLQTxCI6lQhvHJI4gAF2zBe
Message-ID: <DB6E482E89290547898851B8CC9D81100154D0FEB6@AUSX7MCPS302.AMER.DELL.COM>
References: <e111da9e0a424a2eac00f684ba4da94f@BY2PR05MB048.namprd05.prod.outlook.com>
In-Reply-To: <e111da9e0a424a2eac00f684ba4da94f@BY2PR05MB048.namprd05.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Subject: Re: PRINC migration questions
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
X-List-Received-Date: Fri, 07 Nov 2014 15:59:08 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I have an additional question on the same subject.

We are migrating from poky 1.3, and I don't see any way I can start using t=
he PR server (multi-site config, firewalled off, IT restrictions on running=
 random network daemons, etc).

What is the solution for this case?
--
Michael
________________________________________
From: openembedded-devel-bounces@lists.openembedded.org [openembedded-devel=
-bounces@lists.openembedded.org] On Behalf Of Bryan Evenson [bevenson@melin=
kcorp.com]
Sent: Friday, November 07, 2014 7:31 AM
To: openembedded-devel@lists.openembedded.org
Subject: [oe] PRINC migration questions

All,

I am on poky/dylan and have not yet started using the PR server.  I really =
do want to start using the PR server and stop using PRINC.  However, even m=
ore so I really don't want to break my package feeds.  I want to make sure =
I do my migration correctly and I don't do something that looks like it wor=
ks okay only to find out it causes problems later.  With that in mind, I am=
 looking for advice on the proper way to migrate away from using PRINC.

Let's say I have a .bbappend in my private layer with the line:

PRINC :=3D "${@int(PRINC) + 4}"

The mainline layer's .bb has the line:

PR =3D "${INC_PR}.0"

And the mainline layer's .inc has the line:

INC_PR =3D "r8"

In this scenario, the resulting PR will be "r12.0".  Now let's say I want t=
o start using the PR server and get rid of PRINC in this recipe.  The resul=
ting package contents are to be the same, so I want the resulting PR to be =
"r12.0".  From some limited testing, if I start the PR server and remove th=
e PRINC line from my .bbappend the resulting PR is "r8.0".  So in my .bbapp=
end should I change the PRINC line to:

INC_PR =3D "r12"

Or should I change it to something else?  If I change it to a hardcoded val=
ue, then I'll have to be careful about what to do if the mainline recipe ch=
anges INC_PR.  How have other people handled this situation?

Thanks,
Bryan
--
_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-devel

