Received: from [64.233.182.184] (helo=nf-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <nelsoneci@gmail.com>) id 1HIsex-00088C-Af
	for openembedded-devel@lists.openembedded.org;
	Sun, 18 Feb 2007 21:29:23 +0100
Received: by nf-out-0910.google.com with SMTP id l24so2127703nfc
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Feb 2007 12:29:22 -0800 (PST)
Received: by 10.78.185.7 with SMTP id i7mr920686huf.1171830561782;
	Sun, 18 Feb 2007 12:29:21 -0800 (PST)
Received: by 10.78.178.6 with HTTP; Sun, 18 Feb 2007 12:29:21 -0800 (PST)
Message-ID: <2accc2ff0702181229p739ebee1ke3ea6c6264cf9b0f@mail.gmail.com>
Date: Sun, 18 Feb 2007 15:29:21 -0500
From: "Nelson Castillo" <nelson@emqbit.com>
Sender: nelsoneci@gmail.com
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
X-Google-Sender-Auth: 37331e4119d62604
Subject: Trying to package Appweb 2.1.0
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 18 Feb 2007 20:29:23 -0000
X-Groupsio-MsgNum: 1407
Content-Type: multipart/mixed; 
	boundary="----=_Part_26843_17988003.1171830561724"

------=_Part_26843_17988003.1171830561724
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi.

We've been trying to package Appweb 2.1.0. This package works
(We haven't thought of PHP5).

We tried to get rid of /usr/mime.types in the commented code that
follows but we could not.

#FILES_${PN} += " /etc/appWeb/appWeb.conf /etc/appWeb/mime.types"
FILES_${PN} += " /usr/appWeb.conf /usr/mime.types"

do_install () {
        oe_runmake 'ROOT_DIR=${D}' install-all
# How do we do this?
#mkdir ${D}/etc/appWeb
#cp ${D}/usr/appWeb.conf ${D}/etc/appWeb/
#cp ${D}/usr/mime.types ${D}/etc/appWeb/
}

How do we do that?

Those are the errors we get:

!!! Failed to move ./etc/appWeb to
/mnt/emqbit1/oe/tmp/work/armv4t-angstrom-linux-gnueabi/appweb-2.1.0-r0/install/appweb/./etc/appWeb
!!! [Errno 39] Directory not empty
NOTE: Task failed: File population failed

And we always get these and it seems they don't hurt.

FATAL: arm-angstrom-linux-gnueabi-strip
/mnt/emqbit1/oe/tmp/work/armv4t-angstrom-linux-gnueabi/appweb-2.1.0-r0/image/usr/sbin/httpComp:
command failed
FATAL: arm-angstrom-linux-gnueabi-strip
/mnt/emqbit1/oe/tmp/work/armv4t-angstrom-linux-gnueabi/appweb-2.1.0-r0/image/usr/sbin/httpPassword:
command failed


Regards,
Nelson.-

-- 
http://arhuaco.org
http://emQbit.com

------=_Part_26843_17988003.1171830561724
Content-Type: application/x-gzip; name=appweb.tar.gz
Content-Transfer-Encoding: base64
X-Attachment-Id: f_eybxfdmp
Content-Disposition: attachment; filename="appweb.tar.gz"

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
NxFh5N86Fnh4Hp6H5+F5eP46z78BnimHUQBQAAA=

------=_Part_26843_17988003.1171830561724--
