Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OPjxq-0002RO-CN
	for openembedded-devel@lists.openembedded.org;
	Sat, 19 Jun 2010 00:23:33 +0200
Received: by iwn5 with SMTP id 5so1567221iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Jun 2010 15:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=kdB275fPOleNd5M75eXz+D7DqYArqm+WeCV6Q0htQHw=;
	b=B66fNXf8ILL3cL35mTlY/daZ84QdcJfo+PrVmsw9+QbeQT4ZAbA5z04D19VCU2V3Lr
	jnWCGjcRud5m8OyX8SaRhPwYpeasT5OjmGyxvlVOKNjAHdqg6sGy9Ymufz6NprRYhV3R
	feUEfmi9xuBcVJnAF9NriNleX1OyRFEkO1xlc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=H8ucxokIBhRVVKUApn6HGGD00186yIG3JpTe/2b/m7NjQ/8V2ctmLJTKmKj24Dd0Wu
	yEF27IH1vkv2VMtZJExQDJ0oCOCaPyyHT1DVomojU7m/3r0EEgBk3VXMs1nJ5vcCCpE3
	N1/MkHNMERyRH9zxmJWrcCYnPMW1lVUwmiyQI=
Received: by 10.231.130.142 with SMTP id t14mr1875902ibs.155.1276899491185; 
	Fri, 18 Jun 2010 15:18:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.17.130 with HTTP; Fri, 18 Jun 2010 15:17:51 -0700 (PDT)
In-Reply-To: <AANLkTilaBLTN8aWRUS6GRhvn-le5-fjK1nftuj_AQjw8@mail.gmail.com>
References: <AANLkTilaBLTN8aWRUS6GRhvn-le5-fjK1nftuj_AQjw8@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 18 Jun 2010 15:17:51 -0700
Message-ID: <AANLkTimI96_ElUsMpX-2SecDKgXSuDYg7phqJLptIUtg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: image.bbclass IMAGE_DEVICE_TABLES issues
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
X-List-Received-Date: Fri, 18 Jun 2010 22:23:34 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 16, 2010 at 5:27 AM, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
> Hi,
>
> I am having an issue or two with image.bbclass and especially the
> devtable section.
>
> It concers the following part:
>
> # Get a list of files containing tables of devices to be created.
> # * IMAGE_DEVICE_TABLE is the old name to an absolute path to a device
> table file
> # * IMAGE_DEVICE_TABLES is a new name for a file, or list of files, searc=
hed
> # =A0 for in the BBPATH
> # If neither are specified then the default name of
> files/device_table-minimal.txt
> # is searched for in the BBPATH (same as the old version.)
> #
> def get_devtable_list(d):
> =A0 =A0import bb
> =A0 =A0devtable =3D bb.data.getVar('IMAGE_DEVICE_TABLE', d, 1)
> =A0 =A0if devtable !=3D None:
> =A0 =A0 =A0 =A0return devtable
> =A0 =A0devtables =3D bb.data.getVar('IMAGE_DEVICE_TABLES', d, 1)
> =A0 =A0if devtables =3D=3D None:
> =A0 =A0 =A0 =A0devtables =3D 'files/device_table-minimal.txt'
> =A0 =A0return " ".join([ bb.which(bb.data.getVar('BBPATH', d, 1), devtabl=
e)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0for devtable in devtables.spli=
t() ])
>
> The issues I have are the following:
> 1. if the file is not there an empty list is returned and used without
> any error being given.
> In case of the default name that is probably ok, but if there is an
> explicit IMAGE_DEVICE_TABLE or IMAGE_DEVICE_TABLES given and the file
> is not there I would qualify the situation as an error.
> Guess it would be very convenient to have an error message in that case.

add a bbnote or somesuch after line 126 in image.bbclass after check
the existence of $devtable

> 2. According to the comment for IMAGE_DEVICE_TABLES (and for the
> default name) the file is searched for in BBPATH. For me BBPATH points
> to an overlay dir with below it recipes/myimage/myimage.bb
> The code does join the names but (at least with my limited python
> knowledge) does not look into subdirs. This is experimentally
> verified.

it looks in BBPATH/<the path given by you>/<table given by you>.txt

> I feel it is more appropriate to have the device table near the bb
> file (e.g. in recipes/myimage/mydevicetable.txt)

devtable is a machine property not image property.

> currently I have to either specify a path in IMAGE_DEVICE_TABLES
> (which I don't like because it makes the recipe dependent of the
> actual place in the tree, so it is not robust to moving it), or have
> the device table on the level of recipes (which I do not like either
> as it is not near the recipe).

its relative to BBPATH I don't see any relation between bb file and
device table

> My suggestion would be to look in the dir of the recipe or in ${WORKDIR}
>
> What do people think about this?
> I'm not really a python wiz, so if someone can contribute a patch that
> would be greatly appreciated.
>
> Frans
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


