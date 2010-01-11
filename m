Received: from mail-pz0-f185.google.com ([209.85.222.185])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dbschuler@gmail.com>) id 1NUObu-0007KK-Kc
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Jan 2010 19:03:30 +0100
Received: by pzk15 with SMTP id 15so13395918pzk.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Jan 2010 10:01:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:from:date:message-id
	:subject:to:content-type;
	bh=cEy9yNg/RZawjYOalHPHxy+kdkRzLGffcHDs/xqUmIY=;
	b=ZJK/B9Ma04UY/aQgQZSiefUlBW8irULn7K/sgP1YlcHlgTHMKaBf2DNoosfG7j647b
	TxoObE2BlO66eSQ+xW+h4AJ/ZYrmHkl7J21jBf2Jnzb6IAcYIDD0pHz6/s0h07TT/+gt
	P6dm1u4qsJDJUtYejlHRN8PiT9uJ0vO+/6SIE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:from:date:message-id:subject:to:content-type;
	b=ZRXeP5fUfdmdQb8IuV0gDITnHaDTRzoemi29J2gkHfo9kwueV8SJps2A4u8BZEofQq
	qg6haKOneNp1Iy+wr6k5Gq+IAXuSdTKxYKI7OCZ/3XNbKGB6BecykykrgTz9toBg4MK/
	LxAhGXONgle29mVy+W6hNMpNoT9BmC9BTGwrE=
MIME-Version: 1.0
Received: by 10.143.21.29 with SMTP id y29mr1248875wfi.175.1263232877108; Mon, 
	11 Jan 2010 10:01:17 -0800 (PST)
From: Daniel Schuler <dbschuler@gmail.com>
Date: Mon, 11 Jan 2010 10:00:57 -0800
Message-ID: <7909dbcf1001111000g6ad7d5a5y68846083b0c7ea85@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.222.185
X-SA-Exim-Mail-From: dbschuler@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: OEWidget scripts to set up and manage an OE build environment
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
X-List-Received-Date: Mon, 11 Jan 2010 18:03:30 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello,

I wrote a couple of scripts to set up a new OE build environment and to
manage a few tasks on the device side.
They have been tested on a Gumstix Overo board (although that could be
changed). The scripts can help with:

  * Setting up a new OE environment
  * Writing an OE root fs to an SD card
  * Writing on-board NAND
  * Setting up an NFS root fs

You can get the git repo for the scripts at:
git://github.com/dschuler/OEWidgets.git

Hopefully someone will find them useful :)

    Daniel Schuler

