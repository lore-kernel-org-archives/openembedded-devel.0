Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f170.google.com (mail-pd0-f170.google.com
	[209.85.192.170])
	by mail.openembedded.org (Postfix) with ESMTP id 1DBDC7394F
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Mar 2015 16:18:41 +0000 (UTC)
Received: by pdbft15 with SMTP id ft15so35559451pdb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Mar 2015 09:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=3O3qYDG8qR1KIoXCPsT7INc091S0o2xkdLabVFwn+AU=;
	b=l+YXFz2eMdDs09Y3J0fDrfHp2eu3F815eKBn6NcN0GIm4V/pCZYHPBiTg/NyHruMIl
	JFjmC04v9DVx7HOhRJSFxQsej/QBuhgecCXlqITgolckcIJl5oHvvp50F7Ma+drqro23
	bR0pJydE5oZNfVF3fT2PsXyXx6UsltdW2x3xCb2qjSrQVzwzoo15dRt8iiEcdnkv9r7v
	ATqz11xx5n/383JER7nokSqewm5Hv1OMFWz0bztQkreWhezm2T1a025iDrqIqh3RyWdL
	aoEE2uEvdK7mZBHsHiDe+mDWZI0IsJOMw48vPWxWSEdd32+EB5Tch/Iad64DsfbKwx/m
	uHkA==
X-Received: by 10.70.90.110 with SMTP id bv14mr48713600pdb.8.1425917922717;
	Mon, 09 Mar 2015 09:18:42 -0700 (PDT)
Received: from ?IPv6:2601:9:3580:84c:5dec:324d:fc8d:ab4d?
	([2601:9:3580:84c:5dec:324d:fc8d:ab4d])
	by mx.google.com with ESMTPSA id
	kn4sm20058186pab.48.2015.03.09.09.18.41
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 09 Mar 2015 09:18:42 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2070.6\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CANwerB1yuL_DBndAnH6WtZz5vfVGeEqG6N0HvC++hxP0mvxUww@mail.gmail.com>
Date: Mon, 9 Mar 2015 09:18:41 -0700
Message-Id: <38091DCF-053B-4916-B0BF-F0E918AEA133@gmail.com>
References: <1425812371-1564-1-git-send-email-raj.khem@gmail.com>
	<1425812371-1564-2-git-send-email-raj.khem@gmail.com>
	<CANwerB1yuL_DBndAnH6WtZz5vfVGeEqG6N0HvC++hxP0mvxUww@mail.gmail.com>
To: Jonathan Liu <net147@gmail.com>
X-Mailer: Apple Mail (2.2070.6)
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCHv3 2/2] nodejs: Upgrade to 0.12.0
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
X-List-Received-Date: Mon, 09 Mar 2015 16:18:46 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> On Mar 9, 2015, at 12:51 AM, Jonathan Liu <net147@gmail.com> wrote:
>=20
> Hi Khem,
>=20
> On 8 March 2015 at 21:59, Khem Raj <raj.khem@gmail.com> wrote:
>> +RDEPENDS_${PN} =3D "curl"
>> +RDEPENDS_${PN}_class-native =3D ""
>=20
> Does using node actually depend on curl at runtime?
> I haven't noticed any runtime dependency on curl when using the node =
executable.

its cruft from past. at best it could be RSUGGESTS for nodejs-nmp =
package
send a followup if you can.=

