Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OOrmL-0001mB-Dm
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Jun 2010 14:31:37 +0200
Received: by bwz14 with SMTP id 14so3418133bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Jun 2010 05:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=F1YzKPapK1amP3bF1iTL3SYjDxf3eaJd3cQ6BGkHpmc=;
	b=SEk9PnoTDJho1e+Mo2wISdIJFLIe7PIwKp7O8/paHa0LChlxDxK4TgI9jzBf8T5Rj/
	lAqcRCwv0l35HTaegTUbvkbyOMFixUhKQKW0C4Fwn9Tf1N5J3UqnZhsavm4SFKqxcGvx
	++6AeC27Ayk2Cf1/CRYNbSebt3GFkvLouXhao=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=ACa5PLIgRQqmEZYWmlKNszyz1+LLE/JnOIulxdMOiKbTWF1iBPMzLE9+sEPqPsJjU5
	uxB0Qq1cJFdWRdH9yw42YWQMUNO/mCbfhiM6SoyiSrYl8eRbaGQzx3TphNqiciqpCUnk
	w/ci6df5T1ZtjsQwnovKytjJIS6dSA8dkjiwY=
MIME-Version: 1.0
Received: by 10.204.81.7 with SMTP id v7mr6507592bkk.140.1276691230236; Wed, 
	16 Jun 2010 05:27:10 -0700 (PDT)
Received: by 10.204.119.12 with HTTP; Wed, 16 Jun 2010 05:27:10 -0700 (PDT)
Date: Wed, 16 Jun 2010 14:27:10 +0200
Message-ID: <AANLkTilaBLTN8aWRUS6GRhvn-le5-fjK1nftuj_AQjw8@mail.gmail.com>
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
Subject: image.bbclass IMAGE_DEVICE_TABLES issues
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
X-List-Received-Date: Wed, 16 Jun 2010 12:31:37 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

I am having an issue or two with image.bbclass and especially the
devtable section.

It concers the following part:

# Get a list of files containing tables of devices to be created.
# * IMAGE_DEVICE_TABLE is the old name to an absolute path to a device
table file
# * IMAGE_DEVICE_TABLES is a new name for a file, or list of files, searched
#   for in the BBPATH
# If neither are specified then the default name of
files/device_table-minimal.txt
# is searched for in the BBPATH (same as the old version.)
#
def get_devtable_list(d):
    import bb
    devtable = bb.data.getVar('IMAGE_DEVICE_TABLE', d, 1)
    if devtable != None:
        return devtable
    devtables = bb.data.getVar('IMAGE_DEVICE_TABLES', d, 1)
    if devtables == None:
        devtables = 'files/device_table-minimal.txt'
    return " ".join([ bb.which(bb.data.getVar('BBPATH', d, 1), devtable)
                      for devtable in devtables.split() ])

The issues I have are the following:
1. if the file is not there an empty list is returned and used without
any error being given.
In case of the default name that is probably ok, but if there is an
explicit IMAGE_DEVICE_TABLE or IMAGE_DEVICE_TABLES given and the file
is not there I would qualify the situation as an error.
Guess it would be very convenient to have an error message in that case.
2. According to the comment for IMAGE_DEVICE_TABLES (and for the
default name) the file is searched for in BBPATH. For me BBPATH points
to an overlay dir with below it recipes/myimage/myimage.bb
The code does join the names but (at least with my limited python
knowledge) does not look into subdirs. This is experimentally
verified.
I feel it is more appropriate to have the device table near the bb
file (e.g. in recipes/myimage/mydevicetable.txt)
currently I have to either specify a path in IMAGE_DEVICE_TABLES
(which I don't like because it makes the recipe dependent of the
actual place in the tree, so it is not robust to moving it), or have
the device table on the level of recipes (which I do not like either
as it is not near the recipe).
My suggestion would be to look in the dir of the recipe or in ${WORKDIR}

What do people think about this?
I'm not really a python wiz, so if someone can contribute a patch that
would be greatly appreciated.

Frans


