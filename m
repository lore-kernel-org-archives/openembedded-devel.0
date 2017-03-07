Return-Path: <rpjday@crashcourse.ca>
Received: from smtp486.redcondor.net (smtp486.redcondor.net [208.80.204.86])
	by mail.openembedded.org (Postfix) with ESMTP id 15EBD71DAB
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Mar 2017 13:05:48 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp486.redcondor.net ({6695537a-536a-45f9-a249-877c85428649})
	via TCP (outbound) with ESMTPS id 20170307130548295_0486
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Mar 2017 13:05:48 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-devel@lists.openembedded.org>
Received: from [216.191.234.70] (port=59533 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1clEoA-00080O-J7 for openembedded-devel@lists.openembedded.org;
	Tue, 07 Mar 2017 08:05:42 -0500
Date: Tue, 7 Mar 2017 08:05:40 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@uk63952.mitel.com
To: OpenEmbedded Development mailing list
	<openembedded-devel@lists.openembedded.org>
Message-ID: <alpine.LFD.2.20.1703070800350.11394@uk63952.mitel.com>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Subject: does specifying "--with-mpm=prefork" for apache2 require ugly manual hacking?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 07 Mar 2017 13:05:49 -0000
Content-Type: text/plain; charset=US-ASCII


  just ran across the following situation in that an OE build
(actually, wind river linux, but that should make no difference) has a
bbappend file, "apache2_2.4.16.bbappend", that appears to be going to
a great deal of trouble to simply specify "--with-mpm=prefork":

EXTRA_OECONF += " --with-mpm=prefork "

do_install_append() {
		# Make a backup of the original httpd.conf file
    cp ${D}/${sysconfdir}/${BPN}/httpd.conf ${D}/${sysconfdir}/${BPN}/httpd.conf.orig

    # Remove the two offending lines (to be replaced with the correct ones), as well as uncommenting the mpm include directive.
    sed -r 's_^IncludeOptional\s+/etc/apache2/conf.d/\*.conf__' < ${D}/${sysconfdir}/${BPN}/httpd.conf.orig | sed -r 's_^IncludeOptional\s+/etc/apache2/modules.d/\*.conf__' | sed -r 's_^#Include\s+etc/apache2/extra/httpd-mpm.conf_Include etc/apache2/extra/httpd-mpm.conf_' | sed -r 's_^Listen 80$_Listen 80\n#Temporary use by minion\nListen 8081_' > ${D}/${sysconfdir}/${BPN}/httpd.conf

    # Replacing the two lines removed previously with the correct ones. Loading the modules first, then configure them.
    printf "\nIncludeOptional ${sysconfdir}/${BPN}/modules.d/*.load" >> ${D}/${sysconfdir}/${BPN}/httpd.conf
    printf "\nIncludeOptional ${sysconfdir}/${BPN}/conf.d/*.conf" >> ${D}/${sysconfdir}/${BPN}/httpd.conf
}

  i'm unclear on what is happening above, but it seems that asking for
a simple configuration like that should be available with something as
basic as adding an option, or selecting PACKAGECONFIG.

  am i missing something? is all of the above really necessary to do
something that looks fairly straightforward?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


