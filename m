Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QZl5e-00053c-Op
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Jun 2011 16:41:07 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p5NEbTrV021702
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jun 2011 07:37:29 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.227) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Thu, 23 Jun 2011 07:37:29 -0700
Message-ID: <4E034FA8.60902@windriver.com>
Date: Thu, 23 Jun 2011 09:37:28 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.2.17) Gecko/20110414 Thunderbird/3.1.10
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <4E03211B.40205@freyther.de>	<1308828119.21613.138.camel@phil-desktop>	<4E032546.6000308@freyther.de>
	<1308839149.21613.165.camel@phil-desktop>
In-Reply-To: <1308839149.21613.165.camel@phil-desktop>
X-MIME-Autoconverted: from 8bit to quoted-printable by mail.windriver.com id
	p5NEbTrV021702
Subject: Re: RFC One recipe with two git repository as sources
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
X-List-Received-Date: Thu, 23 Jun 2011 14:41:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 6/23/11 9:25 AM, Phil Blundell wrote:
> On Thu, 2011-06-23 at 13:36 +0200, Holger Freyther wrote:
>> On 06/23/2011 01:21 PM, Phil Blundell wrote:
>>> On Thu, 2011-06-23 at 13:18 +0200, Holger Freyther wrote:
>>>> -        destdir =3D os.path.join(destdir, "git/")
>>>> +        destsuffix =3D ud.parm.get("destsuffix", "git/")
>>>> +        print destsuffix
>>>> +        destdir =3D os.path.join(destdir, destsuffix)
>>>
>>> I think that "print" might be extraneous, but other than this your pa=
tch
>>> looks awesome.  I think this would resolve the problem that I was hav=
ing
>>> in.
>>
>> great, yeah the print is bogus and the question if and how this applie=
s to
>> fetch/git.py is also unresolved (i had a quick look but have not found=
 the
>> dirname it uses to create the tarball).
>=20
> I'm not entirely clear on what's going on with fetch vs fetch2 at all,
> in terms of whether fetch is going away at some point or the two of the=
m
> are meant to be existing in parallel.  Can one of the TSC =C3=BCberhack=
ers
> shed any light on what the intent is there?
>=20

"fetch" is remaining for compatibility for the time being.  I believe the=
 intent
is that fetch will go away when compatibility is no longer needed or desi=
red.

--Mark

> p.
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



