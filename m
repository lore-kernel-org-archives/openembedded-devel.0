Received: from mail.geicp.com ([203.206.162.107])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gbj@theforce.com.au>) id 1NeEqo-00005K-Tm
	for openembedded-devel@lists.openembedded.org;
	Sun, 07 Feb 2010 22:39:34 +0100
Received: from [192.168.0.8] (bwing.geicp.com [192.168.0.8])
	(authenticated bits=0)
	by mail.geicp.com (8.14.3/8.14.3/Debian-6) with ESMTP id o17LaqDm020159
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 8 Feb 2010 08:36:54 +1100
Message-ID: <4B6F3274.2010508@theforce.com.au>
Date: Mon, 08 Feb 2010 08:36:52 +1100
From: Grahame Jordan <gbj@theforce.com.au>
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
To: openembedded-devel@lists.openembedded.org
References: <4B6B4EBC.1030906@theforce.com.au>
	<1265356132.3907.12.camel@mattotaupa>
In-Reply-To: <1265356132.3907.12.camel@mattotaupa>
X-geicp-MailScanner-ID: o17LaqDm020159
X-geicp-MailScanner: Found to be clean
X-geicp-MailScanner-From: gbj@theforce.com.au
X-MIME-Autoconverted: from 8bit to quoted-printable by mail.geicp.com id
	o17LaqDm020159
X-SA-Exim-Connect-IP: 203.206.162.107
X-SA-Exim-Mail-From: gbj@theforce.com.au
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: mtr
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
X-List-Received-Date: Sun, 07 Feb 2010 21:39:34 -0000
Content-Type: text/plain; charset="UTF-8"

   Hi Paul,

Cannot bitbake mtr. It is set to PV=0.65.


can you please post the error message and the log files?



   | checking for floor in -lm... yes
   | checking for socket... yes
   | checking for gethostbyname... yes
   | checking for seteuid... yes
   | checking for res_mkquery... no
   | checking for res_mkquery in -lbind... no
   | checking for res_mkquery in -lresolv... no
   | configure: error: No resolver library found
   | FATAL: oe_runconf failed


mtr-0.75 compiles and installs OK.
Can this be set to PV=0.75 and the mtr_0.75.bb file created in the
org.openembedded.dev branch?


How did you compile mtr-0.75? Did you just change the version number?
Could you send in a patch for it please?




   I copied mtr_0.65.bb to  mtr_0.75.bb
   I changed PREFERRED_VERSION_mtr ?= "0.75" in
   org.openembedded.dev/conf/distro/include/preferred-om-2008-versions.inc
   Thanks
   Grahame

