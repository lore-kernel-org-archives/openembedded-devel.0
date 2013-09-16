Return-Path: <akini@synapticon.com>
Received: from mail-la0-f49.google.com (mail-la0-f49.google.com
	[209.85.215.49])
	by mail.openembedded.org (Postfix) with ESMTP id A512E60E89
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Sep 2013 10:58:11 +0000 (UTC)
Received: by mail-la0-f49.google.com with SMTP id ev20so2914986lab.22
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Sep 2013 03:58:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:date:message-id:subject:from:to
	:content-type;
	bh=bCG3/Krin5mdRXGXxonzwPmwwzYjxwg8K/QHDDMhwKM=;
	b=J8swqmnNEhkbR+gNkOFXq99d8KsBjulIUti7bO5QIXSrYTylBo9+iNIcqa98CLwLfl
	2R3Z3Zv59VYCGV7DA7n+cQzb+BD6KS8IzrvRj8wUqE7nlJO5SksQ1NM1+zzsFDwFHcqN
	QhBzAXppn/LIbXlynDECbc415CHNYyjnozMNoaCbnfG4fvHZeq4eS3Ku2i6n6tfaKjWw
	7SQmF5OUzRcWB5IMSQomAofbWIKB46hj8rgFgZa7mMJrjjjFdqNP79+cXcWnuHiBShua
	8SBjvfay69b7bk3/1b6oQPV/RUgnUF0N4zV7lAyKUXdOGZsHyvEq24nQHsdbDycrjYml
	PE9A==
X-Gm-Message-State: ALoCoQlD5/ir2DW4BaPv5wXEMGe5IUx6D05/zWJBDHSQlsHVpbd0HS1zNWQE+5/PYmqObXjeZMyS
MIME-Version: 1.0
X-Received: by 10.152.36.98 with SMTP id p2mr24454489laj.14.1379329092785;
	Mon, 16 Sep 2013 03:58:12 -0700 (PDT)
Received: by 10.114.3.8 with HTTP; Mon, 16 Sep 2013 03:58:12 -0700 (PDT)
Date: Mon, 16 Sep 2013 12:58:12 +0200
Message-ID: <CAKS01onp9CcPLNOybKbTh9bsp4QwuLJtJABrU7_zDe=Px0t6Nw@mail.gmail.com>
From: Anup Kini <akini@synapticon.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: using deb as source while building image.
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
X-List-Received-Date: Mon, 16 Sep 2013 10:58:12 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi All,

I am trying to build a core image minimal for the ZYNQ board.

I am trying to include VTK library available as deb in the following
location
http://ports.ubuntu.com/pool/universe/v/vtk/libvtk5.8_5.8.0-5_armhf.deb,
since its already compiled for ARM platform.

When i try to use the recipe mentioned below, nothing gets installed.
Let me know if it is possible to use the deb as a source to install
My recipe looks like below:
-----------------------------------------------------------------------------------------------------------------------------------
DESCRIPTION = "The Visualisation Toolkit"
HOMEPAGE = "http://www.vtk.org"

LICENSE = "BSD"

SRC_URI = "
http://ports.ubuntu.com/pool/universe/v/vtk/libvtk5.8_5.8.0-5_armhf.deb"

SRC_URI[md5sum] = "14945458a1e80d2990a4005c5163e01c"

# Skip the unwanted steps
do_compile[noexec] = "1"

# Install the files to ${D}
bin_package_do_install () {
    # Do it carefully
    [ -d "${S}" ] || exit 1
    cd ${S} || exit 1
    tar --no-same-owner --exclude='./patches' --exclude='./.pc'
--exclude='./control.tar.gz' -cpf - . \
        | tar --no-same-owner -xpf - -C ${D}
}

FILES_${PN} = "/"

EXPORT_FUNCTIONS do_install
------------------------------------------------------------------------------------------------------------------------------------------

Let me know if there is already a reference recipe that uses such a deb
source.



-- 

*Anup Kini
*Systems Engineer****
*
------------------------------
*

*Synapticon** * |  Cyber-Physical System Solutions ****

Mobile:

Direct:

+49 151 / 638 646 73

+49 7335 / 186 999 21

Fax:****
+49 7335 / 186 999 1


 **

 ****

synapticon.com <http://www.synapticon.com/>  |
@synapticon_co<https://twitter.com/#!/synapticon_co>
****

Synapticon GmbH  |  Hohlbachweg 2  |  73344 Gruibingen, DE
Secretary +49 7335 / 186 999 0  |  General Manager: Nikolai Ensslen
Registry Court Ulm HRB 725114  |  USt-ID DE271647127****

This message and any files transmitted with it are confidential and
intended
solely for the use of the individual or entity to whom they are addressed.
Please notify the sender immediately if you have received this e-mail by
mistake and delete it from your system.

