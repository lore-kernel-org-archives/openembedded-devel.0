Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OQHkQ-0008J4-VW
	for openembedded-devel@lists.openembedded.org;
	Sun, 20 Jun 2010 12:27:32 +0200
Received: by bwz14 with SMTP id 14so685446bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Jun 2010 03:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=o5AwTXENKNCxMJWzgSTgbWCXd4p+JNC/e4P9o07uJFs=;
	b=bdBSB38quTG4FgDVs434JRvWtIeiZns1kSov7/1Xf5gE59nW+Gv2fDuAfNTDaMO7bU
	E5JQwo6YzRmlvzIwiOqMgyEibGbBAcsXuh9w9ISX2nSbMhErB+tqrMbHNFCSnxZb3GuY
	NnnrjC5FabiZAs1u+5foPSmFB6+edhQNZzxkE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=Npmvyr+YESsUKU+Nt+7hOvb2c6pLPNURapwMlnRw21fkndnAXQHqALdnxSylu2UCWV
	we5mjSkGRusS9Y0ToUz6nQAOWpnM7QcmFIhCsi17Rs4oc9x70GUNDukl5ocY0uQcjfrM
	E5k18rVzRQeUgMU5/886kuCaiNJhprTJl9ODI=
MIME-Version: 1.0
Received: by 10.204.79.214 with SMTP id q22mr191731bkk.109.1277029379680; Sun, 
	20 Jun 2010 03:22:59 -0700 (PDT)
Received: by 10.204.77.132 with HTTP; Sun, 20 Jun 2010 03:22:59 -0700 (PDT)
In-Reply-To: <AANLkTimI96_ElUsMpX-2SecDKgXSuDYg7phqJLptIUtg@mail.gmail.com>
References: <AANLkTilaBLTN8aWRUS6GRhvn-le5-fjK1nftuj_AQjw8@mail.gmail.com>
	<AANLkTimI96_ElUsMpX-2SecDKgXSuDYg7phqJLptIUtg@mail.gmail.com>
Date: Sun, 20 Jun 2010 12:22:59 +0200
Message-ID: <AANLkTimjS3tXUek1Gpf-F4QXqTdHv1CkklNut_-M6B7X@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
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
X-List-Received-Date: Sun, 20 Jun 2010 10:27:32 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/6/19 Khem Raj <raj.khem@gmail.com>:
> On Wed, Jun 16, 2010 at 5:27 AM, Frans Meulenbroeks
> <fransmeulenbroeks@gmail.com> wrote:
>> Hi,
>>
>> I am having an issue or two with image.bbclass and especially the
>> devtable section.
>>
>> It concers the following part:
>>
>> # Get a list of files containing tables of devices to be created.
>> # * IMAGE_DEVICE_TABLE is the old name to an absolute path to a device
>> table file
>> # * IMAGE_DEVICE_TABLES is a new name for a file, or list of files, sear=
ched
>> # =A0 for in the BBPATH
>> # If neither are specified then the default name of
>> files/device_table-minimal.txt
>> # is searched for in the BBPATH (same as the old version.)
>> #
>> def get_devtable_list(d):
>> =A0 =A0import bb
>> =A0 =A0devtable =3D bb.data.getVar('IMAGE_DEVICE_TABLE', d, 1)
>> =A0 =A0if devtable !=3D None:
>> =A0 =A0 =A0 =A0return devtable
>> =A0 =A0devtables =3D bb.data.getVar('IMAGE_DEVICE_TABLES', d, 1)
>> =A0 =A0if devtables =3D=3D None:
>> =A0 =A0 =A0 =A0devtables =3D 'files/device_table-minimal.txt'
>> =A0 =A0return " ".join([ bb.which(bb.data.getVar('BBPATH', d, 1), devtab=
le)
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0for devtable in devtables.spl=
it() ])
>>
>> The issues I have are the following:
>> 1. if the file is not there an empty list is returned and used without
>> any error being given.
>> In case of the default name that is probably ok, but if there is an
>> explicit IMAGE_DEVICE_TABLE or IMAGE_DEVICE_TABLES given and the file
>> is not there I would qualify the situation as an error.
>> Guess it would be very convenient to have an error message in that case.
>
> add a bbnote or somesuch after line 126 in image.bbclass after check
> the existence of $devtable

Thanks for the hint, but I am not sure my pythonese is good enough to
implement this.
Also I'd say that if the default table is chosen in the code and that
table is not present, it does not constitute an error.

>
>> 2. According to the comment for IMAGE_DEVICE_TABLES (and for the
>> default name) the file is searched for in BBPATH. For me BBPATH points
>> to an overlay dir with below it recipes/myimage/myimage.bb
>> The code does join the names but (at least with my limited python
>> knowledge) does not look into subdirs. This is experimentally
>> verified.
>
> it looks in BBPATH/<the path given by you>/<table given by you>.txt

I know. And if I do not give a subdir they will (at least in my setup)
live in the same dir as the recipes/classes/conf etc folders.
It does not seem to be a proper place (but I am not too keen on
hardcoding a path in a recipe).
>
>> I feel it is more appropriate to have the device table near the bb
>> file (e.g. in recipes/myimage/mydevicetable.txt)
>
> devtable is a machine property not image property.

Then I'd say there should be a machine specific dir for this stuff.
Actually I feel that device table could be image specific. E.g.
different images for the same hardware could contain a different
device table. E.g. I do not want to make the console available on the
production version, but I do want it on the development version. Or if
I want to hide devices that are not to be used in a specific image.
>
>> currently I have to either specify a path in IMAGE_DEVICE_TABLES
>> (which I don't like because it makes the recipe dependent of the
>> actual place in the tree, so it is not robust to moving it), or have
>> the device table on the level of recipes (which I do not like either
>> as it is not near the recipe).
>
> its relative to BBPATH I don't see any relation between bb file and
> device table

The image refers to the table. Typically all files referred to in a
recipe reside in the recipe dir (e.g. an .inc file) or in subdirs
(e.g. patches).
Having the device table in the same dir seems only consistent to me
(and also makes it easier to move the recipe around).
>
>> My suggestion would be to look in the dir of the recipe or in ${WORKDIR}
>>
>> What do people think about this?
>> I'm not really a python wiz, so if someone can contribute a patch that
>> would be greatly appreciated.
>>
>> Frans
>>

Have fun! Frans


