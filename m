Received: from bear.ext.ti.com ([192.94.94.41])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin@ti.com>) id 1OIoGk-000597-Bk
	for openembedded-devel@lists.openembedded.org;
	Sun, 30 May 2010 21:34:00 +0200
Received: from dlep35.itg.ti.com ([157.170.170.118])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id o4UJQgqN028029
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 30 May 2010 14:26:42 -0500
Received: from dlep26.itg.ti.com (localhost [127.0.0.1])
	by dlep35.itg.ti.com (8.13.7/8.13.7) with ESMTP id o4UJQg6F003894
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 30 May 2010 14:26:42 -0500 (CDT)
Received: from dsbe71.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id o4UJQg5L015860
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 30 May 2010 14:26:42 -0500 (CDT)
Received: from dlee02.ent.ti.com ([157.170.170.17]) by dsbe71.ent.ti.com
	([156.117.232.23]) with mapi; Sun, 30 May 2010 14:26:42 -0500
From: "Ambrose, Martin" <martin@ti.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Sun, 30 May 2010 14:26:40 -0500
Thread-Topic: [oe] Examples of srctree and gitver
Thread-Index: AcsAE7kAQVP54M+DTBSGZrvajGZxhQAF7gAw
Message-ID: <A24693684029E5489D1D202277BE894455A0F300@dlee02.ent.ti.com>
References: <A24693684029E5489D1D202277BE89445316FB3A@dlee02.ent.ti.com>
	<AANLkTinePogltaKgN7CaqFVzw4PpDXSkE-f7H18PINOB@mail.gmail.com>
In-Reply-To: <AANLkTinePogltaKgN7CaqFVzw4PpDXSkE-f7H18PINOB@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 192.94.94.41
X-SA-Exim-Mail-From: martin@ti.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Examples of srctree and gitver
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
X-List-Received-Date: Sun, 30 May 2010 19:34:01 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

On Sun, May 30, 2010 at 11:16:16, Chris Larson wrote:

> On Sun, May 30, 2010 at 8:07 AM, Ambrose, Martin <martin@ti.com> wrote:
...

> > Are there any recipes/examples which use these classes?
>=20
> I expect they'd be most useful in development, so no, I don't know of any
> examples in an OE tree today.

Makes sense.

> It's pretty straightforward.  Add inherit
> srctree, point S at your local source tree (or put the recipe inside the
> sourcetree, it defaults to the dir the recipe is in), and it'll build fro=
m
> that local tree rather than doing the fetch+unpack+patch process.

Ack. I now think of the class as providing a 'skip' to the fetch+unpack+pat=
ch
steps but everything afterwards is then vanilla OE.

Ideally I could have a single set of recipes which, through some command li=
ne switches,
would either build in-tree using local sources or out-of-tree using a tarba=
ll.
But maybe this really requires separate recipes with commonality factored i=
nto includes.

Thanks for the explanation/help.

Regards,=20
Martin


