Received: from mail-qy0-f174.google.com ([209.85.221.174])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <msundius@sundius.com>) id 1NwmIE-0001d7-T4
	for openembedded-devel@lists.openembedded.org;
	Wed, 31 Mar 2010 03:00:32 +0200
Received: by qyk4 with SMTP id 4so1525140qyk.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Mar 2010 17:57:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.229.44.145 with HTTP; Tue, 30 Mar 2010 17:57:05 -0700 (PDT)
Date: Tue, 30 Mar 2010 17:57:05 -0700
Received: by 10.229.218.2 with SMTP id ho2mr511376qcb.51.1269997026003; Tue, 
	30 Mar 2010 17:57:06 -0700 (PDT)
Message-ID: <18e217241003301757i23125ed4g3bb55a795ff5db02@mail.gmail.com>
From: C Michael Sundius <msundius@sundius.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.221.174
X-SA-Exim-Mail-From: msundius@sundius.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: native recipes use legacy staging.
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
X-List-Received-Date: Wed, 31 Mar 2010 01:00:32 -0000
Content-Type: text/plain; charset=ISO-8859-1

why does the native.bbclass force the use of legacy staging?

also how can I override this. I tried go use create my own

do_stage() {
   :
}

function in my recipe, but the one in the class was still used.

My issue is that my install function does not use make at all, nor autotools

so the do_stage_native() call [from do_stage() ] fails.

thanks

see my [smiple] recipe attached:



PR = "031110"

BBCLASSEXTEND = "native nativesdk"

#SRC_URI = "http://sauscupoe01.cisco.com/cisco/mkimage-tools-${PR}.tar.gz"
SRC_URI = "file:///home/sundism/src/mkimage-tools"

S = ${WORKDIR}/mkimage-tools

do_compile() {
        :
}


do_install() {
        install  -m 0755 -d ${STAGING_BINDIR}
        install  -m 0755 ${S}/bin/imgen ${bindir}/imgen
        install  -m 0755 -d ${datadir}
        install  -m 0755 -d ${datadir}/LxLoad
        install  -m 0644 ${S}/share/LxLoad/LxLoad2_cronus.img \
                ${datadir}/LxLoad/LxLoad2_cronus.img
}

do_stage() {
        :
}

