Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <robert@erafx.com>) id 1Q74en-0000Cv-87
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Apr 2011 13:42:49 +0200
Received: by vxd7 with SMTP id 7so177456vxd.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Apr 2011 04:40:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.62.8 with SMTP id v8mr2342537vch.6.1302003638275; Tue, 05
	Apr 2011 04:40:38 -0700 (PDT)
Received: by 10.220.192.1 with HTTP; Tue, 5 Apr 2011 04:40:38 -0700 (PDT)
X-Originating-IP: [24.165.208.114]
In-Reply-To: <20110405103538.fc13eeb3.ospite@studenti.unina.it>
References: <1301967081-14512-1-git-send-email-robert@erafx.com>
	<20110405103538.fc13eeb3.ospite@studenti.unina.it>
Date: Tue, 5 Apr 2011 07:40:38 -0400
Message-ID: <BANLkTi=dMe7oKT=JrVvi6q2o7mW0+9oTCw@mail.gmail.com>
From: Robert Foerster <robert@erafx.com>
To: Antonio Ospite <ospite@studenti.unina.it>,
	openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH 1/2] tzcode-native: update to 2011e
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
X-List-Received-Date: Tue, 05 Apr 2011 11:42:50 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Apr 5, 2011 at 4:35 AM, Antonio Ospite <ospite@studenti.unina.it>wrote:

> On Mon,  4 Apr 2011 21:31:20 -0400
> Bob Foerster <robert@erafx.com> wrote:
>
> > Signed-off-by: Bob Foerster <robert@erafx.com>
> > ---
> >  ...code-native_2011d.bb => tzcode-native_2011e.bb} |   11 ++++++-----
> >  1 files changed, 6 insertions(+), 5 deletions(-)
> >  rename recipes/tzcode/{tzcode-native_2011d.bb => tzcode-native_2011e.bb}
> (51%)
> >
> > diff --git a/recipes/tzcode/tzcode-native_2011d.bb b/recipes/tzcode/
> tzcode-native_2011e.bb
> > similarity index 51%
> > rename from recipes/tzcode/tzcode-native_2011d.bb
> > rename to recipes/tzcode/tzcode-native_2011e.bb
> > index 1cc7757..39b172b 100644
> > --- a/recipes/tzcode/tzcode-native_2011d.bb
> > +++ b/recipes/tzcode/tzcode-native_2011e.bb
> > @@ -6,11 +6,12 @@ require tzcode-native.inc
> >  # Also, tzdata (and it is needed to build tzcode) version can differ
> from
> >  # tzcode version, thus this variable
> >
> > -TZDATA_PV = "2011d"
> > +TZDATA_PV = "2011e"
> >
> >  PR = "${INC_PR}.0"
> >
> > -SRC_URI[tzcode-2011d.md5sum] = "95095242ee368e6a7e107f154590ac11"
> > -SRC_URI[tzcode-2011d.sha256sum] =
> "68f2c07471c5390199c09fe9fee6a22f8a4dac24713af88b92da17b33ad98cc7"
> > -SRC_URI[tzdata-2011d.md5sum] = "03c5793502b7c41985edd73146bf7e36"
> > -SRC_URI[tzdata-2011d.sha256sum] =
> "415a54774094e8dcdc9ba141fafbee4b3b2f2140a5b8cf012eea4b37fb9a23bd"
> > +SRC_URI[tzcode-2011e.md5sum] = "fbfc05dbf9ebcfe7c4bba18549870173"
> > +SRC_URI[tzcode-2011e.sha256sum] =
> "8fb00f8763aa51d83d6f3190d144124bb7176ca829fc08823d6205297bf0426b"
> > +SRC_URI[tzdata-2011e.md5sum] = "044a07072300a0ee72b046e5a9a4ec90"
> > +SRC_URI[tzdata-2011e.sha256sum] =
> "44fef01de4589a4979eb6b5fdbbfd21a3b135852af1ecbfb9e0368ae47392c79"
> > +
>
> Just nitpicking, maybe you can drop the last blank line.
> Same comment for the other patch about tzdata.
>
>
Sure, v2 sent. Though it seems git send-email didn't prefix the second patch
with v2.  That's odd, because it showed the proper subject when sending:

To: openembedded-devel@lists.openembedded.org
Subject: [PATCH v2 2/2] tzdata: update to 2011e
Date: Tue,  5 Apr 2011 07:28:26 -0400




> Thanks,
>   Antonio
>
> --
> Antonio Ospite
> http://ao2.it
>
> PGP public key ID: 0x4553B001
>
> A: Because it messes up the order in which people normally read text.
>   See http://en.wikipedia.org/wiki/Posting_style
> Q: Why is top-posting such a bad thing?
>

