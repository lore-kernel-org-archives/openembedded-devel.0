Return-Path: <Noor_Ahsan@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 32EA3612E5
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 May 2016 10:16:19 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-FEM-05.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1ayco0-0004nD-3o from Noor_Ahsan@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Fri, 06 May 2016 03:16:20 -0700
Received: from EU-MBX-01.mgc.mentorg.com ([169.254.1.18]) by
	SVR-IES-FEM-05.mgc.mentorg.com ([137.202.0.112]) with mapi id
	14.03.0224.002; Fri, 6 May 2016 11:16:19 +0100
From: "Ahsan, Noor" <Noor_Ahsan@mentor.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [PATCH] Fix "failed sanity test tmpdir" for libnice and
	update PNBLACKLIST.
Thread-Index: AQHRpupW2wHvQUhtUkGj+2KudrTB25+qge+AgAEv5gA=
Date: Fri, 6 May 2016 10:16:18 +0000
Message-ID: <365E1805BC95084CBE82381A0B8699940127D1DB39@EU-MBX-01.mgc.mentorg.com>
References: <1462465350-33532-1-git-send-email-noor_ahsan@mentor.com>
	<CABcZANkpvF7ehM5fdd53229jonE4x43Qg2bB7M5OcM88pXb+fQ@mail.gmail.com>
In-Reply-To: <CABcZANkpvF7ehM5fdd53229jonE4x43Qg2bB7M5OcM88pXb+fQ@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [137.202.0.76]
MIME-Version: 1.0
Subject: Re: [PATCH] Fix "failed sanity test tmpdir" for libnice and update PNBLACKLIST.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 06 May 2016 10:16:21 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Doesn't recipe name is mentioned when only that recipe is changed in the pa=
tch. I though when multiple recipes are changed then we don't mention the n=
ame of the files in the commit summary. Correct me if my interpretation is =
wrong.

Secondly I thought both are inter related. That is why added both in signed=
 patch. Farsight is mentioned in the details=20

Remove PNBLACKLIST for libnice and farsight recipes.

Noor

-----Original Message-----
From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembedde=
d-devel-bounces@lists.openembedded.org] On Behalf Of Christopher Larson
Sent: Thursday, May 05, 2016 10:05 PM
To: Openembedded Discussion
Subject: Re: [oe] [PATCH] Fix "failed sanity test tmpdir" for libnice and u=
pdate PNBLACKLIST.

On Thu, May 5, 2016 at 9:22 AM, Noor, Ahsan <noor_ahsan@mentor.com> wrote:

> From: Noor Ahsan <noor_ahsan@mentor.com>
>
> * Update do_compile_append where it was updating *.pc from ${S} and
>   removing staging dir folder. Now we have seperate build folder
>   where packages got build. We have to search pc in ${B} not in ${S}.
>   After updating the tmp dir pathc is removed from nice.pc file.
> * Remove PNBLACKLIST for libnice and farsight recipes.
>
> Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>
>

The commit message doesn't meet the OE guidelines (not prefixed by the reci=
pe being changed) and you don't mention farsight2 in the message at all
-- should that be a separate commit?
--
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus Maintainer - Tslib Senior Softw=
are Engineer, Mentor Graphics
--
_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-devel

