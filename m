Received: from mail2.eads.net ([80.156.45.114] helo=mail.eads.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Wolfgang.Hauser.external@cassidian.com>)
	id 1PwtOf-0006u8-47 for openembedded-devel@lists.openembedded.org;
	Tue, 08 Mar 2011 10:40:05 +0100
Received: from gsx3071-vs5.mxchg.m.corp ([53.147.176.148])
	by mail.eads.net (8.13.8/8.13.8/Debian-2) with ESMTP id p289ccO8024455
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 8 Mar 2011 10:38:39 +0100
Received: from gsx300a.mxchg.m.corp ([10.43.212.131]) by
	gsx3071-vs5.mxchg.m.corp with Microsoft SMTPSVC(6.0.3790.4675); 
	Tue, 8 Mar 2011 10:38:31 +0100
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Tue, 8 Mar 2011 10:38:31 +0100
Message-ID: <01DC65355775654EB4BECCE3C4522F0D08155650@GSX300A.mxchg.m.corp>
In-Reply-To: <AANLkTikzk175mvsX+JCC7Mfm_gt=xdxG67NR4v5WF8x9@mail.gmail.com>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: [oe] How does oe handle rebuilds?
Thread-Index: Acvc89BRM7u0kKmQS06H4NvAprwrJAAgD/Uw
References: <AANLkTikzk175mvsX+JCC7Mfm_gt=xdxG67NR4v5WF8x9@mail.gmail.com>
From: "Hauser, Wolfgang (external)" <Wolfgang.Hauser.external@cassidian.com>
To: <openembedded-devel@lists.openembedded.org>
X-OriginalArrivalTime: 08 Mar 2011 09:38:31.0885 (UTC)
	FILETIME=[965D8FD0:01CBDD74]
Subject: Re: How does oe handle rebuilds?
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
X-List-Received-Date: Tue, 08 Mar 2011 09:40:05 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

As I see it is recommended by the community to do a build "from scratch" =
if main features as e.g. kernel version has changed.

Removing the temporary directory and do an overnight build is the =
easiest and cleanest resolution.

Regards
Wolfgang
=20
-----Urspr=FCngliche Nachricht-----
Von: openembedded-devel-bounces@lists.openembedded.org =
[mailto:openembedded-devel-bounces@lists.openembedded.org] Im Auftrag =
von Charles Manning
Gesendet: Montag, 7. M=E4rz 2011 18:58
An: Openembedded-devel@lists.openembedded.org
Betreff: [oe] How does oe handle rebuilds?

I find I often have problems when using oe that changing a recipe does
not result in dependent packages being rebuilt. A bit of Googling
suggests that many experience this issue and take manual steps to
force rebuilding.

For example, changing the kernel requires rebuilding various libraries
(tslib etc) and rebuilding the image.

1.Should oe be able to handle that automatically or is this oe's
"killer defect" (ie. opposite of "killer feature").
2. Is there something missing in recipes to show the correct =
dependencies?
3. What is the best way to manage these stale dependencies?

Thanks

Charles

_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


