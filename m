Received: from [213.133.104.47] (helo=www47.your-server.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <k.fetscher@fetron.de>) id 1Mxnt2-0006RY-7q
	for openembedded-devel@lists.openembedded.org;
	Tue, 13 Oct 2009 22:22:27 +0200
Received: from [89.244.177.14] (helo=[192.168.0.128])
	by www47.your-server.de with esmtpa (Exim 4.69)
	(envelope-from <k.fetscher@fetron.de>) id 1Mxns9-0005ri-6x
	for openembedded-devel@lists.openembedded.org;
	Tue, 13 Oct 2009 22:21:29 +0200
Message-ID: <4AD4E140.6000009@fetron.de>
Date: Tue, 13 Oct 2009 22:21:20 +0200
From: Klaus Fetscher <k.fetscher@fetron.de>
User-Agent: Thunderbird 2.0.0.23 (Windows/20090812)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Authenticated-Sender: k.fetscher@fetron.de
X-Virus-Scanned: Clear (ClamAV 0.95.1/9888/Tue Oct 13 21:06:31 2009)
X-SA-Exim-Connect-IP: 213.133.104.47
X-SA-Exim-Mail-From: k.fetscher@fetron.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Installed files but not but not shipped in any package
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
X-List-Received-Date: Tue, 13 Oct 2009 20:22:27 -0000
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

I try to make my first Package but I got the following error during 
"do_package()" :

NOTE: Running task 9 of 17 (ID: 12, 
/home/stuff/openembedded/recipes/openscada/openscada_0.6.4.bb, 
do_package)                                                                                                             

NOTE: the following files were installed but not shipped in any 
package:                                        
NOTE:   
/home/stuff/tmp/staging/armv4t-angstrom-linux-gnueabi/usr/lib/liboscada.so.0                      

... and a lot more files  .....

Later I can find all these missing files under the ..../image 
subdirectory with the complete path from the /home/... directory again.
Also there a a lot more erros in the later process because of the 
missing libraries.

Can anyone see what is going wrong ?

Here are the snippet
------------------------

SRC_URI = "svn://oscada.org.ua/trunk;module=OpenSCADA;rev=;proto=svn"

PV = "0.6.4"
PR = "svn"

S = "${WORKDIR}/OpenSCADA"

inherit autotools

EXTRA_OECONF = " \
        --includedir=${STAGING_INCDIR} \
        --libdir=${STAGING_LIBDIR} \
"

do_configure_prepend() {
    autoconf
}

do_configure() {
    oe_runconf
}


do_install_prepend () {
    mkdir -p -m 755 ${D}/etc
    cp ${S}/data/oscada.xml ${D}/etc
    mkdir -p -m 755 ${D}/var/spool/openscada/icons
    cp ${S}/data/icons/* ${D}/var/spool/openscada/icons
    install -p -m 777 -d ${D}/var/spool/openscada/ARCHIVES/{MESS,VAL}
}


Thanks,

Klaus



