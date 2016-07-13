Return-Path: <prvs=300251fa7c=michael.davis@essvote.com>
Received: from mail1.essvote.com (mail1.essvote.com [66.37.226.19])
	by mail.openembedded.org (Postfix) with ESMTP id CC4806AC4B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jul 2016 13:29:42 +0000 (UTC)
X-AuditID: 0a000213-f79066d0000013b8-0f-5786424506b9
Received: from ESS-EX01.essvote.corp.local (Unknown_Domain [172.16.110.40])
	by mail1.essvote.com (Symantec Messaging Gateway) with SMTP id
	3D.67.05048.54246875; Wed, 13 Jul 2016 08:29:42 -0500 (CDT)
Received: from ESS-EX01.essvote.corp.local ([::1]) by
	ESS-EX01.essvote.corp.local ([::1]) with mapi id 14.03.0301.000;
	Wed, 13 Jul 2016 08:29:21 -0500
From: "Davis, Michael" <michael.davis@essvote.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] nodejs: newer npm?
Thread-Index: AQHR3NmxfJRA5kqUrEazkUEVribB2aAWVlKAgABY6wA=
Date: Wed, 13 Jul 2016 13:29:20 +0000
Message-ID: <2056819.lo3LDqAOXZ@localhost.localdomain>
References: <5785F022.8030404@mlbassoc.com> <5785F799.4000804@mlbassoc.com>
In-Reply-To: <5785F799.4000804@mlbassoc.com>
Reply-To: "Davis, Michael" <michael.davis@essvote.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.1.1.158]
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrEIsWRmVeSWpSXmKPExsWyRiBPQ9fNqS3c4MsabotLvRPYLS4eXsrs
	wORxbuMKRo+vmyexBDBFcdskJZaUBWem5+nbJXBn7DlhUDCPo+LFLcsGxhNsXYycHBICJhI3
	7y6AssUkLtxbD2YLCZxglPjyRqeLkQvInsUocfTDDHaQBJuAkcS565sYQWwRgViJeZtmMoHY
	zALKEt/2XAVrFhZQkWhY+50JokZVYt6LrcwQtpXE17snwOIsQPHXz7YC1XNw8AqYSXz6lQux
	11tix9wPjCBhTgEdiYn/hSHCZhJtD1+ygNiMQGd+P7UGaqu4xK0n85kgzheQWLLnPDOELSrx
	8vE/VpAxEgJyEt+/eEKU60gs2P0JbCkz0DHrP6tDhLUlli18DdbJKyAocXLmE5YJjBKzkCyY
	haR7FkL3LCTds5B0L2BkXcUomJuYmWOol1pcXJZfkqqXnJ+7iREYc1wMTMI7GOdMsT3EKMDB
	qMTDGxDVGi7EmlhWXJl7iFGag0VJnFdFSClcSCA9sSQ1OzW1ILUovqg0J7X4ECMTB+chRgkO
	LimR4tS8lNSixNKSjHhQFMcXA+NYqoFx2dqk5Z/P7tbNvnNXTm1PhXxUaI+gsNFlpxTp1BkB
	ZR92rLLd8o/dfm76nLvngo+9XDTTz0T/2LLz904pS4dtUppQkhUnuWE2L7fTh+SirR7/InzP
	Cth+2uV2Vdie5V2EZ6XA409M0u1fHHslH5RLB87mZXVZpF/yUZ8xtHkLk96sjUcjXyYpsRRn
	JBpqMRcVJwIAzrd7OLUCAAA=
Cc: Gary Thomas <gary@mlbassoc.com>
Subject: Re: nodejs: newer npm?
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
X-List-Received-Date: Wed, 13 Jul 2016 13:29:43 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <00DEDFFA03EDCE438AC12E12F60697AB@essvote.com>
Content-Transfer-Encoding: quoted-printable

I am currently using angular from a different meta layer.
https://github.com/imyller/meta-nodejs
It maintains newer versions of nodejs. =20
It might be something you want to try.


On Wednesday, July 13, 2016 10:11:05 AM Gary Thomas wrote:
> On 2016-07-13 09:39, Gary Thomas wrote:
> > The current (at least 4.4.4) nodejs recipe also creates nodejs-npm
> > which is npm version 2.15.1.  I'm trying to run angularjs that needs
> > npm >=3D 3.3.x.  I've not yet tried the update to 4.4.5, so if this
> > fixes the issue just let me know.
> >=20
> > What needs to be done to get a newer npm?
> >=20
> > BTW, the current one segfaults when trying to install the
> > attached package file.
>=20
> I have now tried nodejs-4.4.5 which has npm-2.15.5  It no longer
> segfaults on the install step, but it doesn't really work :-(
> Any access just returns 'Cannot GET /'
>=20
> Anyone have suggestions on how I might debug this?  It's a known
> working (simple) application I got from
> https://angular.io/docs/ts/latest/quickstart.html=

